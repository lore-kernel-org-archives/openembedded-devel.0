Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE74C07545
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2288.1699061895893924145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JEyS+91A;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JWIK00hU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb12fc-977b6330-ac70-40b2-8c2a-18953b5a50f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YXVp5a1a10tGRZPtKxC+TYQxEFOzjC15X+G10viZB6Y=;
	b=JEyS+91Am81XW5ChLb5uodK5byUiOHGwDZBVOo1WGp9/NxfnibEqyIePQDDM2bps
	2kLY1dS/fPGzvJ7DgYTwykfeVt6dyttknhcMmrLE78brrEsDNvqbRynw0A6r1larG55
	AxG4P9g9pbYRW6ejgfxVB43ABftt53m7TM8Qf/Jo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YXVp5a1a10tGRZPtKxC+TYQxEFOzjC15X+G10viZB6Y=;
	b=JWIK00hUn4o4DsKJQZAjwlSebcx9Omtc/W8L88uoIMGYUliGARcC7mTP775jUg0X
	a9wNVmWhbheGwVd3HD9PdtUZvf7vD85Hh67ixuik/tOjwmQZMda6+6ou0uluTvcLfgi
	N5KvL4QPI/4zpZcTBYPcl3IDICao1wYhZHUMUoEg=
Content-Type: multipart/mixed; boundary="===============1737185177480862363=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-jsonref: upgrading to 1.1.0 FAILED
Message-ID: <0101018b97fb12fc-977b6330-ac70-40b2-8c2a-18953b5a50f0-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106134

--===============1737185177480862363==
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
From 48cab6a88889a9a9c7d9b4d704dc9b9cc0d7fa00 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:10:48 +0000
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
2.39.2


--===============1737185177480862363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4990 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:ba99cfb7d96c495277bf10d99fa4cb433e40b44d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 357 Local 348 Mirrors 0 Missed 9 Current 267 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 278 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 503 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 573 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 506 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1104 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_patch)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1607 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1757 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_configure)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonref-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-jsonref-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile)
NOTE: recipe python3-jsonref-1.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/jsonref-1.1.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/temp/run.do_compile.2944098:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/temp/run.do_compile.2944098, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/temp/run.do_compile.2944098, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/temp/run.do_compile.2944098, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/temp/run.do_compile.2944098, line 184
NOTE: recipe python3-jsonref-1.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1758 tasks of which 1751 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103221003.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103221003.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-jsonref-1.1.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-jsonref-1.1.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/temp/run.do_compile.2944098', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-jsonref/1.1.0/temp/log.do_compile.2944098
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb:do_compile) failed with exit code '1'

--===============1737185177480862363==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonref-upgrade-1.0.1-1.1.0.patch"

RnJvbSA0OGNhYjZhODg4ODlhOWE5YzdkOWI0ZDcwNGRjOWI5Y2MwZDdmYTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjoxMDo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnJlZjogdXBncmFkZSAxLjAuMSAtPiAxLjEuMAoKLS0tCiAuLi5ucmVmXzEuMC4x
LmJiID0+IHB5dGhvbjMtanNvbnJlZl8xLjEuMC5iYn0gfCA1OCArKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi1qc29ucmVmL3tweXRob24zLWpz
b25yZWZfMS4wLjEuYmIgPT4gcHl0aG9uMy1qc29ucmVmXzEuMS4wLmJifSAoMTAlKQoKZGlmZiAt
LWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uLWpzb25yZWYvcHl0aG9u
My1qc29ucmVmXzEuMC4xLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24t
anNvbnJlZi9weXRob24zLWpzb25yZWZfMS4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCAxMCUKcmVu
YW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24tanNvbnJlZi9weXRo
b24zLWpzb25yZWZfMS4wLjEuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uLWpzb25yZWYvcHl0aG9uMy1qc29ucmVmXzEuMS4wLmJiCmluZGV4IDViODQyYTQ2
Mi4uMzhiZWFiYzEyIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi1qc29ucmVmL3B5dGhvbjMtanNvbnJlZl8xLjAuMS5iYgorKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi1qc29ucmVmL3B5dGhvbjMtanNvbnJlZl8xLjEuMC5iYgpA
QCAtMSw5ICsxLDYzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2
ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4K
KyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJp
emUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRh
dGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1
cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElD
RU5TRQorIyBAQCAtMSwyMSArMSwyMSBAQAorIyAtVGhlIE1JVCBMaWNlbnNlCisjIC0KKyMgLUNv
cHlyaWdodCAoQykgMjAxMyBDaGFzZSBTdGVybGluZworIyAtCisjIC1QZXJtaXNzaW9uIGlzIGhl
cmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBj
b3B5CisjIC1vZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmls
ZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAorIyAtaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQg
cmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyAt
dG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNl
bnNlLCBhbmQvb3Igc2VsbAorIyAtY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1p
dCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjIC1mdXJuaXNoZWQgdG8gZG8gc28s
IHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyAtCisjIC1UaGUgYWJvdmUg
Y29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNs
dWRlZCBpbgorIyAtYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29m
dHdhcmUuCisjIC0KKyMgLVRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VU
IFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisjIC1JTVBMSUVELCBJTkNMVURJTkcg
QlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMg
LUZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElO
IE5PIEVWRU5UIFNIQUxMIFRIRQorIyAtQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBM
SUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgorIyAtTElBQklMSVRZLCBXSEVU
SEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcg
RlJPTSwKKyMgLU9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRI
RSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4KKyMgK1RoZSBNSVQgTGljZW5zZQorIyArCisjICtD
b3B5cmlnaHQgKEMpIDIwMTMgQ2hhc2UgU3RlcmxpbmcKKyMgKworIyArUGVybWlzc2lvbiBpcyBo
ZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEg
Y29weQorIyArb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZp
bGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgK2luIHRoZSBTb2Z0d2FyZSB3aXRob3V0
IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKKyMg
K3RvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGlj
ZW5zZSwgYW5kL29yIHNlbGwKKyMgK2NvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJt
aXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyArZnVybmlzaGVkIHRvIGRvIHNv
LCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgKworIyArVGhlIGFib3Zl
IGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5j
bHVkZWQgaW4KKyMgK2FsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNv
ZnR3YXJlLgorIyArCisjICtUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9V
VCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorIyArSU1QTElFRCwgSU5DTFVESU5H
IEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisj
ICtGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJ
TiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgK0FVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUg
TElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKKyMgK0xJQUJJTElUWSwgV0hF
VEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5H
IEZST00sCisjICtPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBU
SEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOCisjICBUSEUgU09GVFdBUkUuCisjCisKIFNVTU1B
UlkgPSAianNvbnJlZiBpcyBhIGxpYnJhcnkgZm9yIGF1dG9tYXRpYyBkZXJlZmVyZW5jaW5nIG9m
IEpTT04gUmVmZXJlbmNlIG9iamVjdHMgZm9yIFB5dGhvbiIKIEhPTUVQQUdFID0gImh0dHBzOi8v
Z2l0aHViLmNvbS9nYXpwYWNob2tpbmcvanNvbnJlZiIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YTM0MjY0ZjI1MzM4ZDQxNzQ0ZGNhMWFi
ZmU0ZWIxOGYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00YWMxY2Nj
ZWU1ZDQzZTExZmM0ZWRkY2Y0NDViZTY0YSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUxZDNl
MThiODNjYTcxNzBmZjUxMjg2YTBlMWE2NzE5ZDhiN2ZjYzdhYmRiMTZiMTg5Mzk1YTg1MzY5OTZi
OTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzJmZThlMWQ4NWFmMGZkZWZiZWJjZTk1MGFmODU1
OTBiMjJiNjBmOWU5NTQ0MzE3NmFkYmRlNGUxZWNlYTU1MiIKIAogaW5oZXJpdCBweXBpIHNldHVw
dG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============1737185177480862363==--

