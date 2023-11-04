Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66885C064F9
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2280.1699061894195226316
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CYFoqrrV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Id95+JrH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b97fb14db-682a222b-59ea-4328-b5f7-2aef0b3244e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=01iyUb0QYHcSxVwF4R1YCO+Qe0z/n1Taar2vgAqaaXo=;
	b=CYFoqrrVjrRdlOJ/kW5elNAYGqJqGP4nKZteElfie4c9YysWVjwsux7irseFdGbB
	tfQi7mYwusipvNfi7hs/AGe1EEHTnFIekAdqggWtnzhN4WQDzo1sGh4e6glys6fyGG9
	MKhsVwSO7qQtT9rtYLOD5AKoxN2+uuc7L8jQO0k8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=01iyUb0QYHcSxVwF4R1YCO+Qe0z/n1Taar2vgAqaaXo=;
	b=Id95+JrH/HON/SC2og1Z0duR2RMNZWfIYXDjkrwTd3+xjpvclk4CwJFqWuoIeXUX
	NdR+Li3ooz6MCBTYoFKnbLl/6wL/iuzjGJLiiikpkERW3gMDvaqG1tZVsVzTQcx67qt
	BKpHbbWdWLdsDY3unq85eTN8nSyYEu2QQC05XId8=
Content-Type: multipart/mixed; boundary="===============3822652489022281490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-portalocker: upgrading to 2.8.2 FAILED
Message-ID: <0101018b97fb14db-682a222b-59ea-4328-b5f7-2aef0b3244e0-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106150

--===============3822652489022281490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-portalocker* to *2.8.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-portalocker-upgrade-2.7.0-2.8.2.patch
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
From 11ad2179ffe77ff55cec046c829e00f01217822d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:24:36 +0000
Subject: [PATCH] python3-portalocker: upgrade 2.7.0 -> 2.8.2

---
 ...ython3-portalocker_2.7.0.bb => python3-portalocker_2.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.7.0.bb => python3-portalocker_2.8.2.bb} (80%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
similarity index 80%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
index 03c4f2f40..087fcebe8 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "032e81d534a88ec1736d03f780ba073f047a06c478b06e2937486f334e955c51"
+SRC_URI[sha256sum] = "2b035aa7828e46c58e9b31390ee1f169b98e1066ab10b9a6a861fe7e25ee4f33"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============3822652489022281490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5028 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:97021126f335c90f9310ceaa5568ae3c69dc72e9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 331 Local 322 Mirrors 0 Missed 9 Current 293 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 302 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 304 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-portalocker-2.8.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-portalocker-2.8.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 624 of 624 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-portalocker-2.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1524 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_fetch)
NOTE: recipe python3-portalocker-2.8.2-r0: task do_fetch: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1751 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_unpack)
NOTE: Running task 1752 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-portalocker-2.8.2-r0: task do_unpack: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 1753 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_patch)
NOTE: Running task 1754 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-portalocker-2.8.2-r0: task do_patch: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-portalocker-2.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-portalocker-2.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1756 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_configure)
NOTE: recipe python3-portalocker-2.8.2-r0: task do_configure: Started
NOTE: recipe python3-portalocker-2.8.2-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 1769 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_compile)
NOTE: recipe python3-portalocker-2.8.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/portalocker-2.8.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/temp/run.do_compile.783217:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/temp/run.do_compile.783217, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/temp/run.do_compile.783217, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/temp/run.do_compile.783217, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/temp/run.do_compile.783217, line 184
NOTE: recipe python3-portalocker-2.8.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1758 tasks of which 1751 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103232407.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103232407.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-portalocker-2.8.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-portalocker-2.8.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/temp/run.do_compile.783217', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-portalocker/2.8.2/temp/log.do_compile.783217
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb:do_compile) failed with exit code '1'

--===============3822652489022281490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-portalocker-upgrade-2.7.0-2.8.2.patch"

RnJvbSAxMWFkMjE3OWZmZTc3ZmY1NWNlYzA0NmM4MjllMDBmMDEyMTc4MjJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzoyNDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9ydGFsb2NrZXI6IHVwZ3JhZGUgMi43LjAgLT4gMi44LjIKCi0tLQogLi4ueXRob24z
LXBvcnRhbG9ja2VyXzIuNy4wLmJiID0+IHB5dGhvbjMtcG9ydGFsb2NrZXJfMi44LjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9weXRob24zLXBvcnRhbG9ja2VyL3tweXRo
b24zLXBvcnRhbG9ja2VyXzIuNy4wLmJiID0+IHB5dGhvbjMtcG9ydGFsb2NrZXJfMi44LjIuYmJ9
ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9weXRob24z
LXBvcnRhbG9ja2VyL3B5dGhvbjMtcG9ydGFsb2NrZXJfMi43LjAuYmIgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWV4dGVuZGVkL3B5dGhvbjMtcG9ydGFsb2NrZXIvcHl0aG9uMy1wb3J0YWxvY2tlcl8y
LjguMi5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNp
cGVzLWV4dGVuZGVkL3B5dGhvbjMtcG9ydGFsb2NrZXIvcHl0aG9uMy1wb3J0YWxvY2tlcl8yLjcu
MC5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9weXRob24zLXBvcnRh
bG9ja2VyL3B5dGhvbjMtcG9ydGFsb2NrZXJfMi44LjIuYmIKaW5kZXggMDNjNGYyZjQwLi4wODdm
Y2ViZTggMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZXh0ZW5kZWQvcHl0aG9uMy1w
b3J0YWxvY2tlci9weXRob24zLXBvcnRhbG9ja2VyXzIuNy4wLmJiCisrKyBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZXh0ZW5kZWQvcHl0aG9uMy1wb3J0YWxvY2tlci9weXRob24zLXBvcnRhbG9ja2Vy
XzIuOC4yLmJiCkBAIC00LDcgKzQsNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIAogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTUyNjM0ZGE2NjBhMzc0Y2ExOGMw
NzM0ZWQwN2M2M2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwMzJlODFkNTM0YTg4ZWMxNzM2
ZDAzZjc4MGJhMDczZjA0N2EwNmM0NzhiMDZlMjkzNzQ4NmYzMzRlOTU1YzUxIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjJiMDM1YWE3ODI4ZTQ2YzU4ZTliMzEzOTBlZTFmMTY5Yjk4ZTEwNjZhYjEw
YjlhNmE4NjFmZTdlMjVlZTRmMzMiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoy
LjM5LjIKCg==

--===============3822652489022281490==--

