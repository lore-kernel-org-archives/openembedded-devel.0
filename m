Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642F6EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.972.1689139827283273683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=ACzJ472t;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7864E0002
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139825;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=sGkiUT/6g7FpZj5Yhe+EBxDJ/SbjfsWKH0KOWEj8HMo=;
	b=ACzJ472tqS74hpAnNRgjNJGCN0QinIcZ9S3GUAMhZNyuE9fjkgel41nFbemi6oZhp+JYac
	kT8vEh2Fw9Gz52iYelTKHLYSPF6mBw4I+Wpv+sq9znEG0iN4qNsRSC4h98CRQ5KmiUDuaS
	8eNKcCVEFxRvNUCf9kcreCTXgVUaZm2p3jWpGeIVmQGlOD99UV0s3ZexlBQHKyUeI45sNo
	gE4Rj2TlLsxBhuz9QTarDTdt3SnBQ2MtVIsOwCSF30sC3enmsk7K2CbUbUopMgn8CfPnWp
	IIi8/dy828YxIfg9WhERt/P6FbMalngvK2NKfUTEXdm4qgc/4t7C2ST2jNHhtQ==
Content-Type: multipart/mixed; boundary="===============4575125099637465817=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-execnet: upgrading to 2.0.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103761
Message-Id: <20230712053030.642F6EB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:30 +0000 (UTC)

--===============4575125099637465817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-execnet* to *2.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-execnet-upgrade-1.9.0-2.0.2.patch
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
From e5528d3315a5b4fa2ef245080c6c5d501ee0b2e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:16:00 -0500
Subject: [PATCH] python3-execnet: upgrade 1.9.0 -> 2.0.2

---
 .../{python3-execnet_1.9.0.bb => python3-execnet_2.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-execnet_1.9.0.bb => python3-execnet_2.0.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
index ea17e8414..195c0e10b 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
@@ -13,7 +13,7 @@ DEPENDS += "\
 
 SRC_URI += "file://run-ptest \
            "
-SRC_URI[sha256sum] = "8f694f3ba9cc92cab508b152dcfe322153975c29bda272e2fd7f3f00f36e47c5"
+SRC_URI[sha256sum] = "cc59bc4423742fd71ad227122eb0dd44db51efb3dc4095b45ac9a08c770096af"
 
 inherit ptest pypi setuptools3
 
-- 
2.25.1


--===============4575125099637465817==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-execnet-upgrade-1.9.0-2.0.2.patch"

From e5528d3315a5b4fa2ef245080c6c5d501ee0b2e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:16:00 -0500
Subject: [PATCH] python3-execnet: upgrade 1.9.0 -> 2.0.2

---
 .../{python3-execnet_1.9.0.bb => python3-execnet_2.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-execnet_1.9.0.bb => python3-execnet_2.0.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
index ea17e8414..195c0e10b 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
@@ -13,7 +13,7 @@ DEPENDS += "\
 
 SRC_URI += "file://run-ptest \
            "
-SRC_URI[sha256sum] = "8f694f3ba9cc92cab508b152dcfe322153975c29bda272e2fd7f3f00f36e47c5"
+SRC_URI[sha256sum] = "cc59bc4423742fd71ad227122eb0dd44db51efb3dc4095b45ac9a08c770096af"
 
 inherit ptest pypi setuptools3
 
-- 
2.25.1


--===============4575125099637465817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12669 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:df73a56beece97ab3c5cb164a10f931ba63aa71c"
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
meta-perl            = "tmp-auh-upgrades:df73a56beece97ab3c5cb164a10f931ba63aa71c"
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
meta-perl            = "tmp-auh-upgrades:df73a56beece97ab3c5cb164a10f931ba63aa71c"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 307 Local 25 Mirrors 274 Missed 8 Current 174 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 181 of 481 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 183 of 481 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-execnet-2.0.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-execnet-2.0.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1057 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_fetch)
NOTE: recipe python3-execnet-2.0.2-r0: task do_fetch: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_unpack)
NOTE: Running task 1619 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-execnet-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_patch)
NOTE: Running task 1671 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-execnet-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-execnet-2.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-execnet-2.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1673 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_configure)
NOTE: recipe python3-execnet-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-execnet-2.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-execnet-2.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1676 of 1687 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_compile)
NOTE: recipe python3-execnet-2.0.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-execnet/2.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-execnet/2.0.2-r0/execnet-2.0.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-execnet-2.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1676 tasks of which 1668 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-execnet-2.0.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-execnet-2.0.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-execnet/2.0.2-r0/temp/run.do_compile.608035', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-execnet/2.0.2-r0/temp/log.do_compile.608035
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb:do_compile) failed with exit code '1'

--===============4575125099637465817==--

