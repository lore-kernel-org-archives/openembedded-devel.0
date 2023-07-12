Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AD4EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1004.1689139920983366575
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=N40ZFG+k;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 574091BF205
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139919;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=ZjaC6i/+Zhli/KSMNNQW7qIppxanQ65iqTgUCUHU+Zs=;
	b=N40ZFG+k8mgMIzFys6Q834349S/qGhBJLios/M6gSuFdg1SeV86Qpq+9lFNzzFQHTpw831
	AyJcJ1sCCpzYEY2AxJrl4gdignN4kK0pOX5NYjVQfG+GI0Pm/38lMuqtPDvNQdeUEVEbvA
	h3011eIcKpyEX8mk/z7gUdRHu30IsE7Fpc/5eEms5de6Mqp4Ur4GrN9ZQxWMKTgzA+Hvv7
	ez9b7XbJVRipvmoZIFXQGepuVWeqIsl4NEWy8i2H2q3dmKkAA2qMlCu+F9EAH/nPKd/vdD
	ge1z4ezHULteXBatgIa38ZCZzp8hA9AeR86m+Eiyq/jL5QExoYIJ5Zu9hwKvJA==
Content-Type: multipart/mixed; boundary="===============6921947399816034197=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-werkzeug: upgrading to 2.3.6 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103816
Message-Id: <20230712053210.68AD4EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:10 +0000 (UTC)

--===============6921947399816034197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-werkzeug* to *2.3.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-werkzeug-upgrade-2.2.3-2.3.6.patch
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
From e984e90c95e0dbd708dbce9d4eba183303bd1627 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:41:32 -0500
Subject: [PATCH] python3-werkzeug: upgrade 2.2.3 -> 2.3.6

---
 .../{python3-werkzeug_2.2.3.bb => python3-werkzeug_2.3.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.2.3.bb => python3-werkzeug_2.3.6.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
index 5565fb4ea..057415f4a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "2e1ccc9417d4da358b9de6f174e3ac094391ea1d4fbef2d667865d819dfd0afe"
+SRC_URI[sha256sum] = "98c774df2f91b05550078891dee5f0eb0cb797a522c757a2452b9cee5b202330"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============6921947399816034197==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-werkzeug-upgrade-2.2.3-2.3.6.patch"

From e984e90c95e0dbd708dbce9d4eba183303bd1627 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:41:32 -0500
Subject: [PATCH] python3-werkzeug: upgrade 2.2.3 -> 2.3.6

---
 .../{python3-werkzeug_2.2.3.bb => python3-werkzeug_2.3.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.2.3.bb => python3-werkzeug_2.3.6.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
index 5565fb4ea..057415f4a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "2e1ccc9417d4da358b9de6f174e3ac094391ea1d4fbef2d667865d819dfd0afe"
+SRC_URI[sha256sum] = "98c774df2f91b05550078891dee5f0eb0cb797a522c757a2452b9cee5b202330"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============6921947399816034197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12864 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:f884d9dc9904a9d67d4afce1f8bac8953e6a8a5b"
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
meta-perl            = "tmp-auh-upgrades:f884d9dc9904a9d67d4afce1f8bac8953e6a8a5b"
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
meta-perl            = "tmp-auh-upgrades:f884d9dc9904a9d67d4afce1f8bac8953e6a8a5b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 243 Local 9 Mirrors 226 Missed 8 Current 169 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 176 of 412 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 178 of 412 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1088 of 1427 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_fetch)
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_fetch: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1411 of 1427 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_unpack)
NOTE: Running task 1412 of 1427 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_unpack: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1413 of 1427 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_patch)
NOTE: Running task 1414 of 1427 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_patch: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1416 of 1427 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_configure)
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_configure: Started
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1427 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_compile)
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-werkzeug/2.3.6-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-werkzeug/2.3.6-r0/Werkzeug-2.3.6/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-werkzeug-2.3.6-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1418 tasks of which 1411 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-werkzeug-2.3.6-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-werkzeug-2.3.6-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-werkzeug/2.3.6-r0/temp/run.do_compile.1732868', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-werkzeug/2.3.6-r0/temp/log.do_compile.1732868
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb:do_compile) failed with exit code '1'

--===============6921947399816034197==--

