Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751B2C11F65
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2281.1699061894488854594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BTA2mikM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iok2Spa1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b97fb0a2d-2c8d480f-f589-4f88-a6e1-d1bd61088d33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YHyRrqq/KmUl+jggGnpYCELHAIDR9DvzSe/3Mix15Tw=;
	b=BTA2mikMiLMYD0VJCyHYv3bt8i1X12rv3q6b/BlyHJPKT/qX0eTdsTQ8Ww4ANS7c
	gdyCcAlHwYnjeyafb1q/qqTelhg6UOBsXrsVIfzHiXPvxHXShXl3x8ognOpnhy2RZm6
	q4K7YSpYudNcYwbiPwUrbQJcPOX5cBT5tJ/mcbxc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YHyRrqq/KmUl+jggGnpYCELHAIDR9DvzSe/3Mix15Tw=;
	b=iok2Spa1zFtFDg4BOGpAk9jPdNBnfFUYWCAwEaLZoL571yRFmCSLM9vDcXnGXmrf
	2dZfLRsuaV0pHDp2Wu91hf9T+bW//+ANQ8uRK4qMrxDNWTdagThCkdJSvHeBqR1pTSb
	RC4NwLAAgKysVTizNrYDtLELEx2jSiZc3zDaQhBQ=
Content-Type: multipart/mixed; boundary="===============2147322013210261216=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cycler: upgrading to 0.12.1 FAILED
Message-ID: <0101018b97fb0a2d-2c8d480f-f589-4f88-a6e1-d1bd61088d33-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106103

--===============2147322013210261216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cycler* to *0.12.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cycler-upgrade-0.11.0-0.12.1.patch
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
From a3112e04079092920cd379da4a870db494e32928 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:40:55 +0000
Subject: [PATCH] python3-cycler: upgrade 0.11.0 -> 0.12.1

---
 .../{python3-cycler_0.11.0.bb => python3-cycler_0.12.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cycler_0.11.0.bb => python3-cycler_0.12.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb
rename to meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
index 59492e8bf..36f814c1f 100644
--- a/meta-python/recipes-devtools/python/python3-cycler_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/matplotlib/cycler"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
 
-SRC_URI[sha256sum] = "9c87405839a19696e837b3b818fed3f5f69f16f1eec1a1ad77e043dcea9c772f"
+SRC_URI[sha256sum] = "88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============2147322013210261216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4936 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:5d9f1660a57ff50dd1910e90990b903e4c6fb273"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 353 Local 344 Mirrors 0 Missed 9 Current 279 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 288 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 290 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-cycler-0.12.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cycler-0.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cycler-0.12.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 632 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cycler-0.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1655 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_fetch)
NOTE: recipe python3-cycler-0.12.1-r0: task do_fetch: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1767 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_unpack)
NOTE: Running task 1768 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cycler-0.12.1-r0: task do_unpack: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1769 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_patch)
NOTE: Running task 1770 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cycler-0.12.1-r0: task do_patch: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cycler-0.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cycler-0.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1772 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_configure)
NOTE: recipe python3-cycler-0.12.1-r0: task do_configure: Started
NOTE: recipe python3-cycler-0.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_compile)
NOTE: recipe python3-cycler-0.12.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/cycler-0.12.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/temp/run.do_compile.2937958:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/temp/run.do_compile.2937958, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/temp/run.do_compile.2937958, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/temp/run.do_compile.2937958, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/temp/run.do_compile.2937958, line 184
NOTE: recipe python3-cycler-0.12.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1774 tasks of which 1767 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103204026.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103204026.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-cycler-0.12.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-cycler-0.12.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/temp/run.do_compile.2937958', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-cycler/0.12.1/temp/log.do_compile.2937958
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb:do_compile) failed with exit code '1'

--===============2147322013210261216==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cycler-upgrade-0.11.0-0.12.1.patch"

RnJvbSBhMzExMmUwNDA3OTA5MjkyMGNkMzc5ZGE0YTg3MGRiNDk0ZTMyOTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDo0MDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3ljbGVyOiB1cGdyYWRlIDAuMTEuMCAtPiAwLjEyLjEKCi0tLQogLi4uL3tweXRob24z
LWN5Y2xlcl8wLjExLjAuYmIgPT4gcHl0aG9uMy1jeWNsZXJfMC4xMi4xLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3ljbGVyXzAuMTEu
MC5iYiA9PiBweXRob24zLWN5Y2xlcl8wLjEyLjEuYmJ9ICg3NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeWNsZXJfMC4xMS4wLmJi
IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeWNsZXJfMC4x
Mi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNzclCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3ljbGVyXzAuMTEuMC5iYgpyZW5hbWUgdG8gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeWNsZXJfMC4xMi4xLmJi
CmluZGV4IDU5NDkyZThiZi4uMzZmODE0YzFmIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5Y2xlcl8wLjExLjAuYmIKKysrIGIvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeWNsZXJfMC4xMi4xLmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vZ2l0aHViLmNvbS9tYXRwbG90bGliL2N5
Y2xlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9NzcxM2ZlNDJjZDc2NmIxNWM3MTBlMTkzOTJiZmE4MTEiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5Yzg3NDA1ODM5YTE5Njk2ZTgzN2IzYjgxOGZlZDNmNWY2OWYxNmYx
ZWVjMWExYWQ3N2UwNDNkY2VhOWM3NzJmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg4YmIxMjhm
MDJiYTM0MWRhOGVmNDQ3MjQ1YTllMTM4ZmFlNzc3ZjZhMjM5NDNkYTQ1NDAwNzdkMzYwMWViMWMi
CiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============2147322013210261216==--

