Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FA1EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.983.1689139841419261024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Nl69hGUI;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9297C0003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139840;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=AobrtTTYOA5kxPwpGTp8Uk5xSthO34nrlQwrgYlhJBI=;
	b=Nl69hGUIxeTFYddz8J8ydCrg7Rl1PbIzDmhavc1a88Tjyx5Vm3DSaYSr5WOlM03MLULeCf
	9vT1Na4j98tC+u1TJbbAWvdjb/xJdd+6VrZKQD6I/s+it+qzvdXyLKJEbDQ3EBd5o95AY4
	5Lhn4U8Gg92Bv0s+NGVXtDkD3UTziImLeDuI0RPUTLIhwxmEKwAUDm49atcVvlYXCCqvR6
	qI1Z+J3Do6LdFR1K+wf6Mxpm5BOMZY5EQZt6EsHL3YOGhMssrJANGQN0/6exam93m2d9aW
	Q0ub9JcIah4zfuBDppdOFPV9rJFjyrIhTLTwELKt7yEpN5nijtwdWhDNqapMHg==
Content-Type: multipart/mixed; boundary="===============4176579135914758480=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-greenstalk: upgrading to 2.0.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103769
Message-Id: <20230712053050.65FA1EB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:50 +0000 (UTC)

--===============4176579135914758480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-greenstalk* to *2.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-greenstalk-upgrade-2.0.0-2.0.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From a18f212b56b68326bdb381d7207665cbf7f0ebd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:09:38 -0500
Subject: [PATCH] python3-greenstalk: upgrade 2.0.0 -> 2.0.2

---
 ...{python3-greenstalk_2.0.0.bb => python3-greenstalk_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenstalk_2.0.0.bb => python3-greenstalk_2.0.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
index 841b84ddf..4229cc141 100644
--- a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mayhewj/greenstalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
 
-SRC_URI[sha256sum] = "0020970abdb6f400586938573cbbec80410e83805d61e46cf76ea3ed71129257"
+SRC_URI[sha256sum] = "3ebde5fc9ecf986f96f6779fd6d15a53f33d432c52a2e28012e100a99ee154a4"
 
 RDEPENDS:${PN} += "python3-io python3-core"
 
-- 
2.25.1


--===============4176579135914758480==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-greenstalk-upgrade-2.0.0-2.0.2.patch"

From a18f212b56b68326bdb381d7207665cbf7f0ebd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:09:38 -0500
Subject: [PATCH] python3-greenstalk: upgrade 2.0.0 -> 2.0.2

---
 ...{python3-greenstalk_2.0.0.bb => python3-greenstalk_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenstalk_2.0.0.bb => python3-greenstalk_2.0.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
index 841b84ddf..4229cc141 100644
--- a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mayhewj/greenstalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
 
-SRC_URI[sha256sum] = "0020970abdb6f400586938573cbbec80410e83805d61e46cf76ea3ed71129257"
+SRC_URI[sha256sum] = "3ebde5fc9ecf986f96f6779fd6d15a53f33d432c52a2e28012e100a99ee154a4"
 
 RDEPENDS:${PN} += "python3-io python3-core"
 
-- 
2.25.1


--===============4176579135914758480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12693 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 310 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:27dbf103074e8b4def9958a1062dbefc4fe47ad6"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:27dbf103074e8b4def9958a1062dbefc4fe47ad6"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:27dbf103074e8b4def9958a1062dbefc4fe47ad6"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 244 Local 20 Mirrors 216 Missed 8 Current 142 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 149 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 151 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1036 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_fetch)
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1317 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_unpack)
NOTE: Running task 1318 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_patch)
NOTE: Running task 1320 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1322 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_configure)
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1324 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_compile)
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-greenstalk/2.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-greenstalk/2.0.2-r0/greenstalk-2.0.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-greenstalk-2.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1324 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-greenstalk-2.0.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-greenstalk-2.0.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-greenstalk/2.0.2-r0/temp/run.do_compile.817816', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-greenstalk/2.0.2-r0/temp/log.do_compile.817816
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb:do_compile) failed with exit code '1'

--===============4176579135914758480==--

