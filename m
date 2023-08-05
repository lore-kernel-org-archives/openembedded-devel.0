Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA577C04FE0
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:09 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.2159.1691221145324864989
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Oyb5H/3c;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.200, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0FED20004
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221144;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=PezAMqF5dNeyG5/Q19z9O4CkttwcuQ3nDLtLzMhOb24=;
	b=Oyb5H/3caKcl/OpbZnV9lfhU3rhLlA7hM47DIJHtJ4vRz6gt0J5d20Pmi+1F5EzFTHRATJ
	ElL+N41oLPVZpDlq11ertD+ThV0QX5AEGG7LVTPwiuotugtZ30fYkKYO9fahG5Ex1JDCWQ
	ddGnV1e174EN4Il/LA9z0ggpFqFdzd8GimVHdiM803hwm0SxSQfFNO+2VR56kYINzWgAyZ
	tX3ojqaGbJt2tewX17Ht1wRhmTHQ5kBbeGND/D0a3gkMxvAIoKaVyhCmxrxiQRA3bLaivw
	kIZk1qm59kRLWgT5iWUQSgE7cofx89X4qeJCSPmp5X3J2xCnAVTXDyK7XgMQhg==
Content-Type: multipart/mixed; boundary="===============7570149861390697305=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-mypy: upgrading to 1.4.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104253
Message-Id: <20230805073909.BA577C04FE0@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:09 +0000 (UTC)

--===============7570149861390697305==
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
From fe503839e35bb0ab753f38c98af5a4e592a781e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:16:24 -0500
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


--===============7570149861390697305==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-mypy-upgrade-0.971-1.4.1.patch"

From fe503839e35bb0ab753f38c98af5a4e592a781e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:16:24 -0500
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


--===============7570149861390697305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12690 entries from dependency cache.
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
meta-perl            = "heads/origin/master-next:393adf5c1c4662d66edc98835d6fbc7cff86128c"
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
meta-perl            = "heads/origin/master-next:393adf5c1c4662d66edc98835d6fbc7cff86128c"
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
meta-perl            = "heads/origin/master-next:393adf5c1c4662d66edc98835d6fbc7cff86128c"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 330 Local 146 Mirrors 174 Missed 10 Current 288 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1323 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_recipe_qa)
NOTE: recipe python3-mypy-1.4.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1725 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_fetch)
NOTE: recipe python3-mypy-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1726 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_unpack)
NOTE: Running task 1727 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mypy-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1728 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_patch)
NOTE: Running task 1729 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-mypy-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mypy-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-mypy-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1730 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1731 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_populate_lic)
NOTE: recipe python3-mypy-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_populate_lic: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-mypy-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1732 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_configure)
NOTE: recipe python3-mypy-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-mypy-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1742 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_compile)
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
NOTE: Tasks Summary: Attempted 1733 tasks of which 1723 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-mypy-1.4.1-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-mypy/1.4.1-r0/temp/run.do_compile.3445651', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-mypy/1.4.1-r0/temp/log.do_compile.3445651
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-mypy_1.4.1.bb:do_compile) failed with exit code '1'

--===============7570149861390697305==--

