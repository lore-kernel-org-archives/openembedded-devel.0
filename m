Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACCAC282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 19:16:39 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.3690.1741029389926657338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 11:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cCzhTaUH;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so3185842a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 11:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741029388; x=1741634188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sL6hzzve97N88E5xaV0RbxL9JqZpgZSLfMHiQmYrWK8=;
        b=cCzhTaUHGhrSPkyly/yRB7gf86TfEdJS1n2J3T7IL+Yx8qNH/VlmcX+tQsbKkK3ZhK
         IYJHt3eOVCt+shMbNL+9dR+n2fHfb6y8ikVkR5Pn8niz1Roxk3XGc7IVi6WV6ZTNoc4o
         qpB41GCxrSxEXqvoWcxbMqN+P9Lw5t5d87dZR5DIJt1GdjS0FM5ll5a2o/7qNRaPkluA
         WW+CxXoIAP32uMS67gLi4bNKYYYpO1gek4ucBwZ05iQ/hMMDyvVh0EohJFYkN1sdsBzC
         zYiRIPfyBVfu2Wtg7uf1pFYSWk6ZZG7UcwkCwHrHr3KxspVXqWjWrSrNGxGW+IbdFNGh
         l//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029388; x=1741634188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sL6hzzve97N88E5xaV0RbxL9JqZpgZSLfMHiQmYrWK8=;
        b=cdXQ2L/89YsPGx+BuVU67RRNcZToebiSHSrFjNU7hLgZl6luM9vqXAKmLAqZPH8gld
         C9CiDP7hVFCu/VLLQ2OheO1JC42ApZCTtfE2SEyboUngONFDVpRSEv+pem44luHs33lC
         mlxAUqUFcZTyzw2auilRdeofr1Owg6GzPneZiibsdcL6wfXFFBAX4lcfSDMj9fRzR7N6
         J4Vv4Bi8+OghzTUm0WQJ6AlGZJkrqjlXA5Aj5A29mqYkzqg1W586eOFkXGLJ73bxtzjL
         AYH1Vds2t91vI4Xs9nbqSfVjCPPAnbpFgo6siZxpkYwm2YQ3y2XSwYq3Cy5lDdgP5NNp
         ReIw==
X-Gm-Message-State: AOJu0YyqcV3IQsRUG+kDqdr5qgFR1kw65AwAFxXhhg03l+11S8W4KCrP
	8TX6tm4g+EsEj+4WMVElbI4hgBRhgZ89R/9KRsihVs9ssuia0qH+qxIkpOlo
X-Gm-Gg: ASbGncuOlvMcvfdDz2gmm27rXlfK8cVU5weGvwTM2RImpqCpwCtT3bZRNMWpYB5kH9H
	4JLEk2mersB1sKXDvFg9kXXPoqNXXRGtNL/MxOmrPnAtUL3y8dSyfXOcmS9c3y6GpwsrJkATWH2
	h0WJ/6MzZoEClyQfn1hBEVgd6d7pKAbHqfVAEjP2JK894m39ZcnvGgAeO5efpMvQhxPIJ6z0Vjq
	Fs8TgRR+fngZDG/kVmMwo8vcdKmo/v4aZqYqTKuBh7oPORCX39EipDyioqMFFCfeH5gcB2TgC9J
	Ccwnwuy4bywY3ZzSnfMWHqrLTGQeOEWROR8ub89Sg0SW3JY=
X-Google-Smtp-Source: AGHT+IFAkYAhO+DRuc+I7zjiO+/mZ85LpUOi/iuDx7Zvj2HJeb9Du4swa8oBESLERtghJDe5WSM2QQ==
X-Received: by 2002:a17:907:7f1f:b0:ac1:dde7:a80b with SMTP id a640c23a62f3a-ac1dde7ab19mr278591266b.43.1741029387909;
        Mon, 03 Mar 2025 11:16:27 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf7981482csm220511966b.122.2025.03.03.11.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:16:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] thin-provisioning-tools: use STAGING_LIBDIR_NATIVE variable for LIBCLANG_PATH
Date: Mon,  3 Mar 2025 20:16:21 +0100
Message-ID: <20250303191621.2421906-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 19:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115729

* hardcoding:
  ${WORKDIR}/recipe-sysroot-native${libdir}
  is just wrong when there is a better variable

* This path won't be correct for multilib builds where target ${libdir}
  might be e.g. /usr/lib32 while native libdir is /usr/lib.

* use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}

* fixes:
  error: failed to run custom build command for `devicemapper-sys v0.3.0`

  Caused by:
    process didn't exit successfully: `lib32-thin-provisioning-tools/1.1.0/build/target/release/build/devicemapper-sys-88de590bc55acb43/build-script-build` (exit status: 101)
    --- stderr
    thread 'main' panicked at lib32-thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/bindgen-0.69.4/lib.rs:622:31:
    Unable to find libclang: "couldn't find any valid shared libraries matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*'], set the `LIBCLANG_PATH` environment variable to a path where one of these files can be found (invalid: [])"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index d0241c7016..1981a35934 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -20,7 +20,7 @@ inherit pkgconfig
 
 DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
-export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
+export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
 export BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
 
 require ${BPN}-crates.inc
-- 
2.48.1


