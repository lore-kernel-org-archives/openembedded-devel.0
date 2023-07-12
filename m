Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B175EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.963.1689139861431822088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=QAGGkn0X;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD5EB60002
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139860;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=mod1vMOAjxHhfs31OsgkNy7Y69d3oJhZwhoB8dZGRY0=;
	b=QAGGkn0XqzwNC7upZRasozj6sWQrfZhhvj1eUZ/zDKzKqqD3mIKdsnWDmXYBrbqzA04WVx
	pI81s//87UC8FoO8GYLc35Dsk3lfn1X0t3LkwGxZzdiBd9ofjChaBUXZP+2qwpFdKYM0y7
	nV8P5lVVeEdlq//DBiC5XVOZasyI/otkHYNn7Rh0DcwAcxYGfwfzhysoYHMy1E9HLmeOp8
	2of7LgN2BEpomBMkT60BWeZVEHIf3vGmoMwDx9dl/USs0an8DsdwZinZ0+iAWSvGKNyBMj
	QtTu1zSqb861bEUrTX+o3jQKzsfQVJS04gnibuw6kEXiL1g/IznpKoTOVPk5aA==
Content-Type: multipart/mixed; boundary="===============4219916038028132949=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-mypy: upgrading to 1.4.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103781
Message-Id: <20230712053110.6B175EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:10 +0000 (UTC)

--===============4219916038028132949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mypy* to *1.4.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-mypy-upgrade-0.971-1.4.1.patch
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
From 9fea53257d299b2597442b2e2c4eba97ee123d69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:22:05 -0500
Subject: [PATCH] python3-mypy: upgrade 0.971 -> 1.4.1

---
 .../python/{python3-mypy_0.971.bb => python3-mypy_1.4.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.971.bb => python3-mypy_1.4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb b/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_0.971.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb
index 31fcb06c9..0770906a9 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "40b0f21484238269ae6a57200c807d80debc6459d444c0489a102d7c6a75fa56"
+SRC_URI[sha256sum] = "9bbcd9ab8ea1f2e1c8031c21445b511442cc45c89951e49bbf852cbb70755b1b"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1


--===============4219916038028132949==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-mypy-upgrade-0.971-1.4.1.patch"

From 9fea53257d299b2597442b2e2c4eba97ee123d69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:22:05 -0500
Subject: [PATCH] python3-mypy: upgrade 0.971 -> 1.4.1

---
 .../python/{python3-mypy_0.971.bb => python3-mypy_1.4.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.971.bb => python3-mypy_1.4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb b/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_0.971.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb
index 31fcb06c9..0770906a9 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "40b0f21484238269ae6a57200c807d80debc6459d444c0489a102d7c6a75fa56"
+SRC_URI[sha256sum] = "9bbcd9ab8ea1f2e1c8031c21445b511442cc45c89951e49bbf852cbb70755b1b"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1


--===============4219916038028132949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12729 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:0668313b9517333e2afb918624126cafb14d4603"
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
meta-perl            = "tmp-auh-upgrades:0668313b9517333e2afb918624126cafb14d4603"
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
meta-perl            = "tmp-auh-upgrades:0668313b9517333e2afb918624126cafb14d4603"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 236 Local 9 Mirrors 219 Missed 8 Current 170 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 177 of 406 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 179 of 406 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mypy-1.4.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mypy-1.4.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1076 of 1385 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_fetch)
NOTE: recipe python3-mypy-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1369 of 1385 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_unpack)
NOTE: Running task 1370 of 1385 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mypy-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1371 of 1385 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_patch)
NOTE: Running task 1372 of 1385 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-mypy-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mypy-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-mypy-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1374 of 1385 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_configure)
NOTE: recipe python3-mypy-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1376 of 1385 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_compile)
NOTE: recipe python3-mypy-1.4.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| running egg_info
| writing mypy.egg-info/PKG-INFO
| writing dependency_links to mypy.egg-info/dependency_links.txt
| writing entry points to mypy.egg-info/entry_points.txt
| writing requirements to mypy.egg-info/requires.txt
| writing top-level names to mypy.egg-info/top_level.txt
| reading manifest file 'mypy.egg-info/SOURCES.txt'
| reading manifest template 'MANIFEST.in'
| warning: no directories found matching 'scripts'
| no previously-included directories found matching 'docs/build'
| no previously-included directories found matching 'docs/source/_build'
| warning: no previously-included files found matching '.gitmodules'
| warning: no previously-included files found matching 'CONTRIBUTING.md'
| warning: no previously-included files found matching 'CREDITS'
| warning: no previously-included files found matching 'ROADMAP.md'
| warning: no previously-included files found matching 'tox.ini'
| warning: no previously-included files found matching 'action.yml'
| warning: no previously-included files found matching '.editorconfig'
| warning: no previously-included files found matching '.git-blame-ignore-revs'
| warning: no previously-included files found matching '.pre-commit-config.yaml'
| warning: no previously-included files matching '*.py[cod]' found anywhere in distribution
| warning: no previously-included files matching '.DS_Store' found anywhere in distribution
| adding license file 'LICENSE'
| writing manifest file 'mypy.egg-info/SOURCES.txt'
| 
| ERROR Missing dependencies:
| 	mypy_extensions>=1.0.0
| 	typing_extensions>=4.1.0
| 	types-typed-ast<1.6.0,>=1.5.8.5
| 	types-setuptools
| 	types-psutil
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-mypy-1.4.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1376 tasks of which 1369 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-mypy-1.4.1-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-mypy/1.4.1-r0/temp/run.do_compile.1283892', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-mypy/1.4.1-r0/temp/log.do_compile.1283892
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_compile) failed with exit code '1'

--===============4219916038028132949==--

