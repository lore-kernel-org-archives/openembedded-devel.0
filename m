Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4C9C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:18 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.4272.1634338577249963300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=ny690Zn5;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id i24so46541086lfj.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIl+NUu9ukoNGAKHLnPQg3JUJMhxRmltvd1Qb5HuqI8=;
        b=ny690Zn5BDSNTXAlar6CQt/yWGPLZAoaDa04YU/KFo4OHUuGTweN7IhgRculDQZ3WX
         WY667Nc6uwvB/XgbzpRwUe/6TqzgEyj2wBVzaq8xT5tMgjFfvKdhkXU8YVNN31So35gN
         NHRQq60kKwM0AGXNZ1gUtWJugHcIktFISaSSmamJsxsnGgl3jaccDKKQtMza3KH2BMJu
         Ql6qd9QOw5Ft5k/v7bGoqzbT75/TuW6nb0DJP5ne0jvN4n+Im+khiy7WT/JekXM1Xz4I
         gs7S5D7BGTZkRHB6BDukVeZlNzQ9qSH1qseI6/pvIAbds8sym1Je411JHshoicbSCWSG
         lBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIl+NUu9ukoNGAKHLnPQg3JUJMhxRmltvd1Qb5HuqI8=;
        b=Du4su74IRXs333MM35wpBKbHORpTYP0AUrrxOIPPSY+FxaFY7o54A16zAQ4axYBTKO
         VsVATGVM9H9ncIVzJy5Nu+GT9Ob8w5ujAJoEVlH5eCBRXi1AQmI+cVOYMLQTlPxZKxo5
         scyzTkc+Jhurb2s90Cn5T1dOrooeFvCWcg0hitVgmwZFjVFoBZdtEr3JIUX+7mHrKrUQ
         JfXJo0gfDP5EZV2Ah+HTli1V7y6hwKw7ZjjknZe5+oUh6fh4+w0dqtHLPhbBJPAem1nJ
         YCMTicQ/fkmqaURHLWyJGnSkrKhJEJisxHnZLaKBKQKNWeXDetCEOW9yLfmpUtE0kQB2
         H3kQ==
X-Gm-Message-State: AOAM533hOfHGvjCtU3b1hfQLVtr1OE26GCOaX3GJFbHEyPsY2ZTtYlTL
	LUnC86M2cW4Hk+tNjtlTyn/DF6jiA6OC0A==
X-Google-Smtp-Source: 
 ABdhPJx7A7jgI4s++nny4Gk6qKu1OlStptUAR2W1DUXONGFQxYdNByIelIM2qRxla5d0tYBaZPDKDQ==
X-Received: by 2002:a2e:3902:: with SMTP id g2mr15602376lja.321.1634338575334;
        Fri, 15 Oct 2021 15:56:15 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 x22sm652445lfd.198.2021.10.15.15.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyopenssl: update to 21.0.0
Date: Sat, 16 Oct 2021 00:56:13 +0200
Message-Id: <20211015225613.4162531-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93352

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-pyopenssl_20.0.1.bb => python3-pyopenssl_21.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_20.0.1.bb => python3-pyopenssl_21.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_21.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_21.0.0.bb
index eda9381a5..a7e0ae4b1 100644
--- a/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyopenssl_21.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "4c231c759543ba02560fcd2480c48dcec4dae34c9da7d3747c508227e0624b51"
+SRC_URI[sha256sum] = "5e2d8c5e46d0d865ae933bef5230090bdaf5506281e9eec60fa250ee80600cb3"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.25.1


