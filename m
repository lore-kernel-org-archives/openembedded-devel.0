Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E14C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:22:25 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.6964.1642166543001444590
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FTbeoYZJ;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1642166543;
  x=1673702543;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vGHP/bjVJD909gP3aoYXPZgetCCJOf50HYxzqWSGkMM=;
  b=FTbeoYZJrHNu2XvizfCVuftRuDdFSxBU4MLqQm5apr1nsP0fZbe2WgYv
   ezQqO+jm79hkrV+DaW0wkF32Pdm8w2hivPAfE2RUN+DqhVBF7k+Ch+pSm
   TjfEITpS6dE7cEy+xZDA61hR5fVQJ057OMDot+dUlEnTg7ztol/0JIuS0
   /uvTVugzmVK8htLpMoio/ExRj0jMax0Wr/dP0SMMlmw5HpFN5G8bkHdOA
   DFylXJZTfxxFzTiJ+42eFM/lS2o94wYM1tlm2jWak7SK/185uQKvTvxUB
   LudB7Mhb58ZRZqBWbf/BVGK3q52+kUUTOlOsK3e2cWGCjSyzwmFagNhS1
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/3] nodejs: A little clean up
Date: Fri, 14 Jan 2022 14:22:15 +0100
Message-ID: <20220114132215.31442-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220114132215.31442-1-pkj@axis.com>
References: <20220114132215.31442-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 13:22:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94832

* The destination file name does not need to be specified to install
  if it matches the source file name (and -D is not used).
* Mode 0755 does not need to be specified to install as it is the
  default.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-devtools/nodejs/nodejs_16.11.1.bb | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index 318cb961f..72fbecb8f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -151,7 +151,7 @@ do_configure () {
 
 do_compile () {
     export LD="${CXX}"
-    install -Dm 0755 ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wrapper.sh
+    install -D ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wrapper.sh
     oe_runmake BUILDTYPE=Release
 }
 
@@ -159,20 +159,22 @@ do_install () {
     oe_runmake install DESTDIR=${D}
 }
 
+BINARIES = " \
+    bytecode_builtins_list_generator \
+    ${@bb.utils.contains('PACKAGECONFIG', 'icu', 'gen-regexp-special-case', '', d)} \
+    mkcodecache \
+    node_mksnapshot \
+    torque \
+"
+
 do_install:append:class-native() {
     # Install the native binaries to provide it within sysroot for the target compilation
     install -d ${D}${bindir}
-    install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
-    install -m 0755 ${S}/out/Release/bytecode_builtins_list_generator ${D}${bindir}/bytecode_builtins_list_generator
-    if ${@bb.utils.contains('PACKAGECONFIG','icu','true','false',d)}; then
-        install -m 0755 ${S}/out/Release/gen-regexp-special-case ${D}${bindir}/gen-regexp-special-case
-    fi
-    install -m 0755 ${S}/out/Release/mkcodecache ${D}${bindir}/mkcodecache
-    install -m 0755 ${S}/out/Release/node_mksnapshot ${D}${bindir}/node_mksnapshot
+    (cd ${S}/out/Release && install ${BINARIES} ${D}${bindir})
 }
 
 PACKAGES =+ "${PN}-npm"
-FILES:${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
+FILES:${PN}-npm = "${nonarch_libdir}/node_modules ${bindir}/npm ${bindir}/npx"
 RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \
     python3-misc python3-multiprocessing"
 

