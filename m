Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4932.1795147169073278108
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0ugHMi2A;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380c28f9e35so1498791eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 19:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147168; x=1795751968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNRlTQhXTFqMjM2u9xyjlitXBHMlATams81bQB0npK4=;
        b=0ugHMi2AM1VK5UwZ3s//w1ypc27EI3xkwP4ZeQRXo54cG3K3HtcVCiBsjaLQUv8MCa
         Fg/8Kj2JUjsd0VCOsZoB0VdUIOPI4iJSeBmywsMZAUNd7bA99lajBx9pasqOllUsZdDw
         ceNI9buQJ6lw57E1ySjFCD+Nsv1GBKFAJkXVypyN+DdGYAC55eL+B6knAEC7952fzz6z
         4+ijyXujVtumr7JEddB4L/7aZ1n4NmX3PPYjlanLg/MqOourncf9yemZlFriYsso18f4
         mRw3+j9ysVRFfTRAsIq1feA1mWKaX3znw+KlGIWFXdob/ZcWkbrQH6cNFHxFJ4PQ0zD+
         Fktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147168; x=1795751968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNRlTQhXTFqMjM2u9xyjlitXBHMlATams81bQB0npK4=;
        b=wXtziRdcKhjJursLXamyA0W/Wi153dHE0NKfvl3k1zKKKL4oIkSrgeelNduLZ9pLvm
         TXSptg7I8seso6UN0ytUk9XwQlzppKgFfjygCCUJmiS5VB/HXeBa31FFRY++tF6KgFeR
         I7tLdjiULt7+H7+aDUUL4fJE0ferGN0tGY0D97MBOlPa7RANGVxmcB3L1GxS5No7Eies
         D73uVNW2M3DjdLKWS91BmYG8g0kY+DHG5yqg2kRF8V5urtjLGwkj3ZlHdtQu/P0Cb3Nn
         FfSfErO8cZreByOSf1+8j7Ns8KjWnKz3KNSFIha8+zN3wbrekidMfnhR6ei5xMm6i8zd
         jiVQ==
X-Gm-Message-State: APuU4Z+diLO1iL8o+j62PZ7yff++Y1Jytq31etcqF2/Ene1MHAWGN072
	6ZNjNBw09lserShq6+OfVVXXB6O62HengxlEfMQ8BQM1vryzmlPso6eAsVGjemtx
X-Gm-Gg: AZFdTZc3cw6TI/rDhwPYTcAnlaAs6M/iDk/E0BNzQJBSJSiOv0PSHhkM908pRkkqk3U
	J5GvQk0EBvMtMXYuKg6QMoOzfliCLwOe2Xe3DFDfvHWzn9pkMobx3tNcugWRF8uUdF3sFKWYL7p
	HCEw8lfq/4+hg0bBDzFLsmSGmMPvKlaFbhimi60jH/4BhlKJVq+VIzLQP/3Mdehc/Rdavz7KUkF
	wQQ+7Mrb5ZDj1rd5OK5KG01w2irI5YDrv/UeyUBeuwwDhrQVgVwEKlHc4j01gtEOfGJ93dAcQHu
	9qd98IXdVAjkZ2Vd9YayrZ9I6xj9Eofh5KRId7nZxgqZPK3RyK+iLZfAR9MlVKLDTA4XVrdPZzl
	xzNiTBmDzsrmEXbRO+sLT83u2DifN4Ka16Kly9blznPVKBoLk+qUuJuq/J2yD257aWn7Qj/sRoZ
	utW1DBDzJu66JUPE6CoUjoZC3VBVPlNla/QNEML3EjrNBeQVWPc1l/THM1tqjN3MnoBMVoNI57/
	Vzpnri5/78XOCwOCDYzkkryF38CCJHWytkSZP3vmPSTm6ByzWdOjRYZ72Eg8FbYuN3mYZJEpXP0
	JbggqleSFEDQ/ptW1Kr6T9TQmBP3rruS+SLS7jXO5sIgEwPtRevqwdusRim8o2aQyUlsmgllcJ2
	H65ZA9pqQhCj8EkvbkZ0xIUV+PzAq4Lms5WLBTMfPokljHpt0CvJqtVL6IkGL/RZlAZQRSSF0pc
	W6Lj0GSuUvQbri4joDPJVLWL4EmUVXwYKysDY08OFN/Kw0/sVctVG56ppiH4mLPCqNN+wWGbMd1
	NghlgwKBtVjsXa5szA2V8BieLtrdg4PdNeOUB/4P3kASc7SANnSoBppZWupbz3JxEsSGXSCJI9V
	zOKXVlgkXBmS8kgn0jA/X8ct+A==
X-Received: by 2002:a05:7301:d81b:b0:361:a195:c46e with SMTP id 5a478bee46e88-384b11ec88fmr2788537eec.1.1795147168383;
        Thu, 19 Nov 2026 19:59:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm3190201eec.23.2026.11.19.19.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/4] python3-pytokens: Fix mypyc build with Python 3.15
Date: Thu, 19 Nov 2026 19:59:21 -0800
Message-ID: <20261120035922.3013969-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035922.3013969-1-khem.raj@oss.qualcomm.com>
References: <20261120035922.3013969-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132762
Content-Type: text/plain; charset="utf-8"

pytokens is compiled with mypyc, which builds its runtime with -Werror.
The mypy 1.17 runtime (misc_ops.c and friends) uses _Py_IDENTIFIER,
_PyUnicode_FromId and _PyObject_GetAttrId, which Python 3.15 marks
deprecated, so the build fails with 19 -Wdeprecated-declarations
errors. mypy 1.20 dropped these calls, but upgrading needs new librt
and ast-serialize recipes. Downgrade the warning from an error until
then; the APIs are still present in 3.15.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
index cf692089c3..eac36b5606 100644
--- a/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
@@ -10,4 +10,6 @@ SRC_URI[sha256sum] = "292052fe80923aae2260c073f822ceba21f3872ced9a68bb7953b348e5

 DEPENDS += "python3-mypy-native"

+CFLAGS += "-Wno-error=deprecated-declarations"
+
 BBCLASSEXTEND = "native nativesdk"
