Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5BFEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.7380.1687180971263300826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=4KbLDCrV;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so1633131f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180970; x=1689772970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpOssfLB/fTdlomVpzuwZthNQiespWKo42TT3FcePcM=;
        b=4KbLDCrVd4GxCU6ePvCqIVdF5yZ9eSIeKIS5Y9+gUHTcouXLcNSXe4IIHn3Hd6AXNr
         7x2ibr3nmnt9phnu/nhlt2/mBvrjPi9ltIR6JYVsji29lLsgQ5MKwUu4M+eHh/OlYH/g
         URGuFXgqGhVRmcWkKhhT6KzKavmMud7HemFKFbuwD5Sx/LTnoprD2FT52pPJpUAuT7k7
         BLcDBvpaiyPypjkUoD//MugpKWOQ+handQRXB5tIVnDnuUalds73JMzi/2BZ2moEQzJl
         fc5ge09IO80khiKJae9BKf+Vwhtg11M82JcREHIOnJ2AeFqrLBTQ8hjfENjkJnbKkhH+
         vNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180970; x=1689772970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpOssfLB/fTdlomVpzuwZthNQiespWKo42TT3FcePcM=;
        b=Jm9uO3gyoPBdV1Mp1amXZH4S+R49weOiumrsh6OlFpm/4JuTsba2AY8dxqzkIIuA5q
         p1wo/w0fF9iR1UGGwCs/4RAH18Y7juTcx/ZVtdnVaUsF8lxWYX/Jn8DI1UYotQTO3u56
         lB1lhuPQ1BFQKJlqh1EgfzQp+ndqEN7WjQQIzgOvxKszJFCCjXBo39G8o13Si3DZVTTn
         ddajcISj0xh2K1+AYTUs3YdDOahSDLcTkrcoZuFrU3Hwv2pVgpxzo4ULSLE45Q5Y2zle
         uU+szhjuyNHQaL4ULmYx5fBs+4gE4HA82kjShPMQj4+6qQ7fQsLOvv6hMqL0K8aaDBxp
         I+MA==
X-Gm-Message-State: AC+VfDzMM3MWbDCd68uoHFMEK3bljQpOCXlzqMo6E3kVMO8pnbwpoBfM
	737bmsqUN0Yd+OCgWI7gGCWaHrhPrs99Af2u6WE=
X-Google-Smtp-Source: ACHHUZ5doUI4DjNN6h0B+gf/+bxhqGzZLypbOKLzbDp+8+yI6Ypt/AGjVx83fg356QfbzTkbUZPibg==
X-Received: by 2002:a5d:4538:0:b0:311:1120:f2a8 with SMTP id j24-20020a5d4538000000b003111120f2a8mr6538727wra.50.1687180969815;
        Mon, 19 Jun 2023 06:22:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 28/54] python3-flask-sijax: stop using PYTHON_PN
Date: Mon, 19 Jun 2023 15:21:48 +0200
Message-Id: <20230619132214.213417-29-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103412

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


