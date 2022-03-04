Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A48C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:28:34 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web08.8085.1646407712753410115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=qHKHo3zo;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26,
 mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 194F15C01BD
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  4 Mar 2022 10:28:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 04 Mar 2022 10:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=45dUgJSkWl6kVuch7zxT7LrBXeIwS2VBB2NHb9sCa7w=; b=qH
	KHo3zofbSw9YG6DDBLXlBj64bmqIQjl6Ge/MQAOJu85157as8gptvu/Aw7q+V0O6
	wyMtrHvpgY2essyf3wl5u5EM6GQjIpm9exdLdye8c7fezuYIE6fWi9MXpfA0ZB75
	GOfGbomtgOdfOSNN/wqKAiAtR9lDAkKx2gVys/DxE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=45dUgJSkWl6kVuch7zxT7LrBXeIwS
	2VBB2NHb9sCa7w=; b=lqfIoWmqbkVmYfrqBDvgKeazBdK1xvckbHg9Kxer99S+V
	5f4/DPYhzcF0yJ30qFVyyYa+d6CNrQ8qDBBOqVMdo4tPG7gcwqcH+1IAJsIyKoAe
	3pNTPowWqj2cTiUD+W+5hb4yYQy+jzqrGGl/MV/HBI/YDJQ7bMgV5bZFOocHk1wd
	tTohpydnA0wGcz3NSr5FzenKswf3uzJeAozzpkMFPyX2CK9i6oVku9i9PvGRWT4+
	bydKlWSYm5WlG5OohLLkHSjkJB3SbPEG7WnFPBJyRwX514cjMiRXFKmTwR9JuyV6
	qSuSExBfnm69YTdbKZ/pu4DeGSh49v35VYsE2B8qg==
X-ME-Sender: <xms:HzAiYg4oh62FZ0f8FCMu12PAo3_HtEoZMp0N0sftjkSwrwD1yLCwnA>
    <xme:HzAiYh6-ZqmwPYJiJ-Ce9j3mudHfmhwznIKe3d_5ZhHI05FsMCL6Cns5DuFcGfAjq
    yiIq6IXbiuL9nSidA>
X-ME-Received: 
 <xmr:HzAiYvc-lq4XkXHetLTteVsYKkjHC9NbJEmMvXRgx_JbKVMOSyOcejEmoW_Nre8M0JAXj2Nor9QCEHHcsNEYbghQlaCua0rQFVZtuTEFP6EW>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeekffdvjefgffeige
    dvieefteehgedutdeuudeileeigfejjefghfehtdefleevffenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmpdhlohhgrdhinhhfohenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdr
    ohhrgh
X-ME-Proxy: <xmx:HzAiYlIlItXpRiNStUrsDw5QI2lW0oZklq_050y_ZG86mQOf5ehI0g>
    <xmx:HzAiYkJU7SwfN2uaaUfiU8KLAw7t_bqp8cB765eDnkuGlatJOvQ6jQ>
    <xmx:HzAiYmzIfsRPtxdNtW1d-d83PYQdNfxhlwLM5yFJbEVEulc8LtWD0w>
    <xmx:IDAiYrlWbTK9zlCMrWYVUSvYyOQRhwBP5PMJIlIX7eYQ5G456RLbdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Fri,
 4 Mar 2022 10:28:31 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-crc32c: set target platform via
 setup.cfg
Date: Fri,  4 Mar 2022 10:28:27 -0500
Message-Id: <20220304152827.31576-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 15:28:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95788

Looks like we're not the first to need to specify the target platform
when building this package.  According to upstream, we can just update
setup.cfg instead of patching setup.py.
https://github.com/ICRAR/crc32c/pull/10

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 ...p.py-Fix-determining-target-platform.patch | 34 -------------------
 .../python/python3-crc32c_2.2.post0.bb        |  7 ++--
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch

diff --git a/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch b/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch
deleted file mode 100644
index b534c05e9a..0000000000
--- a/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 855428feb14c44762ea21a18b05638e3e6266ab5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 3 Mar 2022 23:50:30 -0800
-Subject: [PATCH] setup.py: Fix determining target platform
-
-Do not poke at the build machine to determine target platform or architecture
-pass it from environment instead for cross compiling to work
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/setup.py
-+++ b/setup.py
-@@ -20,6 +20,7 @@
- #    MA 02111-1307  USA
- #
- import glob
-+import os
- import platform
- 
- import distutils.ccompiler
-@@ -58,7 +59,8 @@ class _build_ext(build_ext):
- 
-     def run(self):
-         assert(len(self.distribution.ext_modules) == 1)
--        platform = self.platform.lower()
-+        platform = os.environ.get('PLATFORM', 'True')
-+
-         is_intel = platform in ['x86_64', 'amd64', 'i386', 'i686']
-         is_arm = platform in ['aarch64_be', 'aarch64', 'armv8b', 'armv8l']
-         distutils.log.info("platform: %s, is_intel: %d, is_arm: %d", platform, is_intel, is_arm)
diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
index 78e14e1d2f..4f6a3aba99 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
@@ -9,11 +9,14 @@ LIC_FILES_CHKSUM = " \
     file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
 "
 
-SRC_URI += "file://0001-setup.py-Fix-determining-target-platform.patch"
 SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
 
 inherit pypi setuptools3
 
-export PLATFORM = "${TARGET_ARCH}"
+do_compile:prepend() {
+    if ! grep 'platform =' setup.cfg; then
+        printf "[build_ext]\nplatform = ${TARGET_ARCH}" >> setup.cfg
+    fi
+}
 
 RDEPENDS:${PN} += "python3-core"
-- 
2.35.1


