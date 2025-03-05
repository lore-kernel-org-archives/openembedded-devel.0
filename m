Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A64C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:03:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.15109.1741186993241279676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KfSeuHnG;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390dd35c78dso627790f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741186991; x=1741791791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1bDwdCpsKr67V0Mk0qwUuJKOMS08b67pdFaScMz2kY=;
        b=KfSeuHnGchw20xQuxY/6WnUDu36ksABB612KXId3qwN6lZKfY1E9Kjn47lFYiKdK6s
         VgceiWVkRPcNYYa4WcpxFML2ZU0ktY04+NO2Q0gkPXXeZduLGszeFvaNIhaPVbgTTRm2
         gr8UjIa+XYdLOl4JaZWeEkuZDk3TvQlBHIM2IBMAe8PSkIf9LjvYH9GYRbVv92tT/iG6
         C+M5Dd+khQlqVihbtnDN6fjlrcaE6GeZnG8+AaURpb9UMIsxz0pPbAv66hI8DfTLEBc0
         +bji5l4vYaQrLQpe6VzyN6EUEhTWEku4bnDnHDOLdj+4fT6u2Ij/F3AVse7gilqqNrkG
         aXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186991; x=1741791791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1bDwdCpsKr67V0Mk0qwUuJKOMS08b67pdFaScMz2kY=;
        b=W1Jg1JKSnQ2DZQhup1mNCbhVqcAvhWTUYPdjcUhq49ZMVETF6q74WL31YPKxu/dNwy
         QNiEQdP8tuzsCZEC7wjz27Hqf0KA8iKwBuT1a5Y2I1eNcAIxtDAJXSFefCDgnAIWVYPU
         /X/NFxaw6HwGOZ32ZGne4N9Zc2YpzMoHsfnsO30fLR0hoD1N1f81Ipdxqri18ieLfNme
         5G1WRJ6K5YhDuIHgFTdFTNd48UG0N5DmmfATpoF9I+R9smYUE5bbwUn9gizMZsYsax6W
         kq+iA+UtvXy8bDk+FLum834DXsLI62fPcMeie7xzuOxQeKtMNibT3YzXsMc2KzJlbaAO
         gbTg==
X-Gm-Message-State: AOJu0YwjQxNdu7HYPxGrSOWcAND/CzDRgBBGK9TilOQxjv2H0lth7Pfv
	Ycirzht0+fYs7ALXxubkQNDz9Mo+oEly1dWTuiNC2sq6L2NY68CvQf/zmg==
X-Gm-Gg: ASbGncv5BJo9vaX5OYOArCve24MHSO3gdxbiyN9MT7SZHRDYGfJ6oUTKyPIuC1Ox059
	0wZB4ufxKweZ1FOeaEvOfz+1Xk445f9sK4hiqbMuMRL/eRgL50jANwEKRFsIpHr4oCCelkhP+il
	e7jiSuqQcpweALHbLP5GxzHvkLvXuDPAABWKZYAYpe8IBtBL8QNb5dLsTvlBPEVWNk0SeOI1AkN
	xwKVoK8dNFzfvaRAleaSqbTjZDh4nyEVurzOBVNDXxIaeToMgyZPXwBd9aX1mIHBqOTD/HbNExv
	HZU09X+ufi4TuQYy97YbN+AzRohPUUJas7tZv+uHOfZBCkw=
X-Google-Smtp-Source: AGHT+IE+p9AdVWAbogJKtTtIDSQ6PIezJHYtvXQPirx9NevnOd5AZIfGfuGkS7RN+I8riOqFiy0+0Q==
X-Received: by 2002:a05:6000:4025:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-3911561aba1mr6411782f8f.18.1741186991153;
        Wed, 05 Mar 2025 07:03:11 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd426c01bsm20136605e9.2.2025.03.05.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:03:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] uutils-coreutils: remove LIBCLANG_PATH, SELINUX_LIB_DIR, SELINUX_INCLUDE_DIR variables
Date: Wed,  5 Mar 2025 16:03:06 +0100
Message-ID: <20250305150306.2628246-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 15:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115758

* don't seem to be needed, I don't see any failures or changes after removing them

* they were needed before in older version as explained by Etienne in:
  https://lists.openembedded.org/g/openembedded-devel/message/115756

regarding SELINUX_INCLUDE_DIR, it was definitely needed as I implemented the recipe. During implementation I submitted this patch to selinux-sys ( https://github.com/koutheir/selinux-sys/commit/a6667c404ecc33266f66e9516bb8e30150c41ec2 ) to correctly use this variable, and was getting a build error without this fix because the rust crate selinux-sys was not finding the selinux header-file (specifically, the bindgen tool).

However, this was in 2022, and since then there has been this patch in selinux-sys: https://github.com/koutheir/selinux-sys/commit/d3ea4674e18c5240918348bea4ec6248e50516e5 , and it seems that the variable is not needed any more.
At least I'm not able to reproduce the build error which I was getting, even with commenting out SELINUX_LIB_DIR and SELINUX_INCLUDE_DIR.

The header-file is used for generating rust code from the C header-file using bindgen, so I don't think it makes a difference whether the native version or the target version is used.

This is the old build error I was getting:
  process didn't exit successfully: `/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutils/0.0.14.AUTOINC+43a5b8c7d7-r0/build/target/release/build/selinux-sys-0849198bc1fef4a4/build-script-build` (exit status: 101)
  --- stdout
  cargo:root=/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutils/0.0.14.AUTOINC+43a5b8c7d7-r0/build/target/aarch64-snap-linux/release/build/selinux-sys-d96748d49908959f/out
  cargo:rerun-if-env-changed=SELINUX_STATIC_aarch64-snap-linux
  cargo:rerun-if-env-changed=SELINUX_STATIC_aarch64_snap_linux
  cargo:rerun-if-env-changed=TARGET_SELINUX_STATIC

|   --- stderr
|   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not found
|   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not found, err: true

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb  | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
index d0a7532984..09f6071e71 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
@@ -30,10 +30,6 @@ CARGO_BUILD_FLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'selinux', '--featur
 
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'clang-native libselinux-native', '', d)}"
 
-export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
-export SELINUX_LIB_DIR = "${STAGING_LIBDIR_NATIVE}"
-export SELINUX_INCLUDE_DIR = "${STAGING_INCDIR_NATIVE}"
-
 # The code which follows is strongly inspired from the GNU coreutils bitbake recipe:
 
 # [ df mktemp nice printenv base64 gets a special treatment and is not included in this
-- 
2.48.1


