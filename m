Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5044FC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:04:19 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.9057.1740657855303916570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jUP21ooI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ded46f323fso1083392a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 04:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740657854; x=1741262654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eC6rwgB7pgrgubiwH9uXhBTmPjCxN5z4HgKie5ObMuI=;
        b=jUP21ooI1i9vYNn9gNKYucbSoyuEz9PBKB5X4ET5gpbIGeWc40MJ1ailcrC9ydJJP/
         +ka0GSnxWG5GXjPOqKTaZskI3ZpIy/N3qnaL4EnfF7bWSWC1roDrDPqweSj5r5tDmYeA
         RmgA1neEbdgvOV0nzXAO6WXJStAPQmvqkjmaTsWBLdCKH8sz1Rhb1Rcx+IiwtanRgl1v
         bV+e8IeiE7iw3NioKaQNBqGCPD8Vow8MQw632AHlnsKW9L74hWYJ3iQ+nmetB/xrdGHV
         aWQF6OOlDs86ER0zhK5P65LwHcGGvOxH10FtmVyigyqRKSo19a8UXdHDgoI4KVe3rZ83
         s0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740657854; x=1741262654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eC6rwgB7pgrgubiwH9uXhBTmPjCxN5z4HgKie5ObMuI=;
        b=utJg0xDeI0vk51jr/Ccw7f8hS1Z72FUV8UgV78oferbp7MLLGBvvhmCY7AjgSVBg8E
         r3cDIGENY2QTrNKtqN8NTjWOYEjC/CgpaoGCDkv1R1E04R8ZlW9jInARSyHGfauqK7rv
         8ezF+Zz8p7D94LZNRXpdDBu/dpajYokgQ967m7IDUJN2YQ0BK9l2fYiYDAIyNcFrWW1m
         8gpGlT1I5YAKNcVHToEuE0CueTrV02GteMAhhMvfAZK0yDO6zMf9YS4IDa6Xd5Qk4R5t
         Ss+by/aVS1QUzb47Gpqr/xpO0slYmbYubYK2Q1lgJr5dd3JDpstK6un9sS8IBbsItSsS
         nYzw==
X-Gm-Message-State: AOJu0YygqgeSvkeSkPtAXJ9anGOLPx1MUz+11LP/oGGXm3h/GeBkT41q
	XFLRH/aobs4JXCBr4ZmGdEinnyt+Mj85lDEa3EArmXSS7qMVBbpfeBmK8Q==
X-Gm-Gg: ASbGncspeJiiee8KsE/Do1j2/xsJKm/verbhAV1UcwNDUD1tJsvyZF7hKshLhpxMI8g
	n0+TLX8OtiIPjvRChDdqMZEFenDbD6vNeGAjkQ3hesuc29SSMnZL4clWt/SmAVnS9wJR/5+ZDRD
	kMDke39BrRKw/va9ssVK9kSWIwbDIK+wnE4rmUUMgk770OHJ0C7DSXvvLUNuS8QBsdR5eybo6Hn
	BztFGYKQ71yFFvPRwCoe+meZ5BcH8PoYgaI6tOCq/Kw/aTDieesZPd0eKqOyL1UHIk4jo507mJC
	ZGEocl4o2ARo7AOzLiYaKiGN0LV54AbS17WmolDevA==
X-Google-Smtp-Source: AGHT+IHiMC9Un0q4xLo6IlWETy5RCRA56mxaVozsMlacw3kHZBpRFZUzCf0arDiTCdSRE4rsOAqprQ==
X-Received: by 2002:a05:6402:501a:b0:5de:a6a8:5ecc with SMTP id 4fb4d7f45d1cf-5e4a0d490aamr9851214a12.5.1740657853423;
        Thu, 27 Feb 2025 04:04:13 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d252sm1014954a12.26.2025.02.27.04.04.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:04:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] thin-provisioning-tools: add target and sysroot to bindgen flags
Date: Thu, 27 Feb 2025 13:04:12 +0100
Message-ID: <20250227120412.1465709-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 12:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115688

BUILD_CFLAGS doesn't contain information about the recipe sysroot nor about the target
system - and in case these are not specified for bindgen, then it builds against
the build system's headers, using the build system's arch.

Specify these attributes in BINDGEN_EXTRA_CLANG_ARGS to use the correct headers.

Fixes the following do_compile error:

|   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found
|   thread 'main' panicked at /yocto/sandbox/build/tmp/work/cortexa72-poky-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/devicemapper-sys-0.3.0/build.rs:24:10:
|   Could not generate dm.h bindings: ClangDiagnostic("/usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found\n")

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index bb4b53c28b..72543e60f4 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -21,7 +21,7 @@ inherit pkgconfig
 DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
 export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
-export BINDGEN_EXTRA_CLANG_ARGS = "${BUILD_CFLAGS}"
+export BINDGEN_EXTRA_CLANG_ARGS = "${BUILD_CFLAGS} --sysroot=${RECIPE_SYSROOT} --target=${TARGET_SYS}"
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc

