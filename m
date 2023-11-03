Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5370DC05032
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.64104.1699041738432461762
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YOEgz8CV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ioxOUurd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96c77eec-b5952a39-8521-4a7a-9aef-62097662e40b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BdcuEC/H+qprQppEHocsBsWLNw2mAdLpkZtopd7So/w=;
	b=YOEgz8CViAlVfnKdEDVQdcEqSt68+X4pjHSjRYX2AeFYIK+2oCalAZLt49V+SEPa
	sGKWhXm1mwhDd6lK5U6iACvY4bPT5eWXxJzH7lyrKmIIJalfWR7glWj6e9ydVIqOpnh
	Lt2vy2Jz5B4sEESIWCFJUt72kE/AWXeJR9rudrYA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BdcuEC/H+qprQppEHocsBsWLNw2mAdLpkZtopd7So/w=;
	b=ioxOUurdP1abLU/HW/Q8Lhw2JAy4PEK2gEdYcaeA8CTZ7FSe1Lzrnlm9iJrT7nKh
	Y3vX3XrLSiTnckUyw7KNjROO3UfnmxQYILYlu455Gbpr7rI0EPV42CiZdM0WoE2WbPO
	cj6VzG8eyJyZD/tkvTo88n2NWCIrHWxkefIMXThQ=
Content-Type: multipart/mixed; boundary="===============7073675697951562510=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] opencl-icd-loader: upgrading to 2023.04.17 FAILED
Message-ID: <0101018b96c77eec-b5952a39-8521-4a7a-9aef-62097662e40b-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106068

--===============7073675697951562510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *opencl-icd-loader* to *2023.04.17* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-opencl-icd-loader-upgrade-2022.01.04-2023.04.17.patch
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
From d83c30a0113ecd21d1511e0e2a21018bee8b231d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:18:44 +0000
Subject: [PATCH] opencl-icd-loader: upgrade 2022.01.04 -> 2023.04.17

---
 meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
index fc04cb55f..ac824d178 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
@@ -12,8 +12,8 @@ PROVIDES = "virtual/opencl-icd"
 RPROVIDES:${PN} = "virtual/opencl-icd"
 
 S = "${WORKDIR}/git"
-PV = "v2022.01.04+git${SRCPV}"
-SRCREV = "169f05d026e65948b30cfe2200595fda92198cf7"
+PV = "2023.04.17"
+SRCREV = "b1bce7c3c580a8345205cf65fc1a5f55ba9cdb01"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
 EXTRA_OECMAKE:append = " \
-- 
2.39.2


--===============7073675697951562510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5013 entries from dependency cache.
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
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:2971342d48d925cd472f23ec54728d5e9be29e15"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 151 Local 142 Mirrors 0 Missed 9 Current 154 (94% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 158 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-headers_04.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 165 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 167 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opencl-headers-04.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_populate_lic_setscene: Started
NOTE: recipe opencl-headers-04.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 249 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 250 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 286 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 254 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_fetch: Succeeded
NOTE: Running task 289 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 261 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 263 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_unpack: Succeeded
NOTE: Running task 763 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_patch)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_patch: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_patch: Succeeded
NOTE: Running task 765 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_generate_toolchain_file)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_generate_toolchain_file: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 305 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 887 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 898 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_collect_spdx_deps)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 899 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_configure)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_configure: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_configure: Succeeded
NOTE: Running task 900 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_compile)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_compile: Started
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_compile: Succeeded
NOTE: Running task 901 of 911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_install)
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-headers_04.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_
 sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['opencl-headers', 'glibc', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'quilt-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'zlib-native', 'ncurses-native', 'zstd-native', 'xz-native', 'bzip2-native', 'openssl-native', 'linux-libc-headers', 'flex-native', 'gnu-config-native', 'texinfo-dummy-native', 'binutils-cross-x86_64', 'libtool-native', 'libmpc-native', 'gmp-native', 'mpfr-native', 'attr-native', 're2c-native', 'libgcc', 'gettext-minimal-native', 'perl-native', 'm4-native', 'make-native', 'gdbm-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| install: cannot stat '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/build/test/loader_test/icd_loader_test': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/temp/run.do_install.3515374:147 exit 1 from 'install -m 0755 /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/build/test/loader_test/icd_loader_test /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/image/usr/bin/'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/temp/run.do_install.3515374, line 147
| 	#2: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/temp/run.do_install.3515374, line 160
NOTE: recipe opencl-icd-loader-2023.04.17-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 901 tasks of which 892 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103171811.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103171811.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: opencl-icd-loader-2023.04.17-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/temp/run.do_install.3515374', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-icd-loader/2023.04.17/temp/log.do_install.3515374
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb:do_install) failed with exit code '1'

--===============7073675697951562510==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-opencl-icd-loader-upgrade-2022.01.04-2023.04.17.patch"

RnJvbSBkODNjMzBhMDExM2VjZDIxZDE1MTFlMGUyYTIxMDE4YmVlOGIyMzFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzoxODo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5jbC1pY2QtbG9hZGVyOiB1cGdyYWRlIDIwMjIuMDEuMDQgLT4gMjAyMy4wNC4xNwoKLS0tCiBt
ZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb3BlbmNsLWljZC1sb2FkZXJfZ2l0LmJiIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb3JlL29wZW5jbC9vcGVuY2wtaWNkLWxvYWRlcl9n
aXQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb3BlbmNsLWljZC1sb2FkZXJfZ2l0
LmJiCmluZGV4IGZjMDRjYjU1Zi4uYWM4MjRkMTc4IDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lw
ZXMtY29yZS9vcGVuY2wvb3BlbmNsLWljZC1sb2FkZXJfZ2l0LmJiCisrKyBiL21ldGEtb2UvcmVj
aXBlcy1jb3JlL29wZW5jbC9vcGVuY2wtaWNkLWxvYWRlcl9naXQuYmIKQEAgLTEyLDggKzEyLDgg
QEAgUFJPVklERVMgPSAidmlydHVhbC9vcGVuY2wtaWNkIgogUlBST1ZJREVTOiR7UE59ID0gInZp
cnR1YWwvb3BlbmNsLWljZCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLVBWID0gInYyMDIyLjAx
LjA0K2dpdCR7U1JDUFZ9IgotU1JDUkVWID0gIjE2OWYwNWQwMjZlNjU5NDhiMzBjZmUyMjAwNTk1
ZmRhOTIxOThjZjciCitQViA9ICIyMDIzLjA0LjE3IgorU1JDUkVWID0gImIxYmNlN2MzYzU4MGE4
MzQ1MjA1Y2Y2NWZjMWE1ZjU1YmE5Y2RiMDEiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
S2hyb25vc0dyb3VwL09wZW5DTC1JQ0QtTG9hZGVyLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1o
dHRwcyIKIAogRVhUUkFfT0VDTUFLRTphcHBlbmQgPSAiIFwKLS0gCjIuMzkuMgoK

--===============7073675697951562510==--

