Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5721EC001B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.218.1687531229914755348
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=NC7qhR7f;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f9c532f9e3so9141415e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531228; x=1690123228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFMUSNmI+3lHGI3GXuzbz9owu5HBXEdUwXTBjrIZic4=;
        b=NC7qhR7f9o6rqd/fs5XlxjeCeygP+rvpGVg9kBMgEMpUTkk4mbOUseXLCHC/6Ed/mC
         oEAamYxMfImFXw+Ts4uT3JyknU3XhwdQm6NCTz7QLegede9ys5xGiMHtYK56pwMpiR17
         KKyqQpWeb1igd4u4xtvIkpGBbVnurDA+2jRrSJq0wyIan8kZr1SBCoufMn7a4zTcbrp+
         JsedTWE7XBgB3qeg7JlPoLPox2LcBIdzPPmKh3HvQ3tku2/hK2mh2oW6JwzxA3Aklvta
         sA5s3giWx43QeE0XoBWqLK82Fs3sq2UknH3tfCKYk77M0waH8o5GTaBL1k9qLnGw2aj7
         oK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531228; x=1690123228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFMUSNmI+3lHGI3GXuzbz9owu5HBXEdUwXTBjrIZic4=;
        b=RCMCm7VNFnrXgTmUuVJNpZLoIYZzBfdzaZcnl6XRCVlaLzVIwChbbO13yq4aSkA4Gm
         UnZ/pvTLkfJPBbexUgo4Y5gMtMgCtaPkYYN7wnWcuJcCh2jdIZRnkO1YCUnw2cAlocCd
         MN+VIBZTZt5cI0nXnrAG8qvO1xIOvH5HQIpPukIq4PhiD3Z1MoWzzQ/KrIls/HBJvgG3
         y6vOBGzRARD64CLoFe6YHOoxIl6DBH0Ew3XyTXlDiPQ/1CGtgUDZShtKtKAgbO6mZkKQ
         L9jTNGte9cSbO7LayiVtRoQW5SlA1REUx8US6xiEaoPeLNHVV9QucLqPfbdZ3qJOvO/3
         kEug==
X-Gm-Message-State: AC+VfDzsFdQ3i9ujhbiDrPAISBp+2nOGhWDgmwjDPasfiZbhPMhcPVWz
	b4tWLk5i2xO7J42ZwHdZe/SGMA==
X-Google-Smtp-Source: ACHHUZ4Eugk1IXHLnYz2lJHc0Qi7aAuDXpgvw1sgnVQQVJENfPxy5OfcqtsFkEwVREI3s3cErL3X/Q==
X-Received: by 2002:a05:600c:2152:b0:3f9:a6f3:8a53 with SMTP id v18-20020a05600c215200b003f9a6f38a53mr12420082wml.20.1687531228364;
        Fri, 23 Jun 2023 07:40:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 54/55] python3-defusedxml: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:20 +0200
Message-Id: <20230623143921.146338-55-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103550

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
index 3396c7262..8ec6680d8 100644
--- a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS:${PN} += "python3-xml"
-- 
2.39.2


