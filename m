Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC27C001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.985.1689139843050449934
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=gF2FbCoi;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B6B640004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139841;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=XzxsB74aAjhTsjhOsks1Lt2HgsS6+AAc1M/KcZX1IN0=;
	b=gF2FbCoi/UtoXi7jQ5GxQCV1HhsmMYC2LY8ahj4bOi2/QlL1vJbHXXUriY7cR48z4LP0p9
	269Kg5pzctJupajfCtb0Y/m+QnDFWdMRE7axhkhRXUwX3L0bUy09s5gBSMS3ml7Kg+ViqK
	je0UQiMbni+OTUeDjUxhcgKqi+Qd5aXxadM7q+Jk0sm5/gmZ8L3/B65qyq2R1iyLxxJcrK
	VtCvoekZVq/JfaVDRB1RLpKI0ldGMGwIYT29iV3G7WveGO6xvN4hQqK4yyByn3SDxWhOqv
	qan9mHWT0pxRHhjmQFJD3nNO0qPBB/uDdItIXiSrqsGzS0CXVKNT6ef6Z2JL5g==
Content-Type: multipart/mixed; boundary="===============2388028007949671739=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-humanize: upgrading to 4.7.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103770
Message-Id: <20230712053050.7AC27C001DF@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:50 +0000 (UTC)

--===============2388028007949671739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-humanize* to *4.7.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-humanize-upgrade-4.4.0-4.7.0.patch
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
From 7093dcfc4f3ba98cc216fdfcbd772db3427a1092 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:13:35 -0500
Subject: [PATCH] python3-humanize: upgrade 4.4.0 -> 4.7.0

---
 .../{python3-humanize_4.4.0.bb => python3-humanize_4.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.4.0.bb => python3-humanize_4.7.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
index 7bb03b75f..963f80ae4 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "efb2584565cc86b7ea87a977a15066de34cdedaf341b11c851cfcfd2b964779c"
+SRC_URI[sha256sum] = "7ca0e43e870981fa684acb5b062deb307218193bca1a01f2b2676479df849b3a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============2388028007949671739==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-humanize-upgrade-4.4.0-4.7.0.patch"

From 7093dcfc4f3ba98cc216fdfcbd772db3427a1092 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:13:35 -0500
Subject: [PATCH] python3-humanize: upgrade 4.4.0 -> 4.7.0

---
 .../{python3-humanize_4.4.0.bb => python3-humanize_4.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.4.0.bb => python3-humanize_4.7.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
index 7bb03b75f..963f80ae4 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "efb2584565cc86b7ea87a977a15066de34cdedaf341b11c851cfcfd2b964779c"
+SRC_URI[sha256sum] = "7ca0e43e870981fa684acb5b062deb307218193bca1a01f2b2676479df849b3a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============2388028007949671739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12696 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:56c63e86421147bf1b239a9e5d6349ae9c08a752"
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
meta-perl            = "tmp-auh-upgrades:56c63e86421147bf1b239a9e5d6349ae9c08a752"
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
meta-perl            = "tmp-auh-upgrades:56c63e86421147bf1b239a9e5d6349ae9c08a752"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 254 Local 20 Mirrors 226 Missed 8 Current 151 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 158 of 405 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 160 of 405 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-humanize-4.7.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-humanize-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1072 of 1399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_fetch)
NOTE: recipe python3-humanize-4.7.0-r0: task do_fetch: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1383 of 1399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_unpack)
NOTE: Running task 1384 of 1399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-humanize-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_patch)
NOTE: Running task 1386 of 1399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-humanize-4.7.0-r0: task do_patch: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-humanize-4.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-humanize-4.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 1399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_configure)
NOTE: recipe python3-humanize-4.7.0-r0: task do_configure: Started
NOTE: recipe python3-humanize-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1390 of 1399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_compile)
NOTE: recipe python3-humanize-4.7.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-humanize/4.7.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_impl.py", line 321, in _call_hook
|     raise BackendUnavailable(data.get('traceback', ''))
| pyproject_hooks._impl.BackendUnavailable: Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-humanize/4.7.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_in_process/_in_process.py", line 77, in _build_backend
|     obj = import_module(mod_path)
|           ^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-humanize/4.7.0-r0/recipe-sysroot-native/usr/lib/python3.11/importlib/__init__.py", line 126, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1204, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1176, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1126, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
|   File "<frozen importlib._bootstrap>", line 1204, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1176, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1140, in _find_and_load_unlocked
| ModuleNotFoundError: No module named 'hatchling'
| 
| ERROR Backend 'hatchling.build' is not available.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-humanize-4.7.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1390 tasks of which 1383 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-humanize-4.7.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-humanize/4.7.0-r0/temp/run.do_compile.824832', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-humanize/4.7.0-r0/temp/log.do_compile.824832
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb:do_compile) failed with exit code '1'

--===============2388028007949671739==--

