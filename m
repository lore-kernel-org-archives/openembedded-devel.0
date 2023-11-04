Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E1EC07542
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2282.1699061894545459158
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CN41XGd1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KQ0yau/u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb0a68-ecd3f855-a6f2-4eff-b3c9-a1b441b29385-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6VkK1p1bPzNFGveEXdxIyIMcqnadtC/nPiZ8c4gDLQY=;
	b=CN41XGd1fEIymwwvaldvZXLXb8Cc/FwMf2Nuv7FIO29z656Rbnr6FD4PHqLmSdqy
	/xU89zcR8ST0iBD8TBikXv/Tjst/3jyuPRyYssAWD5c8p1TqqpWQffqZUEuG+29vmEl
	RyOKok7gWnqwCZKc9S4veJ4+9YZPat51KkSkhI/I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6VkK1p1bPzNFGveEXdxIyIMcqnadtC/nPiZ8c4gDLQY=;
	b=KQ0yau/uc6c3NBgXniBuVStKdViq3jatypACBLv5UUQOpcAW8Rd4OFq2C0ZUibOJ
	xEt7fPnLHJ7p/WXTQv7MCts9/JP63v6ngyYKn5C980UAUxk/7Iowq7/swbM/VDEKp5Q
	g7Yoe+wsNptmuehX/R54rv5PsYCol/uhooNsl2EI=
Content-Type: multipart/mixed; boundary="===============2627347687308711637=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-constantly: upgrading to 23.10.4 FAILED
Message-ID: <0101018b97fb0a68-ecd3f855-a6f2-4eff-b3c9-a1b441b29385-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106105

--===============2627347687308711637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-constantly* to *23.10.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-constantly-upgrade-15.1.0-23.10.4.patch
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
From 2b3db226f6e48db7dc8070dba463b6d05b700ede Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:36:49 +0000
Subject: [PATCH] python3-constantly: upgrade 15.1.0 -> 23.10.4

---
 ...hon3-constantly_15.1.0.bb => python3-constantly_23.10.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-constantly_15.1.0.bb => python3-constantly_23.10.4.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
rename to meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
index 7f9b0326f..281d64e8e 100644
--- a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/twisted/constantly"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e393e4ddd223e3a74982efa784f89fd7"
 
-SRC_URI[md5sum] = "f0762f083d83039758e53f8cf0086eef"
-SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35"
+SRC_URI[sha256sum] = "aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0efd050b7f1c7cbd"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============2627347687308711637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4932 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:b86467aa6ebbb3c26407f819f5eb1b519286f224"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 357 Local 348 Mirrors 0 Missed 9 Current 267 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 278 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-constantly-23.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-constantly-23.10.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 513 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-constantly-23.10.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 503 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 573 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe python3-constantly-23.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 506 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_unpack)
NOTE: recipe python3-constantly-23.10.4-r0: task do_unpack: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1104 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_patch)
NOTE: recipe python3-constantly-23.10.4-r0: task do_patch: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_patch: Succeeded
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
NOTE: Running task 1607 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-constantly-23.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-constantly-23.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1757 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_configure)
NOTE: recipe python3-constantly-23.10.4-r0: task do_configure: Started
NOTE: recipe python3-constantly-23.10.4-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_compile)
NOTE: recipe python3-constantly-23.10.4-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/constantly-23.10.4/setup.py", line 4, in <module>
|     import versioneer
| ModuleNotFoundError: No module named 'versioneer'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/temp/run.do_compile.2921804:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/temp/run.do_compile.2921804, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/temp/run.do_compile.2921804, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/temp/run.do_compile.2921804, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/temp/run.do_compile.2921804, line 184
NOTE: recipe python3-constantly-23.10.4-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1758 tasks of which 1751 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103203618.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103203618.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-constantly-23.10.4-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-constantly-23.10.4-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/temp/run.do_compile.2921804', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-constantly/23.10.4/temp/log.do_compile.2921804
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb:do_compile) failed with exit code '1'

--===============2627347687308711637==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-constantly-upgrade-15.1.0-23.10.4.patch"

RnJvbSAyYjNkYjIyNmY2ZTQ4ZGI3ZGM4MDcwZGJhNDYzYjZkMDViNzAwZWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDozNjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY29uc3RhbnRseTogdXBncmFkZSAxNS4xLjAgLT4gMjMuMTAuNAoKLS0tCiAuLi5ob24z
LWNvbnN0YW50bHlfMTUuMS4wLmJiID0+IHB5dGhvbjMtY29uc3RhbnRseV8yMy4xMC40LmJifSB8
IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY29uc3Rh
bnRseV8xNS4xLjAuYmIgPT4gcHl0aG9uMy1jb25zdGFudGx5XzIzLjEwLjQuYmJ9ICg2NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
b25zdGFudGx5XzE1LjEuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY29uc3RhbnRseV8yMy4xMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggNjQlCnJlbmFt
ZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY29uc3Rh
bnRseV8xNS4xLjAuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY29uc3RhbnRseV8yMy4xMC40LmJiCmluZGV4IDdmOWIwMzI2Zi4uMjgxZDY0
ZThlIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNvbnN0YW50bHlfMTUuMS4wLmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY29uc3RhbnRseV8yMy4xMC40LmJiCkBAIC0zLDggKzMsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vdHdpc3RlZC9jb25zdGFudGx5IgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lMzkzZTRk
ZGQyMjNlM2E3NDk4MmVmYTc4NGY4OWZkNyIKIAotU1JDX1VSSVttZDVzdW1dID0gImYwNzYyZjA4
M2Q4MzAzOTc1OGU1M2Y4Y2YwMDg2ZWVmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4NjM3MmVi
OTIwNTk4NzNlMjllYmE0ZjlkZWM4MzgxNTQxYjRkMzgzNDY2MDcwN2ZhZjhiYTU5MTQ2ZGZjMzUi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWE5MmI3MGEzM2UyYWMwYmIzM2NkNzQ1ZWI2MTc3NjU5
NGRjNDg3NjRiMDZjMzVlMGVmZDA1MGI3ZjFjN2NiZCIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9v
bHMzCiAKLS0gCjIuMzkuMgoK

--===============2627347687308711637==--

