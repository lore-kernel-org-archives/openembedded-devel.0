Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E408EC04FDE
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.63223.1699041739147715432
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KJS+CjjA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QDDQB8PG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96c782af-dfc436da-a795-4530-9696-6df70276058f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QbzyEC8lG4pyLrNMMlKil3V/dnu4z3rwkkR+5AZBouU=;
	b=KJS+CjjA09ngyESmwFWcTJPuyBsnygrpSuFx60YVRwMCkjyNfI33+YAmGPDld7i2
	w+DJtAXikAVNxJidNRclFtvq5DcdJ8gVQ0TaNv2GwfbhLL6NMx7sdCaZCP2Jq2cnyhy
	zXzPqcWhXHLS18QyUwFMEr0wVjRf6k6gHYrciFfQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QbzyEC8lG4pyLrNMMlKil3V/dnu4z3rwkkR+5AZBouU=;
	b=QDDQB8PGFPjuhw8Vk7CW3HDk19VjQwiqQXRBKSz+8NbLHkA3rSy37WjM5tkm13Fj
	dUoM5Iqllb6Pi6WZRJeaF/5A/912gMJfQlENCPvuRTue9iNcxjVH/qCRDNgWR44bSBI
	vWM3Z2Z8H5w8s1+9FfTHZbZn1okcjaVmC8GOhxF8=
Content-Type: multipart/mixed; boundary="===============6531361174360888892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] renderdoc: upgrading to 1.29 FAILED
Message-ID: <0101018b96c782af-dfc436da-a795-4530-9696-6df70276058f-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106082

--===============6531361174360888892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *renderdoc* to *1.29* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-renderdoc-upgrade-1.27-1.29.patch
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
From 4ad500c4221b39261fcc96bc8d10415327d1f87b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:11:28 +0000
Subject: [PATCH] renderdoc: upgrade 1.27 -> 1.29

---
 .../renderdoc/{renderdoc_1.27.bb => renderdoc_1.29.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.27.bb => renderdoc_1.29.bb} (95%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.29.bb
similarity index 95%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.29.bb
index c89b2d1c9..318ff0b2f 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.29.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=36d34a46cb71546195d2b0c626a52e5d"
 
-SRCREV = "35b13a8e8fd2a331854dba6da81a20452e142d6f"
+SRCREV = "0202a066a9ffa4077fa980da2d97ad5fb6ec5827"
 SRC_URI = " \
     git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
     file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
-- 
2.39.2


--===============6531361174360888892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/renderdoc: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc: PV changed from "1.27" to "1.29"
packages/core2-64-poky-linux/renderdoc/renderdoc-dbg: PKGSIZE changed from 235815832 to 244216656 (+4%)
packages/core2-64-poky-linux/renderdoc/renderdoc-dbg: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc/renderdoc-dbg: PV changed from "1.27" to "1.29"
packages/core2-64-poky-linux/renderdoc/renderdoc-dev: PKGSIZE changed from 30977 to 31582 (+2%)
packages/core2-64-poky-linux/renderdoc/renderdoc-dev: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc/renderdoc-dev: PV changed from "1.27" to "1.29"
packages/core2-64-poky-linux/renderdoc/renderdoc-doc: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc/renderdoc-doc: PV changed from "1.27" to "1.29"
packages/core2-64-poky-linux/renderdoc/renderdoc-locale: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc/renderdoc-locale: PV changed from "1.27" to "1.29"
packages/core2-64-poky-linux/renderdoc/renderdoc-src: PKGSIZE changed from 24816860 to 25483984 (+3%)
packages/core2-64-poky-linux/renderdoc/renderdoc-src: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc/renderdoc-src: FILELIST: directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/catch -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/catch, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/replay -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/replay, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoccmd -> /usr/src/debug/renderdoc/1.29-r0/renderdoccmd, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/arm -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/arm, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/gl -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/gl, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/amd -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/amd, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/stb -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/stb, directory renamed /usr
 /src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/miniz -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/miniz, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/CMakeFiles/data.src/driver/vulkan -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/CMakeFiles/data.src/driver/vulkan, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoccmd/3rdparty/cmdline -> /usr/src/debug/renderdoc/1.29-r0/renderdoccmd/3rdparty/cmdline, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/OSDependent -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/OSDependent, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/common -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/common, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/gl/official -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/gl/official, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/tinyfiledialogs -> /usr/src/debug/ren
 derdoc/1.29-r0/renderdoc/3rdparty/tinyfiledialogs, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/api/replay -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/api/replay, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/gl/wrappers -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/gl/wrappers, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/CMakeFiles/data.src/data -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/CMakeFiles/data.src/data, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/half -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/half, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/tinyexr -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/tinyexr, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/strings -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/strings, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/api/app -> /usr/src/debug/renderdoc/1.29-r0/rende
 rdoc/api/app, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/CMakeFiles/data.src/data/glsl -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/CMakeFiles/data.src/data/glsl, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/intel -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/intel, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/lz4 -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/lz4, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/serialise -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/serialise, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/amd/official/RGA/Common/AsicReg -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/amd/official/RGA/Common/AsicReg, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/maths -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/maths, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/zstd -> /usr/src/debug/rend
 erdoc/1.29-r0/renderdoc/3rdparty/zstd, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/jpeg-compressor -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/jpeg-compressor, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/vulkan -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/vulkan, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/serialise/codecs -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/serialise/codecs, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/compressonator -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/compressonator, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/data -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/data, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/core -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/core, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/shaders/spirv -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/dr
 iver/shaders/spirv, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/os -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/os, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/GenericCodeGen -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/GenericCodeGen, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/md5 -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/md5, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/superluminal -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/superluminal, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/android -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/android, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/pugixml -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/pugixml, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/data/glsl -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/data/g
 lsl, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/OSDependent/Unix -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/OSDependent/Unix, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/hooks -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/hooks, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/os/posix -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/os/posix, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/preprocessor -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/nv/official/PerfSDK/redist/NvPerfUtility/include -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/nv/official/PerfSDK/redist/NvPerfUtility/include, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/nv -> /usr/src/debug/renderdoc/1
 .29-r0/renderdoc/driver/ihv/nv, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/nv/official/PerfSDK/redist/include -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/nv/official/PerfSDK/redist/include, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/vulkan/wrappers -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/vulkan/wrappers, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/plthook -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/plthook, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/os/posix/linux -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/os/posix/linux, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/OGLCompilersDLL -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/OGLCompilersDLL, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/amd/official/GPUPerfAPI/Include -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/
 ihv/amd/official/GPUPerfAPI/Include, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/vulkan/official -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/vulkan/official, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/nv/official/PerfSDK/redist/include/linux-desktop-x64 -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/nv/official/PerfSDK/redist/include/linux-desktop-x64, directory renamed /usr/src/debug/renderdoc/1.27-r0/renderdoc/driver/ihv/amd/official/RGP -> /usr/src/debug/renderdoc/1.29-r0/renderdoc/driver/ihv/amd/official/RGP, removed "/usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/PoolAlloc.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/BaseTypes.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/ShHandle.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/ResourceLimits.h /usr/src/debug/renderdoc/1.2
 7-r0/renderdoc/3rdparty/glslang/SPIRV/GlslangToSpv.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/spvIR.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/Logger.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Intermediate.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/RemoveTree.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/bitutils.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/SpvTools.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/attribute.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/RemoveTree.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/InfoSink.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang
 /glslang/MachineIndependent/ScanContext.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.std.450.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/iomapper.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ParseHelper.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Versions.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/glslang_tab.cpp.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/SpvBuilder.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/GlslangToSpv.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Initialize.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/limits.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/parseVersions.h /usr/sr
 c/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/propagateNoContraction.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/attribute.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/SpvPostProcess.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/intermediate.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/linkValidate.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.EXT.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/Types.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/Logger.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ParseContextBase.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.AMD.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndep
 endent/Versions.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/SymbolTable.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Scan.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Initialize.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Public/ShaderLang.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/propagateNoContraction.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ShaderLang.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.KHR.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/parseConst.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/ConstantUnion.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/hex_float.h /usr/src/debug/renderdo
 c/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/spirv.hpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/InReadableOrder.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/IntermTraverse.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ParseHelper.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/SpvBuilder.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Constant.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/reflection.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/Common.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/InitializeGlobals.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Scan.cpp /u
 sr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/SymbolTable.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/iomapper.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/Include/arrays.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/localintermediate.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/reflection.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/LiveTraverser.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.NV.h /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/intermOut.cpp /usr/src/debug/renderdoc/1.27-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/InfoSink.cpp", added "/usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/PoolAlloc.cpp /usr/src/d
 ebug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/BaseTypes.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/ShHandle.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/ResourceLimits.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GlslangToSpv.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/spvIR.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/Logger.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Intermediate.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/RemoveTree.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/bitutils.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/SpvTools.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/attribute.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdpart
 y/glslang/glslang/Include/PoolAlloc.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/RemoveTree.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Public/ResourceLimits.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/InfoSink.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ScanContext.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.std.450.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/iomapper.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ParseHelper.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Versions.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/glslang_tab.cpp.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/SpvBuilder.cpp /usr/src/de
 bug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GlslangToSpv.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Initialize.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/limits.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/parseVersions.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/NonSemanticShaderDebugInfo100.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/ResourceLimits/ResourceLimits.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/propagateNoContraction.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/SpirvIntrinsics.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/attribute.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/SpvPostProcess.cpp /usr/src/debug/renderdoc/1.29-r0/r
 enderdoc/3rdparty/glslang/glslang/Include/intermediate.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/linkValidate.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.EXT.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/Types.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/Logger.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/SpirvIntrinsics.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ParseContextBase.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.AMD.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Versions.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/SymbolTable.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Scan.h /us
 r/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Initialize.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Public/ShaderLang.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/propagateNoContraction.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ShaderLang.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.KHR.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.ARM.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/parseConst.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/ConstantUnion.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/hex_float.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/spirv.hpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/InReadableOrder.cp
 p /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/IntermTraverse.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/ParseHelper.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/SpvBuilder.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Constant.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/reflection.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/Common.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/InitializeGlobals.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/Scan.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/SymbolTable.h /usr/src/debug/renderdoc/1.29-r0/rende
 rdoc/3rdparty/glslang/glslang/MachineIndependent/iomapper.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/Include/arrays.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/localintermediate.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/reflection.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/LiveTraverser.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/SPIRV/GLSL.ext.NV.h /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/intermOut.cpp /usr/src/debug/renderdoc/1.29-r0/renderdoc/3rdparty/glslang/glslang/MachineIndependent/InfoSink.cpp"
packages/core2-64-poky-linux/renderdoc/renderdoc-src: PV changed from "1.27" to "1.29"
packages/core2-64-poky-linux/renderdoc/renderdoc-staticdev: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc/renderdoc-staticdev: PV changed from "1.27" to "1.29"
packages/core2-64-poky-linux/renderdoc/renderdoc: PKGSIZE changed from 20249001 to 20711593 (+2%)
packages/core2-64-poky-linux/renderdoc/renderdoc: PKGV changed from 1.27 [default] to 1.29 [default]
packages/core2-64-poky-linux/renderdoc/renderdoc: PV changed from "1.27" to "1.29"

--===============6531361174360888892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4925 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 46 recipes from the core2-64 sysroot...done.
Removing 46 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'renderdoc'
renderdoc was skipped: incompatible with musl C library
renderdoc was skipped: incompatible with musl C library

--===============6531361174360888892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-renderdoc-upgrade-1.27-1.29.patch"

RnJvbSA0YWQ1MDBjNDIyMWIzOTI2MWZjYzk2YmM4ZDEwNDE1MzI3ZDFmODdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODoxMToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
bmRlcmRvYzogdXBncmFkZSAxLjI3IC0+IDEuMjkKCi0tLQogLi4uL3JlbmRlcmRvYy97cmVuZGVy
ZG9jXzEuMjcuYmIgPT4gcmVuZGVyZG9jXzEuMjkuYmJ9ICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9y
ZWNpcGVzLWdyYXBoaWNzL3JlbmRlcmRvYy97cmVuZGVyZG9jXzEuMjcuYmIgPT4gcmVuZGVyZG9j
XzEuMjkuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3Jl
bmRlcmRvYy9yZW5kZXJkb2NfMS4yNy5iYiBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9yZW5k
ZXJkb2MvcmVuZGVyZG9jXzEuMjkuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3JlbmRlcmRvYy9yZW5kZXJkb2NfMS4yNy5iYgpyZW5h
bWUgdG8gbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3JlbmRlcmRvYy9yZW5kZXJkb2NfMS4yOS5i
YgppbmRleCBjODliMmQxYzkuLjMxOGZmMGIyZiAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVz
LWdyYXBoaWNzL3JlbmRlcmRvYy9yZW5kZXJkb2NfMS4yNy5iYgorKysgYi9tZXRhLW9lL3JlY2lw
ZXMtZ3JhcGhpY3MvcmVuZGVyZG9jL3JlbmRlcmRvY18xLjI5LmJiCkBAIC00LDcgKzQsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vYmFsZHVyay9yZW5kZXJkb2MiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTM2ZDM0
YTQ2Y2I3MTU0NjE5NWQyYjBjNjI2YTUyZTVkIgogCi1TUkNSRVYgPSAiMzViMTNhOGU4ZmQyYTMz
MTg1NGRiYTZkYTgxYTIwNDUyZTE0MmQ2ZiIKK1NSQ1JFViA9ICIwMjAyYTA2NmE5ZmZhNDA3N2Zh
OTgwZGEyZDk3YWQ1ZmI2ZWM1ODI3IgogU1JDX1VSSSA9ICIgXAogICAgIGdpdDovL2dpdGh1Yi5j
b20vYmFsZHVyay8ke0JQTn0uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD12MS54IFwKICAgICBm
aWxlOi8vMDAwMS1yZW5kZXJkb2MtdXNlLXh4ZC1pbnN0ZWFkLW9mLWNyb3NzLWNvbXBpbGluZy1z
aGltLWJpLnBhdGNoIFwKLS0gCjIuMzkuMgoK

--===============6531361174360888892==--

