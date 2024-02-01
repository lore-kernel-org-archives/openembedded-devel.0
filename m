Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21017C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 07:22:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.10550.1706772113761550817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 23:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eCzkEKjY;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29080973530so436496a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 23:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706772113; x=1707376913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OfM/3jU9JIwQGzoGuzwGstFQopSGfSC1nYefeETsns=;
        b=eCzkEKjY7F0Zf8KWYywopajLRfq/81RlFLXXcm3oCzqfIbZHPbiJd6fDV9v/Pz0jDh
         fb0HnGs+80Jw0HypxPtPldvAsucuemyXCVXIxKrSwtdwArdiElo9RNvU3eP6JaBFqbXx
         Hfk9g7OrPqinC5oyI6V4SGWd+nhVW2dAgNYOydfHdr2RRTqQ0CRJyiu561/XhV/kM6tU
         pqqTfeUo2AVDldljl/BbQeZyjEMTQ41UPtIlrbH5Rpq2yNzN9B/Xw+kgLcKLDzXM84nQ
         SKZJLpUdnBuF9bkJNrFihqRUD/4vdNylHmqGEQTMd09dB8fTT+yEH+GeGM1cqMuYPt4g
         R1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706772113; x=1707376913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OfM/3jU9JIwQGzoGuzwGstFQopSGfSC1nYefeETsns=;
        b=u4/NyewrsVihgmaMgclJ6ARWiNixkMtZT4zJZsdHH9bLg9CgaOz50mM03cRR2WnUzt
         QEJNB+oXwbNWCpoFqrIt89CLSKBlJZSEO3MxL14z+HlnPeohvzuh3RekPp0dnXDY3Jh0
         ujcM5lxXqzAf4R7W0RVyYJvj2tmFA3LIFtA8wIVlr91BYwMXav+VnEbusYiZWbRVNfgU
         qb5cYhFN7NF0vwZ9vI6pRm0v1UgtMugV/iHHZrZMOhggFTV1qCbzy9s2JeNTOe8OGZA1
         ils5Q3QcS2SAivI4sa3PBTweEe+P8u/TedFmaKNgOxklXP/nFKYU8hVDWJwo2K3fA6eh
         ZSJQ==
X-Gm-Message-State: AOJu0Yyb9tNfxreGUTwHKvflzFlFHiZBTfSbu6g+7PzAhyYmwRu57VJC
	ajKXaGK4QWysUnvlVtjf1Z+TXoa0dicGzq0sfv7RToCxIetvZgCLD3AMU3Qv1Yc=
X-Google-Smtp-Source: AGHT+IHTmZjSsItiy4ZIyQNoEynbSvXw8jP9kk1TLtF9EMUM/acKWwZ4ReaZYNO0GmouLiQlo2QLGg==
X-Received: by 2002:a17:90a:d302:b0:296:1033:c97b with SMTP id p2-20020a17090ad30200b002961033c97bmr917490pju.49.1706772112891;
        Wed, 31 Jan 2024 23:21:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8157])
        by smtp.gmail.com with ESMTPSA id ga20-20020a17090b039400b00295e671dfb8sm1026571pjb.22.2024.01.31.23.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 23:21:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] bpftool: Add missing dep on elfutils-native
Date: Wed, 31 Jan 2024 23:21:50 -0800
Message-ID: <20240201072150.3751126-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 07:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108515

Point host CC to OE defined BUILD_CC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 317ec19266..b22334fe90 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -2,7 +2,7 @@ SUMMARY = "Inspect and manipulate eBPF programs and maps"
 DESCRIPTION = "bpftool is a kernel tool for inspection and simple manipulation \
 of eBPF programs and maps."
 LICENSE = "GPL-2.0-only"
-DEPENDS = "binutils elfutils"
+DEPENDS = "binutils elfutils elfutils-native"
 PROVIDES = "virtual/bpftool"
 
 inherit bash-completion kernelsrc kernel-arch
@@ -15,6 +15,7 @@ EXTRA_OEMAKE = "\
     O=${B} \
     CROSS=${TARGET_PREFIX} \
     CC="${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}" \
+    HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}" \
     LD="${LD}" \
     AR=${AR} \
     ARCH=${ARCH} \
-- 
2.43.0


