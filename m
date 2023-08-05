Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8845C00528
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.2163.1691221147534636305
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=QfcYi3V0;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7189AE0004
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221145;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=baVez9fItc7GwLiAwTAT0/vOxNJ79vIBWF9eVuB6+RA=;
	b=QfcYi3V07CxluZKU3eccPfZ2UA/mfrWaAQvmvw4kS2RC9DyN+9j3XIFj0/rGF9n9zt1P9p
	oFEm0Z3kI7nhAz1Dz53OQioGmKHDnG/2NYet/w/h93ACjQys1zLoYcxt/Vl8o0cP+DbK+W
	4xPgdJEnMqC+Vh0K3ANq3zRKFYDrRdXknSSAF07tZYtJ4USoc1N/DNorLUkVUFebglqXmy
	NPDzLXrQISe0d3Ct/d4wl8HyqM4w968gimAFZVmRMDGkZo+tghSrE8EzdNczctlP3HsMlx
	6wzf+Z/bbjy7IxPzI5Cx5SZf4Gwop+Uoa8E8xhIZL/NcAcK5WzPHtRvZYzcABQ==
Content-Type: multipart/mixed; boundary="===============7852374420072920075=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-paramiko: upgrading to 3.3.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104254
Message-Id: <20230805073909.A8845C00528@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:09 +0000 (UTC)

--===============7852374420072920075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-paramiko* to *3.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-paramiko-upgrade-3.2.0-3.3.1.patch
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
From f892b1ec8fb1033735cca35cfe171efeb13755b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:25:06 -0500
Subject: [PATCH] python3-paramiko: upgrade 3.2.0 -> 3.3.1

---
 .../{python3-paramiko_3.2.0.bb => python3-paramiko_3.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.2.0.bb => python3-paramiko_3.3.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
index 5420a9edc..da87e5199 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "93cdce625a8a1dc12204439d45033f3261bdb2c201648cfcdc06f9fd0f94ec29"
+SRC_URI[sha256sum] = "6a3777a961ac86dbef375c5f5b8d50014a1a96d0fd7f054a43bc880134b0ff77"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


--===============7852374420072920075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm64.txt"

Loading cache...done.
Loaded 12663 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7329 cached, 12 parsed). 12615 targets, 396 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a0bbec33031a7a45a9ba3f0558a908b6077e47c1"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux-musl"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a0bbec33031a7a45a9ba3f0558a908b6077e47c1"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a0bbec33031a7a45a9ba3f0558a908b6077e47c1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 445 Local 121 Mirrors 302 Missed 22 Current 293 (95% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 383 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 485 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_recipe_qa)
NOTE: Running task 489 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_recipe_qa)
NOTE: Running task 500 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_recipe_qa)
NOTE: recipe libsodium-1.0.18-r0: task do_recipe_qa: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_recipe_qa: Started
NOTE: recipe libsodium-1.0.18-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 567 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_fetch)
NOTE: Running task 568 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_fetch)
NOTE: Running task 569 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_fetch)
NOTE: recipe libsodium-1.0.18-r0: task do_fetch: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_fetch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_fetch: Started
NOTE: recipe libsodium-1.0.18-r0: task do_fetch: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 570 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_unpack)
NOTE: Running task 571 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_unpack)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 572 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_unpack: Started
NOTE: recipe libsodium-1.0.18-r0: task do_unpack: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_unpack: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-41.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 662 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata_setscene)
NOTE: Running task 1494 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_patch)
NOTE: Running task 1530 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_patch)
NOTE: Running task 1539 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1549 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_patch)
NOTE: Running task 1569 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1723 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_collect_spdx_deps)
NOTE: Running task 1771 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_collect_spdx_deps)
NOTE: recipe libsodium-1.0.18-r0: task do_patch: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_patch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_patch: Started
NOTE: recipe libsodium-1.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_patch: Succeeded
NOTE: Running task 1815 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1816 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1817 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1818 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_populate_lic)
NOTE: recipe libsodium-1.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_lic: Started
WARNING: Logfile for failed setscene task is /scratch1/auh/build-auh/tmp/work/cortexa57-poky-linux/python3-cryptography-vectors/41.0.2-r0/temp/log.do_packagedata_setscene.3469386
WARNING: Setscene task (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 685 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_setscene)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running task 1882 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_configure)
NOTE: Running task 1888 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_setscene: Started
NOTE: recipe libsodium-1.0.18-r0: task do_configure: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_configure: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_compile)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1929 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_install)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_install: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_install: Succeeded
NOTE: Running task 1930 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_package)
NOTE: Running task 1931 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_populate_sysroot)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package: Succeeded
NOTE: Running task 1932 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 704 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1933 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_create_spdx)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-cryptography-41.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 738 (/home/auh/Projects/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2092 of 2115 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_configure: Succeeded
NOTE: Running task 2097 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_compile)
NOTE: recipe libsodium-1.0.18-r0: task do_compile: Started
NOTE: recipe libsodium-1.0.18-r0: task do_compile: Succeeded
NOTE: Running task 2098 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_install)
NOTE: recipe libsodium-1.0.18-r0: task do_install: Started
NOTE: recipe libsodium-1.0.18-r0: task do_install: Succeeded
NOTE: Running task 2099 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_package)
NOTE: Running task 2100 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_populate_sysroot)
NOTE: recipe libsodium-1.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libsodium-1.0.18-r0: task do_package: Started
NOTE: recipe libsodium-1.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2101 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2102 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_configure)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_configure: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_compile)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_compile: Started
NOTE: recipe libsodium-1.0.18-r0: task do_package: Succeeded
NOTE: Running task 2104 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_packagedata)
NOTE: recipe libsodium-1.0.18-r0: task do_packagedata: Started
NOTE: recipe libsodium-1.0.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2105 of 2115 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_create_spdx)
NOTE: recipe libsodium-1.0.18-r0: task do_create_spdx: Started
NOTE: recipe libsodium-1.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 2106 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2107 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_install)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_install: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2108 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_package)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_packagedata)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2110 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_create_spdx)
NOTE: Running task 2111 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_package_write_rpm)
NOTE: Running task 2112 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_package_write_rpm)
NOTE: Running task 2113 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_package_qa)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_qa: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2114 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_create_runtime_spdx)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2115 of 2115 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2115 tasks of which 2067 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7852374420072920075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 12663 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7329 cached, 12 parsed). 12615 targets, 384 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a0bbec33031a7a45a9ba3f0558a908b6077e47c1"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a0bbec33031a7a45a9ba3f0558a908b6077e47c1"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a0bbec33031a7a45a9ba3f0558a908b6077e47c1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 478 Local 153 Mirrors 303 Missed 22 Current 307 (95% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 400 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 402 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 508 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_recipe_qa)
NOTE: Running task 512 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_recipe_qa)
NOTE: Running task 523 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_recipe_qa)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_recipe_qa: Started
NOTE: recipe libsodium-1.0.18-r0: task do_recipe_qa: Started
NOTE: recipe libsodium-1.0.18-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 584 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_fetch)
NOTE: Running task 585 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_fetch)
NOTE: Running task 586 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_fetch)
NOTE: recipe libsodium-1.0.18-r0: task do_fetch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_fetch: Started
NOTE: recipe libsodium-1.0.18-r0: task do_fetch: Succeeded
NOTE: Running task 587 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_unpack)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 588 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_unpack)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_unpack: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_unpack: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 699 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1553 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1611 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_patch)
NOTE: Running task 1618 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1619 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_unpack)
NOTE: Running task 1648 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsodium-1.0.18-r0: task do_patch: Started
NOTE: Running task 1816 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_patch: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_unpack: Started
NOTE: recipe libsodium-1.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1863 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_collect_spdx_deps)
NOTE: recipe libsodium-1.0.18-r0: task do_patch: Succeeded
NOTE: Running task 1903 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1904 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1905 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_populate_lic)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /scratch1/auh/build-auh/tmp/work/core2-32-poky-linux-musl/python3-cryptography-vectors/41.0.2-r0/temp/log.do_packagedata_setscene.3485143
WARNING: Setscene task (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 722 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_setscene)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsodium-1.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsodium-1.0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1959 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_patch)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running task 1970 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_configure)
NOTE: Running task 1976 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_configure)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_setscene: Started
NOTE: recipe libsodium-1.0.18-r0: task do_configure: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_configure: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1998 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2017 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_compile)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_compile: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2018 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_install)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_install: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_install: Succeeded
NOTE: Running task 2019 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_package)
NOTE: Running task 2020 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_populate_sysroot)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package: Succeeded
NOTE: Running task 2021 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 741 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2022 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_create_spdx)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 785 (/home/auh/Projects/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 785 (/home/auh/Projects/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 785 (/home/auh/Projects/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2210 of 2233 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsodium-1.0.18-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_compile)
NOTE: recipe libsodium-1.0.18-r0: task do_compile: Started
NOTE: recipe libsodium-1.0.18-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_install)
NOTE: recipe libsodium-1.0.18-r0: task do_install: Started
NOTE: recipe libsodium-1.0.18-r0: task do_install: Succeeded
NOTE: Running task 2217 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_package)
NOTE: Running task 2218 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_populate_sysroot)
NOTE: recipe libsodium-1.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libsodium-1.0.18-r0: task do_package: Started
NOTE: recipe libsodium-1.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2219 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_configure)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_configure: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_compile)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_compile: Started
NOTE: recipe libsodium-1.0.18-r0: task do_package: Succeeded
NOTE: Running task 2222 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_packagedata)
NOTE: recipe libsodium-1.0.18-r0: task do_packagedata: Started
NOTE: recipe libsodium-1.0.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2223 of 2233 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb:do_create_spdx)
NOTE: recipe libsodium-1.0.18-r0: task do_create_spdx: Started
NOTE: recipe libsodium-1.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 2224 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pynacl-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2225 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_install)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_install: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2226 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_package)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_packagedata)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2228 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_create_spdx)
NOTE: Running task 2229 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb:do_package_write_rpm)
NOTE: Running task 2230 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_package_write_rpm)
NOTE: Running task 2231 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_package_qa)
NOTE: recipe python3-pynacl-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_qa: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_qa: Succeeded
NOTE: Running task 2232 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_create_runtime_spdx)
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-pynacl-1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-paramiko-3.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2233 of 2233 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2233 tasks of which 2185 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:41.0.3-r0 to 0:41.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-41.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7852374420072920075==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-paramiko-upgrade-3.2.0-3.3.1.patch"

From f892b1ec8fb1033735cca35cfe171efeb13755b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:25:06 -0500
Subject: [PATCH] python3-paramiko: upgrade 3.2.0 -> 3.3.1

---
 .../{python3-paramiko_3.2.0.bb => python3-paramiko_3.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.2.0.bb => python3-paramiko_3.3.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
index 5420a9edc..da87e5199 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "93cdce625a8a1dc12204439d45033f3261bdb2c201648cfcdc06f9fd0f94ec29"
+SRC_URI[sha256sum] = "6a3777a961ac86dbef375c5f5b8d50014a1a96d0fd7f054a43bc880134b0ff77"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


--===============7852374420072920075==--

