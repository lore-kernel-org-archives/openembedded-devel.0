Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6433DEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.960.1689139859796686723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=STofn4EA;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E9EAC0004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139858;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=Xy9yYiNyyGvUQfGjMF2Ij1H8nOy3ov6lX/0DPUbtnC4=;
	b=STofn4EAJ/cFs15erdO0gABdJoK0KqFI4M4/+OzPmCWq8zcoWUr9XPtDyJeBMPy16C5sR2
	3LP/rfbk75opOKKOlf3ePrnd47HBAkl9Kpsu5/JESD9gNFfAaOMX84ffJrzd69XlyigqaI
	Azd4ijyyagzInlMBiwWgqag+arUFTdjHUQ3M5dc3ZIbAJXSeOc08sncm4GKjKQgTLo4+7W
	+oyBdEnZNLn/VgvF7cHkuEnHDBE2ywYpmV3X5uYlKwM7II0VmJ+Hn4dRx3TMeLO9javnFa
	t4Q4XdQvULatjs23o9BUmfc2LlIFVOM0j9QJl6xFE7P3nHaiHqgXhbSjY3eW0w==
Content-Type: multipart/mixed; boundary="===============1085073310287617201=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-msm: upgrading to 0.9.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103780
Message-Id: <20230712053100.6433DEB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:00 +0000 (UTC)

--===============1085073310287617201==
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
From 7a1e87d153adb555bdf0c06d38e338c5d6ce32ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:17:08 -0500
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


--===============1085073310287617201==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-msm-upgrade-0.8.8-0.9.0.patch"

From 7a1e87d153adb555bdf0c06d38e338c5d6ce32ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:17:08 -0500
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


--===============1085073310287617201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12726 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:5b59c4bd4d04fa23f10f44fd1ec1291d3e160e9d"
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
meta-perl            = "tmp-auh-upgrades:5b59c4bd4d04fa23f10f44fd1ec1291d3e160e9d"
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
meta-perl            = "tmp-auh-upgrades:5b59c4bd4d04fa23f10f44fd1ec1291d3e160e9d"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 322 Local 12 Mirrors 302 Missed 8 Current 231 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 238 of 553 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 240 of 553 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-msm-0.9.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1274 of 1922 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_fetch)
NOTE: recipe python3-msm-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1721 of 1922 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_unpack)
NOTE: Running task 1722 of 1922 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-msm-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1922 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_patch)
NOTE: Running task 1909 of 1922 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-msm-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1911 of 1922 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_configure)
NOTE: recipe python3-msm-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1922 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile)
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
NOTE: Tasks Summary: Attempted 1913 tasks of which 1906 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-msm-0.9.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-msm-0.9.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-msm/0.9.0-r0/temp/run.do_compile.1273021', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-msm/0.9.0-r0/temp/log.do_compile.1273021
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile) failed with exit code '1'

--===============1085073310287617201==--

