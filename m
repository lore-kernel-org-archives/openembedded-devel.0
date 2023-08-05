Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE341C0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.2184.1691221194303562276
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=ft5JYJ/z;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AF0CE0007
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221192;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=j8MGWN4nmWwvEgTZYYJgrYPyriCOFZZtbINeOVo5Q8Q=;
	b=ft5JYJ/zxTfaG51zxhmY6fUwxT2JxfXwEYTy8K9pw5fAUB0Rzg1CxZtccogcTXT1MQZpFw
	rtw7Tc46JeHv0/BJVt4T6/CHfoVzCsJrRCZNzYMK3CwBGib6j4LPwg0U9qevFq9wvXN4LZ
	eNDC3lsGykZvdOC4/VAbUQiNiUr8TluHdJLMzxo+V7bJgvFBX+HfE1sHQwSrDiDeDhpgFP
	y9sa2YRHF0JCC9fu8wTuHS1vK+dU1ZevUXWIbVbnNTz5ZlVQ6ujc+r/Hnw3HAacYIlpXc0
	4XkK/euGU2oCLrnH+C1KllRsgGmeSgjqGTEnT+39OrTDsb+ESSQfFj6Hci+6EA==
Content-Type: multipart/mixed; boundary="===============2878438863927416164=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-xxhash: upgrading to 3.3.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104281
Message-Id: <20230805073959.AE341C0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:59 +0000 (UTC)

--===============2878438863927416164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-xxhash* to *3.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-xxhash-upgrade-3.2.0-3.3.0.patch
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
From 8a1ec9f775fddaedee113725969406822d15949c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:24:08 -0500
Subject: [PATCH] python3-xxhash: upgrade 3.2.0 -> 3.3.0

---
 .../python/{python3-xxhash_3.2.0.bb => python3-xxhash_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.2.0.bb => python3-xxhash_3.3.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
index c4d74306c..78842f0cf 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
-SRC_URI[sha256sum] = "1afd47af8955c5db730f630ad53ae798cf7fae0acb64cebb3cf94d35c47dd088"
+SRC_URI[sha256sum] = "c3f9e322b1ebeebd44e3d9d2d9b124e0c550c1ef41bd552afdcdd719516ee41a"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.25.1


--===============2878438863927416164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12789 entries from dependency cache.
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
meta-perl            = "heads/origin/master-next:b9ecbead3bb51376fbf949b5b86ec85e9506ac85"
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
meta-perl            = "heads/origin/master-next:b9ecbead3bb51376fbf949b5b86ec85e9506ac85"
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
meta-perl            = "heads/origin/master-next:b9ecbead3bb51376fbf949b5b86ec85e9506ac85"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 387 Local 187 Mirrors 190 Missed 10 Current 334 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1225 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_recipe_qa)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2051 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_fetch)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_fetch: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2052 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_unpack)
NOTE: Running task 2053 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_unpack: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_patch)
NOTE: Running task 2055 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_patch: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-xxhash-3.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xxhash-3.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2056 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2057 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_populate_lic)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_populate_lic: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-xxhash-3.3.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2058 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_configure)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_configure: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2059 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_configure_ptest_base)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-xxhash-3.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2060 of 2071 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_compile)
NOTE: recipe python3-xxhash-3.3.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py:84: _DeprecatedInstaller: setuptools.installer and fetch_build_eggs are deprecated.
| !!
| 
|         ********************************************************************************
|         Requirements should be satisfied by a PEP 517 installer.
|         If you are using pip, you can try `pip install --use-pep517`.
|         ********************************************************************************
| 
| !!
|   dist.fetch_build_eggs(dist.setup_requires)
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: No module named pip
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 96, in _fetch_build_egg_no_warn
|     subprocess.check_call(cmd)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py", line 413, in check_call
|     raise CalledProcessError(retcode, cmd)
| subprocess.CalledProcessError: Command '['/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmphxd9m_lt', '--quiet', 'setuptools_scm']' returned non-zero exit status 1.
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/xxhash-3.3.0/setup.py", line 33, in <module>
|     setup(
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 106, in setup
|     _install_setup_requires(attrs)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 79, in _install_setup_requires
|     _fetch_build_eggs(dist)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 84, in _fetch_build_eggs
|     dist.fetch_build_eggs(dist.setup_requires)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/dist.py", line 907, in fetch_build_eggs
|     return _fetch_build_eggs(self, requires)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 38, in _fetch_build_eggs
|     resolved_dists = pkg_resources.working_set.resolve(
|                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 829, in resolve
|     dist = self._resolve_dist(
|            ^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 865, in _resolve_dist
|     dist = best[req.key] = env.best_match(
|                            ^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 1135, in best_match
|     return self.obtain(req, installer)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 1147, in obtain
|     return installer(requirement)
|            ^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 98, in _fetch_build_egg_no_warn
|     raise DistutilsError(str(e)) from e
| distutils.errors.DistutilsError: Command '['/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmphxd9m_lt', '--quiet', 'setuptools_scm']' returned non-zero exit status 1.
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-xxhash-3.3.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2060 tasks of which 2049 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-xxhash-3.3.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-xxhash-3.3.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/temp/run.do_compile.4038277', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-xxhash/3.3.0-r0/temp/log.do_compile.4038277
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb:do_compile) failed with exit code '1'

--===============2878438863927416164==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-xxhash-upgrade-3.2.0-3.3.0.patch"

From 8a1ec9f775fddaedee113725969406822d15949c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:24:08 -0500
Subject: [PATCH] python3-xxhash: upgrade 3.2.0 -> 3.3.0

---
 .../python/{python3-xxhash_3.2.0.bb => python3-xxhash_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.2.0.bb => python3-xxhash_3.3.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
index c4d74306c..78842f0cf 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
-SRC_URI[sha256sum] = "1afd47af8955c5db730f630ad53ae798cf7fae0acb64cebb3cf94d35c47dd088"
+SRC_URI[sha256sum] = "c3f9e322b1ebeebd44e3d9d2d9b124e0c550c1ef41bd552afdcdd719516ee41a"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.25.1


--===============2878438863927416164==--

