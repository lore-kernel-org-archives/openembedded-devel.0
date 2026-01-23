Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6165FD72362
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 09:42:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64045.1769161331227730052
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 01:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dlkq4r1s;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee974e230so17658305e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 01:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769161329; x=1769766129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PL4GElrw4MB/Y/bL6yEd7Hdkg1/tE4fyWGXP00rzSNQ=;
        b=Dlkq4r1sE3cZUhaFHdyfPunjpLqZ3RMyzcES5Na22cp5DmfpxEosfceQx/WM09C4rh
         XOVt03OI9Y2txSAatALO/7MVD9ikGEhmQrDiOsMxUNP+KHb4138WlJnJa4mZf8DYu3le
         qvTipCPg2V3Kn1rZAKzFPimEjFXBekVYp8lj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161329; x=1769766129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PL4GElrw4MB/Y/bL6yEd7Hdkg1/tE4fyWGXP00rzSNQ=;
        b=uyyznzshmOJoB+Vzdkoxz+gZdc8HQwp6AAoArwivFDY0azjbQS7MCqmGujnuXhXpUx
         7PIlCfheOf5uz8wRtTP8+Jd7Qss2swGgefWE8wx/bekze7BflrBemY3hEb2yrlGX2xc3
         eW30KuI/4GSUvznCtHZadNNeenVvo4wXdnfKJk808e84MklqteQpKeoNtN/OgSxbDpFn
         zNXdIOySlCqGPF/GI1I/IlHF23MX1MPDwpUfq2Wyyu9CjNUbpukqdtfFNG4jSMNKgmxS
         u2n5vOm7dH/4tiW3oBJB7wCfCST6SEWi/WbB1d7jTrI4CVHS/nd6Wp7I24BpzcFlcwNb
         2rYA==
X-Gm-Message-State: AOJu0YyqCQ4thMw6b6K+9Lvi0WzvVmXHcn9DK0Ej3uLAFkiX5ZhCcws6
	a7BXiLEAPiX7rjYkhSPy1aByMMqR925c08Z20gjvwloSpEOW1eiFEwcgc49PeqkWoPgWaLCKH99
	9hhI7
X-Gm-Gg: AZuq6aKdkZZPNLInwp8qXtCoHaQIoccr8k/mkT3gjSebt1ike6k+4EbCi79tVEhgOQu
	68qbe7tyvIwOPaCIrgPzwyg6vEOZ8+TA6gtAcToeRdZylXPXFbogliiOBh3iQfDpA3I1wOUtml1
	pu2CKV8BN4rYEOX6aK505qtU8VB0UKheUqw8a7RoHHJJsZYeEW+c0+MgjrvLDA05kSORupygro6
	d4UxRMczdcONhFVR4eZzk9leH6r5FTdy+/LYR9z7BHqQwXs1T2X61ZVb2SraZQQ357yNm9rFc9R
	VVUI+GJ8HYstgy357cNrCMEmHyx1p4AcA/lhUB3o4NiNU/L22fqp8cjWusnVxIqvAlOqC2XTdwr
	WKagk5GTuXl++hQW/NwNSGgfOolWHy1ZWJjYCiJ8tTsGtaxt6HYgcOVYkGxR9Ytko7vWFB8NMNc
	+qbKNupa8ljc1zJeHXtEdgmfjssevps66+S7g=
X-Received: by 2002:a05:600c:450d:b0:480:1a22:fce8 with SMTP id 5b1f17b1804b1-4804c9b7c2bmr37275835e9.26.1769161329294;
        Fri, 23 Jan 2026 01:42:09 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbc9d0esm16135575e9.16.2026.01.23.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:42:08 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pydantic: Upgrade 2.12.4 -> 2.12.5
Date: Fri, 23 Jan 2026 11:42:04 +0200
Message-ID: <20260123094205.3303453-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123094205.3303453-1-leon.anavi@konsulko.com>
References: <20260123094205.3303453-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123777

Upgrade to release 2.12.5:

- Fix pickle error when using model_construct() on a model with
  MISSING as a default value
- Several updates to the documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.12.4.bb => python3-pydantic_2.12.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.12.4.bb => python3-pydantic_2.12.5.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.5.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.12.5.bb
index 8793e76aef..e354e4b93d 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "5c842dfc9c245fb37aa1f5ec5b55c1aed10bd7e6"
+SRCREV = "bd2d0dd0137dfa1a8fdff2529b9dfb1547980150"
 PV .= "+git"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.12-fixes"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
-- 
2.47.3


