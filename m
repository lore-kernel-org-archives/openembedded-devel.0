Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2B3C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.2281.1635879107422264571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OUCuUciV;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879109;
  x=1667415109;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3VQHRjvFJ16A2aB/pDsKQl6q8XTEVcc+9UFuz1P+cXo=;
  b=OUCuUciVnI++/jeOAlfyyp+DfLA/kAy+ZhUZyQTnI5XPHZVgmVxR1UzG
   mPt9mpAugRTh53+SaGtb2EdPNv67LCsxjVt5Gc6Q6kW5s1fNlH2srPuP8
   /T4lFxbkpQemvxIvN9ayHZya/0OTye2jizUkxLLoIOTFpsZ7qo6ZGjHep
   S60EzPjYHbiwqJl+prMD6vDFiNquDNitWeMJ0aZTOhV8Hgf5ZowPvau2P
   IsrQOKj4l+Lz4BQv377ZgZ8xo78xuvseZa+0Hpdo1CKkyFHs85YhYx8sO
   FkiJNKVf4qbaV/oZnOIyFh+DisOsc9Ipo175X6Fpm5BCx+JallK68+6CS
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 5/8] openflow: Create
 /var/log/openflow in runtime
Date: Tue, 2 Nov 2021 19:51:41 +0100
Message-ID: <20211102185144.13556-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211102185144.13556-1-pkj@axis.com>
References: <20211102185144.13556-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 18:51:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93784

/var/log is normally a link to /var/volatile/log and /var/volatile is a
tmpfs mount. So anything created in /var/log will not be available when
the tmpfs is mounted.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-protocols/openflow/openflow.inc    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 94d9553e1..c4e69b58e 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -34,4 +34,22 @@ do_configure:prepend() {
 do_install:append() {
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
+
+    # /var/log/openflow needs to be created in runtime. Use rmdir to catch if
+    # upstream stops creating /var/log/openflow, or adds something else in
+    # /var/log.
+    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
+
+    # Create /var/log/openflow in runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} - - - -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
+    fi
 }
+
+FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"

