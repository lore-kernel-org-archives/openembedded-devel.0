Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.504.1795102830674849793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uWAFV4/k;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2189672f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102829; x=1795707629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sccFVCSD288q+gshBw3r/F2AoBrschSjEbV/V9lfH8c=;
        b=uWAFV4/kqxW9lA1P+OJbwDWaxyXfLB/SFR0A4O4/n+a3LTBxrcMtQyYqo4AZV2+ZQu
         v/+ZwrQBUyuTFOxV7MmRULu74m1FinwZQONOZMe8CA/Cb/aPrFsXDTIh1BHuL/chUN1c
         n49wWEge2BZ8+4jFQmtKpuk0r42N+783OreyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102829; x=1795707629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sccFVCSD288q+gshBw3r/F2AoBrschSjEbV/V9lfH8c=;
        b=E4uyq7itPuh0iXNOO7kkZ5QhZfvdqFUTHGkJRCRJy5Vid5+0wdBlCs9IfxCnPNRY0I
         FRV26o8us6j0FLkFyk+bhteyCNbJmO7+S0Ua7zh5idoN5YAk2/dEXX5zWXGQ/5Qfusw2
         6XqW+FACFEKP1tfUolUBrCk9oAlPdYskfpTQv2o2GM4vN+Pgoym0JTqVRIORIzIHlyOh
         xlFYK2pVGBpnAOZVs0tsWs/sLb5SBHo+ZeXngA1p37tscbTEnHLlvX+tIrXObivBV2ha
         r1igdCMlS5cEhodN/vk+y7Tr7k3VfFcYGFvYE1n49gBcYKldwQP8xGSmgZA3NQBJXQZf
         Tqqg==
X-Gm-Message-State: APuU4Z9Tp2wZpzzjq/czkMOc20idmzf2lYAWzAwel2NqaSpRgmh36BIh
	ePj3MHy+vFPFRcAz9huOuG8wBcy8mJnVZ3JvVSaoaNwQ6ixi6C5bTkLKowDd7Or1k9FZHitdu0p
	MVNB2
X-Gm-Gg: AZFdTZc5IMt16eH3JpWBjDdWxPTlz/Zz+bmanTBgmvM41FVRfYD6XCkMp0sgf5mfudh
	ZaFIWni5rP2VVSDngX6+8OodapDVCh2yc4J4j4LO4BHQQyMZTkBebzebhODB2hZ6bD+Aecdvte2
	47vhWdUApJWQw5nzhyvD8Wec1TPRrUl4aTLBE1jozqy7aAP6KZDOygiNovFUATzSLU0pd2PQeQS
	Dv1RrmJi/GQkyoosNLnno7Ak27yRrfgxIH5kPVhQN+OLAhXSvggJRe98QT/XBKndxKb+AeSkdZk
	sziC5QnggEvlyTFAvPkkoYOAHLsBOtGoriEIWYURbOS68uxzu/Vua/ArS3vhzD7ZkG3WVI4tjcu
	Gy0EkZm1SFsA7rAqj/v50nHwTuDGikTHQIVzdGgSa466qjja/TLOLj+SyNwVJtbqu/NXwEQAaol
	2jiYkLbCULCSC4J/QUMZ/bZZohhkxoOHhwJ6zLSVbWsB9UXx+TWVjye3N4h/bxE/QHPqhTp6yAx
	/Rt+kN74WMUS9vghzbv0SQ3qDnmXYbNpHtd586iqATAFMNCROAnqYV9C0MOW+zoC2s6aJbvL9Yw
	uSg5Nd4rVJwF8P6fb6fMInFV5B/bTJrMipn/iGhAe6tX9HMsyOcfp5LUrRR5DapHRtCnTHAZP6A
	R+ahdH8oK/QG0ljiR8k6YB4bnIEkZuCHQhjBiGK7d4qBFzJuZ4E8KFw==
X-Received: by 2002:a05:6000:4616:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-4a63db6f472mr12987819f8f.55.1795102828952;
        Thu, 19 Nov 2026 07:40:28 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/11] python3-typer: Upgrade 0.29.1 -> 0.29.2
Date: Thu, 19 Nov 2026 17:40:14 +0200
Message-ID: <20261119154014.1039002-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132689
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.29.2:

- Drop support for Python 3.10.
- Limit the full test matrix to Python 3.15.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-typer_0.29.1.bb => python3-typer_0.29.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.29.1.bb => python3-typer_0.29.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.29.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.29.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-typer_0.29.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.29.2.bb
index 851d3d53ae..90807e9aed 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.29.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.29.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "ab6eb3880bf67ce96147734717f9ec333c06f66e361f3ea947d0be43da39f242"
+SRC_URI[sha256sum] = "b1998dc5f2c3dedafa1517a9521fa944cc4dc1fadcea085d81a3b10ebcaeb075"
 
 inherit pypi python_pdm ptest
 
-- 
2.47.3

