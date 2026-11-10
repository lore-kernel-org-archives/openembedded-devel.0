Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13.1794324463379364522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Eq0Kul86;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso1571876f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324461; x=1794929261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKR53QwARXMt9BXKYQ8DJC2yHGNg5GcMbFM6oELmb50=;
        b=Eq0Kul86H115B7GWO4IZLtFeM/gJg2cOXeG1/+JVHiDIAtDbrbutQvDTslmrYZ2YmA
         CdHCrO7app+IH6XpXfHLJvKOi+OEvNAgOvTBuW8ph7lyUc/2Lj2lNFs2WoNG4102J//H
         DW+E6IAfpSH+nZ0Ah0v+scn49XkcEFK/ooEwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324461; x=1794929261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKR53QwARXMt9BXKYQ8DJC2yHGNg5GcMbFM6oELmb50=;
        b=dHRodbsS0EJIyzCUhxH8yGn1E+8hRf+pLTD8Ke78GubR4blnPnaitAXsYiCTV4f996
         sinMzF4kd4V72Zh+VZkX/D4OLGApEG1GxM/han+31diRxfIEaeFSdAUON0fUMwz0e14Q
         gkEEsIzDfQbJOdNp2Ha0WaILnwutOgBIO2nk4mqm5atISInENPkBm2kQB4qY2BUOwHVh
         ZV3ieYeBKNX11ne0TDlYPlnSD70OnVZ+8sR4AtM/zm81YySysvyfSkxhTaV4d+xGxh8G
         Bh2cYooTIL1sFofe7Bu14pFq+KIDVqdYH48EOgy6zH18Qj4XKXT4PrFYn6LzmRpE89uX
         pFQQ==
X-Gm-Message-State: APuU4Z/aVPZXmfyvsPn8jzeAwmRs27rXuTTPeb7z37X3Mcp6Hd6b7GQ0
	6m7qWbs7H/FpXutDvCuZIF5CF1kREckrAWaeNRnWq8PbScdsS66uy+3DX+dBE/SP5s9AeBcHB0c
	8hsXF
X-Gm-Gg: AYBFou1mnj6GZyDbjKRv9WYKsoYjrUCcZNUDRRZgJ95/S6ZIqvxI64CU3WB/EiwmuWs
	C8AQ4Ooh4KiQgkjDZ4HGQk6N0+J+B0vUaIqBIK0gnSzpJ0brjGI5TJLlV/GE7XOizvIVvfva9ha
	DyCHaj7PsiJ1Vj8HIDeC5Uv2MMl0EGJy3C4iyWP/J5ZrpCXCkr4wmsy91nv0vR4KrzESsumCrZO
	NFCe1L4tikJJLrkt4eSmfd3JGsLSsSnfr/rXn2Z5wPxnsVHZ+gRN4G2iaLPRJ+x4MrKSv/kkLWZ
	c+Q+CpSQ2vKx/vLuGuvbI4CkZIuwPF+w3CySUsX9843TkhORb6GCrwenAMF0ROIOWl3+AKyHlEx
	mbfl3Up8cjg4aH52FAVoWNUuRhvVpoxQyPsF2s0KiNzJ920hV1b+rMSXcLKsIjt0mLp6Q8oe3JJ
	fePF36iHvefWr+sMd8fz7rgTfrlPxTZ+WFeCmp51Zn8UTVBbhUbwXFWM9HB0/r66R8c9eTBK7Hu
	NxYxDwpGxPq3tiDCRbY/qEIdPOElOzR1PinFQcRZhUpK1nL4yDn4TByo/+TDUTe4n3kVyi7GRXf
	qasdRgN9BROiLtwdeoM/DYrAXYgaq0JMqKReMsLnt5GSw8TW9IaIHnpKfyxfcqCOX6R9MeBglBg
	KnbvfXpXZgRDX14neuFRFvuFyl9zVUjqQrjktHSdHjcQ3ixbNI2g0iw==
X-Received: by 2002:a5d:64e4:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-4982f77f085mr5670171f8f.37.1794324461569;
        Tue, 10 Nov 2026 07:27:41 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/19] python3-pymisp: Upgrade 2.5.34.4 -> 3.0.0
Date: Tue, 10 Nov 2026 17:27:20 +0200
Message-ID: <20261110152729.1065911-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132084
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.0.0:

- Drop support for Python 3.10
- Add support for Python 3.15
- [high] fix: wait for the publish worker in
  test_search_publish_timestamp
- fix: [DataURLObject] keep commas in the data of non-base64 data
  URLs
- new: add sharing group blueprint management
- fix: [tools] Validation of mac-eui-64, mac-address and SHA256
  ssh-fingerprint values
- Feature/custom warninglists

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.5.34.4.bb => python3-pymisp_3.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.34.4.bb => python3-pymisp_3.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.4.bb b/meta-python/recipes-devtools/python/python3-pymisp_3.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.34.4.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_3.0.0.bb
index f0754899da..8e238fa8b2 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_3.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "0e5563d4fb1d5850f808c4e53d0ea8cd4e2c7877453034d966e7b2b70c32cdd9"
+SRC_URI[sha256sum] = "cae124f52d897aeb15d4f9483ef4e4a3ba47c7086e370b34cc31b144f85b38e5"
 
 inherit python_poetry_core pypi
 
-- 
2.47.3

