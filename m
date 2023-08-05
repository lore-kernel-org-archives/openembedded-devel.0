Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBE2C41513
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2166.1691221159842340492
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Blt+upul;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BE8D40002
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221158;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=FY7A6rNYuPG7Qbv3vkNnPTVgSv4JbrtCfbX/eDtXP8o=;
	b=Blt+upulNNuSz/F+KFsW1ZhKEOYe5z56CFxcBTxwE8UUr237jYYU7z/Ckj2pilrXESQ4u/
	he5ydRHIZO+99NAZKe/E4vcGFS23NiiN2dFE6DEBxMdKdFbUZYk6JaJWhCBVSlTg1mFMvD
	hOCT95qlmSiLPJ+tHjj+WQPwNj1gPBjOeikCo44H+MZDc3LPEbZDNMlGQDlKSCrj01IRN9
	+s2pKUCeRegjMsnMWPyUD0ysnpSd4UBMTJ1DWfjLPa3RZcz7/RILv91LqEiyl36+Gct14g
	OGhoEM1gU/XKzqt8mS60YNAkOTfIlQ9nPeBXecQsfdx9fMkTFwosbCAd2UJbow==
Content-Type: multipart/mixed; boundary="===============7809456685938102637=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pydantic: upgrading to 2.1.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104261
Message-Id: <20230805073929.9EBE2C41513@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:29 +0000 (UTC)

--===============7809456685938102637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pydantic* to *2.1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pydantic-upgrade-1.10.7-2.1.1.patch
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
From d9dd6cd5d847aa45a4f69aba5f04a12a5f64b481 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:59:16 -0500
Subject: [PATCH] python3-pydantic: upgrade 1.10.7 -> 2.1.1

---
 ...ic_1.10.7.bb => python3-pydantic_2.1.1.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.7.bb => python3-pydantic_2.1.1.bb} (31%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb
similarity index 31%
rename from meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb
index 9d59cf859..8e769b2d3 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb
@@ -1,11 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  The MIT License (MIT)
+#  
+# -Copyright (c) 2017, 2018, 2019, 2020, 2021 Samuel Colvin and other contributors
+# +Copyright (c) 2017 to present Pydantic Services Inc. and individual contributors.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Data validation and settings management using Python type hinting"
 HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cfc83c0678b6ba51b0532bea66860617c4cd4251ecf76e9846fa5a9f3454e97e"
+SRC_URI[sha256sum] = "22d63db5ce4831afd16e7c58b3192d3faf8f79154980d9397d9867254310ba4b"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.25.1


--===============7809456685938102637==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pydantic-upgrade-1.10.7-2.1.1.patch"

From d9dd6cd5d847aa45a4f69aba5f04a12a5f64b481 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:59:16 -0500
Subject: [PATCH] python3-pydantic: upgrade 1.10.7 -> 2.1.1

---
 ...ic_1.10.7.bb => python3-pydantic_2.1.1.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.7.bb => python3-pydantic_2.1.1.bb} (31%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb
similarity index 31%
rename from meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb
index 9d59cf859..8e769b2d3 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb
@@ -1,11 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  The MIT License (MIT)
+#  
+# -Copyright (c) 2017, 2018, 2019, 2020, 2021 Samuel Colvin and other contributors
+# +Copyright (c) 2017 to present Pydantic Services Inc. and individual contributors.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Data validation and settings management using Python type hinting"
 HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cfc83c0678b6ba51b0532bea66860617c4cd4251ecf76e9846fa5a9f3454e97e"
+SRC_URI[sha256sum] = "22d63db5ce4831afd16e7c58b3192d3faf8f79154980d9397d9867254310ba4b"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.25.1


--===============7809456685938102637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12729 entries from dependency cache.
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
meta-perl            = "heads/origin/master-next:8aa647eede1d36353585b71e78a1726fd1d90417"
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
meta-perl            = "heads/origin/master-next:8aa647eede1d36353585b71e78a1726fd1d90417"
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
meta-perl            = "heads/origin/master-next:8aa647eede1d36353585b71e78a1726fd1d90417"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 327 Local 144 Mirrors 173 Missed 10 Current 273 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1296 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_recipe_qa)
NOTE: recipe python3-pydantic-2.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1683 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_fetch)
NOTE: recipe python3-pydantic-2.1.1-r0: task do_fetch: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1684 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_unpack)
NOTE: Running task 1685 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pydantic-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1686 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_patch)
NOTE: Running task 1687 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pydantic-2.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pydantic-2.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pydantic-2.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1688 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1689 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_populate_lic)
NOTE: recipe python3-pydantic-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pydantic-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1690 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_configure)
NOTE: recipe python3-pydantic-2.1.1-r0: task do_configure: Started
NOTE: recipe python3-pydantic-2.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1691 of 1700 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_compile)
NOTE: recipe python3-pydantic-2.1.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pydantic/2.1.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pydantic/2.1.1-r0/pydantic-2.1.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-pydantic-2.1.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1691 tasks of which 1681 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pydantic-2.1.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pydantic-2.1.1-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pydantic/2.1.1-r0/temp/run.do_compile.3589271', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pydantic/2.1.1-r0/temp/log.do_compile.3589271
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic_2.1.1.bb:do_compile) failed with exit code '1'

--===============7809456685938102637==--

