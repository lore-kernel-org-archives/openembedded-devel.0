Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A00BC072A4
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.3554.1699067574367725296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GfYzLr1H;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GGwnNThS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b9851b59c-0c9014da-9264-4956-96a5-5cdda3a2a839-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SE/tyStD3LQ5Pazn3cqfV/utLZY5izJzB0ieT8FgQbU=;
	b=GfYzLr1HecTBdvBcqusBLJBSc6buW7t4V738t6DPVYonCpDX/TAPQp16yqfeWafw
	VimbjF5GStzU1+kmQXd0bgMYH28U+ZkkaTNO3Zl5Rx0Fi2ypXh5Bqvys8j8kBRhSJwK
	wxsB5CahZEmdIN5+VsPsWZasvjusF5jvyX6qCuvk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SE/tyStD3LQ5Pazn3cqfV/utLZY5izJzB0ieT8FgQbU=;
	b=GGwnNThSRL/2VKPflsBV5sIgEG0kfJMTXhqZ5j7z6cZ990tpiDHwQCA3kfSNIBVX
	WTB7Gow1ICpqWcLjbhIwCU0pVm+Oe20w5nb0IrCYq+JX+rozwFzmp0knvQtaVmlhEfk
	uOWofEsHkd0QP2N/rOsdEf6yOP44dxRHvgJ4niwM=
Content-Type: multipart/mixed; boundary="===============5037990378409653923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] iscsi-initiator-utils: upgrading to 2.1.9 FAILED
Message-ID: <0101018b9851b59c-0c9014da-9264-4956-96a5-5cdda3a2a839-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106201

--===============5037990378409653923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iscsi-initiator-utils* to *2.1.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-iscsi-initiator-utils-upgrade-2.1.8-2.1.9.patch
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
From 20262ca715994aa635390e9a0168b462ad1bab14 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:15:28 +0000
Subject: [PATCH] iscsi-initiator-utils: upgrade 2.1.8 -> 2.1.9

---
 ...-initiator-utils_2.1.8.bb => iscsi-initiator-utils_2.1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.8.bb => iscsi-initiator-utils_2.1.9.bb} (98%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
similarity index 98%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
index 2caddbb54..18ab16bc2 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "543ba0f15d340b97f30782308cec424a6738fec3"
+SRCREV = "678c3e9232b2b7177b7131071910da14f065e037"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://0001-Makefile-Do-not-set-Werror.patch \
-- 
2.39.2


--===============5037990378409653923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-dbg: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-dbg: PKGV changed from 2.1.8 [default] to 2.1.9 [default]
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-dbg: PKGSIZE changed from 4494440 to 4498432 (+0%)
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-dev: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-dev: PKGV changed from 2.1.8 [default] to 2.1.9 [default]
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-doc: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-doc: PKGV changed from 2.1.8 [default] to 2.1.9 [default]
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-doc: PKGSIZE changed from 24353 to 24078 (-1%)
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-locale: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-locale: PKGV changed from 2.1.8 [default] to 2.1.9 [default]
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-src: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-src: PKGV changed from 2.1.8 [default] to 2.1.9 [default]
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-src: PKGSIZE changed from 1305776 to 1305504 (-0%)
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-staticdev: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils-staticdev: PKGV changed from 2.1.8 [default] to 2.1.9 [default]
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils: PKGV changed from 2.1.8 [default] to 2.1.9 [default]
packages/core2-64-poky-linux/iscsi-initiator-utils/iscsi-initiator-utils: PKGSIZE changed from 1335789 to 1335705 (-0%)
packages/core2-64-poky-linux/iscsi-initiator-utils: PV changed from "2.1.8" to "2.1.9"
packages/core2-64-poky-linux/iscsi-initiator-utils: PKGV changed from 2.1.8 [default] to 2.1.9 [default]

--===============5037990378409653923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4886 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 49 recipes from the core2-64 sysroot...done.
Removing 49 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:89ea613bdebce704f785ee5e8100a825108b9040"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 276 Local 267 Mirrors 0 Missed 9 Current 145 (96% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 154 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_populate_lic_setscene)
NOTE: Running setscene task 156 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 157 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-support/open-isns/open-isns_0.102.bb:do_create_spdx_setscene)
NOTE: Running setscene task 158 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-support/open-isns/open-isns_0.102.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 160 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 161 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 168 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: Running setscene task 169 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe open-isns-0.102-r0: task do_create_spdx_setscene: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_populate_lic_setscene: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe open-isns-0.102-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe open-isns-0.102-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 253 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-support/open-isns/open-isns_0.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 255 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 256 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 258 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_recipe_qa_setscene)
NOTE: recipe open-isns-0.102-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe open-isns-0.102-r0: task do_packagedata_setscene: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 262 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 287 of 1199 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe open-isns-0.102-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 275 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-support/open-isns/open-isns_0.102.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 276 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 281 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe open-isns-0.102-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_fetch: Succeeded
NOTE: Running task 288 of 1199 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_unpack)
NOTE: recipe open-isns-0.102-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 295 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 304 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 308 of 421 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 328 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 738 of 1199 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 342 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 347 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 348 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 378 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 401 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 402 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 407 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 421 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 421 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 421 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1159 of 1199 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1186 of 1199 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_collect_spdx_deps)
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1187 of 1199 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_configure)
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_configure: Started
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_configure: Succeeded
NOTE: Running task 1188 of 1199 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_compile)
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-musl', 'x86_64-linux', 'bit-64', 'x86_64-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52 OS=x86_64-poky-linux-musl TARGET=linux-musl BASE=/usr MANDIR=/usr/share/man OPTFLAGS=-DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/
 build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  PKG_CONFIG=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native/usr/bin/pkg-config SED=sed -C /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git -j 16 -l 52 OS=x86_64-poky-linux-musl TARGET=linux-musl BASE=/usr MANDIR=/usr/share/man OPTFLAGS=-DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1
 .9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/c
 ore2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  PKG_CONFIG=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native/usr/bin/pkg-config SED=sed user
| make: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git'
| ***
| *** Warning: using 'make' is being deprecated, in favor of 'meson'
| ***    Please see the README file for more information.
| ***
| make -j16 -l52 --jobserver-auth=fifo:/tmp/GMfifo471074 -C libopeniscsiusr
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git/libopeniscsiusr'
| make[1]: warning: -j16 forced in submake: resetting jobserver mode.
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o context.o context.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o misc.o misc.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o session.o session.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o sysfs.o sysfs.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o iface.o iface.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o idbm.o idbm.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o node.o node.c
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\"   -c -o default.o default.c
| /usr/bin/install -v -m 644 -D docs/libopeniscsiusr.h.3 docs/man/libopeniscsiusr.h.3
| /usr/bin/install: creating directory 'docs/man'
| 'docs/libopeniscsiusr.h.3' -> 'docs/man/libopeniscsiusr.h.3'
| generating library man pages ...
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\" -shared -Wl,-soname=libopeniscsiusr.so.0.2.0 -o libopeniscsiusr.so.0.2.0 context.o misc.o session.o sysfs.o iface.o idbm.o node.o default.o -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta
 -oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wl,-z,relro,-z,now -lkmod
| ln -sf libopeniscsiusr.so.0.2.0 libopeniscsiusr.so
| ln -sf libopeniscsiusr.so.0.2.0 libopeniscsiusr.so.0
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\" -I../libopeniscsiusr -g  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-ut
 ils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-
 utils/2.1.9/recipe-sysroot-native=  -Wl,-z,relro,-z,now -lkmod  -L../libopeniscsiusr -lopeniscsiusr  tests/test_context.c libopeniscsiusr.so.0.2.0   -o tests/test_context
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\" -I../libopeniscsiusr -g  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-ut
 ils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-
 utils/2.1.9/recipe-sysroot-native=  -Wl,-z,relro,-z,now -lkmod  -L../libopeniscsiusr -lopeniscsiusr  tests/test_session.c libopeniscsiusr.so.0.2.0   -o tests/test_session
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\" -I../libopeniscsiusr -g  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-ut
 ils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-
 utils/2.1.9/recipe-sysroot-native=  -Wl,-z,relro,-z,now -lkmod  -L../libopeniscsiusr -lopeniscsiusr  tests/test_iface.c libopeniscsiusr.so.0.2.0   -o tests/test_iface
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Werror -Wextra -fvisibility=hidden -fPIC  -DSBINDIR=\"/sbin\" -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_VERSION_STR=\"2.1.9\" -I../libopeniscsiusr -g  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-ut
 ils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-
 utils/2.1.9/recipe-sysroot-native=  -Wl,-z,relro,-z,now -lkmod  -L../libopeniscsiusr -lopeniscsiusr  tests/test_node.c libopeniscsiusr.so.0.2.0   -o tests/test_node
| find docs/man -type f -name \*[0-9]
| docs/man/iscsi_strerror.3
| docs/man/iscsi_iface_print_config.3
| docs/man/iscsi_context_new.3
| docs/man/iscsi_context_free.3
| docs/man/libopeniscsiusr.h.3
| docs/man/iscsi_context_userdata_set.3
| docs/man/iscsi_session_recovery_tmo_get.3
| docs/man/iscsi_session_persistent_port_get.3
| docs/man/iscsi_iface_transport_name_get.3
| docs/man/iscsi_iface_hwaddress_get.3
| docs/man/iscsi_default_iface_setup.3
| docs/man/iscsi_session_persistent_address_get.3
| docs/man/iscsi_iface_get.3
| docs/man/iscsi_node_target_name_get.3
| docs/man/iscsi_context_log_priority_get.3
| docs/man/iscsi_ifaces_free.3
| docs/man/iscsi_log_priority_str.3
| docs/man/iscsi_session_free.3
| docs/man/iscsi_session_tpgt_get.3
| docs/man/iscsi_iface_port_speed_get.3
| docs/man/iscsi_iface_dump_config.3
| docs/man/iscsi_context_userdata_get.3
| docs/man/iscsi_iface_netdev_get.3
| docs/man/iscsi_session_address_get.3
| docs/man/iscsi_session_target_name_get.3
| docs/man/iscsi_node_tpgt_get.3
| docs/man/iscsi_node_conn_address_get.3
| docs/man/iscsi_session_username_get.3
| docs/man/iscsi_nodes_get.3
| docs/man/iscsi_context_log_func_set.3
| docs/man/iscsi_session_iface_get.3
| docs/man/iscsi_session_password_in_get.3
| docs/man/iscsi_iface_name_get.3
| docs/man/iscsi_session_sid_get.3
| docs/man/iscsi_ifaces_get.3
| docs/man/iscsi_context_log_priority_set.3
| docs/man/iscsi_iface_port_state_get.3
| docs/man/iscsi_iface_ipaddress_get.3
| docs/man/iscsi_node_conn_is_ipv6.3
| docs/man/iscsi_node_iface_name_get.3
| docs/man/iscsi_sessions_free.3
| docs/man/iscsi_session_password_get.3
| docs/man/iscsi_nodes_free.3
| docs/man/iscsi_node_print_config.3
| docs/man/iscsi_node_dump_config.3
| docs/man/iscsi_sessions_get.3
| docs/man/iscsi_iface_iname_get.3
| docs/man/iscsi_session_lu_reset_tmo_get.3
| docs/man/iscsi_session_port_get.3
| docs/man/iscsi_iface_free.3
| docs/man/iscsi_session_tgt_reset_tmo_get.3
| docs/man/iscsi_node_conn_port_get.3
| docs/man/iscsi_node_portal_get.3
| docs/man/iscsi_session_get.3
| docs/man/iscsi_session_username_in_get.3
| docs/man/iscsi_is_default_iface.3
| docs/man/iscsi_session_abort_tmo_get.3
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git/libopeniscsiusr'
| make -j16 -l52 --jobserver-auth=fifo:/tmp/GMfifo471074 -C sysdeps
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git/sysdeps'
| make[1]: warning: -j16 forced in submake: resetting jobserver mode.
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=   -Wall -Wstrict-prototypes   -c -o sysdeps.o sysdeps.c
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git/sysdeps'
| make -j16 -l52 --jobserver-auth=fifo:/tmp/GMfifo471074 -C usr
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git/usr'
| make[1]: warning: -j16 forced in submake: resetting jobserver mode.
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o iscsi_util.o iscsi_util.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o io.o io.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o auth.o auth.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o iscsi_timer.o iscsi_timer.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o login.o login.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o log.o log.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o iface.o iface.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o idbm.o idbm.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o sysfs.o sysfs.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o host.o host.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o session_info.o session_info.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o iscsi_sysfs.o iscsi_sysfs.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o iscsi_net_util.o iscsi_net_util.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| idbm.c: In function 'idbm_rec_write_old':
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| idbm.c:2230:27: error: 'GLOB_ONLYDIR' undeclared (first use in this function)
|  2230 |         rc = glob(portal, GLOB_ONLYDIR, NULL, &globbuf);
|       |                           ^~~~~~~~~~~~
| idbm.c:2230:27: note: each undeclared identifier is reported only once for each function it appears in
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o iscsid_req.o iscsid_req.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o transport.o transport.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot -DNO_SYSTEMD  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/build=/usr/src/debug/iscsi-initiator-utils/2.1.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/recipe-sysroot-native=  -Wall -Wextra -Wstrict-prototypes -fno-common -I../include -I. -D_GNU_SOURCE -I../libopeniscsiusr -DISCSI_VERSION_STR=\"2.1.9\"   -DISNS_SUPPORTED -DISCSI_DB_ROOT=\"/etc/iscsi\" -DISCSI_CONFIG_ROOT=\"/etc/iscsi\"   -c -o iser.o iser.c
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| Package libsystemd was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libsystemd.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd' found
| make[1]: *** [<builtin>: idbm.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git/usr'
| make: *** [Makefile:64: user] Error 2
| make: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/git'
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/run.do_compile.471072:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/run.do_compile.471072, line 181
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/run.do_compile.471072, line 165
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/run.do_compile.471072, line 160
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/run.do_compile.471072, line 155
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/run.do_compile.471072, line 194
NOTE: recipe iscsi-initiator-utils-2.1.9-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1188 tasks of which 1181 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104021455.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104021455.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: iscsi-initiator-utils-2.1.9-r0 do_compile: oe_runmake failed
ERROR: iscsi-initiator-utils-2.1.9-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/run.do_compile.471072', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/iscsi-initiator-utils/2.1.9/temp/log.do_compile.471072
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb:do_compile) failed with exit code '1'

--===============5037990378409653923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iscsi-initiator-utils-upgrade-2.1.8-2.1.9.patch"

RnJvbSAyMDI2MmNhNzE1OTk0YWE2MzUzOTBlOWEwMTY4YjQ2MmFkMWJhYjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjoxNToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlz
Y3NpLWluaXRpYXRvci11dGlsczogdXBncmFkZSAyLjEuOCAtPiAyLjEuOQoKLS0tCiAuLi4taW5p
dGlhdG9yLXV0aWxzXzIuMS44LmJiID0+IGlzY3NpLWluaXRpYXRvci11dGlsc18yLjEuOS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1kYWVtb25zL2lzY3NpLWluaXRpYXRvci11dGls
cy97aXNjc2ktaW5pdGlhdG9yLXV0aWxzXzIuMS44LmJiID0+IGlzY3NpLWluaXRpYXRvci11dGls
c18yLjEuOS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1k
YWVtb25zL2lzY3NpLWluaXRpYXRvci11dGlscy9pc2NzaS1pbml0aWF0b3ItdXRpbHNfMi4xLjgu
YmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1kYWVtb25zL2lzY3NpLWluaXRpYXRvci11dGls
cy9pc2NzaS1pbml0aWF0b3ItdXRpbHNfMi4xLjkuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVu
YW1lIGZyb20gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGFlbW9ucy9pc2NzaS1pbml0aWF0b3It
dXRpbHMvaXNjc2ktaW5pdGlhdG9yLXV0aWxzXzIuMS44LmJiCnJlbmFtZSB0byBtZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1kYWVtb25zL2lzY3NpLWluaXRpYXRvci11dGlscy9pc2NzaS1pbml0aWF0
b3ItdXRpbHNfMi4xLjkuYmIKaW5kZXggMmNhZGRiYjU0Li4xOGFiMTZiYzIgMTAwNjQ0Ci0tLSBh
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWRhZW1vbnMvaXNjc2ktaW5pdGlhdG9yLXV0aWxzL2lz
Y3NpLWluaXRpYXRvci11dGlsc18yLjEuOC5iYgorKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBl
cy1kYWVtb25zL2lzY3NpLWluaXRpYXRvci11dGlscy9pc2NzaS1pbml0aWF0b3ItdXRpbHNfMi4x
LjkuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyArPSAiJHtAYmIudXRpbHMuY29udGFpbnMo
J0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgJ3N5c3RlbWQnLCAnJywgZCkKIAogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZk
YWY0YTQyNjMiCiAKLVNSQ1JFViA9ICI1NDNiYTBmMTVkMzQwYjk3ZjMwNzgyMzA4Y2VjNDI0YTY3
MzhmZWMzIgorU1JDUkVWID0gIjY3OGMzZTkyMzJiMmI3MTc3YjcxMzEwNzE5MTBkYTE0ZjA2NWUw
MzciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9vcGVuLWlzY3NpL29wZW4taXNjc2k7
YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1h
a2VmaWxlLURvLW5vdC1zZXQtV2Vycm9yLnBhdGNoIFwKLS0gCjIuMzkuMgoK

--===============5037990378409653923==--

