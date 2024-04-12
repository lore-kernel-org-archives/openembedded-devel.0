Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1AFC04FF9
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 06:31:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.40695.1712903475732186571
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 23:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xl52PdzY;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so399082b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 23:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712903475; x=1713508275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioNDMxf8eM7I/I83ZPdzrYmSNwfhfmpH6KMrdpUevkY=;
        b=Xl52PdzY8mRl2/7rVbsx1D+ruKG2pZkS02nNE+Bs1PkCKw/FZHHHiXxWRckzkV1Q3x
         yA8jAYcr0Dl/eGwhaeZHKXMK8ONW5yrd/v+n3N6rLfS6xlZeNs2qJ4ZSBwBFnwgyqUbc
         NYLZ75Rs6PWtVKU7eBMwCgEYLFvIfYVxp8y2lzM38aUj/1Kq98djnZMv7KQ4p7x9rP+s
         PH3jyYY+8EYbB1k/rXbbg40zJbBfjNAfMWJVqmK14Q4qBvmlU+Wo0trWVOoDasTRIw65
         tqCRayvEZYaBCoIpBEAZls6MAoYZf50S5HchhetZF7nVxrKwn3IWnrxfOfzn70V5fdkz
         awcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712903475; x=1713508275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioNDMxf8eM7I/I83ZPdzrYmSNwfhfmpH6KMrdpUevkY=;
        b=B16+N404RvWzu5qpjTV0YlgM7JTLDz+nt8CNblAxSLUpY9QKiwyoFmt2yRPpU+evLu
         j1RVAKua4q8O5WG1UsHgein3hCHJweRE9z3Ko+rMu6IhBk4uXNqo6SlWz9JuoD9+nVss
         MwbnbeGLTMZ6DdKiATDovogls+b72gKuGhOlMPh7FIzwY/HyVHYqY0r9lQnFnUS/ZE3b
         UOy1pzox08yPkzHt3VaQJyaXB9oNUwChmt/qxXaZfG1Zd/ITz4Bn3LstXVrN9SkkLXpQ
         BfxouoeZ/NnByu2IMhG4CdatsXqtW0pn00Rfbg+b3kjE/DXk+J/4p81Bho4szYtcTp8i
         2y4w==
X-Gm-Message-State: AOJu0Yx20QNNnFIR5P3RojKVRBcdu0/1ZTbshsFqcwlTrywy5FEu2oIT
	xHygfPxlj5pAoEGsVm68VEtZWscB3TD4Ifi2of9zLIZhMgNlZ22DlGH0kqWu
X-Google-Smtp-Source: AGHT+IFYOR+l29vBl7inFUIJpu0e0+ROt2DitCGO6mirsDCIShPu9lMw3iKJKbWRaeH5svt9LDj8Vg==
X-Received: by 2002:a05:6a00:21d0:b0:6ed:21b2:ca54 with SMTP id t16-20020a056a0021d000b006ed21b2ca54mr6391868pfj.17.1712903474908;
        Thu, 11 Apr 2024 23:31:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id q18-20020a63d612000000b005dc9ab425c2sm2103036pgg.35.2024.04.11.23.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:31:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] ptest-packagelists-meta-oe: jemalloc and oprofile are passing now
Date: Thu, 11 Apr 2024 23:31:11 -0700
Message-ID: <20240412063111.1267280-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412063111.1267280-1-raj.khem@gmail.com>
References: <20240412063111.1267280-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 06:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109935

Move them into PTESTS_FAST_META_OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 48f3412b7a..f5c7b9b719 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -13,6 +13,7 @@ PTESTS_FAST_META_OE = "\
     function2 \
     fwupd \
     gcab \
+    jemalloc \
     jq \
     leveldb \
     libcereal \
@@ -32,6 +33,7 @@ PTESTS_FAST_META_OE = "\
     nlohmann-json \
     nodejs \
     onig \
+    oprofile \
     protobuf \
     sdbus-c++ \
     uthash \
@@ -43,8 +45,8 @@ PTESTS_FAST_META_OE:append:x86 = " mcelog"
 PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
 
 PTESTS_FAST_META_OE:remove:libc-musl = "minicoredumper"
-PTESTS_FAST_META_OE:remove:riscv64 = "nodejs"
-PTESTS_FAST_META_OE:remove:riscv32 = "nodejs"
+PTESTS_FAST_META_OE:remove:riscv64 = "nodejs oprofile"
+PTESTS_FAST_META_OE:remove:riscv32 = "nodejs oprofile"
 
 PTESTS_SLOW_META_OE = "\
     c-ares \
@@ -60,16 +62,11 @@ PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
 PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 
 PTESTS_PROBLEMS_META_OE ="\
-    jemalloc \
     keyutils \
     libdbi-perl \
     libjcat \
     libteam \
-    oprofile \
     ostree \
     psqlodbc \
     pv \
 "
-
-PTESTS_PROBLEMS_META_OE:remove:riscv64 = "oprofile"
-PTESTS_PROBLEMS_META_OE:remove:riscv32 = "oprofile"
-- 
2.44.0


