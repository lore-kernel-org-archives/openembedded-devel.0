Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8960C41513
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2158.1691221143595941075
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=aSZIG+5y;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EED2CC0004
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221142;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=7AL+/zkxfx54Cl7vJ5u+Fj/VRCMU7F+0ZKlBcQB+ysU=;
	b=aSZIG+5y6T403lCWrP8t0iQwl5nGo2xuXZCCA/PSL6wYYx24DDosDJHUszS6qh5EvHqzbW
	K26t80jgAIDmBOeKofiqSREMiI1tI4FmRnVTOFJx601/NOzfg4QS0aZCHkD39rIkT87CME
	d6toDWWvKRQloDLTGxQ9+tRihYy7JngNe3UliUwUZBaVSJLs7p0yNDfJdvv2vm0iuh5bej
	oXqQsts9Zf/jUMuxFJ+rWSAi0+O5A8KhJBJUESgIm2DKWEmcX+BQ9IBYAyStlSUrYIf/ZO
	6B4WWjDODoBa2W9+oLth5PrNgvaOeWMOhVvje503onfCmsXHTVGhTt8Ut1zwhw==
Content-Type: multipart/mixed; boundary="===============1636132896461885329=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-msm: upgrading to 0.9.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104252
Message-Id: <20230805073909.A8960C41513@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:09 +0000 (UTC)

--===============1636132896461885329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-msm* to *0.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-msm-upgrade-0.8.8-0.9.0.patch
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
From 3829abd541ecf4bad84cb7ad2d1a5e5cbfc01f1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:11:36 -0500
Subject: [PATCH] python3-msm: upgrade 0.8.8 -> 0.9.0

---
 .../python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
index 966ff86de..dbda2e1ed 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
-SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
+SRC_URI[sha256sum] = "3fbed593800aa669f0af2f01edfc3b54de46e995e0bdf03c5ea3693bdeab8735"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============1636132896461885329==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-msm-upgrade-0.8.8-0.9.0.patch"

From 3829abd541ecf4bad84cb7ad2d1a5e5cbfc01f1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:11:36 -0500
Subject: [PATCH] python3-msm: upgrade 0.8.8 -> 0.9.0

---
 .../python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
index 966ff86de..dbda2e1ed 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
-SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
+SRC_URI[sha256sum] = "3fbed593800aa669f0af2f01edfc3b54de46e995e0bdf03c5ea3693bdeab8735"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============1636132896461885329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12687 entries from dependency cache.
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
meta-perl            = "heads/origin/master-next:b6650ff98c003d7fe7d1631bc1ebb1d4366b408c"
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
meta-perl            = "heads/origin/master-next:b6650ff98c003d7fe7d1631bc1ebb1d4366b408c"
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
meta-perl            = "heads/origin/master-next:b6650ff98c003d7fe7d1631bc1ebb1d4366b408c"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 460 Local 246 Mirrors 204 Missed 10 Current 341 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1534 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_recipe_qa)
NOTE: recipe python3-msm-0.9.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2274 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_fetch)
NOTE: recipe python3-msm-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 2275 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_unpack)
NOTE: Running task 2276 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-msm-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2277 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_patch)
NOTE: Running task 2278 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-msm-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2279 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2280 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_populate_lic)
NOTE: recipe python3-msm-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_populate_lic: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_configure)
NOTE: recipe python3-msm-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2282 of 2291 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile)
NOTE: recipe python3-msm-0.9.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-msm/0.9.0-r0/msm-0.9.0/setup.py", line 44, in <module>
|     install_requires=required('requirements/requirements.txt'),
|                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-msm/0.9.0-r0/msm-0.9.0/setup.py", line 34, in required
|     with open(os.path.join(BASEDIR, requirements_file), 'r') as file_handler:
|          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| FileNotFoundError: [Errno 2] No such file or directory: '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-msm/0.9.0-r0/msm-0.9.0/requirements/requirements.txt'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-msm-0.9.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2282 tasks of which 2272 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-msm-0.9.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-msm-0.9.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-msm/0.9.0-r0/temp/run.do_compile.3434419', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-msm/0.9.0-r0/temp/log.do_compile.3434419
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile) failed with exit code '1'

--===============1636132896461885329==--

