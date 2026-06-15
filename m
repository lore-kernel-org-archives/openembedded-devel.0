Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF64ECD98E4
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:13:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132070.1781536403252625593
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=otc5JtaI;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1806193f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781536401; x=1782141201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59nQmYin2JkSVLoZugJ+ky8gzWbHbvk3Wgg8YJdsPG8=;
        b=otc5JtaI/rKsqTJQ6ganJ6cum3KnGeBl4uFoFjcls2pYhf9oH07E1jEWVNDCVUOLFk
         BCprDj6cGIZmMMDNYIJs3iwMyB7e/ZA4fqgYsHNwWB21BghcxHGQPe38jjIC5KKm351w
         FuktNFU4ayeyNUQaPqqcBYsZX4vNHql/xGenY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536401; x=1782141201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59nQmYin2JkSVLoZugJ+ky8gzWbHbvk3Wgg8YJdsPG8=;
        b=TIbpegd+BIb1PsfdnxJZ8TNJyKRTl62z0yQMADPxgaj35q8gZB3UJuIgG/NEvdYSjX
         2ZiOU7COgvnx6df4Mlhpwk5mHkjhd2ZLCk8btWROD5hiqMhp/2Ajef65NvT8Owq9KKUC
         OveMnQ9dgmiK2ErivXAyf1pSq4KMiudD0Q7FbfZs9A7FZVDD566/+FHEBnXsgfXkVFkv
         TWj/NSKo1zaDUhKF4aoWZ+tDBMddHH06QXIWlW8sWGicLb8KDeCm0J8J4pBknjlO0MGu
         cMotCXOk/n32ANi7NqHZ7CIKKm8jpaDVTUAPrziTFLo9Mc5h+JpCW2Ym/e+RKfO8dQ0Z
         JfRQ==
X-Gm-Message-State: AOJu0Ywp4helc1y5p7ZwAvs4psw01CCxRalt+Km8imjlavMM53wfqdnz
	a/tC5eyHerlYgF8JlFrlqK+Xa8BU0L1mFrES7UKaWp5wpvDbnT6Roin2YsZPIeHd+Lpc4HpC7XX
	HNHwG
X-Gm-Gg: Acq92OEzbSgnaPLJwRFrPw1wtEKsJDseLhQ0jLgPDkMufGqZBeXg6yfMlb7YfFXqWQw
	9y9+zUVtGtFyJSNggYZIY2hqT4viTAPvLnhiQdNERlNHv6gbDV+5pGA3qq8ObxOJKwSusiGJhqu
	aHWYGloU3TxJic7o8tN51dnanX0M0Lk68ZIt/9f+A4TDiZCAP2jyX2zOnNqfTuM/E39u+/OOm6x
	hrUU8OEiHSidBOvfFpMo3oMNk16n4/SinlaUc9NKjsE8+9KOD39U3K+eXdTw6XYNE226RHjjjbw
	Kf+4+pbcOFtbv7ooHyGJ7UOSYOkdFXhyoJY0Te6uZ/0v2q46cRAjn0SqkbHaTTNbGY84I8eh/jY
	UfTmOa6imBxhece+Q516fBZK8MkHGGPqWWY7MyOSGtzCsd0SH1Mkb2lBIUfg5atKveb2qGHe60s
	XPZYqJj77kQv6VoV/TrUulYhGv4Node0299zAa
X-Received: by 2002:a7b:c7c5:0:b0:490:b0e0:3de2 with SMTP id 5b1f17b1804b1-4922010b88fmr112754795e9.33.1781536401189;
        Mon, 15 Jun 2026 08:13:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b2e8esm219066395e9.0.2026.06.15.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:13:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-ujson: Upgrade 5.12.1 -> 5.13.0
Date: Mon, 15 Jun 2026 18:13:13 +0300
Message-ID: <20260615151316.3273340-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615151316.3273340-1-leon.anavi@konsulko.com>
References: <20260615151316.3273340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127587

Upgrade to release 5.13.0:

- Create manylinux2014 wheels
- Add support for Python 3.15
- Disable global interpreter lock for freethreading
- Re-enable building GraalPy wheels on macOS arm64

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_5.12.1.bb => python3-ujson_5.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.12.1.bb => python3-ujson_5.13.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb b/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
index 8f8c6e23d4..29fa9028e0 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause & TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "5b7e96406c301a1366534479a7352ec40ec68bb327c0c119091635acd5925e35"
+SRC_URI[sha256sum] = "d62e3d7625384c08082abad81a077af587fdef2761bb14c3822f4234b8d07d75"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-- 
2.47.3


