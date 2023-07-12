Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D8CEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1028.1689139893270335244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=ABM1zSZw;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FE5EE0002
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139891;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=+074a7GrNtx75DYKrEg1ZAcstZHBsnx2iS0QMeEceD4=;
	b=ABM1zSZwAUMgqnQPepZJVj+oGYrm0Pl0xDfJ8Avhx22HG/xu14B9M563qs1oGqnVW3kVpF
	hAn+i3K/umy6UOvwZMhxGz9aaJIPXyGppDu3pqUYzjyhpmUDPVuJtuAz1OhO6Vv1RtCrTm
	6eiN6kuM+BdKweVL+OriNOj4bEI6TLxYlbDcXkriDAQamQeMpP8OL/DUrL6xirkAgn4Svd
	B8CZSMqnF5S6kqK080Zobsdgrolpvvl62Os9UeuSRFCpmnvnxYa6dnDUsHR3MoTtMEFZHh
	TSDrjWR+Okh75fMgOMdkg9yHL2/GUVOXjTnarYAIvd4baMxzUugtDQG7t/uNJA==
Content-Type: multipart/mixed; boundary="===============1315998390477580415=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-rdflib: upgrading to 6.3.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103800
Message-Id: <20230712053140.73D8CEB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:40 +0000 (UTC)

--===============1315998390477580415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-rdflib* to *6.3.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-rdflib-upgrade-6.2.0-6.3.2.patch
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
From cbefb775a03404b729babe937cb4e20339cfc140 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:16:53 -0500
Subject: [PATCH] python3-rdflib: upgrade 6.2.0 -> 6.3.2

---
 ...dflib_6.2.0.bb => python3-rdflib_6.3.2.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.2.0.bb => python3-rdflib_6.3.2.bb} (32%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
similarity index 32%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
index 282d40709..4190073b2 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
@@ -1,8 +1,29 @@
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
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2002-2022, RDFLib Team
+# +Copyright (c) 2002-2023, RDFLib Team
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bcae79bd3c84b857f42a98a7ccf6ad47"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
 
-SRC_URI[sha256sum] = "62dc3c86d1712db0f55785baf8047f63731fa59b2682be03219cb89262065942"
+SRC_URI[sha256sum] = "72af591ff704f4caacea7ecc0c5a9056b8553e0489dd4f35a9bc52dbd41522e0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============1315998390477580415==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-rdflib-upgrade-6.2.0-6.3.2.patch"

From cbefb775a03404b729babe937cb4e20339cfc140 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:16:53 -0500
Subject: [PATCH] python3-rdflib: upgrade 6.2.0 -> 6.3.2

---
 ...dflib_6.2.0.bb => python3-rdflib_6.3.2.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.2.0.bb => python3-rdflib_6.3.2.bb} (32%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
similarity index 32%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
index 282d40709..4190073b2 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
@@ -1,8 +1,29 @@
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
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2002-2022, RDFLib Team
+# +Copyright (c) 2002-2023, RDFLib Team
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bcae79bd3c84b857f42a98a7ccf6ad47"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
 
-SRC_URI[sha256sum] = "62dc3c86d1712db0f55785baf8047f63731fa59b2682be03219cb89262065942"
+SRC_URI[sha256sum] = "72af591ff704f4caacea7ecc0c5a9056b8553e0489dd4f35a9bc52dbd41522e0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============1315998390477580415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12801 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:acd7e136a223f48ba64b5d0c8f3e224395f9859b"
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
meta-perl            = "tmp-auh-upgrades:acd7e136a223f48ba64b5d0c8f3e224395f9859b"
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
meta-perl            = "tmp-auh-upgrades:acd7e136a223f48ba64b5d0c8f3e224395f9859b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 236 Local 9 Mirrors 219 Missed 8 Current 163 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 170 of 399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 172 of 399 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-rdflib-6.3.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-rdflib-6.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1075 of 1369 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_fetch)
NOTE: recipe python3-rdflib-6.3.2-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1353 of 1369 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_unpack)
NOTE: Running task 1354 of 1369 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-rdflib-6.3.2-r0: task do_unpack: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1355 of 1369 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_patch)
NOTE: Running task 1356 of 1369 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-rdflib-6.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-6.3.2-r0: task do_patch: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1358 of 1369 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_configure)
NOTE: recipe python3-rdflib-6.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-6.3.2-r0: task do_configure: Started
NOTE: recipe python3-rdflib-6.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1360 of 1369 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_compile)
NOTE: recipe python3-rdflib-6.3.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-rdflib/6.3.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-rdflib/6.3.2-r0/rdflib-6.3.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-rdflib-6.3.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1360 tasks of which 1353 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-rdflib-6.3.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-rdflib-6.3.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-rdflib/6.3.2-r0/temp/run.do_compile.1511482', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-rdflib/6.3.2-r0/temp/log.do_compile.1511482
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb:do_compile) failed with exit code '1'

--===============1315998390477580415==--

