Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47194C41535
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.64104.1699041738432461762
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R1HvuS3D;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wq0LM9M2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96c77b82-05707143-ec45-4a9f-9497-64dffeabdad1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/5MfsyxFZ9HL0EfMHWWu0rZyv/uKWUWS4nYlDrktFTA=;
	b=R1HvuS3DXcIH5je03l9XEVqFtGg6isU4FUjmPcf38cCqkyMCE3e5TgduEFBasR4+
	ftum428OOM/ef1573xyeihhVUqV5Bay2b+fWyivFFFtvwg2Eyj4nBGeE6uMya2AeLPE
	WoLhehsyjLBAEjPaBhuIVQwftENO0gR2e1Vqsw8Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/5MfsyxFZ9HL0EfMHWWu0rZyv/uKWUWS4nYlDrktFTA=;
	b=Wq0LM9M2ESttWXb7e1OzoLsCnDY9YsP4j+l2aK8Uu9B1v/A444PJ8aQYpO6Nx+Hd
	WOjnpqdX1xEKOr8veZTbLbj9ObziiieKeC1SLLqBTWi5FtV0ik57vWYwCH20XGvWJYM
	9ChSW38niNEeY6DJC/eEQh1ftObSt8czurwBnR5M=
Content-Type: multipart/mixed; boundary="===============7134385622509628604=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] pahole: upgrading to 1.25 SUCCEEDED
Message-ID: <0101018b96c77b82-05707143-ec45-4a9f-9497-64dffeabdad1-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106054

--===============7134385622509628604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pahole* to *1.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pahole-upgrade-1.24-1.25.patch
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
From 78fd369bb7811d9ec999c6563b029f6d914429ee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:36:34 +0000
Subject: [PATCH] pahole: upgrade 1.24 -> 1.25

---
 meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
index 2bb73c3eb..a57053c7c 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
@@ -10,7 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64).*-linux"
 
 PV .= "+1.25+git${SRCPV}"
-SRCREV = "a9498899109d3be14f17abbc322a8f55a1067bee"
+SRCREV = "81558a5a996005df0d607dd33f74ec5b7bdb619d"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
            file://0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
 
@@ -31,3 +31,5 @@ FILES:${PN}-extra = "${datadir} ${bindir} ${libdir}/libdwarves_emit.so*"
 RDEPENDS:${PN}-extra += "bash python3-core"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "1.25"
-- 
2.39.2


--===============7134385622509628604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/pahole: PKGV changed from 1.24+1.25+git [default] to 1.25 [default]
packages/qemux86_64-poky-linux/pahole: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole-dbg: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-dbg: PKGSIZE changed from 1166760 to 1169104 (+0%)
packages/qemux86_64-poky-linux/pahole/pahole-dbg: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole-dev: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-dev: PKGSIZE changed from 91895 to 92139 (+0%)
packages/qemux86_64-poky-linux/pahole/pahole-dev: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole-doc: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-doc: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole-extra: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-extra: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole-locale: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-locale: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole-src: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-src: PKGSIZE changed from 663901 to 665481 (+0%)
packages/qemux86_64-poky-linux/pahole/pahole-src: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole-staticdev: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-staticdev: PV changed from "1.24+1.25+git" to "1.25"
packages/qemux86_64-poky-linux/pahole/pahole: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole: PV changed from "1.24+1.25+git" to "1.25"

--===============7134385622509628604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4923 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3049 cached, 6 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 133 recipes from the core2-64 sysroot...done.
Removing 149 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:b73ca9a069c084f0a4781ae00db2a045af7cfbb3"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 533 Local 524 Mirrors 0 Missed 9 Current 142 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 151 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_populate_lic_setscene)
NOTE: Running setscene task 152 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 154 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 155 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 158 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx_setscene)
NOTE: Running setscene task 162 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 163 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 164 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 165 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 167 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 168 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 169 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 170 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 171 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pahole-1.25-r0: task do_populate_lic_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Started
NOTE: recipe pahole-1.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libbpf-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe pahole-1.25-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_write_deb_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/qemux86_64-poky-linux-musl/libbpf/1.2.0/temp/log.do_packagedata_setscene.3891460
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 276 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_package_setscene)
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pahole-1.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 277 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 278 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 286 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libbpf-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pahole-1.25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 309 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 310 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe pahole-1.25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 311 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe pahole-1.25-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libbpf-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe pahole-1.25-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 257 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pahole-1.25-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pahole-1.25-r0: task do_fetch: Succeeded
NOTE: Running setscene task 352 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 298 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_unpack)
NOTE: recipe libbpf-1.2.0-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 362 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe pahole-1.25-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libbpf-1.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 417 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 418 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pahole-1.25-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libbpf-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 750 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pahole-1.25-r0: task do_patch: Started
NOTE: recipe libbpf-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 757 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_fetch)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libbpf-1.2.0-r0: task do_fetch: Started
NOTE: Running setscene task 444 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 452 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pahole-1.25-r0: task do_patch: Succeeded
NOTE: Running setscene task 462 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libbpf-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 780 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_unpack)
NOTE: Running task 785 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_generate_toolchain_file)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libbpf-1.2.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pahole-1.25-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 489 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 490 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pahole-1.25-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 493 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 494 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 495 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 496 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 505 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 512 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 517 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libbpf-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 527 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 531 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 546 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 547 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 556 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 569 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1662 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_packagedata)
NOTE: Running task 1684 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1828 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libbpf-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pahole-1.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libbpf-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libbpf-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pahole-1.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_configure)
NOTE: recipe pahole-1.25-r0: task do_configure: Started
NOTE: recipe libbpf-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1852 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb:do_create_spdx)
NOTE: recipe libbpf-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libbpf-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1853 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_collect_spdx_deps)
NOTE: recipe pahole-1.25-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_compile)
NOTE: recipe pahole-1.25-r0: task do_collect_spdx_deps: Started
NOTE: recipe pahole-1.25-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pahole-1.25-r0: task do_compile: Started
NOTE: recipe pahole-1.25-r0: task do_compile: Succeeded
NOTE: Running task 1855 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_install)
NOTE: recipe pahole-1.25-r0: task do_install: Started
NOTE: recipe pahole-1.25-r0: task do_install: Succeeded
NOTE: Running task 1856 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_package)
NOTE: recipe pahole-1.25-r0: task do_package: Started
NOTE: recipe pahole-1.25-r0: task do_package: Succeeded
NOTE: Running task 1858 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_packagedata)
NOTE: recipe pahole-1.25-r0: task do_packagedata: Started
NOTE: recipe pahole-1.25-r0: task do_packagedata: Succeeded
NOTE: Running task 1859 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_create_spdx)
NOTE: Running task 1860 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_package_write_ipk)
NOTE: Running task 1861 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_package_write_deb)
NOTE: Running task 1862 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_package_write_rpm)
NOTE: Running task 1863 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_package_qa)
NOTE: recipe pahole-1.25-r0: task do_create_spdx: Started
NOTE: recipe pahole-1.25-r0: task do_package_write_ipk: Started
NOTE: recipe pahole-1.25-r0: task do_package_write_deb: Started
NOTE: recipe pahole-1.25-r0: task do_package_write_rpm: Started
NOTE: recipe pahole-1.25-r0: task do_package_qa: Started
NOTE: recipe pahole-1.25-r0: task do_create_spdx: Succeeded
NOTE: Running task 1864 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_create_runtime_spdx)
NOTE: recipe pahole-1.25-r0: task do_create_runtime_spdx: Started
NOTE: recipe pahole-1.25-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe pahole-1.25-r0: task do_package_qa: Succeeded
NOTE: recipe pahole-1.25-r0: task do_package_write_ipk: Succeeded
NOTE: recipe pahole-1.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pahole-1.25-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1865 of 1865 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.24.bb:do_build)
NOTE: Tasks Summary: Attempted 1865 tasks of which 1842 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libbpf-src went backwards which would break package feeds (from 0:1.2.2-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libbpf-dbg went backwards which would break package feeds (from 0:1.2.2-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libbpf-staticdev went backwards which would break package feeds (from 0:1.2.2-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libbpf-dev went backwards which would break package feeds (from 0:1.2.2-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libbpf-doc went backwards which would break package feeds (from 0:1.2.2-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libbpf-locale went backwards which would break package feeds (from 0:1.2.2-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libbpf went backwards which would break package feeds (from 0:1.2.2-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: libbpf-1.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7134385622509628604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86_64-poky-linux/pahole/pahole-dbg: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-dev: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-doc: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-extra: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-locale: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-src: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole-staticdev: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]
packages/qemux86_64-poky-linux/pahole/pahole: PKGV changed from 1.24+1.25+git0+a949889910 to 1.25 [default]

--===============7134385622509628604==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pahole-upgrade-1.24-1.25.patch"

RnJvbSA3OGZkMzY5YmI3ODExZDllYzk5OWM2NTYzYjAyOWY2ZDkxNDQyOWVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzozNjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
aG9sZTogdXBncmFkZSAxLjI0IC0+IDEuMjUKCi0tLQogbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L3BhaG9sZS9wYWhvbGVfMS4yNC5iYiB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9wYWhvbGUvcGFob2xlXzEuMjQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcGFo
b2xlL3BhaG9sZV8xLjI0LmJiCmluZGV4IDJiYjczYzNlYi4uYTU3MDUzYzdjIDEwMDY0NAotLS0g
YS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcGFob2xlL3BhaG9sZV8xLjI0LmJiCisrKyBiL21l
dGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wYWhvbGUvcGFob2xlXzEuMjQuYmIKQEAgLTEwLDcgKzEw
LDcgQEAgUEFDS0FHRV9BUkNIID0gIiR7TUFDSElORV9BUkNIfSIKIENPTVBBVElCTEVfSE9TVCA9
ICIoeDg2XzY0fGkuODZ8YWFyY2g2NCkuKi1saW51eCIKIAogUFYgLj0gIisxLjI1K2dpdCR7U1JD
UFZ9IgotU1JDUkVWID0gImE5NDk4ODk5MTA5ZDNiZTE0ZjE3YWJiYzMyMmE4ZjU1YTEwNjdiZWUi
CitTUkNSRVYgPSAiODE1NThhNWE5OTYwMDVkZjBkNjA3ZGQzM2Y3NGVjNWI3YmRiNjE5ZCIKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9kZXZlbC9wYWhvbGUvcGFob2xl
LmdpdDticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItVXNlLXVzci1iaW4t
ZW52LXB5dGhvbjMtaW5zdGVhZC1vZi1qdXN0LXVzci1iaW4tcHl0aC5wYXRjaCIKIApAQCAtMzEs
MyArMzEsNSBAQCBGSUxFUzoke1BOfS1leHRyYSA9ICIke2RhdGFkaXJ9ICR7YmluZGlyfSAke2xp
YmRpcn0vbGliZHdhcnZlc19lbWl0LnNvKiIKIFJERVBFTkRTOiR7UE59LWV4dHJhICs9ICJiYXNo
IHB5dGhvbjMtY29yZSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitQ
ViA9ICIxLjI1IgotLSAKMi4zOS4yCgo=

--===============7134385622509628604==--

