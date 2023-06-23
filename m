Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EB6C00528
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.186.1687531185633756702
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=RIzM7tyS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fa23c3e618so9186765e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531184; x=1690123184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzXfM15YYjj2+bISNUR81lPKe1Mmm1a4ElkQf0ByiNg=;
        b=RIzM7tySTQy/OAMhWQYqMoiLpOdIoDp66P4NxadLcrocesodrI3O1SAuv2ZjlbvIAw
         IeQPL9Jgju6AyyJ11ykv+QD4hRJgdjFhkcV4BF1jfy6kkuAddXYgwl9k6kj4E0rq5ilT
         gWlgdOFSxDaxNuUXaP1O2gLc14eyl5qHB4sjF/9Q9izjpYx3zQ8XVCTC8R2UYr7SouCV
         9CFmpd0SbSTHWgZW1utosMFvI+aCRApTjyyLIzulFnl6mgmoM6F2YdRQqseEog+l4SC6
         KmCF5Jn3sJrVGILbDptUNi+g57+4Apmu68LESdS2PojBl06XXv1F5jSxfk/C0weAAa/F
         y2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531184; x=1690123184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXfM15YYjj2+bISNUR81lPKe1Mmm1a4ElkQf0ByiNg=;
        b=cRzWBi4DszmG6eF1xWQY3UvvsDeCEFQS6GBtFUShnwgIpBOrqUspNYBsEU+RK/Bzg3
         mK+8cQNsqjcIWfszv/KNxPVxNm48OoSyn2Vp6tZrOyIGpWC/GzSrxAB0ImcJf2t08X2C
         bVLi3uU+tukhuDVpC45/nIDQNuaSgAHldl+LjNAuB4vvmk/4sA0SEn/SO0mTps93AK1t
         fQLjyNUBtkPbei9qQUqS9Avz37kkFaFndE7Cxro37pcL+CtaIeK5vyIhyfJ4i+Ay5AGm
         VdfnbrRYQo3JWt8soyv/J31cGkn6O6ykKXPlXbOuKBzkNiwprZ9ZxGeiHvHHl6I3HDrf
         9T2A==
X-Gm-Message-State: AC+VfDyjzsStukxWbPTvUv74Pk6V/3uVk4o0oTR9J2RECRWx3F7VC9UE
	HAJSHJOdqlZANHG7vpeVw/UrC5tQSJ9V/xMXZLw=
X-Google-Smtp-Source: ACHHUZ5aMfwCZwmcSNaBHMSFOHysY5/1V+EapNf/BRU/Cw34sxoyiAJI+EhyzkOXUqcmxWOeC4NtXQ==
X-Received: by 2002:a1c:f709:0:b0:3f6:9634:c8d6 with SMTP id v9-20020a1cf709000000b003f69634c8d6mr18710857wmh.18.1687531184219;
        Fri, 23 Jun 2023 07:39:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 13/55] python3-et-xmlfile: fix coding style
Date: Fri, 23 Jun 2023 16:38:39 +0200
Message-Id: <20230623143921.146338-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103509

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't use PYTHON_PN and split RDEPENDS into multiple lines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-et-xmlfile_1.1.0.bb    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
index 7c66342ec..fbebf4869 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
@@ -10,7 +10,12 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 SRC_URI[sha256sum] = "8eb9e2bc2f8c97e37a2dc85a09ecdcdec9d8a396530a6d5a33b30b9a92da0c5c"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-io \
+    python3-pprint \
+    python3-shell \
+"
 
 inherit setuptools3 pypi
 
-- 
2.39.2


