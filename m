Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C00C43217
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:50 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.2281.1635879107422264571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OYkUigPM;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879110;
  x=1667415110;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ov4a/QUJOaqDUF+qa2w8oDTuR5mMy5YFM/XC7VGby1M=;
  b=OYkUigPMkMT19U9m3bEKR6hFqPAWR2IRcimUp1zz0eTdBeYGCDimd9Xs
   y4a+YyY/I+97m/9us82OkYRaerJFtJF1bw0W5AUoZdEQYaHmkXaqWCJgL
   TAoOn678pwDlkvPHYkLGKS5SPOkWIGc+xo1uOveW/I76aiG3sUfXSZb8w
   xR98hlK2hB0c5LHTtWH7rZ4E+TkQVFBD4mG+Nao+sd5wkq/KYmGnAPIoA
   QP86uY5xcZIJjo6Lm8llGLLrQvIyW+u12N2EoHRStJE0CwNffz4Bmwp46
   UD4tvKNo7ycK/BRb1qq2SRinHyvOUQXm84oLXBGhCSvWT2XPhaDgwyhPA
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 6/8] mongodb: A little clean up
Date: Tue, 2 Nov 2021 19:51:42 +0100
Message-ID: <20211102185144.13556-6-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211102185144.13556-1-pkj@axis.com>
References: <20211102185144.13556-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 18:51:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93786

This cleans up whitespace, and avoids using ${...} for shell
variables.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-dbs/mongodb/mongodb_git.bb        | 57 +++++++++----------
 1 file changed, 26 insertions(+), 31 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index eff014a4c..461a1d007 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -43,7 +43,6 @@ SRC_URI:append:toolchain-clang = "\
            file://0001-asio-Dont-use-experimental-with-clang.patch \
            "
 
-
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
@@ -83,44 +82,40 @@ EXTRA_OESCONS = "PREFIX=${prefix} \
                  --separate-debug \
                  ${PACKAGECONFIG_CONFARGS}"
 
-
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
 
-
 scons_do_compile() {
-        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} install-core || \
+    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} install-core ||
         die "scons build execution failed."
 }
 
 scons_do_install() {
-        # install binaries
-        install -d ${D}${bindir}
-        for i in mongod mongos mongo
-        do
-            if [ -f ${B}/build/opt/mongo/${i} ]
-            then
-                install -m 0755 ${B}/build/opt/mongo/${i} ${D}${bindir}/${i}
-            else
-                bbnote "${i} does not exist"
-            fi
-        done
-
-        # install config
-        install -d ${D}${sysconfdir}
-        install -m 0644 ${S}/debian/mongod.conf ${D}${sysconfdir}/
-
-        # install systemd service
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${S}/debian/mongod.service ${D}${systemd_system_unitdir}
-
-        # install mongo data folder
-        install -m 755 -d ${D}${localstatedir}/lib/${BPN}
-        chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
-
-        # Log files
-        install -m 755 -d ${D}${localstatedir}/log/${BPN}
-        chown ${PN}:${PN} ${D}${localstatedir}/log/${BPN}
+    # install binaries
+    install -d ${D}${bindir}
+    for i in mongod mongos mongo; do
+        if [ -f ${B}/build/opt/mongo/$i ]; then
+            install -m 0755 ${B}/build/opt/mongo/$i ${D}${bindir}
+        else
+            bbnote "$i does not exist"
+        fi
+    done
+
+    # install config
+    install -d ${D}${sysconfdir}
+    install -m 0644 ${S}/debian/mongod.conf ${D}${sysconfdir}
+
+    # install systemd service
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${S}/debian/mongod.service ${D}${systemd_system_unitdir}
+
+    # install mongo data folder
+    install -m 755 -d ${D}${localstatedir}/lib/${BPN}
+    chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
+
+    # Log files
+    install -m 755 -d ${D}${localstatedir}/log/${BPN}
+    chown ${PN}:${PN} ${D}${localstatedir}/log/${BPN}
 }
 
 CONFFILES:${PN} = "${sysconfdir}/mongod.conf"

