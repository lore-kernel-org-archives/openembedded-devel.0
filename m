Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14849.1793092868114536529
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I/EONsuV;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27264905e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092866; x=1793697666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+o8cmWWqaGMzXlOArqsF52hvT8TcGxHoF9FgOOMfseg=;
        b=I/EONsuVcgDUuun1nDj1J1L2z/dlSYXglBtM/05+aPrkLm7QguD4eLhN9zOVNg5t7o
         NUJpqv0/K6IlOMCOct+MAW9CoRbDGmHbEINyoLjftRQTVho4FhZTX38N4nSp66+7Cwu5
         2JzzvZA1fAQxombP24/b/JC7/+05BCLnurg6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092866; x=1793697666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+o8cmWWqaGMzXlOArqsF52hvT8TcGxHoF9FgOOMfseg=;
        b=bx4FcJcYWrfachTNon3ET0Ny1UlVs4haCApV9HArdKiqJGsdbzAIfjzddl7z6TB4S7
         bnxV6fM86HFUN9BrKoeglI4jQaMLTJlBqs2HfiC8PXVtdh15vJIW8cBnfe4iwoxREQaP
         De5s3JN/4vUw03ehBuHHxpJnG+Sqfgvh4PKxcSAb6JIcy1KzOgtUyJtDGQh5tnNWb+Zn
         gliZe4wb5Qn3Q38ddPDP23piJ6eEltmpUuDIBYG9E1AIUNVtNwLmX450GUt6cSjxpzUf
         y2+v55a3sYR4CFCFPNASze50jZw2eF5OM0AlJ28umrItzWXFsZ2iWjO8w+Wgh8k/ALq2
         khRg==
X-Gm-Message-State: AFq9FYJRHEvHjRZaMzGx0SXfT61urpc0yfn7iDEOJf+fZ50aBP4ARDEd
	490Fa1mSw/L6dkv0f4lpP2cC1jnueRTGCimB9gSGo9VGlXaKVsq+a9vdAUVVx64WwIrxmtO7oeC
	kQdgu
X-Gm-Gg: AYBFou2ka1AZl9nbgzaRw/rgyYcXBclWpR0dOeGSglvp3LJJKf8BXysU9HV1fgIkogQ
	Oee/CdJN5ul0BDkgdhcHnfigxj13Cegj0O+hm7UzmMORHbPiwWXJO/fwUAg6bsfYxvw44req0K2
	EPh/UzkR36uDGiSWB/MbAlx9Gy+kepMhzvbEcmLwd0gFoHEmBBHDMmIC4FGN8iGH86wyNFhq+/t
	vljoOG7b9ta8IviZCKjPosgsb28gKjgIy2Nq2qVOf9/cfGC4lAbl24f9XNITbpOtcX9S/3FRqLu
	ksy7xFvInrCPloGkpbINR4Jxjm+UxWJ5sVouqVii4JeEqQ2rHzz9gPLHjaFbOE8LpdCI8xf5P9H
	5rwTTqM2vTuiH1oGl8yYxi8vPG3w1hf1HiO8t9ZU+DoScZnsfYzU7J9VvZJQkcWPDLJjDk/FRYt
	cBebNNvutJAzd2XiQEsvXMACQiPSXFVfTHuXtWl3bZYMFUALsgENtwAEfnlx+AVoPkRwJz2bUAI
	WXliAvGOOIm9lWfATbCOhff+tcY8xRO3uawzGKxKNIfQhvQPHZSMekpUDRKaD77qp6R4diGmokK
	ai/X1Ft52igIm+vDSX9iR5c1bgYqNgNKl01H42mqsjfYrCxIOfFn5VR11s9s0nCCGgcIXeY09Z5
	HqfFe
X-Received: by 2002:a05:600c:3c98:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4a79006b1a9mr53488075e9.7.1793092866279;
        Tue, 27 Oct 2026 02:21:06 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 31/61] python3-pytest-mock: Upgrade 3.15.1 -> 3.17.0
Date: Tue, 27 Oct 2026 11:19:58 +0200
Message-ID: <20261027092028.782979-31-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131495
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.17.0:

- Failures of mock assertions such as assert_called_with are
  again reported only once, instead of two or three times with the
  original error from the mock module chained before them.
- Mock assertion failures no longer show misleading
  introspection when they are not about the arguments of the last
  call: assert_called, assert_called_once, assert_not_called,
  assert_any_call, their await counterparts, and
  assert_called_once_with/assert_awaited_once_with when the mock
  was not called (awaited) exactly once. The introspection also no
  longer reports arguments passed by position versus by keyword as
  different for autospecced mocks, and no longer shows empty
  Args:/Kwargs: sections when assertion rewriting is not available.
- assert_has_calls and assert_has_awaits failures no longer show
  pytest introspection, which compared the expected and actual
  calls position by position and so reported differences between
  unrelated calls. The mock's own message, listing the expected
  and actual calls, is still shown.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pytest-mock_3.15.1.bb => python3-pytest-mock_3.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-mock_3.15.1.bb => python3-pytest-mock_3.17.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.17.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-mock_3.17.0.bb
index e4951d54cb..6bbc8511d4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.17.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 SRC_URI += " \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "1849a238f6f396da19762269de72cb1814ab44416fa73a8686deac10b0d87a0f"
+SRC_URI[sha256sum] = "e36576e0985e01027e999891e7a966c67822d40c89ef1b4c8b6e22737e3590b4"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.47.3

