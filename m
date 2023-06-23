Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20181C001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.202.1687531202700046534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=0lcjAddu;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f90b8ace97so9020075e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531201; x=1690123201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpOssfLB/fTdlomVpzuwZthNQiespWKo42TT3FcePcM=;
        b=0lcjAddu1vbzi3/r4esNfaPyvsOU3p80TLIChMY+/y1OPlSWiK0lPMT2prNk6x3PLV
         9mShOaX5EBmU6h1lKRs9PDML29tTffZjOqxWQyL7cfmzcnVwdi2Vm6jUlchVtcvYCXN4
         IJ44l35kquQag8z5KfWacY0XheDOtB25RI5MxcBPtqR7dQlyswAcnFnESNrPXSXtd/ZW
         zDIwJNVhLsPBZVDTZDsRlgU/G9YFzNzf/diAsJYg4vfaP8BSFfwtmgX0SORUiQ9eK1xt
         AkljE35AzrGlA8encJ6RSo7Gez4XpW61lg9MNr4n9Rk3LUIZH6l4tat32p0RD3cSwcKV
         HWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531201; x=1690123201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpOssfLB/fTdlomVpzuwZthNQiespWKo42TT3FcePcM=;
        b=h31XXN2T1X8KUSyQpFWoW98H3YqyJhnThawiGS05WRlG1uKdMF8n//WAmKO56JTy8E
         /dYbBCa3ismoAKrQK3mc1Z/fm4/y1fv4h2TAyj76wQvxclAKiZ2/5OCHM1ekOKMd9m2G
         Y2SNPV5D06Poh1f+aw6lAsVv5LZwQRT8bMbC9r0qkh3rRQt+YW2dYjivg6FNoyBIceQT
         M49dBs1JL2OeGvlHJ3J+EQ6EQ/QfxgAIs8Pa0DHIPsUO41PKTQA7+xsNaTcOgGuHpavX
         DsvXpyVU5nwOoqZSs7okYmyLlmQPfXyBkumOkb9ewevnILDe9x/c5yQVHqwpGX14G+30
         8D7g==
X-Gm-Message-State: AC+VfDyD4yuFI4gMdJ3Cepdxb0CqO5Ow9R+3Gv9C8cE3Z/cdKhTvMfC4
	+ovg0hdWSQvfrV1XTcKTfQw8kg==
X-Google-Smtp-Source: ACHHUZ4+BgyNYfEte2ZXSamD3BM6SSHIAwO883He+lCn700pheSyql2Nlwosu0EvbmczqBJa67Ka5g==
X-Received: by 2002:a05:600c:2197:b0:3f9:c859:24c4 with SMTP id e23-20020a05600c219700b003f9c85924c4mr6137424wme.22.1687531201266;
        Fri, 23 Jun 2023 07:40:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 29/55] python3-flask-sijax: stop using PYTHON_PN
Date: Fri, 23 Jun 2023 16:38:55 +0200
Message-Id: <20230623143921.146338-30-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103525

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so use python3 explicitly.

While at it: use '+=' for RDEPENDS assignment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python-flask-sijax.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-sijax.inc b/meta-python/recipes-devtools/python/python-flask-sijax.inc
index 4264f8f6d..036cf7c3b 100644
--- a/meta-python/recipes-devtools/python/python-flask-sijax.inc
+++ b/meta-python/recipes-devtools/python/python-flask-sijax.inc
@@ -5,4 +5,4 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
 
 PYPI_PACKAGE = "Flask-Sijax"
-RDEPENDS:${PN} = "${PYTHON_PN}-sijax"
\ No newline at end of file
+RDEPENDS:${PN} += "python3-sijax"
-- 
2.39.2


