Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1A4C00528
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2146.1691221116206850737
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=j1nypv2j;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41A0B40002
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221113;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=iNfNrbG8q9qfqDrq/5lYeBKFAvCGcZb/4o7+UBoZQCY=;
	b=j1nypv2jdLYSjbWgdK9WdSXKm5YadNInpVB5631gVW6tPza8qTEnqtn5qgP3YhHx61nJPY
	ebwuuAdSHDthnczDZjM0XAGhX8Wun55iK52U+2C4gZJqTCeNQPP30NLQG9xIOLQYlbdS33
	+8YxWZ9S2Z2kZAr71QJ5KMMo4HYnpqTwrxr92/0dDUhOjsCemg34OQoL2R/NrRLXemScTk
	89UTN+4sjB4b/xMfetLRDFjbkqJxX2popMNwGLX45WF0pmheYm7isTH8rLVUoZw7Tr0j0n
	R6BrooYy7MwnKOIb8SCZc20uRKUybI5eptV1iuxJcMBMxf4eCCR6NzUjWqV99g==
Content-Type: multipart/mixed; boundary="===============2904174130224700473=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cantools: upgrading to 39.0.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104239
Message-Id: <20230805073839.BA1A4C00528@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:39 +0000 (UTC)

--===============2904174130224700473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cantools* to *39.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cantools-upgrade-38.0.2-39.0.0.patch
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
From 7d31946fcd40ab5e14604dfc2549f1ecf0c6f297 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:35:06 -0500
Subject: [PATCH] python3-cantools: upgrade 38.0.2 -> 39.0.0

---
 .../{python3-cantools_38.0.2.bb => python3-cantools_39.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_38.0.2.bb => python3-cantools_39.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb b/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb
index 003573583..9e6bf7f6a 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "93bfe6f4bd652f369763ea9162b027a62f424a8400f2423d41137918ce68c68e"
+SRC_URI[sha256sum] = "60b3d224e3b080b1215fe37d21b043830ea68ee44fce0614977823ffd850fb18"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.25.1


--===============2904174130224700473==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-cantools-upgrade-38.0.2-39.0.0.patch"

From 7d31946fcd40ab5e14604dfc2549f1ecf0c6f297 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:35:06 -0500
Subject: [PATCH] python3-cantools: upgrade 38.0.2 -> 39.0.0

---
 .../{python3-cantools_38.0.2.bb => python3-cantools_39.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_38.0.2.bb => python3-cantools_39.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb b/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb
index 003573583..9e6bf7f6a 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "93bfe6f4bd652f369763ea9162b027a62f424a8400f2423d41137918ce68c68e"
+SRC_URI[sha256sum] = "60b3d224e3b080b1215fe37d21b043830ea68ee44fce0614977823ffd850fb18"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.25.1


--===============2904174130224700473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12636 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7338 cached, 3 parsed). 12618 targets, 325 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 368 Local 178 Mirrors 180 Missed 10 Current 268 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1330 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_recipe_qa)
NOTE: recipe python3-cantools-39.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1772 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_fetch)
NOTE: recipe python3-cantools-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1773 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_unpack)
NOTE: Running task 1774 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cantools-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_patch)
NOTE: Running task 1776 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-cantools-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cantools-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1777 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1778 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_populate_lic)
NOTE: recipe python3-cantools-39.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cantools-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cantools-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1779 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_configure)
NOTE: recipe python3-cantools-39.0.0-r0: task do_configure: Started
NOTE: recipe python3-cantools-39.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1780 of 1789 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_compile)
NOTE: recipe python3-cantools-39.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-cantools/39.0.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-cantools/39.0.0-r0/cantools-39.0.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-cantools-39.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1780 tasks of which 1770 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-cantools-39.0.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-cantools-39.0.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-cantools/39.0.0-r0/temp/run.do_compile.2941473', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-cantools/39.0.0-r0/temp/log.do_compile.2941473
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-cantools_39.0.0.bb:do_compile) failed with exit code '1'

--===============2904174130224700473==--

