Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF7AC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:04:48 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.17151.1747411483588369769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 09:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFtQx4jW;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso21032916d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747411482; x=1748016282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/PPLVU25oQJqoh8O4hxN0GGzyxwE7vQOP4tzpouFoE=;
        b=OFtQx4jWapDRa5agraytkr2JoxRSnxpuC7/opgSiJmm+dGBXBK2cn8MMoWBIRxARgK
         SynFaNQV2MxyBtQ8ejUsS5YltnjzGID3jps68z6CjKc/oY+13hrtEayvNPrmw20OVCXQ
         qDbl/kLVTFmoeTx9btVWHqh775ZfvxFAwOtSXjZlfQgOUqrPSwuyYsMnY8XrO7MDeVCZ
         Ien90SXDu3EXfP+dmMdPR0ip4kt6abGDi7sw+melMLH4l6PBM9qpW9kQbh56/ADaJqP0
         laI5JF3jOgSza+ar+3IKNCOuqSVO93PNNqK5JSoAsDeUJx70FRbH2aGpDSp8oQt8pqB8
         bjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747411482; x=1748016282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/PPLVU25oQJqoh8O4hxN0GGzyxwE7vQOP4tzpouFoE=;
        b=Fi2wDrPq9bLMUJWs7/AD4pIXtApl7y0dKeYqh5A8P8Lr/kvsiwxJu03krWdJcz8wOC
         7o6V9f6620NNrBcIOs2+ei1nfoRNhpTdRajnkyyqs8pktpd1X84l4ID2EAYkuic/aeom
         1L0/Es2/0msEWiJT3S/kAnDVsIoR9ypP+dMr+rSIqpUJekahvpFbozGE1veQdr2pA7ps
         aampp2fBbwScooTN0PLP5CIpaye5jlCUpmDbfujzs5AlnzNM14LA0XAD77x15+oWMBQh
         vBiSlxP+kk9uXRT7+GBkw6OZZV+ZU6vRCXFgDX30u6JDhiBMIn7R/YIEw0/iOmMN6SSx
         OvrA==
X-Gm-Message-State: AOJu0YxvTEMXgubKWpxCGiCQkJ+tf54sDCuY2CqcPBaMx9B3fU2q7WdQ
	XY1K/KhMo0W6hN6DCRtXytcZzHTyY5UCq4xCt1J5Sp7Zg9JBF9CpFCz5AN+Ti9AS
X-Gm-Gg: ASbGnct3nqfOmMoEMM52K8KWSeRDG36UY0GGM4Wg3HirB3mpcbiwDQGxDJhOz50r2H5
	tq2B6L1c+U53gUKHChtT5cUpu9nlrgTb4OnHJotmj0xBIFq1QOEvF0UhmiuYI+LVkeAIc9bXGmo
	2YPdG2/2F0d/w+d1eklEPRmC8hgfDfAgLUYpfkWqmy5VzZyd75G8WLZft9dfDxi88oIWL+kbw8o
	KhpAWgh0TEIZLYKuXoI0wDVohykkyzDfrBFEDVJUbpAAgjTvFXq9HbGVvhBPtlEcmQKtBOZ2z07
	Sv80xsx2oUqCBCaZwOXIP3HERC9t9OR1fjrhsE3Cpro=
X-Google-Smtp-Source: AGHT+IGxuAUg0AXz/PnYmUfeFcegKWKD+UGbIdBtAfoUEO6VVJ5G2HOUV88HtA7sBnZNHP327b1pLw==
X-Received: by 2002:a05:6a00:440b:b0:742:a7a8:4135 with SMTP id d2e1a72fcca58-742a98daa4amr6087519b3a.24.1747411471893;
        Fri, 16 May 2025 09:04:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b9a0sm1749877b3a.108.2025.05.16.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:04:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] geany-plugins: Switch to using libsoup 3.0
Date: Fri, 16 May 2025 09:04:26 -0700
Message-ID: <20250516160429.1391450-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 16:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117433

libsoup-2.4 is being removed and its preferred to use libsoup 3.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb b/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
index bd10c09195..9a19e5dc98 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
@@ -15,7 +15,7 @@ DEPENDS = " \
     fribidi \
     geany \
     libxml2 \
-    libsoup-2.4 \
+    libsoup \
     enchant2 \
     intltool-native \
     libassuan \

