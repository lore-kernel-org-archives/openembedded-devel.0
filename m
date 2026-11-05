Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32770.1793879745830329735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=txhIPDZA;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so18073675e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879744; x=1794484544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2SNumNfXx1hEGXKB07Ptue97DJsW+7V+fsnA+xsj1E=;
        b=txhIPDZA2gPvkra5+KMcv3sf/eTC1oG9+4aweRI3PRbM6wqMRrUFAzIlscu1U5gvUN
         woJGygDIh2c8KnRsk2uCzQ81qWiIiO1n/kNdQHthIuc8ApP2mOMOOFZz81MLJPNIgvLj
         Qofoj5VTudjI2K3azguORmHc6EqFoDb3Tky1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879744; x=1794484544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2SNumNfXx1hEGXKB07Ptue97DJsW+7V+fsnA+xsj1E=;
        b=naT0u9mMjGyyuFqdmJVTbVoe4+zPPfH3P1sUzC4NkKolk12uWv7fvqb4zRQC52dKpQ
         1GvdZrfqrvYQaexUuom9Z6SK0FXfgneKfMMicKvuUmC2L98BrbdtJX9Pff/yIYKCcBxI
         cRdE1faKNmRin6y7uEx5zZzJM+MnXY3QxkmjeIrsYcq6ODV4RTZtHD+9VkqP8cmCpR0U
         TKSQ6+P7L5wD+AGb2WhvnWgpQjGXETfOgQbKpUBTeKpNOQvNq+PdV4iumtKPJ1uMNP7j
         jkdZicqpaXkSsygtTbW8yC7uj9YJCxT7pAQYPPZupkSMtw0ONV4Ntt5G3btUxJVzW2LM
         7cIQ==
X-Gm-Message-State: APuU4Z+55g6GH5UxCOcglcX1oRbsuJgO9KTX2GYL12aBK7esiWmPDlJT
	35E9vrDpSfvVGr5qfjdl2a3G8PKu7AgKQMPDJfB3WV/v/IEuKaybr01gg+O70ZcskJFuCCGe5XL
	9StPZ
X-Gm-Gg: AYBFou17oh60o42SknhhXDHVivLM98T9VPEYXZ5qS0+C17n6D8mT8J+KnTkgeRKHH/S
	vt1slMVpnJXIsZ9TZvMXwW/9tFmoECL7pU5QQPch1kgO1KEqUyhdZ5jXbdQDwmm6qgu6lSsZ3s6
	fqQufD3Y46sgxT3reSKfrmSoCgkoaEPPSwGJ0GOmYxrMPlS3JR165Rt6dci2/JBBEk8TXDHnwj7
	yVeeK/N6PR5ksSjxBtkf4d60CNEbZ+nCxJz2/PmM7rCMIPtD2fenw8zRIxa26jUReqZualkT9vl
	UoP4IAzVY9QZRNvIyB+FibDF3dvnox3YAlJTOCSujHaFJAkxnG3/atYOc2PnaRQsKGrOIwB10Tx
	liCYLmjLugUIBhLm4N1vf6bCdrIiOG4LV/qVI0cLJXCDvW0f6RsxWH92ZnOvLYPz2SbPEjUxSH9
	pre48wnQpUX6qfEre+zZP7AZ2ynLp9v+xlId/RzUKZKnmQg1L7RsvpWhEh85ZGaX1re6+L4qymS
	5ceQX9EuZXtHRET0saIMDm2NWD+ZcDN/oPm3qQ7g11/fUq2FEylYOrWuslHqomI9rVUHKFtGDeK
	9dM+M6SsmcGSt26emZj7XoRE6qsjnhJeXHhc7gobhF1j9nyYhnL9NbODiifQ5d3UT/P9MeRI2q0
	PLPXjWIg5gu2Ki4vXNhV4Q03JPV1pvhFk+Kb98NrhT5eFdesv6+BRIw==
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr417939975e9.26.1793879744164;
        Thu, 05 Nov 2026 03:55:44 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 17/19] python3-typing-inspection: Upgrade 0.4.4 -> 0.4.5
Date: Thu,  5 Nov 2026 13:55:24 +0200
Message-ID: <20261105115526.634289-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131917
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.4.5:

- Improve performance of get_literal_values()
- Expand chained type aliases in get_literal_values()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...g-inspection_0.4.4.bb => python3-typing-inspection_0.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typing-inspection_0.4.4.bb => python3-typing-inspection_0.4.5.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.5.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
rename to meta-python/recipes-devtools/python/python3-typing-inspection_0.4.5.bb
index 383a878ef5..64c547e12b 100644
--- a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dfe2d84c58973d6a532c4e7638dbb3d8"
 DEPENDS = "python3-hatchling-native"
 
 inherit pypi python_hatchling ptest-python-pytest
-SRC_URI[sha256sum] = "547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47"
+SRC_URI[sha256sum] = "7f16c411e7930dc79596d42ab44672a3fe5f60eb34b781a1647e7872363120c7"
 
 RDEPENDS:${PN}-ptest += "python3-typing-extensions"
 
-- 
2.47.3

