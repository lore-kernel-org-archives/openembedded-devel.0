Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5EFC4321E
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:51 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.2281.1635879107422264571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IHjNGT93;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879111;
  x=1667415111;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iiCbGH1fALF0CCljgnHLuEk22Qz+/bbtByzfaXC7pP0=;
  b=IHjNGT93HRjKU7nyCvmSCRFzJ3FgJEjtiT4bCRRqxZOpA5dlXiZPiqod
   Jq+50AWW27pQxD0dbUQ0aeKk8zxdL6InoLzl2DMlvYBkvqn8Ml4rg/zdK
   4qGTMPkw0cEx2u/eujFIk1oOzm3owYQooGM29AoA+49DCxGA1xnTvjmhY
   NWF9iymGYVpDp38MxjL56plANf5ws3NBsT7AfsCZXa2u+AEvFXus3kiWv
   Hwg5dwFDqUn9D7IjgLbJd9Q3tmmGjoyK4i+FgDoLBAe4sNsDZZdHKYZIz
   WAaU/flZJJ2t084JWkCnbeZL3Ia5yA8Qm7BNps/zzP/Hdv1zr6E4YdM+q
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 7/8] mongodb: Create /var/log/mongodb
 in runtime
Date: Tue, 2 Nov 2021 19:51:43 +0100
Message-ID: <20211102185144.13556-7-pkj@axis.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/93789

/var/log is normally a link to /var/volatile/log and /var/volatile is a
tmpfs mount. So anything created in /var/log will not be available when
the tmpfs is mounted.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 461a1d007..1b11bd4dc 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -113,11 +113,19 @@ scons_do_install() {
     install -m 755 -d ${D}${localstatedir}/lib/${BPN}
     chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
 
-    # Log files
-    install -m 755 -d ${D}${localstatedir}/log/${BPN}
-    chown ${PN}:${PN} ${D}${localstatedir}/log/${BPN}
+    # Create /var/log/mongodb in runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} 0755 ${BPN} ${BPN} -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d ${BPN} ${BPN} 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
+    fi
 }
 
 CONFFILES:${PN} = "${sysconfdir}/mongod.conf"
 
 SYSTEMD_SERVICE:${PN} = "mongod.service"
+
+FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"

