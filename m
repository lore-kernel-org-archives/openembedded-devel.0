Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF80C197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 18:32:42 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.18543.1740681160954459452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 10:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BE0n3Ywi;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf178f4cf1so109268266b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 10:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740681159; x=1741285959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7MbBA+upFGdIRHxCITh0HHbeFiSMQ60DFYloczBa4Q=;
        b=BE0n3YwiJ5KVwd33X+szUfcMo5sJQVKupeWb0xBMEGe/VnMItvArzrb6oLNQ8vhSAu
         DsfCSQov977mUK9i+P4/CwEu24X3rXTTseGGq7z0vp9gSfgzo0vyc1BJuEORZFb7djfk
         VVTlu1yD6N29WS15LMxA3HXRreQyuPYd+7JOREbAjkQFeyyQA3TJlSwJw6KUlXEbLAW4
         nr5YZxkO3dUz9N5cqSTy15k9k+G9/aFsSZ9l4NCpP89C+d/Epd5PeVQek7fX9J6HaBhG
         JiOlYj0SOo/na+9cC0Ky/DtK2xL0avr71rTLdtH52NjAN2T1LJnl2EzgpTVyGu5f9hXM
         ybHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740681159; x=1741285959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7MbBA+upFGdIRHxCITh0HHbeFiSMQ60DFYloczBa4Q=;
        b=HnUkPX3+oYQqk4elSJu2ntqll3DIYJTlTpK0hY7FEYjASG1g4rl8EdY3U1XA4iuryF
         VyCV5U7V1k5tWcV/1EKEcQC+jXEwMNRz0TwFGIeGZOsyMURulfU8pinrcvABUKqaapuA
         1eG1S5q4KIGKaqztzB9HcKllOBroC2wi8/QsHQBXRhGC2P00CrEn1RQaasKfiliLh3yi
         1VDD2kDVSIcan0al4HK3FOd4aam4GrD3E9cZk0eHzoCuUJLPJpjgSfq6Lro1Tcexyr1B
         gUkAD4RP5GnIWW8ecS4BLiPHfXmi2uI4OgqNdGRTl0q5yIY/uGmGL5sEFshRj9JaCxkX
         YJ2A==
X-Gm-Message-State: AOJu0Yx0DmXxQuA40rrC8ydIQwtGRj+NQWFc8sItfkQhXsrAZAwZ1j/2
	qXfz0hIKoDdDFFIm+b62QdtaUVzRBaZLU7/dCLRdhFG1JnlgFeXNGyXnDQ==
X-Gm-Gg: ASbGncu57A9HiRheaD5/TWCe9PFc0/sNWjUbrPPXXoZ9OWQSYuiXReMEnkwek5hHW3a
	BW8x3NWJyJZD294gZ/ZUbBja80aqKCakVRz7AZVKTWJGB1WvZQRx9o8ba7G8gR8wZJMkOrI/sBU
	PhZ5YSHSUL6PBJbfQ7xytREEoDrSGHNKyMGRiq0zpd0/Ja4DC3qOb2vsIRdlVlEMKmwoBw9oloG
	NH+v8gYAHz6AOuZr3hvtIqnblhmkJa2+hp1GjIJ6q7RmkpmipnDpm/2ZhJ+fmdvnYgBSYC15V7g
	hys/MtUtyc2QThUPV1iYl71FBwsUOEdPBefDhYDSVA==
X-Google-Smtp-Source: AGHT+IGuE/jzuaUU6ME7Mou9u/fWh3eHB85FxUQLYUGPir+eMZzb3EhR8K9ncrRRp9Q7jnk8L1cFBw==
X-Received: by 2002:a17:907:2d0c:b0:abe:cccd:9222 with SMTP id a640c23a62f3a-abf26888da0mr41506366b.54.1740681159213;
        Thu, 27 Feb 2025 10:32:39 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c101415sm161950366b.81.2025.02.27.10.32.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:32:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] thin-provisioning-tools: add target and sysroot to bindgen flags
Date: Thu, 27 Feb 2025 19:32:38 +0100
Message-ID: <20250227183238.1909597-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 18:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115699

BUILD_CFLAGS doesn't contain information about the recipe sysroot nor about the target
system - and in case these are not specified for bindgen, then it builds against
the build system's headers, using the build system's arch.

Instead of BUILD_CFLAGS pass HOST_CC_ARCH and TOOLCHAIN_OPTIONS, which contain the sysroot
and the requred cross-compiling flags, beside passing the target flag also.

Fixes the following do_compile error:

|   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found
|   thread 'main' panicked at /yocto/sandbox/build/tmp/work/cortexa72-poky-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/devicemapper-sys-0.3.0/build.rs:24:10:
|   Could not generate dm.h bindings: ClangDiagnostic("/usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found\n")

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index bb4b53c28b..d0241c7016 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -21,7 +21,7 @@ inherit pkgconfig
 DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
 export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
-export BINDGEN_EXTRA_CLANG_ARGS = "${BUILD_CFLAGS}"
+export BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc

