Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65057EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.946.1689139830602008499
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Bf5NCMQU;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01114240007
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139829;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=16uIobf7dzILlhOjiYuDWPmcck+tG0386rxzRfHHfAE=;
	b=Bf5NCMQUNgR0fQz80tbKSeuc9GaEMkubjC0XapV+Nt42n56WUgACwZ9EI3SLdSaZ+m8UX4
	CjRX/qR0DLXHNiHewqvdAUVDrjqoQv3luNf/Xy4Sb0B584dl9rqDWdOzCEyF4UXjHhBus7
	ikDtjBt1GO4K2ywgq4qhoqSflV/Umnwej4T4NqwgwRkDjiwmHLR2exoZVwA3mp9EUFBrEx
	POnNNkH0eX6yq9EYPXq0GH2QBf+9pv5i9K4s0IF4HQwMpIqYnOuDIorv5OWQNKOA3zfnup
	26wZ2gwCKDZu5IJS3jcC338lqoxCBZkilvUAW9y68g9aid1s4GBXLygj74G5BA==
Content-Type: multipart/mixed; boundary="===============4492921089684483284=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-flask: upgrading to 2.3.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103763
Message-Id: <20230712053040.65057EB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:40 +0000 (UTC)

--===============4492921089684483284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flask* to *2.3.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-flask-upgrade-2.2.3-2.3.2.patch
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
From 0928147942a55114446d23c7a2c091e7aabeef40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:22:46 -0500
Subject: [PATCH] python3-flask: upgrade 2.2.3 -> 2.3.2

---
 .../python/{python3-flask_2.2.3.bb => python3-flask_2.3.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.2.3.bb => python3-flask_2.3.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
index 90c56c75a..35f59ff81 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "7eb373984bf1c770023fce9db164ed0c3353cd0b53f130f4693da0ca756a2e6d"
+SRC_URI[sha256sum] = "8c2f9abd47a9e8df7f0c3f091ce9497d011dc3b31effcf4c85a6e2b50f4114ef"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


--===============4492921089684483284==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-flask-upgrade-2.2.3-2.3.2.patch"

From 0928147942a55114446d23c7a2c091e7aabeef40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:22:46 -0500
Subject: [PATCH] python3-flask: upgrade 2.2.3 -> 2.3.2

---
 .../python/{python3-flask_2.2.3.bb => python3-flask_2.3.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.2.3.bb => python3-flask_2.3.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
index 90c56c75a..35f59ff81 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "7eb373984bf1c770023fce9db164ed0c3353cd0b53f130f4693da0ca756a2e6d"
+SRC_URI[sha256sum] = "8c2f9abd47a9e8df7f0c3f091ce9497d011dc3b31effcf4c85a6e2b50f4114ef"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


--===============4492921089684483284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12678 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:012971fe7e3b24c1a574c56e699c499244111ad1"
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
meta-perl            = "tmp-auh-upgrades:012971fe7e3b24c1a574c56e699c499244111ad1"
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
meta-perl            = "tmp-auh-upgrades:012971fe7e3b24c1a574c56e699c499244111ad1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 265 Local 25 Mirrors 232 Missed 8 Current 166 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 173 of 431 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 175 of 431 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flask-2.3.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-flask-2.3.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1099 of 1489 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_fetch)
NOTE: recipe python3-flask-2.3.2-r0: task do_fetch: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 1489 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_unpack)
NOTE: Running task 1474 of 1489 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-flask-2.3.2-r0: task do_unpack: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1475 of 1489 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_patch)
NOTE: Running task 1476 of 1489 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-flask-2.3.2-r0: task do_patch: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-flask-2.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-flask-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1478 of 1489 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_configure)
NOTE: recipe python3-flask-2.3.2-r0: task do_configure: Started
NOTE: recipe python3-flask-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1489 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_compile)
NOTE: recipe python3-flask-2.3.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask/2.3.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask/2.3.2-r0/Flask-2.3.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-flask-2.3.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1480 tasks of which 1473 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-flask-2.3.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-flask-2.3.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask/2.3.2-r0/temp/run.do_compile.633783', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask/2.3.2-r0/temp/log.do_compile.633783
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb:do_compile) failed with exit code '1'

--===============4492921089684483284==--

