Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A59FC10F05
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2209.1699061896518635812
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bTAMVynq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=On62yNAp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb1299-4d19bf8e-7a16-4529-bbff-9bc1046beacb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ft8vnjK6dKj7nHJopMlxvtAq/EXokPh0yi39sPac2As=;
	b=bTAMVynqC9APrQ+9Vxx2XknaIk+TWf40vsnYOeOlea2b0UrbLc+bHjxi6aZGHkcb
	UyRFQurUoZ78gcqTppkVF3VrUksOwWw18AXT1DX8/re7LnBKce6DQQ/fJZRZ6heC7yx
	TzOuUgyREoWjDNQT1uhv/NDcFgs2DIfNS1iG68So=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ft8vnjK6dKj7nHJopMlxvtAq/EXokPh0yi39sPac2As=;
	b=On62yNApWeVq1mhqisl1q4Ngr/VMs6YUZuKV52tC9iIHbzEqeuX9o4FgcJoANhpN
	x1zVEY092kGLyk0gF9rvcEdIPvik146xUqv7frkkm0eSjWC/+MINHYKqlNJ0iCGUOto
	JCln4PoyKAFl0cZWeYJ+8XjFdhVwrUeGtVkFsHXE=
Content-Type: multipart/mixed; boundary="===============7480860446957316460=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-msm: upgrading to 0.9.0 FAILED
Message-ID: <0101018b97fb1299-4d19bf8e-7a16-4529-bbff-9bc1046beacb-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106136

--===============7480860446957316460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-msm* to *0.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-msm-upgrade-0.8.8-0.9.0.patch
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
From c588e607a2de70843960911185acc1a716cc5123 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:56:32 +0000
Subject: [PATCH] python3-msm: upgrade 0.8.8 -> 0.9.0

---
 .../python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
index 966ff86de..dbda2e1ed 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
-SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
+SRC_URI[sha256sum] = "3fbed593800aa669f0af2f01edfc3b54de46e995e0bdf03c5ea3693bdeab8735"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============7480860446957316460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5009 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:5798e4a9c1a1f3c625e2e5fb1c402268c526aff7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 514 Local 505 Mirrors 0 Missed 9 Current 333 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 335 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-lazy_1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 338 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 348 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-git_3.1.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 409 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 410 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-fasteners-0.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-monotonic-1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-lazy-1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pako-0.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-git-3.1.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-appdirs-1.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-monotonic-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-fasteners-0.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 702 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pako-0.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-lazy-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-git-3.1.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-appdirs-1.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 736 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-msm-0.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 666 of 2390 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 667 of 2390 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_unpack)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 783 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-msm-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 803 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1435 of 2390 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_patch)
NOTE: recipe python3-msm-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 847 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2103 of 2390 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2328 of 2390 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-msm-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-msm-0.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2378 of 2390 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_configure)
NOTE: recipe python3-msm-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-msm-0.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2379 of 2390 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile)
NOTE: recipe python3-msm-0.9.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/msm-0.9.0/setup.py", line 44, in <module>
|     install_requires=required('requirements/requirements.txt'),
|                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/msm-0.9.0/setup.py", line 34, in required
|     with open(os.path.join(BASEDIR, requirements_file), 'r') as file_handler:
|          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/msm-0.9.0/requirements/requirements.txt'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/temp/run.do_compile.582269:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/temp/run.do_compile.582269, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/temp/run.do_compile.582269, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/temp/run.do_compile.582269, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/temp/run.do_compile.582269, line 184
NOTE: recipe python3-msm-0.9.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2379 tasks of which 2372 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103225556.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103225556.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-msm-0.9.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-msm-0.9.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/temp/run.do_compile.582269', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-msm/0.9.0/temp/log.do_compile.582269
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb:do_compile) failed with exit code '1'

--===============7480860446957316460==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-msm-upgrade-0.8.8-0.9.0.patch"

RnJvbSBjNTg4ZTYwN2EyZGU3MDg0Mzk2MDkxMTE4NWFjYzFhNzE2Y2M1MTIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjo1NjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbXNtOiB1cGdyYWRlIDAuOC44IC0+IDAuOS4wCgotLS0KIC4uLi9weXRob24ve3B5dGhv
bjMtbXNtXzAuOC44LmJiID0+IHB5dGhvbjMtbXNtXzAuOS4wLmJifSAgICAgIHwgMyArLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tc21fMC44LjguYmIgPT4g
cHl0aG9uMy1tc21fMC45LjAuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tc21fMC44LjguYmIgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1zbV8wLjkuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLW1zbV8wLjguOC5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tc21fMC45LjAuYmIKaW5kZXggOTY2ZmY4NmRlLi5kYmRhMmUxZWQg
MTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bXNtXzAuOC44LmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbXNtXzAuOS4wLmJiCkBAIC0zLDggKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vTXljcm9mdEFJL215Y3JvZnQtc2tpbGxzLW1hbmFnZXIiCiBMSUNFTlNFID0gIkFw
YWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lMjNmYWRk
NmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSIKIAotU1JDX1VSSVttZDVzdW1dID0gImNmMWZjMGQx
ZDg2YWY2ODAwM2NhZTUzYzcxZWM2Mjg4IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE1MDJhZWU1
NDkxN2NkMzk0MjE3YjMxYzk3N2ExYmEzZDk1NDFhMDEyMGUwYTA0NWM0OWZkNzdiMzI4ZTRhMjki
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2ZiZWQ1OTM4MDBhYTY2OWYwYWYyZjAxZWRmYzNiNTRk
ZTQ2ZTk5NWUwYmRmMDNjNWVhMzY5M2JkZWFiODczNSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9v
bHMzCiAKLS0gCjIuMzkuMgoK

--===============7480860446957316460==--

