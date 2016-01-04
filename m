Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 481BB6FF76
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:04:44 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f206so134172220wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=FiJ+QCF/LBXqS7G0j6zPdYSqFU2t0podj/XohgcTjNc=;
	b=lUmJRbEzMze8vuzjuVadxfgCKFFu4jjEazOKNbRP4+aBUgx3aknBF/9SU32lzmPi0P
	0YzNrhdcu4FY7b7k+qBB0OmA56bZteQ7a4F7bqnniFv2KHIvhtWNHdhcKuKWclfpmX0W
	R0PX/6eWoc2GhyqudlOVNFRHsxKYYdua+t9pAsu0SHV6xftWXZIeZnLRLAEVbmCWBQ05
	XCLBwuC+oOF5xF+GFzghufNbtufVqpy+QuB6E3QB4Ba/0dia9o+o/zph0s6PfaXXwjPQ
	WtsNmz7pbhRf11bqN5K4lnoe1ni32g4gMmN2TiE2R65peUaURKKy9Ta6hSDGFGE+FPQ9
	f/6Q==
X-Received: by 10.28.23.73 with SMTP id 70mr40777932wmx.37.1451901884980;
	Mon, 04 Jan 2016 02:04:44 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	t9sm30890802wjf.33.2016.01.04.02.04.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 02:04:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jan 2016 11:04:16 +0100
Message-Id: <1451901856-5089-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][master/jethro] qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix segfault on armv7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 10:04:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have a simple application containing a QWebView which segfaulted during
loading a page on a CortexA9 (armv7 thumb2). After enabling debug information
for qtwebkit and remote debug session the point of segfault was detected in

Source/JavaScriptCore/llint/LowLevelInterpreter.asm:1082
  callSlowPath(_llint_slow_path_new_func_exp)

Further digging around lead to similar source in:

* qtwebkit: Source/JavaScriptCore/assembler/ARMv7Assembler.h
* qtscript: src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMv7Assembler.h

In these files a class ARMThumbImmediate is declared and used in many places.
This lead me to the suspicion that compiligng for armv7 expects thumb support.

The following tests were performed:

* our application is working fine again
* qtscript and qtwebkit were build with
  'ARM_INSTRUCTION_SET = "thumb"' => TUNE_FEATURES = "arm armv5 thumb dsp"
  for qemuarm without issues

This is a partial/rebased revert of:
commit 932b32c1c9e9a3ac833c82ff9273683345056ec7
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Wed Apr 22 15:33:01 2015 +0200

    qtscript,qtwebking: disable thumb

    * qemuarm builds fail when thumb is enabled

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtscript_git.bb | 3 ++-
 recipes-qt/qt5/qtwebkit_git.bb | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index c6dca51..c53217a 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -22,7 +22,8 @@ LIC_FILES_CHKSUM = " \
 #{standard input}:23: Error: selected processor does not support Thumb mode `stmdb sp!,{r4-r8,lr}'
 #{standard input}:30: Error: lo register required -- `ldmia sp!,{r4-r8,lr}'
 #{standard input}:43: Error: lo register required -- `ldmia sp!,{r4-r8,lr}'
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 862abd2..a952306 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -15,7 +15,8 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
 # | {standard input}: Assembler messages:
 # | {standard input}:106: Error: invalid immediate: 983040 is out of range
 # | {standard input}:106: Error: value of 983040 too large for field of 2 bytes at 146
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
-- 
2.5.0


