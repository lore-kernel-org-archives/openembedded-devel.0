Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B14C41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2203.1699061894630771382
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JIFbLBbI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dz4k2iQW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b97fb1c61-f48710e8-667a-4f4b-9ddf-ec56d24f7263-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Sgwd4kVAUn+efoYZ8hWu2u4sqBt+DoJ4NQHPhHRhBKs=;
	b=JIFbLBbIm/Nd8nMkwp1xfIR65Hft8llSRAm8j7fIyv2LOz4Mdk8cbQ9mvLIjAn3y
	uP6URj7TF/jD2xbuD/MUzDT+/o0ZLL5SF3+i9aQcypjEGc6R2G14o/gVWVJuAngHLbc
	n+GSZ14WHYRgl0AuefMyX0WeQeUQSk3aSknDVVcs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Sgwd4kVAUn+efoYZ8hWu2u4sqBt+DoJ4NQHPhHRhBKs=;
	b=dz4k2iQWoKEyE3WTWnRsNhF6o8hn/s3ICh1EBz+KqgduFGNSJXoSkay8wzW2Q+3Z
	uel2slFh84bBUZfMmECTLKRr8hlHFTv3A+nZamfCHZlGq5tJpwcNtvq0nkAbnR0DKjO
	aXO2o70nM5/8FiDQMKvHSnhem0MFgzIKEikcSzN0=
Content-Type: multipart/mixed; boundary="===============2542733973001566327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-web3: upgrading to 6.11.2 SUCCEEDED
Message-ID: <0101018b97fb1c61-f48710e8-667a-4f4b-9ddf-ec56d24f7263-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106177

--===============2542733973001566327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-web3* to *6.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-web3-upgrade-6.11.1-6.11.2.patch
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
From dcc3d7f6ef1d3315727632cd1b3553aacc20f0f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:10:48 +0000
Subject: [PATCH] python3-web3: upgrade 6.11.1 -> 6.11.2

---
 .../python/{python3-web3_6.11.1.bb => python3-web3_6.11.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.11.1.bb => python3-web3_6.11.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.11.1.bb b/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.11.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.11.2.bb
index aabea69a3..8cc5dd728 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "d301d7120922d5b9e5c9535ef9780012ea25ea4011c2b177490ba7d3ef886b92"
+SRC_URI[sha256sum] = "77340b9a8109835a680950e09f21ae77e41ea38076215ab8be2ba4bee7b8034a"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============2542733973001566327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-web3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/web3/web3-6.11.1.tar.gz;downloadfilename=web3-6.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/web3/web3-6.11.2.tar.gz;downloadfilename=web3-6.11.2.tar.gz"
packages/core2-64-poky-linux/python3-web3: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
packages/core2-64-poky-linux/python3-web3/python3-web3-dbg: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3/python3-web3-dbg: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
packages/core2-64-poky-linux/python3-web3/python3-web3-dev: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3/python3-web3-dev: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
packages/core2-64-poky-linux/python3-web3/python3-web3-doc: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3/python3-web3-doc: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
packages/core2-64-poky-linux/python3-web3/python3-web3-locale: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3/python3-web3-locale: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
packages/core2-64-poky-linux/python3-web3/python3-web3-src: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3/python3-web3-src: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
packages/core2-64-poky-linux/python3-web3/python3-web3-staticdev: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3/python3-web3-staticdev: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
packages/core2-64-poky-linux/python3-web3/python3-web3: PKGSIZE changed from 8477973 to 8477441 (-0%)
packages/core2-64-poky-linux/python3-web3/python3-web3: PV changed from "6.11.1" to "6.11.2"
packages/core2-64-poky-linux/python3-web3/python3-web3: PKGV changed from 6.11.1 [default] to 6.11.2 [default]
Changes to packages/core2-64-poky-linux/python3-web3 (sysroot):
  /usr/lib/python3.11/site-packages/web3-6.11.1.dist-info moved to /usr/lib/python3.11/site-packages/web3-6.11.2.dist-info

--===============2542733973001566327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4970 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 33 recipes from the core2-64 sysroot...done.
Removing 101 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
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
meta-webserver       = "tmp-auh-upgrades:7dce3e8dd18449edc7871667b380059415c3d2e3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 811 Local 802 Mirrors 0 Missed 9 Current 197 (98% match, 99% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 199 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 200 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-bitarray_2.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cytoolz_0.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-abi_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 210 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 211 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-hexbytes_0.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 214 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 215 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-bitarray-2.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-eth-abi-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cytoolz-0.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-eth-keyfile-0.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-eth-rlp-0.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hexbytes-0.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 219 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 220 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 221 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 226 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-eth-keyfile-0.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-bitarray-2.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-eth-rlp-0.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 230 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cytoolz-0.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 242 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 243 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 245 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 246 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 247 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-eth-abi-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hexbytes-0.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 260 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-idna_3.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 261 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb:do_packagedata_setscene)
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-googleapis-common-protos-1.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-auth-2.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-grpcio-1.56.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-websockets-11.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-websockets-11.0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-websockets-11.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-websockets-11.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-web3-6.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 262 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-websockets-11.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 264 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb:do_packagedata_setscene)
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/python3-google-auth/2.23.3/temp/log.do_packagedata_setscene.68295
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/python3-eth-account/0.9.0/temp/log.do_packagedata_setscene.68289
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 267 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb:do_package_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-googleapis-common-protos-1.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-websockets-11.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-websockets-11.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-websockets-11.0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-grpcio-1.56.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-aiohttp-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-async-timeout-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-aiosignal-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cchardet-2.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-charset-normalizer-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-async-timeout-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-aiosignal-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-charset-normalizer-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cchardet-2.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-google-api-core-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_package_setscene)
NOTE: Running setscene task 293 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-yarl_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 302 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 303 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 306 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 307 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-idna-ssl-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-protobuf-4.24.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-websockets-11.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-multidict-6.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-yarl-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 308 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 310 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 311 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 312 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 314 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene)
NOTE: recipe python3-websockets-11.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe python3-lru-dict-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-yarl-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-multidict-6.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-ssl-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata_setscene)
NOTE: recipe python3-web3-6.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_package_setscene)
NOTE: Running setscene task 334 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-protobuf-4.24.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe protobuf-4.23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 341 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 342 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 346 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 347 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-zipp_3.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 364 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-google-auth-2.23.3-r0: task do_package_setscene: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_package_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe protobuf-4.23.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 376 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-zipp-3.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe abseil-cpp-20230802.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 398 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 399 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 423 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 509 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 542 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-google-auth-2.23.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 544 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-urllib3-2.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-google-auth-2.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 609 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-google-auth-2.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 610 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 611 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-web3-6.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 622 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 607 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 633 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 795 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 819 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 822 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 853 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 866 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 892 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 895 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 901 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 960 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 965 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 974 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 979 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 994 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1008 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2470 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_packagedata)
NOTE: Running task 2775 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-google-auth_2.23.3.bb:do_packagedata)
NOTE: Running task 2789 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-eth-account-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-google-auth-2.23.3-r0: task do_packagedata: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2831 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_create_spdx)
NOTE: Running task 2832 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_package_write_ipk)
NOTE: Running task 2833 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_package_write_deb)
NOTE: Running task 2834 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb:do_package_write_rpm)
NOTE: Running task 2835 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_package_write_ipk)
NOTE: recipe python3-google-auth-2.23.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2839 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_package_write_deb)
NOTE: Running task 2840 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_package_write_rpm)
NOTE: Running task 2841 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_package_qa)
NOTE: recipe python3-eth-account-0.9.0-r0: task do_create_spdx: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_package_qa: Started
NOTE: recipe python3-eth-account-0.9.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2842 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_create_runtime_spdx)
NOTE: recipe python3-web3-6.11.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-web3-6.11.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-eth-account-0.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-web3-6.11.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-web3-6.11.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-web3-6.11.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-web3-6.11.2-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2843 of 2843 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2843 tasks of which 2828 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-google-auth-src went backwards which would break package feeds (from 0:2.23.4-r0 to 0:2.23.3-r0) [version-going-backwards]
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-eth-account-src went backwards which would break package feeds (from 0:0.10.0-r0 to 0:0.9.0-r0) [version-going-backwards]
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-google-auth-dbg went backwards which would break package feeds (from 0:2.23.4-r0 to 0:2.23.3-r0) [version-going-backwards]
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-eth-account-dbg went backwards which would break package feeds (from 0:0.10.0-r0 to 0:0.9.0-r0) [version-going-backwards]
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-google-auth-staticdev went backwards which would break package feeds (from 0:2.23.4-r0 to 0:2.23.3-r0) [version-going-backwards]
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-eth-account-staticdev went backwards which would break package feeds (from 0:0.10.0-r0 to 0:0.9.0-r0) [version-going-backwards]
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-google-auth-dev went backwards which would break package feeds (from 0:2.23.4-r0 to 0:2.23.3-r0) [version-going-backwards]
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-eth-account-dev went backwards which would break package feeds (from 0:0.10.0-r0 to 0:0.9.0-r0) [version-going-backwards]
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-google-auth-doc went backwards which would break package feeds (from 0:2.23.4-r0 to 0:2.23.3-r0) [version-going-backwards]
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-eth-account-doc went backwards which would break package feeds (from 0:0.10.0-r0 to 0:0.9.0-r0) [version-going-backwards]
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-google-auth-locale went backwards which would break package feeds (from 0:2.23.4-r0 to 0:2.23.3-r0) [version-going-backwards]
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-eth-account-locale went backwards which would break package feeds (from 0:0.10.0-r0 to 0:0.9.0-r0) [version-going-backwards]
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-google-auth went backwards which would break package feeds (from 0:2.23.4-r0 to 0:2.23.3-r0) [version-going-backwards]
ERROR: python3-google-auth-2.23.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-eth-account went backwards which would break package feeds (from 0:0.10.0-r0 to 0:0.9.0-r0) [version-going-backwards]
ERROR: python3-eth-account-0.9.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2542733973001566327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-web3 (sysroot):
  /usr/lib/python3.11/site-packages/web3-6.11.1.dist-info moved to /usr/lib/python3.11/site-packages/web3-6.11.2.dist-info

--===============2542733973001566327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-web3-upgrade-6.11.1-6.11.2.patch"

RnJvbSBkY2MzZDdmNmVmMWQzMzE1NzI3NjMyY2QxYjM1NTNhYWNjMjBmMGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMToxMDo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2ViMzogdXBncmFkZSA2LjExLjEgLT4gNi4xMS4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtd2ViM182LjExLjEuYmIgPT4gcHl0aG9uMy13ZWIzXzYuMTEuMi5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdlYjNfNi4xMS4xLmJi
ID0+IHB5dGhvbjMtd2ViM182LjExLjIuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWIzXzYuMTEuMS5iYiBiL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViM182LjExLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWIzXzYuMTEuMS5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWIzXzYuMTEuMi5iYgppbmRleCBhYWJlYTY5
YTMuLjhjYzVkZDcyOCAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWIzXzYuMTEuMS5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXdlYjNfNi4xMS4yLmJiCkBAIC00LDcgKzQsNyBAQCBTRUNU
SU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9MzczZmVkZTM1MDg0NmZkZmZkMjM2NDhmYmE1MDQ2MzUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMzAxZDcxMjA5MjJkNWI5ZTVjOTUzNWVmOTc4MDAxMmVh
MjVlYTQwMTFjMmIxNzc0OTBiYTdkM2VmODg2YjkyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3
MzQwYjlhODEwOTgzNWE2ODA5NTBlMDlmMjFhZTc3ZTQxZWEzODA3NjIxNWFiOGJlMmJhNGJlZTdi
ODAzNGEiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============2542733973001566327==--

