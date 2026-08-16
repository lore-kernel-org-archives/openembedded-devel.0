Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA53C5DF7C
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:13 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19827.1786922652584091843
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wu4VIvmi;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf452def93so29726985ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922652; x=1787527452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AK94nwjcb+ICwqMcNYI/O9fYy57MaG38yMiqob+GP5w=;
        b=Wu4VIvmiIqsXwZZ5Fjn6LWgrgJXFTTzLPmBMV2oy/bMt9yDwMPftjIVDtWHSaS/1zQ
         LQk6xaYYHck2JNxfPyDJAS1KUKrB9CYSSCRs8Cd8M1fxcIH20X79Bby3zc6YnU6FH4pb
         syv4HZDK0HLXlWyrNo828HlZBR3xee7pBW7cXbrWjpppclmZcDiOWndXEg1qtaDsMHyI
         02sVBLeZn8IWwatH6YInKb1l3YwgQNRxKQDlICTCGqs8lhOGaf6L+x50VFdwwlnFN5f5
         +t7uBLgeI21AnwwkG78HIYSe6DI8zfXeb46ljYOQI+y1BmNZ0Ce2J8MAAHcvHaRKtAmf
         RLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922652; x=1787527452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AK94nwjcb+ICwqMcNYI/O9fYy57MaG38yMiqob+GP5w=;
        b=IH8c2eUhlsHKincLY7Yv1LAmL/W3HUjjPlhLsRcnYgE31ZVUkZG9u+bhIVnLCcf3cF
         zB8Fs4G7lL2+j5Y3yD8gj1mQfBH6L5PVaus/Lvbqabob99w1tDtDg0z7MgV9bYyWJJt3
         ISyVAQtSRTXFeDMbJ/hB8pZE5OwoctLlkxBe52Uykv/AO6lfgTSPW9jw343hg2uBVchh
         mq5xJxA/fKgqP616zcyJRJoejD6TMMJjxo/MjRTtxwr6hxVlcS91FunrNy49/ceGWpiA
         1oenoC/AvVmnW6LfTPi9oX9Esl00lT9VsJZjWvVKuC8yk3P0aHKQ4yri3D9HoOHvdnIA
         pRlQ==
X-Gm-Message-State: AOJu0YyQI5yuvMoFRcEE1nV2L/BmYzooQDgFNrN67FL3uTLB3pk7woDh
	oCvuDMt6ZjQkAsqZh6VJ+KU8QNVLg1hR9spT94pssG6wJW6DfV+y3orOg3wBOIuM
X-Gm-Gg: AR+sD10KdfcMtchje2xbApDky4vbVHWDk34oZPBLTHYhJoz+eI0kLBzgwZnByy20y4K
	CsL2kuWJ0vUdfJyKffaTlcql3inU1kloxWGgiGaG7Gwtv9iMZUAhwBZ5f1hjNeGEP4UTSc4fPYQ
	WbaaQO4xmZjbpWCu3xUgFNV6oVLd5jOaxUeCz8K68PpQ85oxwwx/pT+28O/RJ2vI0/pm3AGtdBL
	bZ/u9noSMLiRbye/z2Trbiq9QCAIiWLAqR3+6bEXfzkrI6KLrhphXpqAzOwRB6nzftg+u9uGN0J
	4ErYYncIdtNUkppUb89Mo90UJtGeuDrnYAvnLFi+guWCs6+FR4ZtK75AnJAMjfDpLHK4cZho859
	kjnFdFXGH6I9uuqXhnLVanrqHX0E2bClr5N6Jz6kcDNoxsbvCe7KmUqjs8Dnti4geKaGm3lM0jJ
	PtEhwFs9+Hrpq0mEwPveUPfAeTSHyb7mv5qFZIl8C0qeS+HPAFezSKKNgZn2ID5bQVpjWxj3HAS
	lxpOFUsRh9itArvNlcMDAofaE1W7It/uLFKjMNABF0IEtR+5n0PJ4v1nIak/DYj0ML4S9XmDWB7
	ZZnhHsdx+Kfywa2CXiO0VmQ0q6PXUC9aqtOw3PHF/y/UPOkBoHAFRzY7So45ZgXKAnFC7EJG4Cm
	eFam+/9Qi65hiY2PdXXTU4PZI/V40whjziG5b5v750QM1Q4SZ7804Q/mu
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr286280475ad.15.1786922651864;
        Sun, 16 Aug 2026 16:24:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 07/12] python3-rich-toolkit: add python3-pydantic to ptest RDEPENDS
Date: Sun, 16 Aug 2026 16:23:53 -0700
Message-ID: <20260816232358.1947922-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129184

From: Khem Raj <raj.khem@gmail.com>

Needed by the ptest suite.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-rich-toolkit_0.20.3.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
index 3f54f47790..a0b1eed56e 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
@@ -15,3 +15,7 @@ RDEPENDS:${PN} = "\
     python3-typing-extensions \
     python3-inline-snapshot \
 "
+
+RDEPENDS:${PN}-ptest += "\
+    python3-pydantic \
+"

