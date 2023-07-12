Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D84FC001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.1032.1689139898399965257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=fnZ38JnH;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EE2540003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139897;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=34QqnXdT5hC7FAc79f+4fmkfVDm+L6PxjhUpIVkloy0=;
	b=fnZ38JnHO46JLO4CzPIArwt0AdCp0k3lYf25vy5IsE3oohMswt6TjnR+xMS5XTC3oQrefG
	isP7WHlp3KYWcI4w6SPRJRS6Mmv7pTZRcMsc1V0DLZ28eVN+odphyrzNlvJx7IFQZp3i5Q
	rBHhhJSIxhNHKRdT4jxdzDrB3KjlAj0xskZhXjXl1sQ1d2mU6xH8mGDehKDWOiQ84TO2uD
	pjHkJ0oR1WYYpSsR79lLz6RhsDuKxYxyDSn51Vusx2jaDZDUWEy/S+K8c/iSp+bMJvKxpR
	aajGoctpBIPK8gK2we90Zbrw7BtftrNwQT/Gk3jAyqMb9hqt6nVIE8ONPJbN5w==
Content-Type: multipart/mixed; boundary="===============7655172329599927915=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-semver: upgrading to 3.0.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103803
Message-Id: <20230712053140.6D84FC001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:40 +0000 (UTC)

--===============7655172329599927915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-semver* to *3.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-semver-upgrade-2.13.0-3.0.1.patch
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
From 2e4343fc1e08f6cb1f75f6ba71fc0ec7d5d60912 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:30:21 -0500
Subject: [PATCH] python3-semver: upgrade 2.13.0 -> 3.0.1

---
 ...mver_2.13.0.bb => python3-semver_3.0.1.bb} | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_2.13.0.bb => python3-semver_3.0.1.bb} (40%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
similarity index 40%
rename from meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
index b47bcae00..38652a3a0 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
@@ -1,11 +1,26 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- PKG-INFO
+# +++ PKG-INFO
+# @@ -1 +1 @@
+# -License: BSD
+# +Maintainer: Sebastien Celles, Tom Schraitle
+# 
+#
+
 DESCRIPTION = "Python module for Semantic Versioning"
 HOMEPAGE = "https://github.com/k-bx/python-semver"
 BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=3f59e638e4054c8b9e028c3893bd4f85"
 
-SRC_URI[md5sum] = "e98b5fb283ea84daa5195087de83ebf1"
-SRC_URI[sha256sum] = "fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f"
+SRC_URI[sha256sum] = "9ec78c5447883c67b97f98c3b6212796708191d22e4ad30f4570f840171cbce1"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============7655172329599927915==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-semver-upgrade-2.13.0-3.0.1.patch"

From 2e4343fc1e08f6cb1f75f6ba71fc0ec7d5d60912 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:30:21 -0500
Subject: [PATCH] python3-semver: upgrade 2.13.0 -> 3.0.1

---
 ...mver_2.13.0.bb => python3-semver_3.0.1.bb} | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_2.13.0.bb => python3-semver_3.0.1.bb} (40%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
similarity index 40%
rename from meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
index b47bcae00..38652a3a0 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
@@ -1,11 +1,26 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- PKG-INFO
+# +++ PKG-INFO
+# @@ -1 +1 @@
+# -License: BSD
+# +Maintainer: Sebastien Celles, Tom Schraitle
+# 
+#
+
 DESCRIPTION = "Python module for Semantic Versioning"
 HOMEPAGE = "https://github.com/k-bx/python-semver"
 BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=3f59e638e4054c8b9e028c3893bd4f85"
 
-SRC_URI[md5sum] = "e98b5fb283ea84daa5195087de83ebf1"
-SRC_URI[sha256sum] = "fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f"
+SRC_URI[sha256sum] = "9ec78c5447883c67b97f98c3b6212796708191d22e4ad30f4570f840171cbce1"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============7655172329599927915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12813 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:6e27622a16b0462bd3a7ec8bf45feaaad1d7751d"
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
meta-perl            = "tmp-auh-upgrades:6e27622a16b0462bd3a7ec8bf45feaaad1d7751d"
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
meta-perl            = "tmp-auh-upgrades:6e27622a16b0462bd3a7ec8bf45feaaad1d7751d"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 287 Local 9 Mirrors 270 Missed 8 Current 193 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 202 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-semver-3.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-semver-3.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1028 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_fetch)
NOTE: recipe python3-semver-3.0.1-r0: task do_fetch: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1620 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_unpack)
NOTE: Running task 1621 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-semver-3.0.1-r0: task do_unpack: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_patch)
NOTE: Running task 1669 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-semver-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semver-3.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-semver-3.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_configure)
NOTE: recipe python3-semver-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-semver-3.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-semver-3.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1674 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_compile)
NOTE: recipe python3-semver-3.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-semver/3.0.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-semver/3.0.1-r0/semver-3.0.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-semver-3.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1674 tasks of which 1666 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-semver-3.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-semver-3.0.1-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-semver/3.0.1-r0/temp/run.do_compile.1538983', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-semver/3.0.1-r0/temp/log.do_compile.1538983
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb:do_compile) failed with exit code '1'

--===============7655172329599927915==--

