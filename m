Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76286C001E0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.1004.1689139864963787320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=iLP3NzLJ;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 394FB1BF204
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139863;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=htV9cuPLzoqSDF6qR8llH6ovp0096LfqmIPPWOmPaNI=;
	b=iLP3NzLJZ4vixEJNTZ0wE+xCgBv9rG/FzmcvVN9R7Ys42MerC5Pt/2SSr6Jix+wltUJz3Y
	YSpN+qCE+SnQUiWF8Aaz1GQcqds8JWAYOM/pweTpfe1fQjb+YWVflKN2QR2FepLVRbpNww
	mG7nbGzoWVH/eHGHaIjOlzIVT2flLrxufG9OEPuYkD2AnSMWwTQdCcrDaCqS60n+5Q1PvS
	vTW0Mt4dv1wiJQXnmQH9JWXGWDI1o8mW1xlGJMO6FCXyfZd9OZ4OKXUrgQ7gliocB5cZ7h
	6IlxyFQUPEbr3zXr8DaAwFJ/mzFMgelNRDBpyKI66wp45T5cvlgZ8amW9CLlYg==
Content-Type: multipart/mixed; boundary="===============5860596857899850523=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pandas: upgrading to 2.0.3 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103783
Message-Id: <20230712053110.76286C001E0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:10 +0000 (UTC)

--===============5860596857899850523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pandas* to *2.0.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pandas-upgrade-1.5.3-2.0.3.patch
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
From a135ea7fc929793d66643e0a560d806aa1493d4c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:46:19 -0500
Subject: [PATCH] python3-pandas: upgrade 1.5.3 -> 2.0.3

---
 ...andas_1.5.3.bb => python3-pandas_2.0.3.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.3.bb => python3-pandas_2.0.3.bb} (49%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
similarity index 49%
rename from meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
index 129c3147c..e4c6c21b0 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
@@ -1,12 +1,34 @@
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
+# @@ -3,7 +3,7 @@
+#  Copyright (c) 2008-2011, AQR Capital Management, LLC, Lambda Foundry, Inc. and PyData Development Team
+#  All rights reserved.
+#  
+# -Copyright (c) 2011-2022, Open source contributors.
+# +Copyright (c) 2011-2023, Open source contributors.
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions are met:
+# 
+#
+
 SUMMARY  = "pandas library for high-performance data analysis tools"
 DESCRIPTION = "pandas is an open source, BSD-licensed library providing \
 high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
-SRC_URI[sha256sum] = "74a3fd7e5a7ec052f183273dc7b0acd3a863edf7520f5d3a1765c04ffdb3b0b1"
+SRC_URI[sha256sum] = "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb4020a77512e2043c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5860596857899850523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12738 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:89e26bdfb1c49c9e5624a342517581c9efbea9b3"
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
meta-perl            = "tmp-auh-upgrades:89e26bdfb1c49c9e5624a342517581c9efbea9b3"
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
meta-perl            = "tmp-auh-upgrades:89e26bdfb1c49c9e5624a342517581c9efbea9b3"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 258 Local 9 Mirrors 241 Missed 8 Current 181 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 188 of 439 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 190 of 439 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pandas-2.0.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pandas-2.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1115 of 1516 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_fetch)
NOTE: recipe python3-pandas-2.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1500 of 1516 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_unpack)
NOTE: Running task 1501 of 1516 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pandas-2.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 1516 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_patch)
NOTE: Running task 1503 of 1516 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-pandas-2.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_patch: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pandas-2.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pandas-2.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1505 of 1516 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_configure)
NOTE: recipe python3-pandas-2.0.3-r0: task do_configure: Started
NOTE: recipe python3-pandas-2.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1507 of 1516 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_compile)
NOTE: recipe python3-pandas-2.0.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pandas/2.0.3-r0/pandas-2.0.3/setup.py", line 26, in <module>
|     import versioneer
| ModuleNotFoundError: No module named 'versioneer'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-pandas-2.0.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1507 tasks of which 1500 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pandas-2.0.3-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pandas-2.0.3-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pandas/2.0.3-r0/temp/run.do_compile.1316376', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pandas/2.0.3-r0/temp/log.do_compile.1316376
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_compile) failed with exit code '1'

--===============5860596857899850523==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pandas-upgrade-1.5.3-2.0.3.patch"

From a135ea7fc929793d66643e0a560d806aa1493d4c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:46:19 -0500
Subject: [PATCH] python3-pandas: upgrade 1.5.3 -> 2.0.3

---
 ...andas_1.5.3.bb => python3-pandas_2.0.3.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.3.bb => python3-pandas_2.0.3.bb} (49%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
similarity index 49%
rename from meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
index 129c3147c..e4c6c21b0 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
@@ -1,12 +1,34 @@
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
+# @@ -3,7 +3,7 @@
+#  Copyright (c) 2008-2011, AQR Capital Management, LLC, Lambda Foundry, Inc. and PyData Development Team
+#  All rights reserved.
+#  
+# -Copyright (c) 2011-2022, Open source contributors.
+# +Copyright (c) 2011-2023, Open source contributors.
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions are met:
+# 
+#
+
 SUMMARY  = "pandas library for high-performance data analysis tools"
 DESCRIPTION = "pandas is an open source, BSD-licensed library providing \
 high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
-SRC_URI[sha256sum] = "74a3fd7e5a7ec052f183273dc7b0acd3a863edf7520f5d3a1765c04ffdb3b0b1"
+SRC_URI[sha256sum] = "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb4020a77512e2043c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5860596857899850523==--

