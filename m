Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3073C10DC1
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2294.1699061896991301558
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K5GrqtKg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B4GvqhYq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b97fb153b-111b8a00-6bad-401a-a344-8a149e5f6f4a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/WZELfJlsZXkQ7S5EHOQfI3VeAtTpL5G9dK6fN21vCk=;
	b=K5GrqtKgp6Cad9+436nVSf5nFTOcZsVIFl/iG9szNuMVexYuC2AAbG2mk2Ka+49+
	QuZQKI6zq0QTt9TTyEfcuU/GrAXPwHxUkcu6JFHhkN0yVu2ewtIdocpUw+ueNi9yLyZ
	b3FuA3CBcD/lSjSeiJryx9HxtRjxWVdlJtRhp5mY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/WZELfJlsZXkQ7S5EHOQfI3VeAtTpL5G9dK6fN21vCk=;
	b=B4GvqhYqlb7R2MdYceBr0rdnW0krkakbyR4PL1dryQBXJKwwIPASRkIn5uHunXbT
	B0jv9qfLsfK6GBdWoEDIZHZmjX+oTQvSMtOq6cWr7t6dN130wnOz7QW61tWxU6or0Ng
	iIS8A9FUQwuvZ+DWUBPE9tGwm1Mz/iIouMSebezQ=
Content-Type: multipart/mixed; boundary="===============0059336065427980860=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pandas: upgrading to 2.1.2 FAILED
Message-ID: <0101018b97fb153b-111b8a00-6bad-401a-a344-8a149e5f6f4a-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106144

--===============0059336065427980860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pandas* to *2.1.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pandas-upgrade-2.0.3-2.1.2.patch
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
From 5bc0bd2ef8b598684c321f60a00719a9121e7606 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:04:40 +0000
Subject: [PATCH] python3-pandas: upgrade 2.0.3 -> 2.1.2

---
 .../python/{python3-pandas_2.0.3.bb => python3-pandas_2.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_2.0.3.bb => python3-pandas_2.1.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb
index 87a173c8a..ed96d07fe 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
-SRC_URI[sha256sum] = "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb4020a77512e2043c"
+SRC_URI[sha256sum] = "52897edc2774d2779fbeb6880d2cfb305daa0b1a29c16b91f531a18918a6e0f3"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============0059336065427980860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5014 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:c4421802609e9549d7933859125be91c806736a5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 396 Local 387 Mirrors 0 Missed 9 Current 307 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 309 of 703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 317 of 703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 319 of 703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-numpy_1.26.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 703 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-versioneer_0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 554 of 703 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-versioneer_0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 703 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-numpy_1.26.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 703 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-numpy_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-numpy-1.26.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-versioneer-native-0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-versioneer-native-0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-native-1.26.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-numpy-native-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pandas-2.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 696 of 703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-1.26.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-numpy-native-1.26.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-versioneer-native-0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pandas-2.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-versioneer-native-0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 703 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-versioneer_0.29.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pandas-2.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-versioneer-native-0.29-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1484 of 1986 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_fetch)
NOTE: recipe python3-versioneer-native-0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pandas-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1956 of 1986 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_unpack)
NOTE: recipe python3-pandas-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-numpy-native-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 703 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-numpy_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pandas-2.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1957 of 1986 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_patch)
NOTE: recipe python3-numpy-native-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-numpy-native-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1968 of 1986 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1971 of 1986 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pandas-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pandas-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1974 of 1986 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_configure)
NOTE: recipe python3-pandas-2.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pandas-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-pandas-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1975 of 1986 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_compile)
NOTE: recipe python3-pandas-2.1.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/pandas-2.1.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/temp/run.do_compile.617423:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/temp/run.do_compile.617423, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/temp/run.do_compile.617423, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/temp/run.do_compile.617423, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/temp/run.do_compile.617423, line 184
NOTE: recipe python3-pandas-2.1.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1975 tasks of which 1968 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103230408.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103230408.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pandas-2.1.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pandas-2.1.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/temp/run.do_compile.617423', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pandas/2.1.2/temp/log.do_compile.617423
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pandas_2.1.2.bb:do_compile) failed with exit code '1'

--===============0059336065427980860==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pandas-upgrade-2.0.3-2.1.2.patch"

RnJvbSA1YmMwYmQyZWY4YjU5ODY4NGMzMjFmNjBhMDA3MTlhOTEyMWU3NjA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzowNDo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGFuZGFzOiB1cGdyYWRlIDIuMC4zIC0+IDIuMS4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGFuZGFzXzIuMC4zLmJiID0+IHB5dGhvbjMtcGFuZGFzXzIuMS4yLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhbmRhc18yLjAuMy5i
YiA9PiBweXRob24zLXBhbmRhc18yLjEuMi5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhbmRhc18yLjAuMy5iYiBiL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFuZGFzXzIuMS4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFuZGFzXzIuMC4zLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhbmRhc18yLjEuMi5iYgppbmRleCA4
N2ExNzNjOGEuLmVkOTZkMDdmZSAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1wYW5kYXNfMi4wLjMuYmIKKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYW5kYXNfMi4xLjIuYmIKQEAgLTYsNyArNiw3
IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9wYW5kYXMucHlkYXRhLm9yZy8iCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWNiODE5
MDkyOTAxZGRiMTNhN2QwYTRmNWUwNWYwOThhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzAy
ZjM3MmE4OGUwZDE3ZjM2ZDMwOTNhNjQ0YzczY2ZjMTc4OGU4NzZhN2M0YmNiNDAyMGE3NzUxMmUy
MDQzYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1Mjg5N2VkYzI3NzRkMjc3OWZiZWI2ODgwZDJj
ZmIzMDVkYWEwYjFhMjljMTZiOTFmNTMxYTE4OTE4YTZlMGYzIgogCiBpbmhlcml0IHB5cGkgc2V0
dXB0b29sczMKIAotLSAKMi4zOS4yCgo=

--===============0059336065427980860==--

