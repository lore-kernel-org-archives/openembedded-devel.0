Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B45ED1A638
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 14:17:49 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10913.1767968260659257231
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 06:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ll/IwgoE;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327555464cso2515527f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 06:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767968259; x=1768573059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiltHJvymQh2bHZAWJfiP0hpU9J5yUQ8/4BxrU+7NuA=;
        b=Ll/IwgoEnb9j9pNCASbOVQX/HQ3VvPOlSIuB4rYPOH4KYc8Rg4PYnMSSDS7z0XvY68
         ykE0oRJ5TVQtuOFkdnUNpd/vOBXAOsir3bP4gJZosP+F6ksSobwQ17rxE2vpNuJdp1f3
         Ft99OnZ78RhSnl1InQrqUZswdqE1qTsPN+gwEuSCZG84ShdGoaoNyooXPFY1cTZc/hle
         zAzsH0WVxDRDep5uA3QC2bq/t5v/m9lf/MP3FZrdbaXeX+OZOvvh1vcvkPKo9DOLErko
         ribOiM9yZOWdrTev0eJXZTpVRVEwJJRRHPrZJP9okOTVbPji8aT5NFSzsStNfzzgleim
         DfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968259; x=1768573059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JiltHJvymQh2bHZAWJfiP0hpU9J5yUQ8/4BxrU+7NuA=;
        b=JUSDTbqSnDL4Cc9ISBI3ud5Iy58RjxgrZJ5vShpqbAG/M8N5FEsFgVH4jKga2gNSim
         w+Z1mU/lihugwGEGaR0Wr3bMr1kXM0mYMEAXKEdA6q/I7RPmxLf4Y+/Eehdzrz3wvjwe
         wOkTg3FuMNBuRuevkI0714AtK6o8mVxsMSHLLO7kUVW+L2YOhA9sh8N1WWtWIohMJAHQ
         EP2W3U/1E8T4ttE8tlVHw/UuIcfQcGTWehg530bPdeY/ugy6vTFsXodYwS5HyplT8gyV
         +Xwuz6EOuzOJDQi98CeYMTVWJp4NMie1HWcX6p+VymRqIwl3I86S+XVUzSrhV1l/O8Bp
         BhZw==
X-Gm-Message-State: AOJu0Yz9xiTAqt7aOy7YV9tg/SW2DN5nzqsgREvg70Zt4K1NiXILPX8W
	GxLQlmQiSkS2EaMtg5j9HB+yvzPk/Cc4iibwaDLffkluydpvqVOAmjXWyIHajg==
X-Gm-Gg: AY/fxX50j3sPl2QOsRN2trFFiDHX67K8tglDCBn3hISw70ODerqOLse9sey35Z5Kivb
	fkiSco2MlxOoL/15WLPXraOOKSqGH3R0JtAvrerBcU9UK5tLc+3vCXrvxL1JN4S0lkemHZdEVYY
	n+C22hL0bcOI1T3U+HjA3Vm3BOjR1szyvM1Y1NQVq790Z9+t/qquAMnicCgSi8Hst2A/RmQkHmN
	8vNdULYcxbQ+JiD5kxFBntG19xGO6g1i6yharoLk/RYSrzFVXDzLLKZwprhXzUzY9jUmX9MsaAW
	XfQ2plUNc2ECB/Sa6Cyzgcv15hr9oiNgY6dIV7Nh3wTJpZEjKwoAEciRSJtzlIEVVw+3CD3L7Er
	6aRGk0b+PkJms1m+FOZVs0AzQSHNQOEU8tmy+J5hLJ717FmlgrEHNH0irrj6vm+7wUaMPm3b2sm
	28p93RSUWu
X-Google-Smtp-Source: AGHT+IEAm2xIEmABD5/1i8DFirdObvAHYXyiSMhCjQJKdZdBLBqER8D9T1MG0kAIhubNwP/OVAYcIg==
X-Received: by 2002:a5d:5f53:0:b0:42f:b649:6dc9 with SMTP id ffacd0b85a97d-432c37c3338mr12107559f8f.58.1767968259010;
        Fri, 09 Jan 2026 06:17:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm22686384f8f.35.2026.01.09.06.17.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:17:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-uvicorn: mark CVE-2020-7694 patched
Date: Fri,  9 Jan 2026 15:17:33 +0100
Message-ID: <20260109141734.1596725-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109141734.1596725-1-skandigraun@gmail.com>
References: <20260109141734.1596725-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 14:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123304

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-7694

The vulnerability was reported to the project[1], and the commit[2] that
resolved the issue has been part of the project since version 0.11.7.

Mark the CVE as patched due to this.

[1]: https://github.com/Kludex/uvicorn/issues/723
[2]: https://github.com/Kludex/uvicorn/commit/895807f94ea9a8e588605c12076b7d7517cda503

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
index 3013ff50d0..227202b8cc 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
@@ -12,6 +12,7 @@ inherit pypi python_hatchling ptest-python-pytest
 
 PYPI_PACKAGE = "uvicorn"
 CVE_PRODUCT = "encode:uvicorn"
+CVE_STATUS[CVE-2020-7694] = "fixed-version: The vulnerability has been fixed since 0.11.7"
 
 RDEPENDS:${PN} = "\
     python3-click \

