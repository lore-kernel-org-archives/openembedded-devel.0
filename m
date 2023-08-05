Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74D1C0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.2158.1691221135806104240
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=lTnFK+Eo;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E669240003
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221134;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=FXIcQrFGAUvgbsA0tQ6MnPMVtxVdqEigNi4+IRqTV48=;
	b=lTnFK+EoxjG833WL3mvTTDrapkJ5rK4dOp85kPY73tXYiekKFDvG4JH/TTXxWKLY3uhFPp
	Yzq8rXfJE1LVasnJPmYhXtMKILTC8hbhBww0PPoFt8sh5qkprvFgu2NO+tlB1o9AVYwkG2
	ZHcUl656A5CN5t6rdQwHoUwrjJ8noOo9xj1oDvneX/NDrdQ4SwtyMEh7bCU5JEqRuW2zxQ
	v/YKNB7N+xej/9LWihWRaQYwajguMU2rm4e1bXWLju0Bvutt0p4gnmVttkYpmXiROrWVcp
	SYUpHvt6irK6FekVSY4LdzpygU0wZ9Xj5FXJriGD4s2tHGtwTJ/M32Yg3ScSPg==
Content-Type: multipart/mixed; boundary="===============7196018219600997930=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-jsonref: upgrading to 1.1.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104248
Message-Id: <20230805073859.A74D1C0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:59 +0000 (UTC)

--===============7196018219600997930==
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
From 6ba99009e6ecbb2992ad755f162a188ff10405dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 22:37:32 -0500
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


--===============7196018219600997930==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-jsonref-upgrade-1.0.1-1.1.0.patch"

From 6ba99009e6ecbb2992ad755f162a188ff10405dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 22:37:32 -0500
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


--===============7196018219600997930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12672 entries from dependency cache.
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
meta-perl            = "heads/origin/master-next:d24e253e7b7ea58b415edd03fbf0160b5e6d6922"
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
meta-perl            = "heads/origin/master-next:d24e253e7b7ea58b415edd03fbf0160b5e6d6922"
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
meta-perl            = "heads/origin/master-next:d24e253e7b7ea58b415edd03fbf0160b5e6d6922"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 351 Local 164 Mirrors 177 Missed 10 Current 243 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1282 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_recipe_qa)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1669 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_fetch)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1670 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_unpack)
NOTE: Running task 1671 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1672 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_patch)
NOTE: Running task 1673 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1674 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1675 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_populate_lic)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1676 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_configure)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1677 of 1686 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/jsonref-1.1.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-jsonref-1.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1677 tasks of which 1667 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-jsonref-1.1.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-jsonref-1.1.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/temp/run.do_compile.3097724', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0-r0/temp/log.do_compile.3097724
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile) failed with exit code '1'

--===============7196018219600997930==--

