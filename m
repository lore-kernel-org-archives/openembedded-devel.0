Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959EACEB2D4
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:00:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8033.1763211606490643262
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BnhcnCxX;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711810948aso19773975e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763211605; x=1763816405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgWKSOdmR/2/aNxOM6nJ0Z2xxabRbyUMHBIAKxxTz1A=;
        b=BnhcnCxX2O6YYL5K5O6tbKm0FwuoKz4gI8bVe2Cs/nDemLbjkVUMXiMgO/vffbzaqA
         3SILB3eD0qa1gicyN8R+stJCB89OvEfaoZJYOg18rTmSYhyjjplwvWA8cifMjpCbctQ9
         B/chMJjPki8O8fAKCfXCRTynQrZHYfkxvNIUIc4WiL2XiGxQR+RLJqnkkobUlXDaAtxs
         MH2C8Q9SJm7RJySTOefEtFuyDOv/2BRHUDO340HnYKm8kk93ncmYrGarcFr9sLuMV1hb
         MtRBGCJk042snRaIPrAAgrJiNbXk9D3Gbm85dCA6n0hHkYmRd+xJs/bfq+NEcVKgIVkD
         0axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763211605; x=1763816405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgWKSOdmR/2/aNxOM6nJ0Z2xxabRbyUMHBIAKxxTz1A=;
        b=NqmrKI7Zv58D3rVw7kiQcSi8HWSUjJ9bdTLDPzUOBSdmnRYvSr9PrRdn7/tRtgZtW8
         dhi6u2KIOCyjEzWVijnJWm/s8n9dBGacHHmBcH8KFZ5F9CfNGMxaGn3KxEAQsb+Icmad
         LG3h6pq609RQILVYvkxxMu0v7RMMirPM17wF0QGFxqwaUFZPKE6pP4MHS53WB2HSxqlN
         236id6FNOe2dnTlmWFB/1i9Jx5y5yyWmnTiX0koTKA2acJa/XZ7NGVpEEWjBTjOisr70
         vXHufr1GZJcgtbTBcX1TtOACqENhs2BFfItEwY0TgBQNeUA+CTzlw1UIrdHmyK+wr4Ug
         nI6Q==
X-Gm-Message-State: AOJu0Yx4aGTMzr4uIhayZ6kp16ly6nsMtad+UM8j+ijxmLZxjY6b7qzX
	j0uUndqBQduuxPkNJ5EENbM3kmBka9HCuFX32WpgHXs9E6OxsCfxgAP2XCK1ERkQ
X-Gm-Gg: ASbGnctJnEWDK7qhga2Btayx00FsYc7wpHr2k3KS57tRI7kNfq8b+691EqN2fw5/RcT
	2IgLICvEvdHu9qV/+sl41Pj6LSX1hBIRgHULkyRwph7eis5LKN5oBhVowM8vfOSl/a1RKjoH5k3
	o9wvSukN52Jwnun4sron+nidKVQBYYqS3EZM+MVlVIrUWyDzsHFR8edvRV+OMgvuSrU5u6ZglL/
	gAwpPw0neriN9/YjJOyyCC2+ojrmV74UmOK2zZ72xngDEsuf7ViZp7qMg5SLrI5dsfXThI80a7D
	iclSmjyr8Gb7ttqA3ZRR0SolxWPG97ZK8Ndsj58GqfpoDxb290ALvC8t9uGS6hhUJkumnLz1Tn2
	MsQb+C16lP2PuiH0YxGxiozRYqyxINjbB+gzpxouoP5vmlrvKlabDiTb++LLIwqDHzZ0fonFF3A
	==
X-Google-Smtp-Source: AGHT+IHiNeHab6Ja+/1Gu0VUze/KjgVocwu5eGXiJfVfipGTP3lW3m6XGBUL5gowALU/agvBezf8xA==
X-Received: by 2002:a05:600c:8b5b:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-4778fe59f99mr56819725e9.7.1763211604671;
        Sat, 15 Nov 2025 05:00:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e953e3sm198104075e9.14.2025.11.15.05.00.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:00:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/4] audiofile: mark CVE-2020-18781 as patched
Date: Sat, 15 Nov 2025 13:59:59 +0100
Message-ID: <20251115130000.1121405-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115130000.1121405-1-skandigraun@gmail.com>
References: <20251115130000.1121405-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121728

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE is already patched by commit [2].

This can be also verified with yocto build.

Running without this patch:
root@qemux86-64:~# sfconvert poc.wav output format wave
malloc(): corrupted top size
Aborted

Running with it:
root@qemux86-64:~# sfconvert poc.wav output format wave
Audio File Library: Bad number of coefficients [error 62]
Could not open file 'poc.wav' for reading.

[1] https://github.com/mpruett/audiofile/issues/56
[2] https://github.com/antlarr/audiofile/commit/c48e4c6503f7dabd41f11d4c9c7b7f8960e7f2c0

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 68f55c158e15a5d35702ae5c730586001e487f86)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0004-Always-check-the-number-of-coefficients.patch     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
index 282f4c01b9..17a97163f5 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
@@ -17,6 +17,7 @@ CVE: CVE-2017-6832
 CVE: CVE-2017-6833
 CVE: CVE-2017-6835
 CVE: CVE-2017-6837
+CVE: CVE-2020-18781
 Upstream-Status: Inactive-Upstream [lastrelease: 2013]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---

