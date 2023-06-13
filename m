Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D0AC88CB9
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 04:23:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6226.1686630195864305172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 21:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=O2u7YksJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b3dd3ca7adso9936725ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 21:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686630195; x=1689222195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HVL4mLxn9LstKGbifXGiUJSK+9lhZrl5MwyUme/MMQ=;
        b=O2u7YksJtpTFwJGrroKrIgnf3bQmM45vHz2cGJDfETYIh7NpVqzq0B+lsmlVk3CwKT
         RBf/7nYpxYjlmmyfuV5Eyo6K6OFU+YhaixBZFEJKIkDk6OCv1o+/VpVBdIfl9k67sMgR
         G22XGdK7sOPKMYDCdrm3E2lK+YFFCmEi/WC/X3h/VGipeXRrj1NpjoiSOZ3/3sZsrnlI
         V/2Ny6EvGH/FXCM9zr5DtW/Fv6gO3pXOO9ctj3LDjEYWVbD2hFU7/dKLbo2AuabyeQIG
         Y23BXEyvnVNxwacXpOXtwMO69ycBSuUtl54QgnVkah9kAezNgbuohzlVb9AlL36f2p42
         0buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686630195; x=1689222195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HVL4mLxn9LstKGbifXGiUJSK+9lhZrl5MwyUme/MMQ=;
        b=UmsyCnWaDUaESBL8T8CG+EgZZvcvpWd7yIfijK/+M6sshaOpb0nkfuK3JvLU3x24jH
         e5h7mK70IyvCgVpsagZ9Ve5kJ6jSE/aLdJ3lYEv8AAOS9jylCZ46Yf6ISkTzW6XCpb4A
         /d+V2PQqnfGJPJwOXAA9zyA0HAsPyHT8mEE583p8mepaa1rG9+wpZBC4hYf/q/oFC7wp
         i5LXvCtLiCwiVsdRUQQiECD6kbu2t9CzcUOVFryqYHoUcvHS8zgoqqeU9hWhJZSaNnZn
         XXnLRfNcVeB4PNH3mSTxEHamzhlVZHe70FYtLJn0MzGSuFsMLWhtDdA3+5WwBypfxjY9
         8TrQ==
X-Gm-Message-State: AC+VfDwCFjery0uaqRga0DoJzmPLSABUYYyBXHMEc0E1PgCl9JYnumvW
	8zXfIC4fBCTx/e3T4WrZ0hEChDVAa0k=
X-Google-Smtp-Source: ACHHUZ5XiGozSUdu9uMt3OyspKVQO5tW+xAOqkxJ2kcoVEPwF+xGAducUtom86TI0zBvA+4BsJRqIA==
X-Received: by 2002:a17:902:f542:b0:1b0:524b:e597 with SMTP id h2-20020a170902f54200b001b0524be597mr10704930plf.2.1686630194762;
        Mon, 12 Jun 2023 21:23:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001b20dc1b3c9sm5025847plb.200.2023.06.12.21.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:23:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] ostree: Fix build errors found with lld linker
Date: Mon, 12 Jun 2023 21:23:10 -0700
Message-ID: <20230613042312.696835-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 04:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103253

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ith-libgpg-error-for-gpg_strerror_r-.patch | 35 +++++++++++++++++++
 .../recipes-extended/ostree/ostree_2023.3.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch b/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch
new file mode 100644
index 0000000000..167d8ffdd8
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch
@@ -0,0 +1,35 @@
+From 597120777ff9410b715c19298df824ce3170d6d7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Jun 2023 14:04:44 -0700
+Subject: [PATCH] libostree: Link with libgpg-error for gpg_strerror_r API
+
+With f461c02bb55bf2853a3b81ed5c8618040ab54e98 use of gpg_strerror_r
+was added this symbol comes from libgpg-error however, therefore its
+needed to add -lgpg-error to cmdline to resolve this symbol especially
+with gold and lld linker. Fixes
+
+aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gpg_strerror_r
+>>> referenced by ./.libs/libostree-1.so
+
+Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/2880]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile-libostree.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile-libostree.am b/Makefile-libostree.am
+index 8edd7f4d..4ad1eed5 100644
+--- a/Makefile-libostree.am
++++ b/Makefile-libostree.am
+@@ -191,7 +191,7 @@ libostree_1_la_CFLAGS = $(AM_CFLAGS) -I$(srcdir)/bsdiff -I$(srcdir)/libglnx -I$(
+ 	-DPKGLIBEXECDIR=\"$(pkglibexecdir)\"
+ libostree_1_la_LDFLAGS = -version-number 1:0:0 -Bsymbolic-functions $(addprefix $(wl_versionscript_arg),$(symbol_files))
+ libostree_1_la_LIBADD = libotutil.la libglnx.la libbsdiff.la $(OT_INTERNAL_GIO_UNIX_LIBS) $(OT_INTERNAL_GPGME_LIBS) \
+-                        $(OT_DEP_LZMA_LIBS) $(OT_DEP_ZLIB_LIBS) $(OT_DEP_CRYPTO_LIBS)
++                        $(OT_DEP_LZMA_LIBS) $(OT_DEP_ZLIB_LIBS) $(OT_DEP_CRYPTO_LIBS) $(OT_DEP_GPG_ERROR_LIBS)
+ # Some change between rust-1.21.0-1.fc27 and rust-1.22.1-1.fc27.x86_64
+ libostree_1_la_LIBADD += $(bupsplitpath)
+ EXTRA_libostree_1_la_DEPENDENCIES = $(symbol_files)
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.3.bb b/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
index dc771ce28a..f5cd7d6ac6 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
 GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = " \
     ${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
+    file://0001-libostree-Link-with-libgpg-error-for-gpg_strerror_r-.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "9c575a094da2c307769f0aee15de95470c3b5550cbff211fbbc4f6fc75f333b1"
-- 
2.41.0


