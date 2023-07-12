Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670F2EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:29:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.953.1689139785305569059
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=MYheMB+D;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE8DA60002
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139783;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=ZTem0MUHAYOtsTvxKIdhj2LBIaTijSyGf91lIGFRQ+Y=;
	b=MYheMB+DNfuGzGdwxRcSu96iKWsOPGtHgilJUYZahmx5NyL8VlbFxdYhO+A1geNuyjI6zz
	B6G4NemU8gL/dC4xqbEAjXqmWlKfP7GQWqzsAifN4cN5IHzUHipB0+JfpuBEwWnFsJYXIR
	ElL0PwEHdEa3gvK3e0vx6a/N4Fw56W00831Bm3LjTslxZu8uP4sOqqVLhKg5kJ2RmB8atV
	5o4jP2URER36gWXKfmV/EWW73gZ5c5INVIy4aiM9EVw3+1x0SDvdbuuCZCokrCkLNW88yX
	Y1de7geJY6TLHDefIoayd8j7Rm0TZJSuZNbkOAD2eT2kH++s0oHJwujmt6LUeQ==
Content-Type: multipart/mixed; boundary="===============5853004318070296798=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-asyncinotify: upgrading to 4.0.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103743
Message-Id: <20230712052950.670F2EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:29:50 +0000 (UTC)

--===============5853004318070296798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-asyncinotify* to *4.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-asyncinotify-upgrade-3.0.1-4.0.2.patch
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
From fdd77bc053263d85a69d1e70e33c7298f749d053 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:45:42 -0500
Subject: [PATCH] python3-asyncinotify: upgrade 3.0.1 -> 4.0.2

---
 ...hon3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
index 2f4adcea7..0c5e39114 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "da812bf2be6a76aac6670b766eec4564d9484da6595d3ce1f9bba8ba78c30445"
+SRC_URI[sha256sum] = "bcac19425b1b418bbbc4d31193ea3c39e24343cd7ddff2074ae7b599f1a04829"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5853004318070296798==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-asyncinotify-upgrade-3.0.1-4.0.2.patch"

From fdd77bc053263d85a69d1e70e33c7298f749d053 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:45:42 -0500
Subject: [PATCH] python3-asyncinotify: upgrade 3.0.1 -> 4.0.2

---
 ...hon3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
index 2f4adcea7..0c5e39114 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "da812bf2be6a76aac6670b766eec4564d9484da6595d3ce1f9bba8ba78c30445"
+SRC_URI[sha256sum] = "bcac19425b1b418bbbc4d31193ea3c39e24343cd7ddff2074ae7b599f1a04829"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5853004318070296798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12597 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:ea652dbf24be28e7b804a9daf5c53f9b1cc10ee8"
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
meta-perl            = "tmp-auh-upgrades:ea652dbf24be28e7b804a9daf5c53f9b1cc10ee8"
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
meta-perl            = "tmp-auh-upgrades:ea652dbf24be28e7b804a9daf5c53f9b1cc10ee8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 258 Local 33 Mirrors 217 Missed 8 Current 128 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 135 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 137 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1036 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_fetch)
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_fetch: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1317 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_unpack)
NOTE: Running task 1318 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_unpack: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_patch)
NOTE: Running task 1320 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_patch: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1322 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_configure)
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_configure: Started
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1324 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_compile)
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-asyncinotify/4.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-asyncinotify/4.0.2-r0/asyncinotify-4.0.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-asyncinotify-4.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1324 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-asyncinotify-4.0.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-asyncinotify-4.0.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-asyncinotify/4.0.2-r0/temp/run.do_compile.301274', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-asyncinotify/4.0.2-r0/temp/log.do_compile.301274
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb:do_compile) failed with exit code '1'

--===============5853004318070296798==--

