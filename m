Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66930C05055
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.2293.1699061896755279395
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VS2A0Y1j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A+SCRkId;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b97fb1711-57a239c9-85a2-431b-a902-d3a9eecfea4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5oLPxuknh0g7e7HE2YAWxYovAOM9lF8O9gAXv8MgyRU=;
	b=VS2A0Y1jL0FWtmgI/IvC3lZH6UlhD+nPBmrkhfXYdBSXYEECGZftRBxrzveL3p/R
	Mm8yzq8VofQpyXm8kDJxuhhEzZVz8Z09+XVdIN8IDE7mpwxyuzHHX59tN2spvwE4qzY
	PdVK0scz6z4/TIPHbVY3VCBmcMQvWcKmw14Ycysk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5oLPxuknh0g7e7HE2YAWxYovAOM9lF8O9gAXv8MgyRU=;
	b=A+SCRkIdruHWtfZ8KnBo5zyaOxRyZALY9xnJ1g/vDbhWwG9x8uoVpqTRbBV3LSD1
	X4zc6uHfMnfBIT4GpHxDYLEuQ4YCRlRgCcW1kI7kN1ua1nQM3ksKulqGngUkUSI42qI
	2hrnBUPkjTXTBm/YBDLkARclDCSZxuTes697xoKY=
Content-Type: multipart/mixed; boundary="===============4447932033577710314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pymodbus: upgrading to 3.5.4 FAILED
Message-ID: <0101018b97fb1711-57a239c9-85a2-431b-a902-d3a9eecfea4b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106151

--===============4447932033577710314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pymodbus* to *3.5.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pymodbus-upgrade-3.5.2-3.5.4.patch
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
From fca7a20453015f705d8bebbc1f509c889f2e6238 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:57:39 +0000
Subject: [PATCH] python3-pymodbus: upgrade 3.5.2 -> 3.5.4

---
 .../{python3-pymodbus_3.5.2.bb => python3-pymodbus_3.5.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.5.2.bb => python3-pymodbus_3.5.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb
index 4cd3801ee..5b60d032e 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6a146397c35e3d0953758ce8803de347"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "26c1aa9919b24f2247794d5d9d80f65ec06fdfd9bd6b76b81d446b55335cabf3"
+SRC_URI[sha256sum] = "d020933cbc32fe8aff5b8157be46f429d08df3dfd06e9579417768128d31b974"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.39.2


--===============4447932033577710314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5053 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:2a5ded4e1080a7e80ef06e0b04eaacdf415ecd8c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 375 Local 366 Mirrors 0 Missed 9 Current 288 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 297 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 299 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 300 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 663 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyserial-3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-native-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-six-native-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyserial-3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 501 of 1877 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_fetch)
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_fetch: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 543 of 1877 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_unpack: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1159 of 1877 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_patch)
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_patch: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 663 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1691 of 1877 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1851 of 1877 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1865 of 1877 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_configure)
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_configure: Started
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 1877 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_compile)
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/pymodbus-3.5.4/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/temp/run.do_compile.2571048:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/temp/run.do_compile.2571048, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/temp/run.do_compile.2571048, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/temp/run.do_compile.2571048, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/temp/run.do_compile.2571048, line 184
NOTE: recipe python3-pymodbus-3.5.4-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1866 tasks of which 1859 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103235702.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103235702.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pymodbus-3.5.4-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pymodbus-3.5.4-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/temp/run.do_compile.2571048', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pymodbus/3.5.4/temp/log.do_compile.2571048
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pymodbus_3.5.4.bb:do_compile) failed with exit code '1'

--===============4447932033577710314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pymodbus-upgrade-3.5.2-3.5.4.patch"

RnJvbSBmY2E3YTIwNDUzMDE1ZjcwNWQ4YmViYmMxZjUwOWM4ODlmMmU2MjM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzo1NzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHltb2RidXM6IHVwZ3JhZGUgMy41LjIgLT4gMy41LjQKCi0tLQogLi4uL3tweXRob24z
LXB5bW9kYnVzXzMuNS4yLmJiID0+IHB5dGhvbjMtcHltb2RidXNfMy41LjQuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHltb2RidXNfMy41
LjIuYmIgPT4gcHl0aG9uMy1weW1vZGJ1c18zLjUuNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9kYnVzXzMuNS4y
LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW1vZGJ1
c18zLjUuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9kYnVzXzMuNS4yLmJiCnJlbmFtZSB0
byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9kYnVzXzMu
NS40LmJiCmluZGV4IDRjZDM4MDFlZS4uNWI2MGQwMzJlIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9kYnVzXzMuNS4yLmJiCisrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHltb2RidXNfMy41
LjQuYmIKQEAgLTQsNyArNCw3IEBAIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NmExNDYzOTdjMzVlM2QwOTUzNzU4Y2U4ODAz
ZGUzNDciCiBERVBFTkRTICs9ICJweXRob24zLXNpeC1uYXRpdmUiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIyNmMxYWE5OTE5YjI0ZjIyNDc3OTRkNWQ5ZDgwZjY1ZWMwNmZkZmQ5YmQ2Yjc2Yjgx
ZDQ0NmI1NTMzNWNhYmYzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQwMjA5MzNjYmMzMmZlOGFm
ZjViODE1N2JlNDZmNDI5ZDA4ZGYzZGZkMDZlOTU3OTQxNzc2ODEyOGQzMWI5NzQiCiBTID0gIiR7
V09SS0RJUn0vcHltb2RidXMtJHtQVn0iCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwotLSAK
Mi4zOS4yCgo=

--===============4447932033577710314==--

