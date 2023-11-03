Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7377DC001DB
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.64113.1699041739541428753
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=encucVJl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h5iWL8XO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96c78064-e6469426-246a-40ec-ab8e-480da014d165-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sm3uFADLP8gAfJ13R9fz3AP5rJ6vUyqTkVcAKZw146s=;
	b=encucVJls7EdLErqWRQ4Z8lDtoMQpbIqBHNj0ryBaYbWPgJRWUCfHlZrgHD88o2S
	zfpeCufKfoo7Q+l3a8Drlr6H3TKkpIGTu84D2vvPJl6O9G2lUc27hIJ6YWz2ldDiRQi
	vzbA9IVPQvnQktl4aaJyn3rW9iSJVHh+O2PwcK9A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sm3uFADLP8gAfJ13R9fz3AP5rJ6vUyqTkVcAKZw146s=;
	b=h5iWL8XOm/T6y2ozymGCMehvKCRHzd2WGFoY2RK6xhTJM+tZk2QSHEdiszENajGW
	t6AhzilPW//irXQ2IUV3irZbVxAwLzgss01Ouzv3AAK29U8fiuuV3b7DVLFyTB+EvhB
	ZE8wGgWwbWsRgNgjVg4jWAwmCbOQM/aFzp5ZSnGA=
Content-Type: multipart/mixed; boundary="===============1990181713059657613=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] proj: upgrading to 9.3.0RC2 FAILED
Message-ID: <0101018b96c78064-e6469426-246a-40ec-ab8e-480da014d165-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106077

--===============1990181713059657613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *proj* to *9.3.0RC2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-proj-upgrade-9.3.0-9.3.0RC2.patch
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
From af16485052e42eac7c543bcfc69bc4207d6e9a70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:04:37 +0000
Subject: [PATCH] proj: upgrade 9.3.0 -> 9.3.0RC2

---
 .../recipes-navigation/proj/{proj_9.3.0.bb => proj_9.3.0RC2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.3.0.bb => proj_9.3.0RC2.bb} (90%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.3.0.bb b/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb
similarity index 90%
rename from meta-oe/recipes-navigation/proj/proj_9.3.0.bb
rename to meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb
index 59bded87f..eb06d9d21 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.3.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "91a3695a004ea28db0448a34460bed4cc3b130e5c7d74339ec999efdab0e547d"
+SRC_URI[sha256sum] = "8fe304f17cfcabea0fed5974933f8fbf0a8d30454e34c7e92045f6134d07da8e"
 
 inherit cmake lib_package
 
-- 
2.39.2


--===============1990181713059657613==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-proj-upgrade-9.3.0-9.3.0RC2.patch"

RnJvbSBhZjE2NDg1MDUyZTQyZWFjN2M1NDNiY2ZjNjliYzQyMDdkNmU5YTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODowNDozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBy
b2o6IHVwZ3JhZGUgOS4zLjAgLT4gOS4zLjBSQzIKCi0tLQogLi4uL3JlY2lwZXMtbmF2aWdhdGlv
bi9wcm9qL3twcm9qXzkuMy4wLmJiID0+IHByb2pfOS4zLjBSQzIuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9y
ZWNpcGVzLW5hdmlnYXRpb24vcHJvai97cHJval85LjMuMC5iYiA9PiBwcm9qXzkuMy4wUkMyLmJi
fSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9uL3Byb2ovcHJv
al85LjMuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9uL3Byb2ovcHJval85LjMuMFJD
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtbmF2
aWdhdGlvbi9wcm9qL3Byb2pfOS4zLjAuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1uYXZp
Z2F0aW9uL3Byb2ovcHJval85LjMuMFJDMi5iYgppbmRleCA1OWJkZWQ4N2YuLmViMDZkOWQyMSAx
MDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLW5hdmlnYXRpb24vcHJvai9wcm9qXzkuMy4wLmJi
CisrKyBiL21ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9uL3Byb2ovcHJval85LjMuMFJDMi5iYgpA
QCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZjI3
NDQ1MTk4YmExNTAwZjUwOGZjZTJiMTgzY2UwZmYiCiBERVBFTkRTID0gInNxbGl0ZTMgc3FsaXRl
My1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Rvd25sb2FkLm9zZ2VvLm9yZy8ke0JQTn0v
JHtCUH0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxYTM2OTVhMDA0ZWEyOGRiMDQ0
OGEzNDQ2MGJlZDRjYzNiMTMwZTVjN2Q3NDMzOWVjOTk5ZWZkYWIwZTU0N2QiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiOGZlMzA0ZjE3Y2ZjYWJlYTBmZWQ1OTc0OTMzZjhmYmYwYThkMzA0NTRlMzRj
N2U5MjA0NWY2MTM0ZDA3ZGE4ZSIKIAogaW5oZXJpdCBjbWFrZSBsaWJfcGFja2FnZQogCi0tIAoy
LjM5LjIKCg==

--===============1990181713059657613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5031 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:d427cd5f1636031920196e45fcf22fc7b124dde8"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 181 Local 171 Mirrors 0 Missed 10 Current 174 (94% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 185 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 194 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 195 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 274 of 355 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_create_spdx_setscene)
NOTE: recipe proj-9.3.0RC2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 276 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 295 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe proj-9.3.0RC2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 306 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe proj-9.3.0RC2-r0: task do_fetch: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_fetch: Succeeded
NOTE: Running task 309 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 311 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 759 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_patch)
NOTE: recipe proj-9.3.0RC2-r0: task do_patch: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_patch: Succeeded
NOTE: Running task 820 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_generate_toolchain_file)
NOTE: Running task 821 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_populate_lic)
NOTE: recipe proj-9.3.0RC2-r0: task do_populate_lic: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_generate_toolchain_file: Started
WARNING: proj-9.3.0RC2-r0 do_populate_lic: Could not copy license file /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/proj-9.3.0RC2/COPYING to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/license-destdir/core2-64/proj/COPYING: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/proj-9.3.0RC2/COPYING'
NOTE: recipe proj-9.3.0RC2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 355 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1006 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1023 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_collect_spdx_deps)
NOTE: recipe proj-9.3.0RC2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_collect_spdx_deps: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe proj-9.3.0RC2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1024 of 1036 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_configure)
NOTE: recipe proj-9.3.0RC2-r0: task do_configure: Started
NOTE: recipe proj-9.3.0RC2-r0: task do_populate_lic: Failed
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/
 yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'quilt-native', 'curl', 'sqlite3', 'ninja-native', 'patch-native', 'pseudo-native', 'sqlite3-native', 'libtool-native', 'mpfr-native', 'gnu-config-native', 'xz-native', 'gmp-native', 'binutils-cross-x86_64', 'linux-libc-headers', 'zlib-native', 'texinfo-dummy-native', 'flex-native', 'libmpc-native', 'zstd-native', 'openssl-native', 'ncurses-native', 'bzip2-native', 'libgcc', 're2c-native', 'zlib', 'openssl', 'opkg-utils', 'libidn2', 'attr-native', 'gettext-minimal-native', 'm4-native', 'perl-native', 'libunistring', 'gdbm-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| CMake Warning:
|   Ignoring extra path from command line:
| 
|    "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/proj-9.3.0RC2"
| 
| 
| CMake Error: The source directory "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/proj-9.3.0RC2" does not appear to contain CMakeLists.txt.
| Specify --help for usage, or press the help button on the CMake GUI.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/temp/run.do_configure.1507764:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/proj-9.3.0RC2 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yo
 cto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTING=OFF -DSQLITE3_LIBRARY:STRING=sqlite3 -DBUILD_APPS=OFF -DENABLE_CURL=ON -DBUILD_SHARED_LIBS=ON -DENABLE_TIFF=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/temp/run.do_configure.1507764, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/temp/run.do_configure.1507764, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/temp/run.do_configure.1507764, line 180
NOTE: recipe proj-9.3.0RC2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1024 tasks of which 1016 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103180413.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103180413.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_populate_lic
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: proj-9.3.0RC2-r0 do_populate_lic: QA Issue: proj: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/proj-9.3.0RC2/COPYING [license-checksum]
ERROR: proj-9.3.0RC2-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: proj-9.3.0RC2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/temp/run.do_configure.1507764', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/temp/log.do_populate_lic.1507589
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_populate_lic) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/proj/9.3.0RC2/temp/log.do_configure.1507764
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.0RC2.bb:do_configure) failed with exit code '1'

--===============1990181713059657613==--

