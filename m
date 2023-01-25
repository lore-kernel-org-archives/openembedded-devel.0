Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B7BC61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.44978.1674653508098724592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oLmTrov+;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id z12-20020a4a490c000000b004f21c72be42so3136143ooa.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0V/9LopHb7WFA8IwcwwFSf0BCyCmN6lZ7no8ecW3bOk=;
        b=oLmTrov+j/ttla0ijjB0Tu9lmz9ciGYX9s6e++XQCdVjg4W/cGYFGXgZF/2CtK7GKE
         HZyK+yh3pDbruXiooqiG0rdI/k1bnk9xvGkMwPHvtHklrOFB4++7dpvamGJdTXNsQIF6
         1fvvzX0kZXvgSxEbdOIqQrpkGYjjKYUxVrCe5443BxxqJ+xphRr249XcShCfA536wQ+p
         grto1LShtRUVxywGxpxEyIqeBSN/bwc74p+E63vzmketJnp3oT1hwxwSgxGkdofeypz5
         XZyeEeWUXzrNHcJP4uMMra8lgDmfeKsXEnSXdOipiiJ44mYWlUMdRr1Uh9Vn20xlPyth
         HEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V/9LopHb7WFA8IwcwwFSf0BCyCmN6lZ7no8ecW3bOk=;
        b=Z5dpN5+t+QGGYxloFHgqOv8WoD6Gbqo3qeyftkbGpbfR5iHZLDEguVt+JjWo2MscxH
         1SRFZVeEQRg0SJf384DKul1awZTBMu4DGwrge2IXwsGNSS3ouHBn6UM1JnxbQLS5v9WW
         +kL8KZuM4L2AnL08UHMPqaM3lX7Ci5Ti5QEZtQ1f0QrBUlPMh6KRAmhrHipHQkwBDccY
         qF45p4jxYoRGplRONQxqy+Z7BULc1Yh3vYoqHeCVSnXlV1IFRpThXPafT0umJEFZktLX
         VPkQEA2+qm4HevDqPFQ0p8YjobQ1uZM0+HrqGrM8/nLH0cNUUOTzzCUSWk06vLaFH1nz
         Pr2w==
X-Gm-Message-State: AFqh2kosNCxu3Jsa9/FFlGCo0alcdzx5yBlKTZAtNPU0LGpvE3kiTXR3
	cixE7HpVlpo+w5C311Qt3bUhjCtWS1A=
X-Google-Smtp-Source: AMrXdXtmWxV05z9EGaRnzacv97+4l+5GMcvqUdharcx5plRlGf6Vz2vMyJoogpMfuS2lmP5IviAc6w==
X-Received: by 2002:a4a:da51:0:b0:4f2:9a3c:d992 with SMTP id f17-20020a4ada51000000b004f29a3cd992mr14585028oou.1.1674653525406;
        Wed, 25 Jan 2023 05:32:05 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.32.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:32:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 40/41] perfetto: pass TUNE_CCARGS to use machine tune
Date: Wed, 25 Jan 2023 08:31:22 -0500
Message-Id: <84ba7671136d02a7d86b23be49bf8a57ac42d378.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100775

From: Markus Volk <f_l_k@t-online.de>

We already tried to pass -mfloat-abi=hard if the machine can use it, but since
no floating-point-unit was defined it got stubbed out and the result was, that
only arm targets configured for softfp were able to build perfetto.

Simplify by passing ${TUNE_CCARGS} to ensure, we always use the features, the
machine was configured for.

Also, do not use sed to remove the hardcoded -mfpu=neon entry. If this really
turns out to be problematic, we need to patch it out to avoid not having a
floating-point-unit again.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c23bde86d0bcba3acc677bc4cd3240a8b3116921)
[Fixes build failure]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 98e39f068d..86ab18cacf 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -70,24 +70,14 @@ do_configure () {
     elif [ $arch = "aarch64" ]; then
         arch="arm64"
     fi
-    
-    # For ARM32 with hardware floating point using clang and musl, we need to
-    # specify -mfloat-abi=hard to make the ABI settings of the linker and the
-    # compiler match. The linker would use hardware float ABI. The compiler does
-    # not. As a result we need to force the compiler to do so by adding
-    # -mfloat-abi=hard to compilation flags.
-    FLOAT_ABI=""
-    if [[ "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'true', 'false', d)}" == "true" ]]; then
-      FLOAT_ABI="-mfloat-abi=hard"
-    fi
 
     ARGS=$ARGS" target_os=\"linux\""
     ARGS=$ARGS" target_cpu=\"$arch\""
-    ARGS=$ARGS" target_cc=\"$CC_BIN ${FLOAT_ABI}\""
-    ARGS=$ARGS" target_cxx=\"$CXX_BIN -std=c++11 ${FLOAT_ABI}\""
+    ARGS=$ARGS" target_cc=\"$CC_BIN ${TUNE_CCARGS}\""
+    ARGS=$ARGS" target_cxx=\"$CXX_BIN -std=c++11 ${TUNE_CCARGS}\""
     ARGS=$ARGS" target_strip=\"$STRIP_BIN\"" #
     ARGS=$ARGS" target_sysroot=\"${RECIPE_SYSROOT}\""
-    ARGS=$ARGS" target_linker=\"$CC_BIN ${FLOAT_ABI} ${LDFLAGS}\""
+    ARGS=$ARGS" target_linker=\"$CC_BIN ${TUNE_CCARGS} ${LDFLAGS}\""
     ARGS=$ARGS" target_ar=\"$AR\""
     ARGS="'$ARGS'"
     cmd="tools/gn gen --args=$ARGS ${B}"
@@ -100,7 +90,6 @@ do_configure () {
     # Eliminate a few incompatible build flags
     REPLACES="s/-Wl,--icf=all//g"
     REPLACES=$REPLACES";s/-Werror//g"
-    REPLACES=$REPLACES";s/-mfpu=neon//g"
     REPLACES=$REPLACES";s/-fcolor-diagnostics//g"
     REPLACES=$REPLACES";s/=format-security//g"
     REPLACES=$REPLACES";s/-fdiagnostics-show-template-tree//g"
@@ -111,12 +100,12 @@ do_configure () {
 
     # If using the clang toolchain: use the clang host-side binaries built by Bitbake
     if [ "${TOOLCHAIN}" = "clang" ]; then
-        BB_CLANGXX="${BUILD_CXX} ${BUILD_LDFLAGS} ${FLOAT_ABI}"
-        BB_CLANG="${BUILD_CC} ${FLOAT_ABI}"
+        BB_CLANGXX="${BUILD_CXX} ${BUILD_LDFLAGS} ${TUNE_CCARGS}"
+        BB_CLANG="${BUILD_CC} ${TUNE_CCARGS}"
         BB_LLVM_OBJCOPY="${RECIPE_SYSROOT_NATIVE}/usr/bin/llvm-objcopy"
         
-        HOST_CLANGXX="${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc ${FLOAT_ABI}"
-        HOST_CLANG="${STAGING_DIR_NATIVE}/usr/bin/clang ${FLOAT_ABI}"
+        HOST_CLANGXX="${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc ${TUNE_CCARGS}"
+        HOST_CLANG="${STAGING_DIR_NATIVE}/usr/bin/clang ${TUNE_CCARGS}"
         HOST_LLVM_OBJCOPY="${STAGING_DIR_NATIVE}/usr/bin/llvm-objcopy"
 
         cd gcc_like_host
-- 
2.25.1


