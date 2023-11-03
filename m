Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5889C25B59
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.62985.1699041168445415392
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FHbBOVx7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Npaxu16U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96bec9a8-cda3cc1d-a720-458a-a60e-186dabe1fa9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+/I5iVPNEk5Dn/KQWx1xhFnf3GFbCW0W/XBVY4fI14g=;
	b=FHbBOVx7RlDrhVQPqpDziGUqVF9O3rIziAqqGJ1Y1GIsznjYVzS6vnl2Ap9hhepO
	i+K8n/cViQSL2ruRJri+xnweLl7qAbOg/Fc0U3dHhyu8cRBtG5LbHHq356uqvv0RuCh
	np2JwF3a4P3VeSOEdfn4vExxDg/CLHakzvkNJHDg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+/I5iVPNEk5Dn/KQWx1xhFnf3GFbCW0W/XBVY4fI14g=;
	b=Npaxu16UbpellhG+eC1nckhF739lSsccH+2ymbIW1Hd/ikB86bfElthoDexa2OXW
	kTEw+haJVl6jMMlW5rEsHlMK/MXsWGhFhpY6zYSBj+e9hnPyJgT7lKNRRKnFQybZbtB
	SXTbVk08lR0XETL/RA0suUtepxqIasJTkGHhOBkc=
Content-Type: multipart/mixed; boundary="===============8287379873043225535=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] imlib2: upgrading to 1.12.1 FAILED
Message-ID: <0101018b96bec9a8-cda3cc1d-a720-458a-a60e-186dabe1fa9f-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105947

--===============8287379873043225535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *imlib2* to *1.12.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-imlib2-upgrade-1.7.1-1.12.1.patch
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
From 308293813ec43532fecc5e67945b54b2c9728807 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:12:34 +0000
Subject: [PATCH] imlib2: upgrade 1.7.1 -> 1.12.1

---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 9b8849b58..f7dfaa937 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.7.1"
-SRCREV = "01424487e360383a039dc123bc2a345fe7ea2535"
+PV = "1.12.1"
+SRCREV = "9198db25369f04db069ce61a661c3c47b2622655"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.39.2


--===============8287379873043225535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4958 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:cede750831dcfe080443d21c3e3a1643d7e67212"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 239 Local 230 Mirrors 0 Missed 9 Current 228 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 237 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 239 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 247 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 251 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 252 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 253 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 254 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe imlib2-1.12.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe imlib2-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 360 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe imlib2-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe imlib2-1.12.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 383 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe imlib2-1.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe imlib2-1.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 411 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 412 of 1331 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe imlib2-1.12.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe imlib2-1.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 415 of 1331 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe imlib2-1.12.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 467 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe imlib2-1.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 1331 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_patch)
NOTE: Running task 1263 of 1331 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1305 of 1331 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_collect_spdx_deps)
NOTE: recipe imlib2-1.12.1-r0: task do_patch: Started
NOTE: recipe imlib2-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe imlib2-1.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe imlib2-1.12.1-r0: task do_patch: Succeeded
NOTE: recipe imlib2-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe imlib2-1.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1319 of 1331 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_configure)
NOTE: recipe imlib2-1.12.1-r0: task do_configure: Started
NOTE: recipe imlib2-1.12.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1319 tasks of which 1313 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103131203.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103131203.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: imlib2-1.12.1-r0 do_configure: QA Issue: imlib2: configure was passed unrecognised options: --without-bzip2 [unknown-configure-option]
ERROR: imlib2-1.12.1-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/imlib2/1.12.1/temp/log.do_configure.493362
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/imlib2/imlib2_git.bb:do_configure) failed with exit code '1'

--===============8287379873043225535==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-imlib2-upgrade-1.7.1-1.12.1.patch"

RnJvbSAzMDgyOTM4MTNlYzQzNTMyZmVjYzVlNjc5NDViNTRiMmM5NzI4ODA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzoxMjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlt
bGliMjogdXBncmFkZSAxLjcuMSAtPiAxLjEyLjEKCi0tLQogbWV0YS1vZS9yZWNpcGVzLWdyYXBo
aWNzL2ltbGliMi9pbWxpYjJfZ2l0LmJiIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1n
cmFwaGljcy9pbWxpYjIvaW1saWIyX2dpdC5iYiBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9p
bWxpYjIvaW1saWIyX2dpdC5iYgppbmRleCA5Yjg4NDliNTguLmY3ZGZhYTkzNyAxMDA2NDQKLS0t
IGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2ltbGliMi9pbWxpYjJfZ2l0LmJiCisrKyBiL21l
dGEtb2UvcmVjaXBlcy1ncmFwaGljcy9pbWxpYjIvaW1saWIyX2dpdC5iYgpAQCAtNyw4ICs3LDgg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MzQ0ODk1ZjI1M2MzMmYz
OGUxODJkY2FmMzBmZThhMzUiCiAKIERFUEVORFMgPSAiZnJlZXR5cGUgIgogUFJPVklERVMgPSAi
dmlydHVhbC9pbWxpYjIiCi1QViA9ICIxLjcuMSIKLVNSQ1JFViA9ICIwMTQyNDQ4N2UzNjAzODNh
MDM5ZGMxMjNiYzJhMzQ1ZmU3ZWEyNTM1IgorUFYgPSAiMS4xMi4xIgorU1JDUkVWID0gIjkxOThk
YjI1MzY5ZjA0ZGIwNjljZTYxYTY2MWMzYzQ3YjI2MjI2NTUiCiAKIGluaGVyaXQgYXV0b3Rvb2xz
IHBrZ2NvbmZpZyBsaWJfcGFja2FnZQogCi0tIAoyLjM5LjIKCg==

--===============8287379873043225535==--

