Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A567CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 10:53:02 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.10651.1741171978365319859
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 02:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Du7hEiB7;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5050d19e9so8598582a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 02:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741171977; x=1741776777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKq7Vx2SwjFsuJRZvEbBidZAB2QYPa2Oc64jlljth2s=;
        b=Du7hEiB7PxS6uRETh/hgRfQoPP71DpHUhfVr4Jf/NMiTykyROm9E6LrpPtv2fayOTX
         KTf75/igjVqAug1xpZR90j7DGbUJ6mHlZK5hrTsRsAOXk2Tv61IzLtz+cWCyi96urfZ2
         4lQjGjneSxB82PkZGzZZo4keGXU8P5CZ5NX+b5y4ihFL2DJ3kMNqhVv/IXGxyuy70cZB
         Y25Pu0s4JYtqgfls6UZ6tCx6UexHbfTn+UjnAQddaGUFyMoCVtJc2+UYMAylVlrHD4aR
         bHZI+36K2SFSXX0JK8lWNaJxN6Qu6diLff3DOxEuMh7bvyPYHSeUpVRN2xxPvgZMTNQY
         Ja5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741171977; x=1741776777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKq7Vx2SwjFsuJRZvEbBidZAB2QYPa2Oc64jlljth2s=;
        b=rd2TwGHKGV8gh6n/VZje7gAoLEjtnyIPO9tmFN6MKyZklER0POS36OzVUUexxF8voi
         HnXj9ygWaRNAJTEjhTfBrbplqtUPbgIs4xv+pbBrViyJQJzq8wVN4XYRPBFftHHl4ptk
         sEvpd2BF1+R9yV2jzsNsLkdrjFWiD7lBvLwE/4g6TMZORktRH/gQ1KsBUuZq6aIf+aW8
         Gt1qXl6IQjs+K3xBhT5EmKf9NVNN6JchLv9yb6iUPxbmDII6BHPzMWNEq7lta6btzFdT
         I5XsWcF8onIueCuASkIh0VA+dZNVCotE7H1WKUP/iuU1nK9WD8n6E2aKxbHuR3vosg1F
         7xfg==
X-Gm-Message-State: AOJu0YwrJQziXbHvsxzgQcB952Amj735+jhYIBFGvAvOZTcrvVsqUM5V
	V/xNB6uxCppaFbHIVurroJMYcx4teuNbQ4rLcLCtk1RMZyUuri36tiwu3A==
X-Gm-Gg: ASbGnctTeCBlhTRnerjfHGi4wPTK+kKqnTqDGCnmRecd+C3qLGEDTdUQRv25Ipu5DXn
	qWZKa3MRcc3MFgzOzx4iJaEK+T5KgkPsnGUeD0NozkMalWi80GHXSPQVdnDMKD1BJqA2+nU2qib
	7ma6bKz+SET/UldvvNS4Dj/f+o03Tmo8fAndZuhSFrx1nYG0IKqJgwXbqybalDSFBRAVfGPs2Rm
	OHlONyj7dGRTO4TNKRa9mt8RmX1BpOlVaePMnJWVHzMheydR06ZjXhffhlU3MMRsNaOG44hDa0i
	HIfRfOQMn0jVkGQ7ZJFNTzpREVdU5PVPy/FhBJXXh76atLU=
X-Google-Smtp-Source: AGHT+IEvEkRIMDFnmby3U27emDhQcdM1OYoHYzI6PgjjQCeSKfi4R80t3E9NI486+rhasjTUhkUJEA==
X-Received: by 2002:a05:6402:2681:b0:5dc:58ad:b8d5 with SMTP id 4fb4d7f45d1cf-5e59f3c29f3mr2825645a12.9.1741171976297;
        Wed, 05 Mar 2025 02:52:56 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3b4aa51sm9373776a12.12.2025.03.05.02.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:52:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] uutils-coreutils: use correct variables
Date: Wed,  5 Mar 2025 11:52:53 +0100
Message-ID: <20250305105253.3545398-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 10:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115748

* use STAGING_LIBDIR_NATIVE variable for LIBCLANG_PATH and SELINUX_LIB_DIR
  and STAGING_INCDIR_NATIVE variable for SELINUX_INCLUDE_DIR
  not sure why it uses native version and not target, but at least use
  correct variable

* hardcoding:
  ${WORKDIR}/recipe-sysroot-native${libdir}
  is just wrong when there is a better variable

* This path won't be correct for multilib builds where target ${libdir}
  might be e.g. /usr/lib32 while native libdir is /usr/lib.

* even with meta-selinux added to my builds I don't see any failure
  maybe these variables aren't really used?

* use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}

OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH -r uutils-coreutils
  #
  # $LIBCLANG_PATH [2 operations]
  #   exported /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb:33
  #     [export] "1"
  #   set /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb:33
  #     "${WORKDIR}/recipe-sysroot-native${libdir}"
  # pre-expansion value:
  #   "${WORKDIR}/recipe-sysroot-native${libdir}"
export LIBCLANG_PATH="/OE/build/oe-core/tmp/work/cortexa57-oe-linux/uutils-coreutils/0.0.29/recipe-sysroot-native/usr/lib64"

OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar STAGING_LIBDIR_NATIVE -r uutils-coreutils
  #
  # $STAGING_LIBDIR_NATIVE
  #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:425
  #     "${STAGING_DIR_NATIVE}${libdir_native}"
STAGING_LIBDIR_NATIVE="/OE/build/oe-core/tmp/work/cortexa57-oe-linux/uutils-coreutils/0.0.29/recipe-sysroot-native/usr/lib"

OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH -r lib32-uutils-coreutils
  #
  # $LIBCLANG_PATH [2 operations]
  #   exported /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb:33
  #     [export] "1"
  #   set /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb:33
  #     "${WORKDIR}/recipe-sysroot-native${libdir}"
  # pre-expansion value:
  #   "${WORKDIR}/recipe-sysroot-native${libdir}"
export LIBCLANG_PATH="/OE/build/oe-core/tmp/work/armv7at2-neon-oemllib32-linux-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr/lib32"

OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar STAGING_LIBDIR_NATIVE -r lib32-uutils-coreutils
  #
  # $STAGING_LIBDIR_NATIVE
  #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:425
  #     "${STAGING_DIR_NATIVE}${libdir_native}"
STAGING_LIBDIR_NATIVE="/OE/build/oe-core/tmp/work/armv7at2-neon-oemllib32-linux-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr/lib"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../uutils-coreutils/uutils-coreutils_0.0.29.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
index 19d628f735..d0a7532984 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
@@ -30,9 +30,9 @@ CARGO_BUILD_FLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'selinux', '--featur
 
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'clang-native libselinux-native', '', d)}"
 
-export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
-export SELINUX_LIB_DIR = "${WORKDIR}/recipe-sysroot-native${libdir}"
-export SELINUX_INCLUDE_DIR = "${WORKDIR}/recipe-sysroot-native${includedir}"
+export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
+export SELINUX_LIB_DIR = "${STAGING_LIBDIR_NATIVE}"
+export SELINUX_INCLUDE_DIR = "${STAGING_INCDIR_NATIVE}"
 
 # The code which follows is strongly inspired from the GNU coreutils bitbake recipe:
 
-- 
2.48.1


