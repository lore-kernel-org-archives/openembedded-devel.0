Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8DBC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:12 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19825.1786922650721101432
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D5sbEQ5l;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dcbade417so2767775a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922650; x=1787527450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxH+63f4dBPqTK6TqEDSv3aI6cNiOjw3xkE4T2zG2Ho=;
        b=D5sbEQ5lPHFgZnU77h9dAXx/j99u7yJ7hs+srirkPlBqGeY/m00+OUAnGPC7oFWWJv
         Ed4JaKOjZNkDtCNV09X89KzPF6Z8oB1SKw3Ob3ua1CtwVtBhbPfKeWKK95JjDaSmHmvu
         fLlyMFl5XG1c/YgGeSbRRJbw5zchKRq8mX1EhcjNguYU6/5nbdrRgpMRh0PRArUM0TS8
         Z1evL6ZWvcerGtkMzPhLxaAUA75WiaSv36yhLDp8LhpHEreUX+ixW2y90Outydom2TO1
         fpTG1PqcqHJ5w73gh2lBoRlLA8DjrzgKjvyVKv2c2CBb/UY4DELqXkwwaJ4jxjYTJDou
         kYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922650; x=1787527450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxH+63f4dBPqTK6TqEDSv3aI6cNiOjw3xkE4T2zG2Ho=;
        b=jG3Dezmt/H3AyLDLnrvhEXqxhBSKiVexxPulaNFONvdpJrFfbSyOsAnVVLwYu5ey8f
         XA92y1yTtDA/iQTaC1GhAmSDauO4QDsNyBubqy+bRuZOgpH+CiSLpj8mKOM/7scradQv
         T1r78uJccAyelZDkrY90Ncp0asrJWduxLJ8IQJ7a/bjk3khIAWlywOv++ZOchazYAvVI
         bnJCa0cn9hLCsNzZ5zeolWNTUi6LZ1PqdpyoDB7MtGjchXHYVLBBDFdMPnbXFEnmzyeV
         Q+TMYRCoLbct9HPDU90Oyp41r3o6gLwp15f6gSle2HLXJ4R2YVvVEy/tcaTxkmUF/WHN
         F9BQ==
X-Gm-Message-State: AOJu0YzNP2zXsZtLQfhLbpeBq5eAw5JP1S0+AuXdxoUiRdtlNRSI6LoW
	S8wZomuq8eKfk0rCTUFwphsWsuQT8E/sFAtW68cBft8pUEMvYswJg8TG6woi9WyL
X-Gm-Gg: AR+sD10YRte7Yy6wxyzsvK00wjIVdUi9EuJmJxTrIzCKovXwmuo3/Qu0Fe2FGP8d0ax
	32llqWjd/Olyx5oIWwTL2mgh75JSie9p3IyEuSxRN6yOJVhXChOZMfa9hwf0eO2Uoi0kTbYzX2H
	Is+9ZHI9qhTdJYdJuDYZR4jb/RBuHZ0VfWJICzm8KEyQL1v5WOdUx4044BxNEYw4PbzWPLBy+PE
	VMvtjt9fi5PUZGvnS6gLLkcRxSQxOJhxmByVTTSXor/8718OIPlX/Esalow0poDzhhJiMpCZxHC
	mrOyIPRL4enOVvOWVMwNkulUqJtQW1ImQ4qzjvcrMjhfIVrX+gkeJyu0vjhw4X3DUV1e3R8MCgV
	z4+007p3xynTyINaM172WRNIWoH74oCu6fnSkOraOUcnv9wLhn0JE9T4btSpE0ufipa/yK3Iv+A
	CjrsT7aFfJ4SXmcz5U2DAgNyJnVmyDw4HdSwSeUAapmXVCn7XuOAtEgJaCuLXrg+mVvtskolcnT
	DzPeTYQvJ9veezJ+ZF/9rFtUfkfSjqoo1tToeUMm3oH1QnVgeapDJvHKyaklQi2j5Vbrb45W+Hd
	dACpK32VB7Dec05dAAa2zaniSKofdO8/JU3cdIY9H5qMybuiBnof+kGUqvu/YAFuAHfxAAzm3pz
	0fh2Y3dDFYy4Pc/xGHZgtmFjpZwQHTF1asuxm4aJ1ax0Erg==
X-Received: by 2002:a17:90a:d2cb:b0:392:c80b:8ef7 with SMTP id 98e67ed59e1d1-3933bcff9c2mr22949656a91.18.1786922649907;
        Sun, 16 Aug 2026 16:24:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 06/12] python3-google-auth-oauthlib: add python3-cryptography to ptest RDEPENDS
Date: Sun, 16 Aug 2026 16:23:52 -0700
Message-ID: <20260816232358.1947922-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129183

From: Khem Raj <raj.khem@gmail.com>

Needed by the ptest suite.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-google-auth-oauthlib_1.4.0.bb                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
index 3f56b5b45d..a6c16c4800 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
         python3-click \
+        python3-cryptography \
         python3-mock \
         python3-pytest \
         python3-unittest-automake-output \

