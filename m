Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6072EC25B7C
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 03:30:04 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.5277.1716953394339334084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 20:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RyhrRxAS;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-65894e58b8aso1196955a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716953393; x=1717558193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeM6Nll0W0F8Z10vgqbi82eO1mrG6600nWe3U0IZxx8=;
        b=RyhrRxASWl5zgPANbiiD1FWRAYNaLguhojiIMqlk3PqekSh+NqzbufiaVYe37PdUFf
         FRcRAfPTdeyXmFEgpPqoJiEo8lAyRK3MJzpI2kDIEuh0LS/RJz8bFPsk+wWOr+y6tghE
         XD7fkdgcUx9D2fudCIHkg5953nYmSPBIhR2dQDyEd7e14djNUEqXjXwc4Lu1JfS4blHN
         c5f8vWzmpP06g/PLjT9+QUhnitxLo4/qhaV2ClBMciGKqTZB/gvSH2BLwCFtmYPer4Z6
         dR4lY6C0NsEBu2RzbP8vV31HMJDV1MoP4JwlPKYwjRg08/MQgE4IfhYE00kPMyLTLrhd
         QO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716953393; x=1717558193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeM6Nll0W0F8Z10vgqbi82eO1mrG6600nWe3U0IZxx8=;
        b=QJw06y3YpPrLbI4Vm94TK6QXTmzqH1jm99Xry5cnPmY26A1o6WdS1jpUI6jt2YP+QG
         XeunM/ZNLLoe0Fq8g3nihHtnS17Al1sPtZHSx+gkA+TtBWz8hwCO6uE1GAEHuXkxoqcP
         PJ2K6HdQCZkYu1O2xsLpUZetRVG6G31xGO6VTOUZunno6Lc+PgR6Ba2IFys3ALcui+/M
         P3WA1nS62QogO40umT0JADV45E6M5ryi6X4wB1IIoij6cELn/Qc7y5NCTVnC14j3Q798
         gKx6/rreONKIYXZsCooQNYoWofwtx0l+78sQMVNW7qyiKMfv31gc6vsD9wX+vT5SeNNE
         YsOw==
X-Gm-Message-State: AOJu0Yz+B1yQ8NJSY7OiJq6CFRCL+HSA8X89hOZFCnkOhiVGDzINPILd
	9Sg7KSJFV7y0mEk7hozvK/etJPx3ls++LqRsHuDAHBjKC/xSJidBBRiWBrpJVUI=
X-Google-Smtp-Source: AGHT+IHiHZxSc2xK8yL+GrMlpkxF+eFOD7CQNg/rfXypQ2ihNe2LMOBOO40A2t6Uaj7RMB7c2HNlRQ==
X-Received: by 2002:a05:6a20:da8d:b0:1af:cc84:f7ec with SMTP id adf61e73a8af0-1b212d5ad0amr16261768637.4.1716953393522;
        Tue, 28 May 2024 20:29:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3972])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c00f389824sm2341384a91.1.2024.05.28.20.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 20:29:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] protobuf: Fix build on riscv32
Date: Tue, 28 May 2024 20:29:47 -0700
Message-ID: <20240529032948.150704-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529032948.150704-1-raj.khem@gmail.com>
References: <20240529032948.150704-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 03:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110603

Link with libatomic since rv32 does not have 64bit atomics
Fixes
| riscv32-yoe-linux-musl-ld.lld: error: undefined reference: __atomic_load_8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
index 3241345963..4f8515471f 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
@@ -116,3 +116,4 @@ LDFLAGS:append:arm = " -latomic"
 LDFLAGS:append:mips = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
 LDFLAGS:append:mipsel = " -latomic"
+LDFLAGS:append:riscv32 = " -latomic"
-- 
2.45.1


