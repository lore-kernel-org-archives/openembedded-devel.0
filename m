Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BE4EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.934.1689139811226307014
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=hJYP8/IX;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98F2F24000D
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139809;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=QJ3Zz6pw9FWELCA1ofk/3gZSbl2ZRKot2xFJQG/22BQ=;
	b=hJYP8/IX8vMoFLUbmHuABsZnt8zyuA8OxvCRfk9CO5+cVOHdxzTBo8A+gd9GImSmWFf7mN
	tat0KIqY3mA1ubi6lIP+tKWoF5jLr4nqnv1l//MJ7RrmMpwlMJJvulIE2Yd2ocZLTFGFgH
	nOv7r6hTLZVgCpoB1LAec7NJSAu2MPaHu5GzrPcOBxOek6vpMRVxGFeDrxhGdZvG6gi+n/
	EjcR527LhJLmrWnEwSc4x+aTtnujJOvE95gsy+ubN1kP7ANegsnO+kR8RHiK6SwSZlCAU6
	bD22VEUI/zoBW43UTyGNVvXPUSp6ztlpj+buifqWVkXIdItAGnNmMhT/MuHdCA==
Content-Type: multipart/mixed; boundary="===============2575826610582288565=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-blinker: upgrading to 1.6.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103752
Message-Id: <20230712053020.67BE4EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:20 +0000 (UTC)

--===============2575826610582288565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-blinker* to *1.6.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-blinker-upgrade-1.5-1.6.2.patch
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
From fd4e5e3a2b0a5643b2c6b89bbc378c0c39413cf6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:30:30 -0500
Subject: [PATCH] python3-blinker: upgrade 1.5 -> 1.6.2

---
 .../python/{python3-blinker_1.5.bb => python3-blinker_1.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-blinker_1.5.bb => python3-blinker_1.6.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.5.bb b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-blinker_1.5.bb
rename to meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
index dae1e3943..79a25746a 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
-SRC_URI[sha256sum] = "923e5e2f69c155f2cc42dafbbd70e16e3fde24d2d4aa2ab72fbe386238892462"
+SRC_URI[sha256sum] = "4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============2575826610582288565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12639 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:7bc4365b1ee7207bd0213da08578a7230967d982"
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
meta-perl            = "tmp-auh-upgrades:7bc4365b1ee7207bd0213da08578a7230967d982"
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
meta-perl            = "tmp-auh-upgrades:7bc4365b1ee7207bd0213da08578a7230967d982"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 307 Local 25 Mirrors 274 Missed 8 Current 173 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 180 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 182 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-blinker-1.6.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-blinker-1.6.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1028 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_fetch)
NOTE: recipe python3-blinker-1.6.2-r0: task do_fetch: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1556 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_unpack)
NOTE: Running task 1557 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-blinker-1.6.2-r0: task do_unpack: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_patch)
NOTE: Running task 1669 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-blinker-1.6.2-r0: task do_patch: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-blinker-1.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-blinker-1.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_configure)
NOTE: recipe python3-blinker-1.6.2-r0: task do_configure: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_configure_ptest_base)
NOTE: recipe python3-blinker-1.6.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-blinker-1.6.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1674 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_compile)
NOTE: recipe python3-blinker-1.6.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-blinker/1.6.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-blinker/1.6.2-r0/blinker-1.6.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-blinker-1.6.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1674 tasks of which 1666 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-blinker-1.6.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-blinker-1.6.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-blinker/1.6.2-r0/temp/run.do_compile.485902', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-blinker/1.6.2-r0/temp/log.do_compile.485902
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb:do_compile) failed with exit code '1'

--===============2575826610582288565==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-blinker-upgrade-1.5-1.6.2.patch"

From fd4e5e3a2b0a5643b2c6b89bbc378c0c39413cf6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:30:30 -0500
Subject: [PATCH] python3-blinker: upgrade 1.5 -> 1.6.2

---
 .../python/{python3-blinker_1.5.bb => python3-blinker_1.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-blinker_1.5.bb => python3-blinker_1.6.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.5.bb b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-blinker_1.5.bb
rename to meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
index dae1e3943..79a25746a 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
-SRC_URI[sha256sum] = "923e5e2f69c155f2cc42dafbbd70e16e3fde24d2d4aa2ab72fbe386238892462"
+SRC_URI[sha256sum] = "4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============2575826610582288565==--

