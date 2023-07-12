Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D81C3DA40
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1038.1689139906037529063
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=PqSvXAqr;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65BC81C0003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139904;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=SkqbAVG22sFvYwws4xYSRhBVpEklsmDGyXHNMboRos8=;
	b=PqSvXAqr8eHhI6HrKyHMn9jh17hLpM4aFuGTPDz1PqWh/kXht8N6D+GVsDDHFmQwmpiv8P
	qeLpU+ocRfwW9YlJaI06YranwApZxp1jhD83JxW422pXU3oIa2zbn5rQ8SeyO+FPX0zaCC
	5VDk4eSnDgBRZDhrchUxo2tWFTLs+Ve0hol5DLsLnNRmW1j7b1dmGihlWjDpUQvLdOwCeH
	c4fbrxBaeD1yR3gGG9Zxs5fEBTV4S39XXplpzFbS5jv0U7NVwsM/zlgMWFxrResVflRBNN
	V8YTz7loJ0ONyfG3I9rkGiPzS32fVUi7b2KS8JddfFPA0kYVtCHnZ5/fTDMS1g==
Content-Type: multipart/mixed; boundary="===============5796976008618470574=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-sh: upgrading to 2.0.4 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103807
Message-Id: <20230712053150.75D81C3DA40@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:50 +0000 (UTC)

--===============5796976008618470574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sh* to *2.0.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-sh-upgrade-1.14.3-2.0.4.patch
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
From 093f2eeb2e9fe768965570088d34d9441c26df3b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:47:52 -0500
Subject: [PATCH] python3-sh: upgrade 1.14.3 -> 2.0.4

---
 .../python/{python3-sh_1.14.3.bb => python3-sh_2.0.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.14.3.bb => python3-sh_2.0.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb b/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
index 317f648dc..10a32c30a 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7"
+SRC_URI[sha256sum] = "a18920f0839991bc9dfddb6dcc006c360b1064ba96257359f0ea356e9fa75a60"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.25.1


--===============5796976008618470574==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-sh-upgrade-1.14.3-2.0.4.patch"

From 093f2eeb2e9fe768965570088d34d9441c26df3b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:47:52 -0500
Subject: [PATCH] python3-sh: upgrade 1.14.3 -> 2.0.4

---
 .../python/{python3-sh_1.14.3.bb => python3-sh_2.0.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.14.3.bb => python3-sh_2.0.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb b/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
index 317f648dc..10a32c30a 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7"
+SRC_URI[sha256sum] = "a18920f0839991bc9dfddb6dcc006c360b1064ba96257359f0ea356e9fa75a60"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.25.1


--===============5796976008618470574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12828 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:8c337106c6ca4369af7172ceeca9e54c33781ed4"
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
meta-perl            = "tmp-auh-upgrades:8c337106c6ca4369af7172ceeca9e54c33781ed4"
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
meta-perl            = "tmp-auh-upgrades:8c337106c6ca4369af7172ceeca9e54c33781ed4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 232 Local 9 Mirrors 215 Missed 8 Current 154 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 161 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 163 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sh-2.0.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sh-2.0.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1036 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_fetch)
NOTE: recipe python3-sh-2.0.4-r0: task do_fetch: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1317 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_unpack)
NOTE: Running task 1318 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sh-2.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_patch)
NOTE: Running task 1320 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-sh-2.0.4-r0: task do_patch: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sh-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sh-2.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1322 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_configure)
NOTE: recipe python3-sh-2.0.4-r0: task do_configure: Started
NOTE: recipe python3-sh-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1324 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_compile)
NOTE: recipe python3-sh-2.0.4-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-sh/2.0.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-sh/2.0.4-r0/sh-2.0.4/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-sh-2.0.4-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1324 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-sh-2.0.4-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-sh-2.0.4-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-sh/2.0.4-r0/temp/run.do_compile.1575066', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-sh/2.0.4-r0/temp/log.do_compile.1575066
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb:do_compile) failed with exit code '1'

--===============5796976008618470574==--

