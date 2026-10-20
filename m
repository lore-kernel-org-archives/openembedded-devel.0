Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6264.1792499560802698019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kAwQTrse;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso35050845e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499559; x=1793104359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqWL2BRsNlkFgQs/Qp9YaYJBWK3LkIXxezxiH9DESOs=;
        b=kAwQTrsePsoQuGwSvdQkHOXWbI01W2Fn8h6jvR5aKHGUitpLVPoT4CiVVAPjSxQ+Yn
         tMevxeh/c4A3kc+7pBbQAXofFvhRJB4n1embKzS4M7Kc0THIFOoiaFGN/xfaj9OVrez3
         eRY+NEmSfaiZppRAG/HNISC97x8fELAgMBplk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499559; x=1793104359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqWL2BRsNlkFgQs/Qp9YaYJBWK3LkIXxezxiH9DESOs=;
        b=r7JiWkJV8bBmJzuMjmHbrBzPuGZ6JaoZkHKTYEWt3R06yhQUiHwWbZXnlYTR39fXSj
         XQU/Vp0T35lE4+YVsJKE+/zGmEvjlBo219c4chB+Q7c+Y3fK6lFw0Qbw555Xu5u46vV+
         Dh7Npe5HR2haDVCatxUiQyCcpO6y2iMIms7gj6jVj8YzItVIawS0V+bg3kC/m/dtoSeN
         Mx9kEVasnl3cYbcLesJI+lqfn6rAAiLknzsmsnSZ+uz5mUp9CYv7J0hgbm1tPi4q2zEF
         TsxoxIuyCfvpUs+f70wJIEt8Cg6XzRSiEkO4Dswv9wru4imMuhZetozDPz7ku5YWEQKq
         HW6w==
X-Gm-Message-State: AFq9FYJtOJgAitZ0eAqoYSJbprAMHIdVRKzJ8V4ed9HWxNVPYZt1mCmn
	wLgIWfQ4wwcqsufvSvy3VTHm/PRrB5aqFL4VO/pHwlsqG3MZmvk2SbihHn71Tax72n/2tPnkBWW
	XRuDt
X-Gm-Gg: AYBFou2vPL2eCVQDOt51X/Z7NRwWXc7iZbwQd7T8kRyHqUEuPBx/HTydD8JZlj9nep/
	Wh1QJaAxE8JO/7ShAe+BLQW0ddDifPkuzqU62BQckcPc4SbdKDrYezuYKsxjW0cgIwBCFUNhRy4
	/hVs57iiu3OsuKZnbV0WjAgJRAzpx+PH+5shwLrwqcBo2V4LYfCEXszEmRD0CFiWEcoMQYmDJxN
	F55kdRlmTY2Z8NcTJX/imssUV+ZnFrDsaJI3JXJ6h4idSnHfjnTCUGHMqxa/gCppYXFSuSnpXoh
	x5eEMpIMiRcSiFR1VpWnviprJBbkbLa0UkGVHJFyw7yckT/1lZE04eT4z4MI7I6YS+x3+rYseZL
	I7zXrrQB0StgFC5w9yojY8NZqiWIxD3FNmXR3tnBynB8IHgznCDBMEIrfGGKU4pAtF7Hc2wDl4y
	aWERAJggcSpHhtr4WVN31WzsigMDj1R+Y9/HZCmpyWKhPLNzS1InFZ+QjJ4EtIxlWE1qGVWVzg+
	EjcKQYk5z7Ctu5rRhuE1a2ix5kNZd2bDd74Sa37UpxON/qCLMDCGAjZllYG/0PzUbKZsL5+NL0K
	2Xth27qaCh6jbkBK/MmX1l0=
X-Received: by 2002:a05:600c:3b82:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4a1f625225amr42777405e9.33.1792499559046;
        Tue, 20 Oct 2026 05:32:39 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/14] python3-fastapi-cli: Upgrade 0.0.27 -> 0.0.32
Date: Tue, 20 Oct 2026 15:32:22 +0300
Message-ID: <20261020123226.4033600-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131168
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.0.32:

- Set FASTAPI_ENV when running fastapi dev.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-fastapi-cli_0.0.27.bb => python3-fastapi-cli_0.0.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.27.bb => python3-fastapi-cli_0.0.32.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.32.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.32.bb
index 94609b2b0f..33a441e1e9 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.32.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e0cf8d811ea2046529403707b266fb5a"
 
-SRC_URI[sha256sum] = "1dffb1e40c0c88f2e0171a8a252a2b615c1e63ff8c05626649e4badd6a84336a"
+SRC_URI[sha256sum] = "38024d2345275e1b37ce8848727a580d84901b570e96b3256d9d36a9a5039424"
 
 inherit pypi python_pdm
 
-- 
2.47.3

