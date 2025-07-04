Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D660C83F04
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 01:28:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3087.1751592486137385045
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 18:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Td6tByDU;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236470b2dceso4798275ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 18:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751592485; x=1752197285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnYqPl47KxOE0xA5lFFK6uziVwcF+tk0IH+RX3nKvls=;
        b=Td6tByDUQBGqe5GyUwmfLD1+/3/7MuN5omL37s7XsuPY5MqlZ/aWAareZVfo8bnHhU
         k4BZgGNJMDcMK3jKu7Aqt2q2VTLGS5nEdoD4L5LutmZIQ/POISCkEEgbw3rBR2loFXFR
         dnQcf4qXH23aJBHR7iwotPz9cQGxNdi03Ojml99Xmyl8qQscOqUC11Jx+Wd7XNI7EIpL
         tC7mcB1aI0AhUctAGNKiZHpOecVEi2eAvsC1IjDKb4tGSEwD12W8NanVE8cg4xkFOJSP
         mgq6O+cyG5HkEHpBQ82QCSliCABih7mZtfj9fvJ/TYdMJmIlozAyLTJMmS0ucdkt+2xs
         lRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592485; x=1752197285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnYqPl47KxOE0xA5lFFK6uziVwcF+tk0IH+RX3nKvls=;
        b=BTsLa5kZdJ/KYDrPwuai+8WuvW92mUKJwNnhYqOI1UVV+iKbVTQa0suVotoVNus0IX
         vASiVVH9Nz5Go7Y75pO7aeFJ4IiIUnFObkDIZ7eKzZObdfEflVv8xPHEoa+Lq2C1NNQi
         hUMPJQKQ/EaFEbL5LSKrORC3zqMtGZ5kP1A4Eyw7h3HY7maByucVTFmaKoI40lfm0U+B
         5zSZWrNuzl+9EElO3rd4olgyrdaaqzSHB9nPziI3F6svTYmlRyJIymHUPaoh+MGOimd5
         XF85kjXtSUdKaN0uvUqE4mXhDa4LOmelKXPxSAxqRLBt6dQNfBdFHIqwSSTeRrX1o1CY
         lPsg==
X-Gm-Message-State: AOJu0YxE2OOkIzMtpSPMlWp17Yd8U+A3Nj5noYh4aRh66jKuqUOW1v0N
	2bYkN2DYJ3XWjX/ZzMI3LuP2PKBWpT9D9JW0bwoa8uoWfY2dGfv89zK9dLkXZK+E
X-Gm-Gg: ASbGnctTH9BYwgiBdKatGR/aaKeICo96QS8wYHsd6WpT6R4s73B6Nt4YvtRpTOMx/xm
	Jko5l6UPoaeU+BoAjg+5iv7fFYBZp8o4lRyGc9Fpna6eUnT9/bj0wx5rl5melfHGNpnNGybQIDD
	DmxAtSdnuDuLJJ/qWD3Ry+giZO5XDgw7a6YGQGSc6+Amj4vSNj+blQtj6hDCnz1xtX4fi7ECREH
	Zjst5n5BXYGGmu1Nxlv/B5q8YGSRtpoAehSomZJWqSo1bUCNt6ZbbMjWCQkWLBRLPDG8K5ug5YO
	mBEzS2l9PlWAh+kLAXcFhHiawrLBjuJbpm4PEsrcM1Uv7WrKO0nqkw==
X-Google-Smtp-Source: AGHT+IHx7uCQ1KU4oMzz2gf0dRP1rLEa7sIHfwJqcv8SJSRroRHQQX6Nuu84F6rCkY/5RScsmRE7rg==
X-Received: by 2002:a17:903:15cf:b0:235:1b3e:c01c with SMTP id d9443c01a7336-23c875ac9d6mr3885635ad.39.1751592485150;
        Thu, 03 Jul 2025 18:28:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bf52asm6735365ad.241.2025.07.03.18.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:28:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] pstack: Always use gcc to compile it
Date: Thu,  3 Jul 2025 18:28:01 -0700
Message-ID: <20250704012802.2817020-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 01:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118227

Fails to build/compile with clang

TMPDIR/work/cortexa15t2hf-neon-yoe-linux-gnueabi/pstack/2.11/sources/pstack-2.11/libpstack/archreg.h:94:1: error: member access into incomplete type 'const CoreRegisters' (aka 'const pstack::Elf::user_regs_struct')
   94 | REGMAP(0, regs[0])
      | ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pstack/pstack.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recipes-devtools/pstack/pstack.inc
index 9831a74d1a..1c85b12061 100644
--- a/meta-oe/recipes-devtools/pstack/pstack.inc
+++ b/meta-oe/recipes-devtools/pstack/pstack.inc
@@ -37,3 +37,5 @@ FILES:${PN}-dbg += "${base_bindir}/.debug ${base_sbindir}/.debug ${bindir}/.debu
 
 PACKAGES += "${PN}-dev"
 FILES:${PN}-dev += "${base_libdir}/*.so"
+
+TOOLCHAIN = "gcc"

