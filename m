Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E1FD73600
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 12:17:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.132922.1732969056529600712
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Nov 2024 04:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YIEAmCJj;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3824aef833bso1929114f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Nov 2024 04:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732969054; x=1733573854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pru7TvbJ1AfBXSyKdm4ofonV70H0SnDN2BzYbeC6uMQ=;
        b=YIEAmCJjjdIMtUpRP3PIjQdIEFFBnXl88L7vpM9qU1uqZZbnUVAjkyIGzFe6W7bNpg
         AFH8NT6vqMdx5LNzF4dA83dk2koJ4cIRRBCIH4vSEiajIskVdLUio4nqQU4FoLBB6RW5
         CDpIqREQFT702dpJgmWAj63N5rh++dFWhDM0CNk6LB8WEUqyucBwOoGCtB93wGY3WsaD
         w4j9ZbtD6dWFii7yxp9GnlMwqr7ibL1csXc69TlHloWop1U273ldl2oMhTGjbWn4Fs2z
         GYRWsNRthZnib1CD82a6numu8K9sBm0IFCWp1YPCFt5r4uwHrZeHdAUsJxg4hAIeC2kk
         1z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732969054; x=1733573854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pru7TvbJ1AfBXSyKdm4ofonV70H0SnDN2BzYbeC6uMQ=;
        b=jrJKPPTlQEUNk16ibOfSm4AziLsN8xH0QS0Xq5gGoAyeUOdAAkFFKeiLyhtw6hB70R
         wc9F2RDAxJdrDG6FklMSoFJzvCElHnc9soZCPdKClocSJHoP1MXMb541esbS0GTuDOD7
         jrx9oLMQRshWfcClwcn9KIavNrOq1c4fNecwjfFBZhBNn3n+hAjVIafw6D5SXZlhT3Xp
         JUBryR1FUyGxy+W/7YsCY5fG638vIzcDZLjuBWAQLDZmHhH0x/F8pXoDY6URU9y80zdo
         ZS46IqBqtf+GnCn14DD5sM3po27Px0vd35o8vxl2sDqTKNgn3PzyQ/j2y8zXeLNSv9HM
         sfCA==
X-Gm-Message-State: AOJu0YyqzdbmHBwuW4INZUgmXcRrugzsLdm5/xu2HL5PwuQftcReiF2n
	c/yRYMd/J8/sQzCs3gSNiROvSpT7LeqTqBbc6Nnppp2CObYv8a3NGSKLBw==
X-Gm-Gg: ASbGncs8GgtZFEjiv7Lj+n0qf4PgOJui1qAmTej61vnClQ6J7G1hIsvRWIXgiaZnxgJ
	i4j1879fc5sdvQs/077WGWpQFUdy67RCgItfFgaM8vwrecAGetZGNCD6Uq5yYQOVJVE96beVjTy
	+4tqy7WYk9zllLe9R06+VxGCns7FX26QGGiY/4ghRX4I/eNQ0DfnnkFcDwHyVx0GT7AaAjzLKTz
	FIiQA4P23GFmlKN41ecrib5iX8Zm+hk5LoyKNsWR46tMgmOfmJA4r1Yy3YkVWQ91vzMj9kf1zk=
X-Google-Smtp-Source: AGHT+IH6PCze2jF1sySL8ks+wO0IIwoFmowZqpyPoZdrDEknFwZe4l7krxnwoUQ4HQ5SllwvkH5LBg==
X-Received: by 2002:a5d:47cd:0:b0:382:40cc:5057 with SMTP id ffacd0b85a97d-385c6cca799mr12822411f8f.8.1732969054376;
        Sat, 30 Nov 2024 04:17:34 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bd06sm85574825e9.3.2024.11.30.04.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 04:17:33 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-ansi2html: drop python3-six from RDEPENDS
Date: Sat, 30 Nov 2024 12:17:30 +0000
Message-ID: <20241130121730.3953-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Nov 2024 12:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114127

Looking at the history, python3-six dependency was dropped
around version v1.6.0 when Python 2 support was dropped.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
index d817d8ee5..cb9234b90 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
@@ -14,6 +14,5 @@ DEPENDS += " \
 "
 
 RDEPENDS:${PN} = " \
-	python3-six \
 	python3-compression \
 "
-- 
2.43.0


