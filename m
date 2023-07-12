Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D91C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.981.1689139838195363011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=BkyizWdI;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 395511C0006
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139836;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=cUJxi4P5Sys6gRjJe5ymBcNle/Vof/wkVgvr5WnYeWw=;
	b=BkyizWdIeVwjT9sinH85hNas0Sk7AdliGB5cYJg5xME7p4GKxuFH9PY86EOlyW0hmWdmzb
	6GarfVma1c9or8QI29+XN7hCPWNy69QFAfF6aIcmNMN52m8z3xoMC/c73GUmUIwSd3b7gL
	+wphXSyRwqm3ThzS1yzktfD99RNq8ApChxedArW8QgXNGAksilbDtjUmNaswxU4gnReLYQ
	8ndqLYf7Q+tvMysAKu4aB9gWdXItmeLhaGu1izhbvqH2qAID2d61m/T8EZpw7ydnVMQ+Vi
	ka+eVR56qeXxB4hKag5yRXK2LDf/aR25Nz7ZWBmyzz6AL2pE9pJqTC/6ykzDUA==
Content-Type: multipart/mixed; boundary="===============2382182242854848939=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-google-api-python-client: upgrading to 2.93.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103767
Message-Id: <20230712053040.76D91C001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:40 +0000 (UTC)

--===============2382182242854848939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-google-api-python-client* to *2.93.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-google-api-python-client-upgrade-2.92.0-2.93.patch
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
From e4f886e815e6bbccb9f81d864a5543589f6feb23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:58:38 -0500
Subject: [PATCH] python3-google-api-python-client: upgrade 2.92.0 -> 2.93.0

---
 ...ent_2.92.0.bb => python3-google-api-python-client_2.93.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.92.0.bb => python3-google-api-python-client_2.93.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.92.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.92.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb
index 4d617ecc7..14a3b4fbe 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.92.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f38a6e106a7417719715506d36f0a233ec253335e422bda311352866a86c4187"
+SRC_URI[sha256sum] = "62ee28e96031a10a1c341f226a75ac6a4f16bdb1d888dc8222b2cdca133d0031"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============2382182242854848939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm64.txt"

Loading cache...done.
Loaded 12651 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 381 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:5196beb64c0ab442ad2f408c990855114191c889"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:5196beb64c0ab442ad2f408c990855114191c889"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:5196beb64c0ab442ad2f408c990855114191c889"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 294 Local 26 Mirrors 226 Missed 42 Current 153 (85% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 162 of 447 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 170 of 447 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 173 of 447 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 176 of 447 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 188 of 447 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 447 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-grpcio-1.56.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe protobuf-3.21.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe protobuf-3.21.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1018 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_fetch)
NOTE: Running task 1035 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_fetch)
NOTE: Running task 1095 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_fetch)
NOTE: Running task 1114 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_fetch)
NOTE: Running task 1115 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_fetch)
NOTE: Running task 1136 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_fetch)
NOTE: Running task 1248 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_fetch)
NOTE: Running task 1250 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_fetch)
NOTE: Running task 1251 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1252 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_fetch)
NOTE: Running task 1253 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_fetch)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_fetch: Started
NOTE: recipe protobuf-3.21.12-r0: task do_fetch: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_fetch: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_fetch: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_fetch: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_fetch: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_fetch: Succeeded
NOTE: Running task 1418 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_unpack)
NOTE: Running task 1419 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-protobuf-4.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_unpack)
NOTE: Running task 1421 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_fetch: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_fetch: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: Running task 1422 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_unpack)
NOTE: Running task 1423 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_unpack)
NOTE: Running task 1424 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_unpack)
NOTE: Running task 1425 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe protobuf-3.21.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-grpcio-1.56.0-r0: task do_fetch: Started
NOTE: Running task 1426 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1427 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_unpack)
NOTE: Running task 1428 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 1429 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_unpack)
NOTE: Running task 1430 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_unpack)
NOTE: Running task 1431 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_unpack)
NOTE: Running task 1433 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1435 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_unpack: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_unpack: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_patch)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1437 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1438 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_unpack)
NOTE: Running task 1439 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_unpack: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_unpack: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_unpack: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1440 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_patch)
NOTE: Running task 1441 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_collect_spdx_deps)
NOTE: recipe protobuf-3.21.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_unpack: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_unpack: Started
NOTE: recipe protobuf-3.21.12-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1442 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_patch)
NOTE: Running task 1443 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_patch)
NOTE: Running task 1444 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_unpack: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_patch: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_unpack: Succeeded
NOTE: Running task 1445 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_patch)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: Running task 1446 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_patch)
NOTE: Running task 1447 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_patch: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_patch: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1448 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_patch)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_patch: Started
NOTE: Running task 1449 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_patch: Started
NOTE: Running task 1450 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_patch)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_patch: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_patch: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe protobuf-3.21.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_configure)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_patch: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_patch: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-protobuf-4.23.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_patch: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_patch: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1455 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: Running task 1457 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_configure)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_configure: Started
NOTE: Running task 1459 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_configure: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1460 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_compile)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_configure: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1461 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_compile)
NOTE: Running task 1462 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_configure)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_compile: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_compile: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_patch: Succeeded
NOTE: Running task 1465 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_configure)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_patch: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1466 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: Running task 1467 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_populate_lic)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1468 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_configure: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_lic: Started
NOTE: Running task 1469 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_patch)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1470 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_configure)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1471 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_configure: Succeeded
NOTE: Running task 1472 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_compile)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_patch: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_configure: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1473 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_compile)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_compile: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1474 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_compile)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1475 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_configure)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_compile: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_configure: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1476 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_configure)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_configure: Succeeded
NOTE: recipe python3-grpcio-1.56.0-r0: task do_patch: Succeeded
NOTE: Running task 1478 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_compile)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_configure: Started
NOTE: recipe protobuf-3.21.12-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_patch)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_compile: Started
NOTE: Running task 1480 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_compile)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_install)
NOTE: recipe protobuf-3.21.12-r0: task do_patch: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_compile: Started
NOTE: recipe protobuf-3.21.12-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_compile: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1482 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_generate_toolchain_file)
NOTE: Running task 1484 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1485 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_install)
NOTE: Running task 1486 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_install)
NOTE: Running task 1487 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1488 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_install)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_install)
NOTE: recipe protobuf-3.21.12-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_install: Started
NOTE: recipe protobuf-3.21.12-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_install: Started
NOTE: Running task 1490 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_configure)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_install: Started
NOTE: Running task 1491 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_install)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_install: Started
NOTE: recipe protobuf-3.21.12-r0: task do_configure: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_install: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_install: Succeeded
NOTE: Running task 1495 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_package)
NOTE: Running task 1496 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_package)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_package)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_install: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_package: Started
NOTE: Running task 1498 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_package: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_package: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_package: Started
NOTE: Running task 1499 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_package)
NOTE: recipe protobuf-3.21.12-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_configure_ptest_base)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package: Started
NOTE: recipe protobuf-3.21.12-r0: task do_configure_ptest_base: Started
NOTE: recipe protobuf-3.21.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1501 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_compile)
NOTE: recipe protobuf-3.21.12-r0: task do_compile: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_install)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_install: Started
NOTE: Running task 1503 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_packagedata)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: Running task 1505 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_packagedata)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1542 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_packagedata: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_package: Succeeded
NOTE: Running task 1507 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_packagedata)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package: Succeeded
NOTE: Running task 1508 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_packagedata: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_package: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_package)
NOTE: Running task 1510 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_packagedata)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package: Started
NOTE: Running task 1511 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_create_spdx)
NOTE: Running task 1512 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_create_spdx)
NOTE: Running task 1513 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_create_spdx)
NOTE: Running task 1514 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_package_write_rpm)
NOTE: Running task 1515 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_package_write_rpm)
NOTE: Running task 1516 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_populate_sysroot)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_create_spdx: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_packagedata: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_create_spdx: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package: Succeeded
NOTE: Running task 1517 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_packagedata)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_packagedata: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1518 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_create_spdx)
NOTE: Running task 1519 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_package_write_rpm)
NOTE: Running task 1520 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_package_qa)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_spdx: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_qa: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1521 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe protobuf-3.21.12-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_compile_ptest_base)
NOTE: recipe protobuf-3.21.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe protobuf-3.21.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1523 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_install)
NOTE: recipe protobuf-3.21.12-r0: task do_install: Started
NOTE: recipe protobuf-3.21.12-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_install_ptest_base)
NOTE: recipe protobuf-3.21.12-r0: task do_install_ptest_base: Started
NOTE: recipe protobuf-3.21.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1525 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_populate_sysroot)
NOTE: Running task 1526 of 1542 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_package)
NOTE: recipe protobuf-3.21.12-r0: task do_populate_sysroot: Started
NOTE: recipe protobuf-3.21.12-r0: task do_package: Started
NOTE: recipe protobuf-3.21.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1527 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_configure)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_configure: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_compile)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_compile: Started
NOTE: recipe protobuf-3.21.12-r0: task do_package: Succeeded
NOTE: Running setscene task 443 of 447 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_packagedata_setscene)
NOTE: recipe protobuf-3.21.12-r0: task do_packagedata_setscene: Started
NOTE: recipe protobuf-3.21.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-protobuf-4.23.3-r0: task do_compile: Succeeded
NOTE: Running task 1531 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_install)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_install: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_install: Succeeded
NOTE: Running task 1532 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_package)
NOTE: Running task 1533 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_populate_sysroot)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_package: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1534 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1535 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_configure)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_configure: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_compile)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_compile: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1542 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_packagedata)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_packagedata: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_packagedata: Failed
NOTE: recipe python3-grpcio-1.56.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1537 tasks of which 1413 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-src went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-dbg went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-staticdev went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-dev went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-doc went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-locale went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/cortexa57-poky-linux/python3-protobuf/4.23.3-r0/temp/log.do_packagedata.742479
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_packagedata) failed with exit code '1'

--===============2382182242854848939==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-google-api-python-client-upgrade-2.92.0-2.93.patch"

From e4f886e815e6bbccb9f81d864a5543589f6feb23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:58:38 -0500
Subject: [PATCH] python3-google-api-python-client: upgrade 2.92.0 -> 2.93.0

---
 ...ent_2.92.0.bb => python3-google-api-python-client_2.93.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.92.0.bb => python3-google-api-python-client_2.93.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.92.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.92.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb
index 4d617ecc7..14a3b4fbe 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.92.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f38a6e106a7417719715506d36f0a233ec253335e422bda311352866a86c4187"
+SRC_URI[sha256sum] = "62ee28e96031a10a1c341f226a75ac6a4f16bdb1d888dc8222b2cdca133d0031"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============2382182242854848939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 12648 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12564 targets, 369 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:5196beb64c0ab442ad2f408c990855114191c889"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:5196beb64c0ab442ad2f408c990855114191c889"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:5196beb64c0ab442ad2f408c990855114191c889"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 291 Local 19 Mirrors 235 Missed 37 Current 154 (87% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 163 of 445 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 171 of 445 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 174 of 445 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 177 of 445 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 189 of 445 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 445 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 445 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata_setscene)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Started
NOTE: recipe protobuf-3.21.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe protobuf-3.21.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1032 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_fetch)
NOTE: Running task 1049 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_fetch)
NOTE: Running task 1107 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_fetch)
NOTE: Running task 1126 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_fetch)
NOTE: Running task 1127 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_fetch)
NOTE: Running task 1148 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_fetch)
NOTE: Running task 1258 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_fetch)
NOTE: Running task 1259 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_fetch)
NOTE: Running task 1260 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_fetch)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_fetch: Started
NOTE: recipe protobuf-3.21.12-r0: task do_fetch: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_fetch: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_fetch: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_fetch: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-protobuf-4.23.3-r0: task do_fetch: Started
NOTE: Running task 1420 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_unpack)
NOTE: Running task 1421 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1422 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_unpack)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1423 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_unpack)
NOTE: Running task 1424 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe protobuf-3.21.12-r0: task do_fetch: Succeeded
NOTE: Running task 1425 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_unpack)
NOTE: Running task 1426 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_unpack)
NOTE: Running task 1427 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_fetch: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_fetch: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_fetch: Started
NOTE: Running task 1428 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_unpack)
NOTE: Running task 1429 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1430 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_fetch: Succeeded
NOTE: Running task 1431 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_unpack)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 1432 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1433 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_unpack)
NOTE: Running task 1434 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_unpack)
NOTE: Running task 1435 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_unpack: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_unpack: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_unpack: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_unpack: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_patch)
NOTE: Running task 1437 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-protobuf-4.23.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_unpack: Started
NOTE: Running task 1438 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_patch)
NOTE: recipe python3-pyparsing-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1439 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_patch)
NOTE: Running task 1440 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_unpack: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe protobuf-3.21.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe protobuf-3.21.12-r0: task do_unpack: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_unpack: Succeeded
NOTE: Running task 1451 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_patch)
NOTE: Running task 1452 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_unpack: Started
NOTE: Running task 1453 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_patch)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_unpack: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_patch: Started
NOTE: Running task 1454 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_patch)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_patch: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_patch: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_patch: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_patch: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_patch: Started
NOTE: Running task 1455 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_patch: Started
NOTE: recipe protobuf-3.21.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_unpack: Succeeded
NOTE: Running task 1456 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_patch)
NOTE: Running task 1457 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-protobuf-4.23.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1458 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_patch: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_patch: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_patch: Succeeded
NOTE: Running task 1461 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_configure)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_patch: Succeeded
NOTE: Running task 1462 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1464 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_configure)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_patch: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1466 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_configure)
NOTE: Running task 1467 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_populate_lic)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_configure: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_configure: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_configure: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_lic: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 1468 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_patch)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_patch: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_configure: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_compile)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_compile)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1471 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_compile)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1472 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_configure)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1473 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_configure)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1474 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_configure)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_compile: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_compile: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_compile: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_configure: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_configure: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_configure_ptest_base)
NOTE: Running task 1476 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_compile)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_configure: Succeeded
NOTE: Running task 1477 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_compile)
NOTE: recipe protobuf-3.21.12-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_patch)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_compile: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_compile: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_patch: Succeeded
NOTE: recipe protobuf-3.21.12-r0: task do_patch: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1480 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_compile)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile: Started
NOTE: recipe protobuf-3.21.12-r0: task do_patch: Succeeded
NOTE: Running task 1481 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_generate_toolchain_file)
NOTE: recipe protobuf-3.21.12-r0: task do_generate_toolchain_file: Started
NOTE: recipe protobuf-3.21.12-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1483 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_configure)
NOTE: recipe protobuf-3.21.12-r0: task do_configure: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_compile: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1484 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_install)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_compile: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile: Succeeded
NOTE: recipe protobuf-3.21.12-r0: task do_configure: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1485 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_configure_ptest_base)
NOTE: Running task 1486 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1487 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_install)
NOTE: Running task 1488 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_install)
NOTE: Running task 1489 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_install)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_install: Started
NOTE: recipe protobuf-3.21.12-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_install: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_install: Started
NOTE: recipe protobuf-3.21.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-google-auth-2.21.0-r0: task do_install: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1490 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_compile)
NOTE: Running task 1491 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_install)
NOTE: recipe protobuf-3.21.12-r0: task do_compile: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_package)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_package)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_install: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_package)
NOTE: Running task 1495 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_package)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install: Succeeded
NOTE: Running task 1496 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_package: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_package: Started
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_package: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1497 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_package)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_install)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_install: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package: Succeeded
NOTE: Running task 1499 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_packagedata)
NOTE: recipe python3-httplib2-0.22.0-r0: task do_packagedata: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_package: Succeeded
NOTE: Running task 1500 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_packagedata)
NOTE: recipe python3-google-auth-2.21.0-r0: task do_package: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_packagedata: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_install: Succeeded
NOTE: Running task 1501 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb:do_packagedata)
NOTE: Running task 1502 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_package)
NOTE: Running task 1503 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_populate_sysroot)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_package: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb:do_packagedata)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_packagedata: Started
NOTE: Running task 1505 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_create_spdx)
NOTE: Running task 1506 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_packagedata)
NOTE: Running task 1507 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb:do_package_write_rpm)
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_packagedata: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-httplib2-0.22.0-r0: task do_create_spdx: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-google-auth-2.21.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-googleapis-common-protos-1.59.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1508 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb:do_create_spdx)
NOTE: Running task 1509 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_create_spdx)
NOTE: Running task 1510 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_create_spdx: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-google-api-core-2.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-httplib2-0.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-uritemplate-4.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_packagedata)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_packagedata: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1512 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_create_spdx)
NOTE: Running task 1513 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_package_write_rpm)
NOTE: Running task 1514 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_package_qa)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_spdx: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_qa: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1515 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_2.93.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-google-api-python-client-2.93.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe protobuf-3.21.12-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_compile_ptest_base)
NOTE: recipe protobuf-3.21.12-r0: task do_compile_ptest_base: Started
NOTE: recipe protobuf-3.21.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1517 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_install)
NOTE: recipe protobuf-3.21.12-r0: task do_install: Started
NOTE: recipe protobuf-3.21.12-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_install_ptest_base)
NOTE: recipe protobuf-3.21.12-r0: task do_install_ptest_base: Started
NOTE: recipe protobuf-3.21.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1519 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_populate_sysroot)
NOTE: Running task 1520 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_package)
NOTE: recipe protobuf-3.21.12-r0: task do_populate_sysroot: Started
NOTE: recipe protobuf-3.21.12-r0: task do_package: Started
NOTE: recipe protobuf-3.21.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1521 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1522 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_configure)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_configure: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_compile)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_compile: Started
NOTE: recipe protobuf-3.21.12-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1536 (/home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb:do_packagedata)
NOTE: recipe protobuf-3.21.12-r0: task do_packagedata: Started
NOTE: recipe protobuf-3.21.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-protobuf-4.23.3-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_install)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_install: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_install: Succeeded
NOTE: Running task 1526 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_package)
NOTE: Running task 1527 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_populate_sysroot)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_package: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1528 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_configure)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_configure: Started
NOTE: recipe python3-grpcio-1.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1530 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb:do_compile)
NOTE: recipe python3-grpcio-1.56.0-r0: task do_compile: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1536 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_packagedata)
NOTE: recipe python3-protobuf-4.23.3-r0: task do_packagedata: Started
NOTE: recipe python3-protobuf-4.23.3-r0: task do_packagedata: Failed
NOTE: recipe python3-grpcio-1.56.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1531 tasks of which 1425 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-src went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-dbg went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-staticdev went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-dev went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-doc went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf-locale went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: QA Issue: Package version for package python3-protobuf went backwards which would break package feeds (from 0:4.23.4-r0 to 0:4.23.3-r0) [version-going-backwards]
ERROR: python3-protobuf-4.23.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-32-poky-linux-musl/python3-protobuf/4.23.3-r0/temp/log.do_packagedata.759761
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb:do_packagedata) failed with exit code '1'

--===============2382182242854848939==--

