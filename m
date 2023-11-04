Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5386C18E16
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2278.1699061893395990930
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AUJUrbsH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IHlETFrU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b97fb03ee-291e3ecb-01ff-49b3-844a-25f29335c62d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xkbiir/5mj/UlEvRRo5UWKrtvk3apC3nmKo2e9aYuaA=;
	b=AUJUrbsHiSmETG/567GQv+Mh4c9IAd08JW9Txli4MwK3wfy2oC1n/aZYgxBrFRpl
	434mjJNEyMHdOf+VGhNhB0ChZvVoy9bsk2jDtZzrwpSKpby+HIwA16DpBSzpP+vevmh
	VI1dS1IbvPLU/q8k9DVFJtXXURtqFDg5hwM6lsD8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xkbiir/5mj/UlEvRRo5UWKrtvk3apC3nmKo2e9aYuaA=;
	b=IHlETFrUSNAtPg1t8drvHB6Oq5JbQ0bJ42vupHJMV6d7gaF126k+YM1K9Ye+9xq0
	U10e7/36PaEOkZgmi/H6Jvg7mj6u/i81Lqft0Hk+pCw4/GMK+mNd8PtZO0qJbXugEBe
	xK6e8jC+9lA15ptaJpykQYRdCWVghcHJZmP2v6WE=
Content-Type: multipart/mixed; boundary="===============3980623948605669634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-aiohue: upgrading to 4.7.0 FAILED
Message-ID: <0101018b97fb03ee-291e3ecb-01ff-49b3-844a-25f29335c62d-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106095

--===============3980623948605669634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-aiohue* to *4.7.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-aiohue-upgrade-4.6.2-4.7.0.patch
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
From 087cfd30d3d78a5fbaf9bb0df03c4413e1e1c75e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:54:34 +0000
Subject: [PATCH] python3-aiohue: upgrade 4.6.2 -> 4.7.0

---
 .../python/{python3-aiohue_4.6.2.bb => python3-aiohue_4.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.6.2.bb => python3-aiohue_4.7.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
index b9256ca20..de0e625b0 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "069af6bb0a7d34d566538af57cc10fb691ee04f844204e4f67d95a57f0b91a46"
+SRC_URI[sha256sum] = "3ca727b463e55bbe7c69b67f5503ffcd7d213c9644c4e458e3556ee6ea33855b"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============3980623948605669634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4887 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:a5fb4886e34ea332ae07f497e6da9717ca80e7cf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 448 Local 439 Mirrors 0 Missed 9 Current 310 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 312 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 322 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-awesomeversion_23.8.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-awesomeversion-23.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-asyncio-throttle-1.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-awesomeversion-23.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-asyncio-throttle-1.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-aiohue-4.7.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 647 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-aiohue-4.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 616 of 2165 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-aiohue-4.7.0-r0: task do_fetch: Started
NOTE: Running setscene task 694 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-aiohue-4.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 658 of 2165 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 716 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1297 of 2165 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_patch)
NOTE: recipe python3-aiohue-4.7.0-r0: task do_patch: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 758 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 2165 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2165 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-aiohue-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2153 of 2165 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_configure)
NOTE: recipe python3-aiohue-4.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-aiohue-4.7.0-r0: task do_configure: Started
NOTE: recipe python3-aiohue-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2154 of 2165 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_compile)
NOTE: recipe python3-aiohue-4.7.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/aiohue-4.7.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/temp/run.do_compile.2720305:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/temp/run.do_compile.2720305, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/temp/run.do_compile.2720305, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/temp/run.do_compile.2720305, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/temp/run.do_compile.2720305, line 184
NOTE: recipe python3-aiohue-4.7.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2154 tasks of which 2147 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103195403.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103195403.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-aiohue-4.7.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-aiohue-4.7.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/temp/run.do_compile.2720305', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-aiohue/4.7.0/temp/log.do_compile.2720305
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb:do_compile) failed with exit code '1'

--===============3980623948605669634==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-aiohue-upgrade-4.6.2-4.7.0.patch"

RnJvbSAwODdjZmQzMGQzZDc4YTVmYmFmOWJiMGRmMDNjNDQxM2UxZTFjNzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOTo1NDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYWlvaHVlOiB1cGdyYWRlIDQuNi4yIC0+IDQuNy4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYWlvaHVlXzQuNi4yLmJiID0+IHB5dGhvbjMtYWlvaHVlXzQuNy4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWFpb2h1ZV80LjYuMi5i
YiA9PiBweXRob24zLWFpb2h1ZV80LjcuMC5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFpb2h1ZV80LjYuMi5iYiBiL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYWlvaHVlXzQuNy4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYWlvaHVlXzQuNi4yLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFpb2h1ZV80LjcuMC5iYgppbmRleCBi
OTI1NmNhMjAuLmRlMGU2MjViMCAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1haW9odWVfNC42LjIuYmIKKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1haW9odWVfNC43LjAuYmIKQEAgLTQsNyArNCw3
IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZGFiMzFhMWQyODE4MzgyNjkzN2Y0
YjE1MjE0M2EzM2YiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNjlhZjZiYjBhN2QzNGQ1NjY1
MzhhZjU3Y2MxMGZiNjkxZWUwNGY4NDQyMDRlNGY2N2Q5NWE1N2YwYjkxYTQ2IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjNjYTcyN2I0NjNlNTViYmU3YzY5YjY3ZjU1MDNmZmNkN2QyMTNjOTY0NGM0
ZTQ1OGUzNTU2ZWU2ZWEzMzg1NWIiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoy
LjM5LjIKCg==

--===============3980623948605669634==--

