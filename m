Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D62EC433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:51 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.2347.1635879110631831923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WQPlwhbt;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879111;
  x=1667415111;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jwGL57Xw5BPw1GBEmV3wIgVz1zV3wabm3RoUuPZEBQE=;
  b=WQPlwhbtHy43dmT6cgb47yFMrRoEuJgl/tmxGAnUSZOkVpl5FGZ8LfLY
   c+gX8/YX9NAvivdZD5D+TYFIF3zAvsDcBcP06yTdyipGyGU/gGikuoTeQ
   1+dOGrhoAIz9qBTlIJ7uLIHLkBDJVVWHUYzg59VzJXMlX14rQdea+2aaY
   3uctFIrrCIfTujNmTS4Y0rQ1J4p2aZXDZbCFiScd/XtKI8QYWQl93TlaO
   Ifrq90aSQOt5qYW3TaFoGEH3YdFIwKcgwIWrf4cOzJN6epynMkydmXw1I
   glOmgnnYvW4zKFPzUIBRIqu16vMyhvwYRUrx+A1Br73odNKhLZBo8tJgT
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 8/8] opensaf: Create
 /var/log/opensaf/saflog in runtime
Date: Tue, 2 Nov 2021 19:51:44 +0100
Message-ID: <20211102185144.13556-8-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211102185144.13556-1-pkj@axis.com>
References: <20211102185144.13556-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 18:51:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93788

/var/log is normally a link to /var/volatile/log and /var/volatile is a
tmpfs mount. So anything created in /var/log will not be available when
the tmpfs is mounted.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-daemons/opensaf/opensaf_5.21.09.bb     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
index 6c8a48179..1aacae9a6 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
@@ -55,15 +55,29 @@ LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
 do_install:append() {
     rm -fr "${D}${localstatedir}/lock"
     rm -fr "${D}${localstatedir}/run"
+    rmdir "${D}${localstatedir}/log/${BPN}/saflog"
+    rmdir "${D}${localstatedir}/log/${BPN}"
+    rmdir "${D}${localstatedir}/log"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
     rmdir --ignore-fail-on-non-empty "${D}${datadir}/java"
     if [ ! -d "${D}${sysconfdir}/init.d" ]; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
     fi
+
+    # Create /var/log/opensaf/saflog in runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN}/saflog - - - -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d root root 0755 ${localstatedir}/log/${BPN}/saflog none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
+    fi
 }
 
 FILES:${PN} += "${libdir}/libSa*.so ${systemd_unitdir}/system/*.service"
+FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
 FILES:${PN}-dev += "${libdir}/libopensaf_core.so"
 FILES:${PN}-staticdev += "${PKGLIBDIR}/*.a"
 

