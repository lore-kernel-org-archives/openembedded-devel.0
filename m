Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B782C3DA41
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.955.1689139848122711511
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=n1HQC/3e;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66DF0FF803
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139846;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=Zkqol0WMXD1ySDQ7HwR7MoX1sbDNDlaeEvSQEM7dZbg=;
	b=n1HQC/3eXQ+4O5vKPFtHqMzBOYPEL+TDNsXi6xoH3fHYAnOlS7kasUvl5gC5dcVYSL+x2M
	OrBdckJQuR8p6mdJLIe1d9D2GqHaCLD9MPINhPoQWR/mBNqEZwERjTObqq9xzndsLaEipb
	ORdkKADbYgUh6VFSUV8dh9cDzd7FTmixKPAclucaK/yX2gn8xWeiRTm4nfUf+n3mFu14mm
	aKC/mr0pYO2nOHtBO7lQETo61j23SWyVGDwoEKo/U6Y4hfSbqB5RML4IX+IQWmB4HCR17b
	B06e4S8pazegtJWN3OQ/U0j4J1vpHYwjZy7qwFCLIG7ozpcKN8f2ZPNWECyZUw==
Content-Type: multipart/mixed; boundary="===============3664906321358422288=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-jsonref: upgrading to 1.1.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103773
Message-Id: <20230712053050.6B782C3DA41@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:50 +0000 (UTC)

--===============3664906321358422288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonref* to *1.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-jsonref-upgrade-1.0.1-1.1.0.patch
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
From f312a4bf1731cc72d261e5a8ba4728c83e0115d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:28:46 -0500
Subject: [PATCH] python3-jsonref: upgrade 1.0.1 -> 1.1.0

---
 ...nref_1.0.1.bb => python3-jsonref_1.1.0.bb} | 58 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python-jsonref/{python3-jsonref_1.0.1.bb => python3-jsonref_1.1.0.bb} (10%)

diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
similarity index 10%
rename from meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
rename to meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
index 5b842a462..38beabc12 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
@@ -1,9 +1,63 @@
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
+# @@ -1,21 +1,21 @@
+# -The MIT License
+# -
+# -Copyright (C) 2013 Chase Sterling
+# -
+# -Permission is hereby granted, free of charge, to any person obtaining a copy
+# -of this software and associated documentation files (the "Software"), to deal
+# -in the Software without restriction, including without limitation the rights
+# -to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# -copies of the Software, and to permit persons to whom the Software is
+# -furnished to do so, subject to the following conditions:
+# -
+# -The above copyright notice and this permission notice shall be included in
+# -all copies or substantial portions of the Software.
+# -
+# -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# -AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# -LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# -OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# +The MIT License
+# +
+# +Copyright (C) 2013 Chase Sterling
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to deal
+# +in the Software without restriction, including without limitation the rights
+# +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is
+# +furnished to do so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in
+# +all copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#  THE SOFTWARE.
+#
+
 SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
 HOMEPAGE = "https://github.com/gazpachoking/jsonref"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ac1cccee5d43e11fc4eddcf445be64a"
 
-SRC_URI[sha256sum] = "51d3e18b83ca7170ff51286a0e1a6719d8b7fcc7abdb16b189395a8536996b97"
+SRC_URI[sha256sum] = "32fe8e1d85af0fdefbebce950af85590b22b60f9e95443176adbde4e1ecea552"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============3664906321358422288==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-jsonref-upgrade-1.0.1-1.1.0.patch"

From f312a4bf1731cc72d261e5a8ba4728c83e0115d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:28:46 -0500
Subject: [PATCH] python3-jsonref: upgrade 1.0.1 -> 1.1.0

---
 ...nref_1.0.1.bb => python3-jsonref_1.1.0.bb} | 58 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python-jsonref/{python3-jsonref_1.0.1.bb => python3-jsonref_1.1.0.bb} (10%)

diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
similarity index 10%
rename from meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
rename to meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
index 5b842a462..38beabc12 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
@@ -1,9 +1,63 @@
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
+# @@ -1,21 +1,21 @@
+# -The MIT License
+# -
+# -Copyright (C) 2013 Chase Sterling
+# -
+# -Permission is hereby granted, free of charge, to any person obtaining a copy
+# -of this software and associated documentation files (the "Software"), to deal
+# -in the Software without restriction, including without limitation the rights
+# -to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# -copies of the Software, and to permit persons to whom the Software is
+# -furnished to do so, subject to the following conditions:
+# -
+# -The above copyright notice and this permission notice shall be included in
+# -all copies or substantial portions of the Software.
+# -
+# -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# -AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# -LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# -OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# +The MIT License
+# +
+# +Copyright (C) 2013 Chase Sterling
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to deal
+# +in the Software without restriction, including without limitation the rights
+# +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is
+# +furnished to do so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in
+# +all copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#  THE SOFTWARE.
+#
+
 SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
 HOMEPAGE = "https://github.com/gazpachoking/jsonref"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ac1cccee5d43e11fc4eddcf445be64a"
 
-SRC_URI[sha256sum] = "51d3e18b83ca7170ff51286a0e1a6719d8b7fcc7abdb16b189395a8536996b97"
+SRC_URI[sha256sum] = "32fe8e1d85af0fdefbebce950af85590b22b60f9e95443176adbde4e1ecea552"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============3664906321358422288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12708 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:81049d4db4aacbca84b426b8129c4717f9dc5af2"
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
meta-perl            = "tmp-auh-upgrades:81049d4db4aacbca84b426b8129c4717f9dc5af2"
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
meta-perl            = "tmp-auh-upgrades:81049d4db4aacbca84b426b8129c4717f9dc5af2"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 243 Local 20 Mirrors 215 Missed 8 Current 143 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 150 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 152 of 386 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1036 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_fetch)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1317 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_unpack)
NOTE: Running task 1318 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_patch)
NOTE: Running task 1320 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1322 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_configure)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1324 of 1333 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/jsonref-1.1.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-jsonref-1.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1324 tasks of which 1317 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-jsonref-1.1.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-jsonref-1.1.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/temp/run.do_compile.898256', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/temp/log.do_compile.898256
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile) failed with exit code '1'

--===============3664906321358422288==--

