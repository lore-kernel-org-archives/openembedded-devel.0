Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47A4EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.7407.1687180961016941873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=NRoRNNmA;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so3435153f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180959; x=1689772959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdYZvjBUxegsyTO1z6GYz7vIppXNQ+kLlroY60zAvDg=;
        b=NRoRNNmAYH2xOd1HhXxfr8hJrnjdhfniXwUYiot8WW+30ZuRraB86znOjLnyxQsl16
         Mzy8Yl0ggecMUWn2b7Hid0FzRUqMuYrFKbqAJDb8aB/7we0A/w9Itl9ReuIOP/XXft2p
         pmGYlOspaFlB1q8ls13QxxPonjxZWAYwb1Ck8LNN51ZEIxLfkGh0pZ8D4Nj5B/TUpBzA
         7fSDqjnECKuePb72b52sQQcqPDijDBJgKHAfEPBJtrJOx70Agbbh6mxMTSlVeNybozLz
         vX/HUViMW8iv6YSZU8kYXsrDuYRCJmFaHIFEi/gV728DBQhdAVm6vkTiD/hIy3Ee23/X
         zDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180959; x=1689772959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdYZvjBUxegsyTO1z6GYz7vIppXNQ+kLlroY60zAvDg=;
        b=E9bwNze+z5I/iVb1PnDG47eRXMH0vAauDL2X+LtHQ7poTNjbLTPXnZJ6/i0PW0+JQA
         pAkQz8T5zeIzGFq3wofJv/1732lhWUj7MGzYfEx9wdBjRfB+bB5xa6ic+FJt3+v8KkOn
         R4JUdA5tmHBNI1EJYIjNDPt3zzQvAxCHAxUPWe40NLHMWoqpnvvVtfhrdGteKr2K2sq+
         NRddh+pump4r/grGX+ioxQQRE4HdoO8olFN5ZD8IPkg0DUVIQSirPHQePaV89slxK6zt
         BngJzctE1e3MhOHbYzA55pY/AeZqrNjPtEYmIbvj76ydeRlt4HN8UhxG4tFWEPkYMrDG
         9wuQ==
X-Gm-Message-State: AC+VfDz7MkK1SZQgTeWxifNqut5RjhQiLHnQS7xRAgS3PihxKpKEI4qu
	2k4/2cdJ7s/AqUaFho7aSWzzPQ==
X-Google-Smtp-Source: ACHHUZ7HASr1dAwIRTP1wDKluwbkKwakmNIL0v1YdQ3UlgMn1O7i4mgJrVuaKMpBjRzpvR2Ko8OLAw==
X-Received: by 2002:a5d:468d:0:b0:30a:f2a0:64fa with SMTP id u13-20020a5d468d000000b0030af2a064famr8654763wrq.10.1687180959483;
        Mon, 19 Jun 2023 06:22:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 19/54] python3-isodate: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:39 +0200
Message-Id: <20230619132214.213417-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103403

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
index 722ea3af3..c65083b77 100644
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c1
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-numbers \
     python3-six \
 "
 
-- 
2.39.2


