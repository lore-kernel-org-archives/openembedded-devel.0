Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B28C0755A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2292.1699061896221975987
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YSC41Rhm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DD2ACReA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b97fb1223-8b41d439-3092-4f5d-81b4-a9c583b6e7bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qnGVozmLHl6ayWym4SyMChRn5asB8/SsaRXDUef3Qxw=;
	b=YSC41RhmQOX6nPg5QdWQS6FaefpoQl/B7hmtHHQuw0/X/ejERM3srZTUlygwDfg+
	lIl2T5bW/BQB+kD4hFyRI3g3rzGCgdmR6nV7FmJMOI1Mmu7Hg30e905KD5+zfqRd71V
	j2XszYgPMa17QzmiVeIwSWJByAxCvp1zRdr95/II=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qnGVozmLHl6ayWym4SyMChRn5asB8/SsaRXDUef3Qxw=;
	b=DD2ACReA+qpbRrKQM3dpD9aJsG229GHlyWrfmAHOs2TpQARna2ggUntwV00NB3JO
	jwM/V8VHFiMjhUx3c/JLb8XQwW0yPOw9/McTi3UG+eXjTVc+LdW5XT1gIkd22n7ehQ5
	BY0BhM+UceSBTiV1VKPSz+0bifGCup5qWKtKhWZg=
Content-Type: multipart/mixed; boundary="===============6925462901185958061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-kmod: upgrading to 0.9.2 FAILED
Message-ID: <0101018b97fb1223-8b41d439-3092-4f5d-81b4-a9c583b6e7bf-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106133

--===============6925462901185958061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-kmod* to *0.9.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-kmod-upgrade-0.9.1-0.9.2.patch
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
From 5a000e3b28358036914cf92129d80248b1cbcb79 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:34:53 +0000
Subject: [PATCH] python3-kmod: upgrade 0.9.1 -> 0.9.2

---
 .../python/{python3-kmod_0.9.1.bb => python3-kmod_0.9.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kmod_0.9.1.bb => python3-kmod_0.9.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb b/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
index 2ec4d474b..acb8bac3b 100644
--- a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6d62c2454850386a2ffe44f72db83d74"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f3bf829059bf88eca22f4f549e17aa316cdaa14302bf2ba49ddeee60cea109ff"
+SRC_URI[sha256sum] = "4ddc73391a9937690f4ca5d8ededf679fae8e212d057fe40cfbb76fc63b5b03e"
 
 DEPENDS += " \
     kmod \
-- 
2.39.2


--===============6925462901185958061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4996 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:34960b3c85894c1eb789ce9f615c62d6d1d9386b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 364 Local 355 Mirrors 0 Missed 9 Current 277 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 286 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 288 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 317 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe python3-kmod-0.9.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-kmod-0.9.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 530 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-kmod-0.9.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-kmod-0.9.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 513 of 1811 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_fetch)
NOTE: recipe python3-kmod-0.9.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_fetch: Succeeded
NOTE: Running task 514 of 1811 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_unpack)
NOTE: recipe python3-kmod-0.9.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe python3-kmod-0.9.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1131 of 1811 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_patch)
NOTE: recipe python3-kmod-0.9.2-r0: task do_patch: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 641 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1645 of 1811 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1795 of 1811 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-kmod-0.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-kmod-0.9.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1799 of 1811 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_configure)
NOTE: recipe python3-kmod-0.9.2-r0: task do_configure: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_configure: Succeeded
NOTE: Running task 1800 of 1811 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_compile)
NOTE: recipe python3-kmod-0.9.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/kmod-0.9.2/setup.py", line 28, in <module>
|     m.Extension.__dict__ = m._Extension.__dict__
|     ^^^^^^^^^^^^^^^^^^^^
| AttributeError: attribute '__dict__' of 'type' objects is not writable
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/temp/run.do_compile.4056242:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/temp/run.do_compile.4056242, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/temp/run.do_compile.4056242, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/temp/run.do_compile.4056242, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/temp/run.do_compile.4056242, line 184
NOTE: recipe python3-kmod-0.9.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1800 tasks of which 1793 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103223357.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103223357.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-kmod-0.9.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-kmod-0.9.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/temp/run.do_compile.4056242', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2/temp/log.do_compile.4056242
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_compile) failed with exit code '1'

--===============6925462901185958061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-kmod-upgrade-0.9.1-0.9.2.patch"

RnJvbSA1YTAwMGUzYjI4MzU4MDM2OTE0Y2Y5MjEyOWQ4MDI0OGIxY2JjYjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjozNDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMta21vZDogdXBncmFkZSAwLjkuMSAtPiAwLjkuMgoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWttb2RfMC45LjEuYmIgPT4gcHl0aG9uMy1rbW9kXzAuOS4yLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1rbW9kXzAuOS4xLmJiID0+
IHB5dGhvbjMta21vZF8wLjkuMi5iYn0gKDc3JSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWttb2RfMC45LjEuYmIgYi9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWttb2RfMC45LjIuYmIKc2ltaWxhcml0
eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1rbW9kXzAuOS4xLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWttb2RfMC45LjIuYmIKaW5kZXggMmVjNGQ0NzRiLi5hY2I4
YmFjM2IgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMta21vZF8wLjkuMS5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWttb2RfMC45LjIuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTZkNjJjMjQ1NDg1MDM4NmEyZmZlNDRmNzJkYjgzZDc0
IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYz
YmY4MjkwNTliZjg4ZWNhMjJmNGY1NDllMTdhYTMxNmNkYWExNDMwMmJmMmJhNDlkZGVlZTYwY2Vh
MTA5ZmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGRkYzczMzkxYTk5Mzc2OTBmNGNhNWQ4ZWRl
ZGY2NzlmYWU4ZTIxMmQwNTdmZTQwY2ZiYjc2ZmM2M2I1YjAzZSIKIAogREVQRU5EUyArPSAiIFwK
ICAgICBrbW9kIFwKLS0gCjIuMzkuMgoK

--===============6925462901185958061==--

