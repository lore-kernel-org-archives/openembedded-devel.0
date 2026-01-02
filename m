Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E01FA372F
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 11:29:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3570.1767353345100841344
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zr05/kQu;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so88223255e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767353343; x=1767958143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07CtpzjEKTfDJfAKiyOgsghVWlBsdzqcCIx/okGDqcE=;
        b=Zr05/kQuH5f/Z5nHbCb6Y130t7EMREuit3S0nc3qHftpDOIpaO5HyszL7i7L6KPx/m
         ZbK12tYN9Tgt11X+Bcuf0LyzX2Xgll4hdLlDbTd/mENjF4EJq31FbwVnia2HnOoehU2S
         f9EaDAlKuSHVz0PsU/dZCX5Y0Tn9gN8WOimPvCZQT/414nRf8HuecevB4MeGlfcHXdZc
         pjO8hEXfbrzbgl3AP0GrnqeV7znq+JqWxMpDgTMH7wUP1NiaqNKow1C32l+8uwgC1ua7
         DT/wzzRxpeY1kmgIGgsHuyJozgVZVZWgWaOhJkEKlmNS3eUGczmk4T/FWLrHt//wrF37
         wE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353343; x=1767958143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07CtpzjEKTfDJfAKiyOgsghVWlBsdzqcCIx/okGDqcE=;
        b=S6uyayu1011/XeZFiBe+S6hPPgXhih+mqQR8f2uSyCi49vMrTMA0FFvMgTSU2fbSbk
         QUeBPQyCFOVHo4gdkkl5KsqNFSxU2m46r8X9qfxDHZPyO5yqTMLPgou0yU5GTzE3cP/U
         UEvarnVn9cTGWTgwKs+mXmcxxOwr4d55WOF3AktDgczw7LwbHTT1Jcvg2pxhVJLkHJI7
         rHuwoh8COSlPyukfkJ+u/h+JQvgiT9PkBxTIwOj74gqppdCGEQSeii4gMaDgDGpmW1Fi
         bW5Ss8fnpKotTPDfUn+zdow4A5rMT+6SaWluxlKHpp1Gd31FWF4ADpJm/tODQV+IQXWT
         F9TA==
X-Gm-Message-State: AOJu0YwMQeNel2rhk7k9AzoGI5P2frBbBTl4tpyXGI6sRoP8JFcB0nVD
	UI8HekObdNHpPQI1qe/fnOmGR2OgZKpWt1+s57Y4cOVKx06yQsYhDpIvl+Qu+Q==
X-Gm-Gg: AY/fxX6vwoETZwh+iixFZvbYV8grGRkp5lu4RDuGlVHapwz5vgE81uQp8+tFRnShZco
	z4xqsl1zO0XGVInE0UfQJxSV7aeBnH4ZyBKnwB2ldzfdbEldNhUcxu3E6yeIPsIbG68TlsHzbAb
	U8pHbEU6O9ObjqpvjBgqnqOn05zPsXSGEqozwZkirGVlkATwomtLA96/PSXXByNksEg151EJiZX
	X/ACMf/gZij3HUryWm6DbAsszGljY1s/cjt5Hi+8i9zZvJOizeugQmj7XweZ72GgrvH8UB2KKZz
	GNL5ffcUL7aqXF4eBic6Xss95umBmozzyWMYR97+eAvyIGrvoKZHWBlcxpBPZCxBaeyROWSxw5S
	lQWeDSDg1U01ZBDeX0ZgVtVxeO69uX+PtaYpArKYYde77o3WMDncgKSEpYzLUuBQJS8pqvG8VwD
	663vk+dBrX
X-Google-Smtp-Source: AGHT+IFINspBvVCBUr4rkw1rhfZBteGcoe+FsGZVeMVn1B/+J0ewGeH5zV8lVhw0KCj58D5j0GjuSw==
X-Received: by 2002:a05:600c:4fd4:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47d1955b744mr477474935e9.6.1767353343412;
        Fri, 02 Jan 2026 03:29:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm85562757f8f.10.2026.01.02.03.29.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:29:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] nodejs: ignore CVE-2023-30583, CVE-2023-30584 and CVE-2023-30587
Date: Fri,  2 Jan 2026 12:28:56 +0100
Message-ID: <20260102112900.1800006-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102112900.1800006-1-skandigraun@gmail.com>
References: <20260102112900.1800006-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 11:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123091

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-30583
https://nvd.nist.gov/vuln/detail/CVE-2023-30584
https://nvd.nist.gov/vuln/detail/CVE-2023-30587

None of these vulnerabilities are present in the recipe version.

CVE-2023-30583: While the main feature (blob) was intruced in v16, the vulnerable
code (load blobs from file) was introduced in v20[1], and as such,
the vulnerability is not present in the recipe version.

CVE-2023-30584, CVE-2023-30587: The whole vulnerable feature (permission model) was
introduced[2] in v20.

Ignore these CVE IDs.

[1]: https://github.com/nodejs/node/commit/950cec4c2642c15e2913f35babadda56c1d8a723
[2]: https://github.com/nodejs/node/commit/00c222593e49d817281bc88a322f41f8dca95885

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 05a6706c10..b2872bfd98 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -46,6 +46,9 @@ S = "${WORKDIR}/node-v${PV}"
 
 CVE_PRODUCT = "nodejs node.js"
 
+# the vulnerabilities were introduced in v20
+CVE_CHECK_IGNORE = "CVE-2023-30583 CVE-2023-30584 CVE-2023-30587"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 

