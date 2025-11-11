Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653F5CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 04:31:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10237.1762835493276791688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 20:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mVxvRUq5;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2980d9b7df5so18081875ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 20:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762835492; x=1763440292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7TsDK2dJQ+FDS4HTKGVeDzd4T3lq3yW0aViulRBaHY=;
        b=mVxvRUq5dMg2Jaq4uQirsTreJ+ddKQ++Y7fKJOf7nlnvyrfEHPs/35qoDAko5DUZss
         SOZnJ5mKRwyG8dwxgUuSQLu5EiOINSfHc4Nuvn+D6wRr+6LdmxdhGd3O3dPDYGfKG8nX
         VTP1N8XVORL0kjSRcr68NqsIVfK+JUpcsbal3fMJOkFK84QCxTp7m+7vKdhV/zRaKYO8
         UJSpN0GiqjYAgwv1C3Lv09fgF90GP0hUbWtRyBYM/qhRIKJ+27+hf6UkZHPb8ZoA9xGX
         R8c42evWn2Rt5655QN7u1eN3JMSnDhnJh+vUPYfCnWM8H4ZfyvnkngNIOZKbPkM6bDZc
         Gmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762835492; x=1763440292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7TsDK2dJQ+FDS4HTKGVeDzd4T3lq3yW0aViulRBaHY=;
        b=jq2u56Lht6NjZ7nzpUa7lBITrJk5oUTJckOSTvzxT0Ym+DuW+VQXLvhTEhF1BS9b0z
         eOeY11lUdiTdm+yGCL7VulOPz/hRTPf8akvcGyUg3i7lrknp937l6Xb0+hs/aAGqZRRb
         A1WKbC4AkYlOlZkhYfHmYfxpX5hdCNHj2AMXT07y4TK3jVIwGdaBxiPcIMd8hMqSB9c1
         VPV24J6O7S/0YgTl2ApeNcWTTKJHE/hTmKT39FEKdqShVI5thQ6d1bZQwrqSzxL3uoa0
         th6hTEXtMiG5INAlykmfA56TIHx341G8XzSZXULInga6IqfSHHDoR+m07MZwkJPU5V+c
         +nsw==
X-Gm-Message-State: AOJu0Yyb2k3ovlB7e/VhRBmOrhdiPIMnm+qR+GV44PNzENLCLUUrQqiM
	PT5DDEkySS2xeg7DmKgRNiCaJztCAIXtx1iDIQvgjrz1qh0Uw6CptLGUSUOTMIbr2v4=
X-Gm-Gg: ASbGncsJjuksRbFuTiSqJSb79B/i86Xw8jsTvGsdL7jVfWejXSykBfC0msYHalateqP
	OUoFoVNqpQZWtHeccBP9edi8wZIt3jmvkM7fKOIdmb9eg7evbOLDe/jZjb22UqFt/UiJUuj5swV
	oa2fW/baxv0y3ouyVgDU2o3Hqbms1f2PJ5DiHgB9HlnQZJv4fWgWNb9l3/L1OQ1eZZfNrp159o+
	yA9Q4UPbIMZAXEr5CRjZ+BlVxo/k0TkmM6B2ONdx3obV3xZPaLP9Ne4d+pT7hKGo/3+cM9xjT42
	iM3IIfpEPo5nzom5nPvXWR2jXLIf8w0LLWT/ohs47p7tO0m3yW+O5GLxoNVt6q2Zh5Zg8W+CWfu
	SxlcUZ3rtaD37AJCHGhsfBcf7sVD8Gu7yMjq5UAwL17V7r4dxQVxQS6sybL2p3/T0Ls8zLCd+O2
	kbTamaCv//kxpMRxrzDDiuIqafuxLWgzWhdkdOLtzRxfa6gVszUUz9YH4dI16P3w==
X-Google-Smtp-Source: AGHT+IF1qq8ITE7JtiF8qOmRab9Vy4hos1i2OAb1dg9GA7p16PLNdUjd02kuiflULkEs4iX3wNd6Rg==
X-Received: by 2002:a17:903:19c8:b0:295:6a9:cb62 with SMTP id d9443c01a7336-297e56be1b5mr152389505ad.35.1762835492366;
        Mon, 10 Nov 2025 20:31:32 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1b8csm167771415ad.85.2025.11.10.20.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 20:31:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] packagegroup-meta-oe: Enable heaptrack on riscv64
Date: Mon, 10 Nov 2025 20:31:25 -0800
Message-ID: <20251111043128.3063095-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111043128.3063095-1-raj.khem@gmail.com>
References: <20251111043128.3063095-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 04:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121475

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0458662f97..d7d6c08693 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -311,7 +311,7 @@ RDEPENDS:packagegroup-meta-oe-devtools:remove:mips64el = "luajit nodejs"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc = "android-tools breakpad lshw luajit uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64 = "android-tools breakpad lshw luajit ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64le = "android-tools breakpad lshw luajit ply uftrace"
-RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "breakpad concurrencykit lshw ltrace luajit nodejs ply"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:libc-musl:riscv32 = "php"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:aarch64 = "concurrencykit"

