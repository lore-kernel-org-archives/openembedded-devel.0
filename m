Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8296C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:49:46 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.17193.1736776180496134222
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KnGsBRAl;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaeecbb7309so809333166b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 05:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736776178; x=1737380978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8OhnnDDqKQPUCZVrX0AriicC2x5TMgQTpPYqWCMvAGM=;
        b=KnGsBRAlYV9rkP9lTKupmT1qldWKeXHBLMhMGhYTgDi3BIyptdf/2RUBMl8TfrOTei
         jOPWnO8xt30jv42Z4X9SRLv3TBx7P2Ud5eUAt4znrE/jvzPEFJIb2R6WyxpvYCCbwUo3
         dn8hnwl+PzKbBBk9TMz4km0oBVcXj9gUN7qzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776178; x=1737380978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OhnnDDqKQPUCZVrX0AriicC2x5TMgQTpPYqWCMvAGM=;
        b=FfkuiTK1guLzBo199pcxHMSBIbacy+ySu3AYuUaCOyJMhs2S2gxuK5gMFN51Afn5n3
         8ikDJI9ii8jgq7xvWKee2oR24Bj9lxJxHDVBGxTfbL4MxI+3qDnd4+QyE9LoywPGqPB8
         eDnJP7sE0OsN/pZTxyhUTLiOBHTMC5i4UWqv2OmkQEU93h/Cg6atyC5d3D1r2KaLPSLa
         /aHC3ZrdDxdvKJfqXe410lBM1EFsn2UmD/rZ4grxlxbguhLKoiz0oaS9eFajjeb5p8jL
         6P7XQ7nYxlvfkdXU3pajkCRnxgvh7hBbphsf5Pe5n07UnxRr/LQ/sg2NAoPl6DB+h00K
         Dl8A==
X-Gm-Message-State: AOJu0YyzQS5V0dgCoAYPnb6WLiohz/53uVz/NiqsldfZtKVQWC/aapBM
	TQO+GwS+nYsWE1rjmIV/YC8zd0wTjHYvrQhy1JuBoHGfmFEfT/ZWyqETwtV7ePy7vJJGIs7hSye
	7
X-Gm-Gg: ASbGncuGPZY5u3C+kXePVLsuZJ5ixC7wXDNcEjgGH5qwcikE0gkdr3gqOwO8h4AlKVY
	rfatljRKvNqf2xCP/Pr350bmMZtw/M0/qdrcHM5UIvddwncfG8GQ+/nGhu+LDEJttRt7J2JRaUf
	1AJg0dPUOQff42wLaVuB8U0O5wyCf3RT9c7yzLaeM4T9302zbb4Qej/CGPOnFWbZZZtY/JD1EnO
	LTzqAk08q6wi1UOzsOackN9IQNmRhZe1u+IpT5TmKdBPVPP7WIUyS3Z7kXttdbwEjopSL4=
X-Google-Smtp-Source: AGHT+IHCbMNwTOZ8ech9KXpUy1qfdlL0af6xlfiDGpaXMEynIcgAtUQH0TK9oKaVMFold4U8YjreHg==
X-Received: by 2002:a17:907:1a4b:b0:ab2:d721:ed8e with SMTP id a640c23a62f3a-ab2d721f254mr1046016766b.39.1736776178509;
        Mon, 13 Jan 2025 05:49:38 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dad57sm509938366b.66.2025.01.13.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:49:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-pydantic: Upgrade 2.10.4 -> 2.10.5
Date: Mon, 13 Jan 2025 15:49:31 +0200
Message-Id: <20250113134936.3594358-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 13:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114831

Upgrade to release 2.10.5:

- Remove custom MRO implementation of Pydantic models
- Fix URL serialization for unions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.10.4.bb => python3-pydantic_2.10.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.10.4.bb => python3-pydantic_2.10.5.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.10.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.10.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
index adfce81b66..019781d51b 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "82f12e9723da6de4fe2ba888b5971157b3be7ad914267dea8f05f82b28254f06" 
+SRC_URI[sha256sum] = "278b38dbbaec562011d659ee05f63346951b3a248a6f3642e1bc68894ea2b4ff" 
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.39.5


