Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8371D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:03:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3029.1764360186506606137
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLvQBhdk;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477563e28a3so15314095e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764360185; x=1764964985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUjtk0MM2H1iJyH/V66DMR4w/YQ+3p5y3zbmx/oJ7JE=;
        b=LLvQBhdkakSe2OnZMTnQ8TLMaFvfIR+Rd5DDusIi7TSd0Fk7ZvZMhDuvExTWYzQKqv
         my4SNDXHLM0ExMCpeVKITkZBJVKdzhx/V1fg71gRv/p0X0rxYvwUIxhT7yMDKu5dmhMj
         Xqjt9MqZReJdkZxv5+FpWLc64ZTNIvr5zkp6MOQpfZI4UwyaWX5Q8MF+jANTqevHF7v+
         6hKjQbKErwc41pUJN3TXp0n7/Iv5Wm+tVEXXAWEGJdGH+g7sos7MN5nwDHktb/g1lTyL
         gLdrV7omvsAUmXlt5BQDQ5BH2dWL4kI6vtkFBzs07Ev7D+5laA9dQ5IYa4lDdBpqLAc2
         ydTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764360185; x=1764964985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUjtk0MM2H1iJyH/V66DMR4w/YQ+3p5y3zbmx/oJ7JE=;
        b=rtNeLL3ZTr2D/JdTSpS6VFZSiOWZNti98teA3CmlOWXtxI67sM0I7Rok6IcDmoo9si
         NMIFUBNLXceF3sW57dO1Kcc4XHjxPZIvXskKx5TAX+EO1LTnOimVCttcs+QyjDxyD22N
         KrCk+6FV44tvnCOhNwi7Szq2uBljDcpf3QDGviCX0eEey/GaOWjAMWaNMBPxO+Lb+dEe
         Y4N5xJtaMG4iGLGrQfzG3JllxcN7FkuUGAjISiGrmRXmDGCBbsF2wI3GEV62gxjnRh+s
         p5TqOz72oaNi2/pPdFXVLuNvy0EMgHb5RoYcVBg1RRjDj22s5ehp4RLlJp29s0SkoONn
         AM2g==
X-Gm-Message-State: AOJu0YzxtfsU0Lp48q/2FlWqs3NlaqIbhyxMKwqjoArpOQfhSqcHY5g3
	Fa/i0wiRqtT1AjcfmYqO9vu5Acz82dsS8yXz/ZRbF8I+D5yJBBMBKFqWI64R7A==
X-Gm-Gg: ASbGncugVFMqII82me9g1FJBeiESjhJk3yfPus0td1liCqUxrC9A3o/sQJrLbaBSPH0
	pedrN8yo3yIwxnd4zJWs/wcoj35tYNqSA3VbTYRPhoLDKLcDx11Cq0s0NwAmYb2gSSzaIWGlAjn
	0FS0FC5TZ12GDCnqKDnGhSz7gXggppHSkIGPZONvr6vdX81y7WB6AXyeM1BB4w6yevA0E53D0Jt
	qqRdWNA6sLFrfzkubrXR3IWYLQdaJ92u3sZTNq2B+9dG6GG6B1iXqHFp4hvtbMtuNVNKfjuNd1K
	NrSM3QLJRTc/x5DHz9j1wlEzUNqDoneroknx+tF6pfL65XudEkcv35gJ9GPQHqEbalQBmInAx7y
	zNiLD4+omgm+WV2sPQKYjbTu37WzN0ThPbMysyalkrFo0/V54L80E3te+UkI3foWsc/DTkJsJes
	HNLKt0m7gq7UggKBSYmlk=
X-Google-Smtp-Source: AGHT+IGyqN4KNNz/LA052ITYCC3kqcZqZvvu7ebY6oScjVWbzD79+HTHKlLQrgjPDosiqtpp8wrGoQ==
X-Received: by 2002:a05:600c:45ce:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-477c04c36a7mr286329535e9.4.1764360184562;
        Fri, 28 Nov 2025 12:03:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111565a1sm100286715e9.5.2025.11.28.12.03.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:03:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tigervnc: fix typo in CVE_STATUS
Date: Fri, 28 Nov 2025 21:03:03 +0100
Message-ID: <20251128200303.2034030-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122129

Forgot to add the CVE- prefix in previous patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index d3159f8a88..53832939e1 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -86,4 +86,4 @@ FILES:${PN} += " \
 
 SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 
-CVE_STATUS[2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
+CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"

