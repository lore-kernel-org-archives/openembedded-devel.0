Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64390EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.984.1689139886642828180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=AMLOWgE4;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C2BC1C000A
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139885;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=4NzMVElP8pKlB91XtsMOv7wIOo8UiDvu0QgCdo7fQ5o=;
	b=AMLOWgE4iIUmM336g91jWawoApcdCGRFep9m4pK9J+rvfAzMm89PPbzith90kJTE79RVQt
	Zwi4t1D985yE7dYl8kXxA24JCD9/crejpbmAeS2kTTrICq/IY332BwSJrkIDxIot0enYD5
	B0ndNMRRQBlvnj1yRRxmJgpZwL6nTsG1fDpY0hVDGIqtPU1oToBYtGf6r9rocNr4qw5WWm
	ceRIh+hn1A0aaFt1k2wR43bnXA4Dy2mPlNlcS3HeXzxnV0v6cvA3OtYBEuhh/h1F33xAh8
	pTH/pyjAwdDhEO57+Gw5ssTrPpq1rezbEeVPo5G4OpMzTvulNKXDRSsq6cVBgg==
Content-Type: multipart/mixed; boundary="===============0770877602836511680=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pyperf: upgrading to 2.6.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103796
Message-Id: <20230712053130.64390EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:30 +0000 (UTC)

--===============0770877602836511680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyperf* to *2.6.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pyperf-upgrade-2.5.0-2.6.1.patch
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
From 2f4e81f8943cdb9cf2ed14132bf6c34ddb63467b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:01:37 -0500
Subject: [PATCH] python3-pyperf: upgrade 2.5.0 -> 2.6.1

---
 .../python/{python3-pyperf_2.5.0.bb => python3-pyperf_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.5.0.bb => python3-pyperf_2.6.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
index d5eaa4f60..39f3c00a0 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "9fd9be5b57224e68b5a5b88f7126f15b6c8667573f62a0a39faf14d6fdd13909"
+SRC_URI[sha256sum] = "171aea69b8efde61210e512166d8764e7765a9c7678b768052174b01f349f247"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.25.1


--===============0770877602836511680==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pyperf-upgrade-2.5.0-2.6.1.patch"

From 2f4e81f8943cdb9cf2ed14132bf6c34ddb63467b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:01:37 -0500
Subject: [PATCH] python3-pyperf: upgrade 2.5.0 -> 2.6.1

---
 .../python/{python3-pyperf_2.5.0.bb => python3-pyperf_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.5.0.bb => python3-pyperf_2.6.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
index d5eaa4f60..39f3c00a0 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "9fd9be5b57224e68b5a5b88f7126f15b6c8667573f62a0a39faf14d6fdd13909"
+SRC_URI[sha256sum] = "171aea69b8efde61210e512166d8764e7765a9c7678b768052174b01f349f247"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.25.1


--===============0770877602836511680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12789 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:fc36f095f3b0e4059965db87cd9f68d940181e31"
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
meta-perl            = "tmp-auh-upgrades:fc36f095f3b0e4059965db87cd9f68d940181e31"
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
meta-perl            = "tmp-auh-upgrades:fc36f095f3b0e4059965db87cd9f68d940181e31"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 233 Local 9 Mirrors 216 Missed 8 Current 156 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 163 of 389 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 165 of 389 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyperf-2.6.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pyperf-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1047 of 1344 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_fetch)
NOTE: recipe python3-pyperf-2.6.1-r0: task do_fetch: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1328 of 1344 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_unpack)
NOTE: Running task 1329 of 1344 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyperf-2.6.1-r0: task do_unpack: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1330 of 1344 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_patch)
NOTE: Running task 1331 of 1344 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyperf-2.6.1-r0: task do_patch: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyperf-2.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyperf-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1333 of 1344 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_configure)
NOTE: recipe python3-pyperf-2.6.1-r0: task do_configure: Started
NOTE: recipe python3-pyperf-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1335 of 1344 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_compile)
NOTE: recipe python3-pyperf-2.6.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pyperf/2.6.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pyperf/2.6.1-r0/pyperf-2.6.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-pyperf-2.6.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1335 tasks of which 1328 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyperf-2.6.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pyperf-2.6.1-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pyperf/2.6.1-r0/temp/run.do_compile.1468725', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pyperf/2.6.1-r0/temp/log.do_compile.1468725
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb:do_compile) failed with exit code '1'

--===============0770877602836511680==--

