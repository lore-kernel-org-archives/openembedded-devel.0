Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0769EC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:22:22 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.6831.1642166539445286407
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ELErBJVH;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1642166541;
  x=1673702541;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=G2Iz3TFJQs5aDNhhX98VLSoqL7rxG4RYeaVp4GqKwtE=;
  b=ELErBJVHPyBrlSCqu5v1xgjYbvDmCZAZeQnWr98OlG0j0X96oYrKV2fk
   FOFdg2rCG1IRHd5nhhSc9x9F0pQRoqsxW4klcz7n7SyqImoXJdh9LteMf
   26IaK9/yM2lEpMNabcM2Kv9ZzdUiey6NfUybORfiE96G/Y34Z2UsDKM/H
   orXw2zPy68ap8PHDhXsvz04j61Tfa4+9nTgO9yqW2w+/vYauJFvFAUnn7
   fknVZ1t6vPB0hIm6+7HTX+UOnuU4HYClCeWX2wueM9HnTuLdSf2KoiuAt
   mkO2emk64XHoWDcp0sPhPdtqhD8q6B5p+iNeu30AqrITXdi9qD80r9H/r
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] nodejs: Drop workaround for an absolute path in
 the npm shebang
Date: Fri, 14 Jan 2022 14:22:14 +0100
Message-ID: <20220114132215.31442-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220114132215.31442-1-pkj@axis.com>
References: <20220114132215.31442-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 13:22:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94831

The rewrite of the npm shebang to use an absolute path was removed in
version 7.0.0.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-devtools/nodejs/nodejs_16.11.1.bb | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index f31648082..318cb961f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -160,20 +160,6 @@ do_install () {
 }
 
 do_install:append:class-native() {
-    # use node from PATH instead of absolute path to sysroot
-    # node-v0.10.25/tools/install.py is using:
-    # shebang = os.path.join(node_prefix, 'bin/node')
-    # update_shebang(link_path, shebang)
-    # and node_prefix can be very long path to bindir in native sysroot and
-    # when it exceeds 128 character shebang limit it's stripped to incorrect path
-    # and npm fails to execute like in this case with 133 characters show in log.do_install:
-    # updating shebang of /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/nodejs-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/npm to /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
-    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
-    # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
-    # npm-cli.js continues to use old shebang
-    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
-        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-    fi
     # Install the native binaries to provide it within sysroot for the target compilation
     install -d ${D}${bindir}
     install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
@@ -185,12 +171,6 @@ do_install:append:class-native() {
     install -m 0755 ${S}/out/Release/node_mksnapshot ${D}${bindir}/node_mksnapshot
 }
 
-do_install:append:class-target() {
-    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
-        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-    fi
-}
-
 PACKAGES =+ "${PN}-npm"
 FILES:${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
 RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \

