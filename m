Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.492.1795102822178766050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nzaarQTc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso26611775e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102820; x=1795707620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ugu9yonIyKGkXrPEKGov4HWhjnBkZnGAl7Vyi194Epg=;
        b=nzaarQTcrIvkuzIZoaXcHzOgiaEp9SQmk8fK2XBGItF5z7yJfFNYqphzcMXRs0Xb/T
         1abxZ9lM73VYSG53F4L+DO2AehHc8MGU8yt7BZ/PHLe0fuGHZBXPnBZXEHTVo3nCRTqi
         IB+p77HdIpNSWB5o07yFCpWVzoHw/XHWdYbWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102820; x=1795707620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ugu9yonIyKGkXrPEKGov4HWhjnBkZnGAl7Vyi194Epg=;
        b=YFpqzAjLks5xC+nXmpLo49B2hk6DYGfZ2d84wv5ncFPdhCAaglFX4nKEEpsq2XZE8Z
         OIBG9wUBGn/iqD1KvIqh8iHt8caWOqDQ4Kfn6T4ER0Ojp6bt2yx1Q8m0m105+hwAbD6b
         XnIjzDOOcXiw/Ksw8RykFraejT6r0ebiPsqpWARWcw2O7EfqaCct6Idni+Sp7tTiyAVm
         YAAxpeYk/yycnh1oexDCFjOKEVt06YhPT1KJUJ3MEqKDHDYx9RUn1t69kwyyHeEDxdnv
         fGt2fHb6lgtXj3Ioeg+XdsXGz4+ubSi807fY1apwMKuppXYKJRNuNfX8qZ6nB0CH0g0P
         7iPQ==
X-Gm-Message-State: APuU4Z+6bxoVsLQDFrH001Ud4U22gTMFpiqR4ZCAEBHcsUpJVaDfvXQr
	1JVFB7zqDcXZXl4KhB6ww1coPIyVxho0QgFA8vOZYVIO8G5eEYXDafZJx/mL6hKIE/WvbWy5guc
	MLP5x
X-Gm-Gg: AYBFou1fKyPRsirJzsIo3NV7aXZVKE1LZi7Kr+S7oo+zPFHurX8WjFDgWyogP4NxIrS
	sBvCIWaiDECtNvwOshrEcwysJEVrAEwfeNYc9DNbcZwYkF3ErkRBAhQRJ5NMkJZdFK46cW2Pkrt
	buciIeAvqISOFynvy5uHKXkXFFR9O9OeURv0nx5k9lCFOkg8z/44CbCC1TMg/QREC9HL7nqxF3h
	E/UKUAu9kWvmu1yx8bLfELGX/CDvSBgOisZeP1yGLEFvuuldMNzLzetOUQFrI/mv9aTQUi4cotG
	4bIgglsDhBA1h5RjZNp6fqWv3hzL/iYE4BGlsrg3cq9/zmFX2wZ3P+vF4RO58Dq81fZuhCYjgGX
	xfakyrgslZELre9aKDPhCB6vfmWZrelVBOQA9dlTKvczSSYk1KfFdhrErYB0sVpTg6ViOy0wpOF
	yLTPeYhN9NmA935mLgta1bh6jUlskEgPBD78LhzlxTRIpkptyVHHzIS8im5XWYZcZqZ5aeWdd5Z
	WcuAIatgFcXePc2cp4BULUNhTjp8zB8I2nYny2r0FGadkvqTsbSN5JAF4omjz3tXXwShndlJeXe
	myeunbbH7AIEgx2ommVARawO91abiWVTG7/niSzctMwqjKR10/hKGgYvpR3f/0ffc25PNcL4pQO
	loJxZciaV6XCaC9hWCZrX4+2bvFjpn0kYmt+mc1NhVd3xLINDWEoRoQ==
X-Received: by 2002:a05:600c:1c0f:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb7da229f4mr146840495e9.10.1795102820467;
        Thu, 19 Nov 2026 07:40:20 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:20 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/11] python3-fastapi: Upgrade 0.163.1 -> 0.165.0
Date: Thu, 19 Nov 2026 17:40:05 +0200
Message-ID: <20261119154014.1039002-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132680
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.165.0 with a new feature:

- Add configurable form parsing limits

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-fastapi_0.163.1.bb => python3-fastapi_0.165.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.163.1.bb => python3-fastapi_0.165.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.163.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.165.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.163.1.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.165.0.bb
index 298bc815b9..57b0cfc7e7 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.163.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.165.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "3d364b02a68b67292e833ff2dfed3b8dc3aeadf73e271c15316c6c166668792f"
+SRC_URI[sha256sum] = "dd94d4128319c1e1d50535ab023ab698f850a4d2822f0e181747b46f4ff3c0ab"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3

