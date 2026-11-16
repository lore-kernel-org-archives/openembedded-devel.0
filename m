Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34353.1794851740789056131
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=shG/Cfli;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f6295304dso3149725eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851740; x=1795456540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfgT7qcNZ8BtdWU5B31nYVRUm7Nr5FMap6DHYbn6hU0=;
        b=shG/Cfli0UTAt5YuV1Y4ON7I7yXD6FPOpBgRI91UMAa8eIwEIekHWQYGaGXXnVx9aO
         rwPR+PK0/ZiO6hRpp+4s0oqIsRACTUH2a3eG8Mz6yCWUzZIQtQaTyxdYdRfam5BqQ0OB
         XXCOcJIC0yr+Shwg29q9uBhg+/VLvY4m9lLrHAEMrWD2DoRv2HnAiL6aa0C9lon4FkrU
         AryrEkdqZ7P1zvvXkJv03v/XzXwFpQaZQtCigLsH1P2/TeR9/rv8qCaGqXePKTEwd/9n
         0gCRFLRravdAgXFf4AZDGYDrHglpjksqAFTU/vHWA4ovUkgDCxM9Cd5wMtzWVIlA3DjR
         AHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851740; x=1795456540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfgT7qcNZ8BtdWU5B31nYVRUm7Nr5FMap6DHYbn6hU0=;
        b=IAJUiaKtZdhMlJlPdKejHSo8/Z1GPaWjN/suEhookJxUGHxWFrCajmVE8YYpBzyx/r
         RVIRAMnEbO0qa4M0RkQrxAafv9HUVptNY1tJHaqYcm0MnjcFa6Q/yiz5LsxWLo53MaB1
         jXuRO0bHXA6MhvTut6ywblP6hx2KZ6oLCfJQlwAm+TgEJTMRmeuOwYGVub95kaxta2OA
         0mtERKWVAuPT4vPe1W21CbD2VnN4QZLYUiaMvOT0ZbbGEjiuH6JujYgq+OArr7HN5o3t
         Wk6KaRmKwggFWahX4BtHIWvJ+QRK5nzDZq6HKX1SdJPJuCMAfMT/0YBSfG7HJjRM5WEN
         2Zew==
X-Gm-Message-State: APuU4Z+Aq6cNAi+jKzdCOyOtRQHYVzZwJ2glfOLvMeFvUjNfJFyHlR1P
	8E5QLf3FiFBv+SOmiFPTbeVVvaSW+rNteKnGAVR1TB+lHPqxpZUndfmecotz7Pxa
X-Gm-Gg: AYBFou2V27WQzpyzk5ubC2DaRCuOiHguk/ISFAQ0YRd2GiS4zVAhAnQWhtN/NTHTL8j
	XngW7PrnLR6rG+5skPavj1fnF2OvcbOct2n6TnOUKVORha+pXIiWqHuKX8WULfR/aNsQNvLcrC6
	UkBZDMo+jWijVaRFfD9XMv1msONHUntS4VQF8HWXXtLG6EJfs8SBpM2DSnV79P2yzwTq6FUtkQ4
	zbWH0A/2JodWFwoOVtdlUXxXmTmasCaR1dxWDhlY0Q9aoc0FjliiYIBJHGO8HfqGvd3J/TQXZER
	cCoAjpcU/8z1g2fBhEtBf/qWQwI/rmxs4gjV5Pm0KH2ycEYOHrkj71YD1LUlTvE8m0pkFU7h0p1
	8sAbQuLde1KOiRW3w6LrF2XPNmNcq/XUrH4XKgW5NxKkZ2k2E+1JbOGT6pZDIP4TqTQjM0ZDtst
	XH+fRcHJe88F0UMrpHDSMa+TTGDPGrG+wbO8hOfw/g4dgB951/q9cwRsqGCa8SgViuuy56EpqEZ
	V8A/tGFf7IjKFm0AJ6htxYHbnmouinB+y75rCVuYhXO3Z2fxPnwv4BIJc8pTljemH0uzbFY7vsG
	vVGbKbYr17flkJyoXbPpn+cFopeTIvOioBRQccQzakWdoZUn6byjMkWmwsAsc/xTlpvn85aipuN
	H+jL8xAyQ4ErHtRVSXc1Ri7sY+bI3s5Rao2sYqBMz6GYl8B2btgFqgGX7E+saKkzUhWWlOlltyl
	k/YwoS76KPdOy0rOiimBlAqJBbbUgcPaBaSBvju1Ef7OtuswwiCcs3Eyqa4d4RnY5tAR4+eMvEB
	AlgDZtFWCG/ug9s/Sd3fWHRiLzTynlOGV/WvjhAoG1qETKMGETyxY1+1sTBcRUuxp6XQnao8X8y
	+dmF
X-Received: by 2002:a05:7301:1528:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-37966d4077dmr9403781eec.26.1794851740075;
        Mon, 16 Nov 2026 09:55:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 071/105] python3-pymetno: upgrade 0.13.0 -> 0.14.0
Date: Mon, 16 Nov 2026 09:53:23 -0800
Message-ID: <20261116175359.342679-71-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132527
Content-Type: text/plain; charset="utf-8"

Changes:
- Locationforecast fetching now respects MET cache deadlines (Expires,
  Last-Modified, minimum 3 h fetch interval) with conditional
  requests and bounded retry/backoff, as required by the MET API.
- New typed exceptions: MetNoError, MetNoHttpError, MetNoPayloadError,
  MetNoTimeoutError, MetNoTransportError; fetch now returns strict
  success status and handles deprecated MET responses.
- Forecast values, timestamps and ordering are validated; cached
  current weather advances in time. Dependencies unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pymetno_0.13.0.bb => python3-pymetno_0.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymetno_0.13.0.bb => python3-pymetno_0.14.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.14.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pymetno_0.14.0.bb
index a9d06c6f1f..096f412b52 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.14.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
 
 SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
-SRCREV = "921812ddad3f147489916c3c7ab7fb7a80d8c646"
+SRCREV = "205f93adf2f29fe0354bc4fca432e3d3ee67f1c2"
 
 inherit setuptools3
 
