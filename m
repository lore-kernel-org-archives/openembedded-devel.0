Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F42C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.63233.1699041739990404041
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O8EwocqF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ISuXJFVY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96c7822b-8ae52c6a-dd73-42e0-9dc8-e25769b49a45-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CJ1tEboRS9MpE1pn3Y9urhQODxhALJesEorIlQQDlp4=;
	b=O8EwocqFSAKIdXHLZlZL4SJq/uj21pG/FAUJ9Dkw3TNwaPZGoVfk+FnZycySCZ86
	4HgYAxTDrkXFiB6D0i1Cvfa8GIKGDbT6ZmC0e75Ce5O2Cvuzh9wFW6g1Vvo/sc7ilkx
	ELDuZqPNRoqYu5dUhhZ+jWUkq6yNan62tw9T2Djk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CJ1tEboRS9MpE1pn3Y9urhQODxhALJesEorIlQQDlp4=;
	b=ISuXJFVYz9Q+lI+NmsfED1NdzJNfEHu3/vjowY/nEJuAcr8QthR0L6bkAt3eJqrp
	5+bXdhHDF4VMI3l0FEgc1uWxaMoQbmiL2BuEf9HpdIQhLjXJZnbSKnZaHXHYVobgPAJ
	6LwyA+hJDUUN+CgrySRO8b0+5mitjN+8B7TlPSg0=
Content-Type: multipart/mixed; boundary="===============7893567343172445355=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] opencl-clhpp: upgrading to 2023.04.17 FAILED
Message-ID: <0101018b96c7822b-8ae52c6a-dd73-42e0-9dc8-e25769b49a45-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106083

--===============7893567343172445355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *opencl-clhpp* to *2023.04.17* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-opencl-clhpp-upgrade-2.0.16-2023.04.17.patch
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
From ac042b9d2a777e8948cace9e3a9f2a58b2d83c9e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:13:41 +0000
Subject: [PATCH] opencl-clhpp: upgrade 2.0.16 -> 2023.04.17

---
 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
index 8a712602c..30a64aeff 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -6,8 +6,8 @@ SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PV = "2.0.16+git${SRCPV}"
-SRCREV = "1df82b9749739f2681081092ae163bb0f0d40f66"
+PV = "2023.04.17"
+SRCREV = "8f536659b8f98220938afdd6b6cf6c90dc03b615"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============7893567343172445355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5008 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:840edfebf00d69545ad44f38ebf11547e50816da"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 143 Local 134 Mirrors 0 Missed 9 Current 156 (93% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 165 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 167 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 175 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_create_spdx_setscene)
NOTE: recipe cmake-native-3.27.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_populate_lic_setscene: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.27.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 299 of 299 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_recipe_qa_setscene)
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 877 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_fetch)
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_fetch: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_unpack)
NOTE: Running task 879 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_unpack: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_patch)
NOTE: Running task 881 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_collect_spdx_deps)
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_patch: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_patch: Succeeded
NOTE: Running task 883 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_generate_toolchain_file)
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_generate_toolchain_file: Started
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 885 of 897 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_configure)
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'quilt-native', 'ninja-native', 'patch-native', 'pseudo-native', 'attr-native', 'libtool-native', 'linux-libc-headers', 'libgcc', 're2c-native', 'ncurses-native', 'bzip2-native', 'xz-native', 'zstd-native', 'zlib-native', 'openssl-native', 'gnu-config-native', 'binutils-cross-x86_64', 'libmpc-native', 'flex-native', 'mpfr-native', 'texinfo-dummy-native', 'gmp-native', 'gettext-minimal-native', 'perl-native', 'm4-native', 'make-native', 'gdbm-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Error at CMakeLists.txt:50 (find_package):
|   By not providing "FindOpenCLHeaders.cmake" in CMAKE_MODULE_PATH this
|   project has asked CMake to find a package configuration file provided by
|   "OpenCLHeaders", but CMake did not find one.
| 
|   Could not find a package configuration file provided by "OpenCLHeaders"
|   with any of the following names:
| 
|     OpenCLHeadersConfig.cmake
|     openclheaders-config.cmake
| 
|   Add the installation prefix of "OpenCLHeaders" to CMAKE_PREFIX_PATH or set
|   "OpenCLHeaders_DIR" to a directory containing one of the above files.  If
|   "OpenCLHeaders" provides a separate development package or SDK, be sure it
|   has been installed.
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/temp/run.do_configure.3433980:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/po
 kybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/temp/run.do_configure.3433980, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/temp/run.do_configure.3433980, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/temp/run.do_configure.3433980, line 180
NOTE: recipe opencl-clhpp-2023.04.17-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 885 tasks of which 878 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103171317.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103171317.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: opencl-clhpp-2023.04.17-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/temp/run.do_configure.3433980', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/opencl-clhpp/2023.04.17/temp/log.do_configure.3433980
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb:do_configure) failed with exit code '1'

--===============7893567343172445355==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-opencl-clhpp-upgrade-2.0.16-2023.04.17.patch"

RnJvbSBhYzA0MmI5ZDJhNzc3ZTg5NDhjYWNlOWUzYTlmMmE1OGIyZDgzYzllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzoxMzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5jbC1jbGhwcDogdXBncmFkZSAyLjAuMTYgLT4gMjAyMy4wNC4xNwoKLS0tCiBtZXRhLW9lL3Jl
Y2lwZXMtY29yZS9vcGVuY2wvb3BlbmNsLWNsaHBwX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
LW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb3BlbmNsLWNsaHBwX2dpdC5iYiBiL21ldGEtb2UvcmVj
aXBlcy1jb3JlL29wZW5jbC9vcGVuY2wtY2xocHBfZ2l0LmJiCmluZGV4IDhhNzEyNjAyYy4uMzBh
NjRhZWZmIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb3BlbmNsLWNs
aHBwX2dpdC5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb3BlbmNsLWNsaHBw
X2dpdC5iYgpAQCAtNiw4ICs2LDggQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9u
b3NHcm91cC9PcGVuQ0wtQ0xIUFAuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0KIExJQ0VOU0Ug
ID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDtt
ZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiAKLVBWID0gIjIuMC4xNitnaXQk
e1NSQ1BWfSIKLVNSQ1JFViA9ICIxZGY4MmI5NzQ5NzM5ZjI2ODEwODEwOTJhZTE2M2JiMGYwZDQw
ZjY2IgorUFYgPSAiMjAyMy4wNC4xNyIKK1NSQ1JFViA9ICI4ZjUzNjY1OWI4Zjk4MjIwOTM4YWZk
ZDZiNmNmNmM5MGRjMDNiNjE1IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIK
Cg==

--===============7893567343172445355==--

