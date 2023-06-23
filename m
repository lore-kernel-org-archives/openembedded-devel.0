Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2265FC001DB
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.196.1687531203960362676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=y2DDTlDb;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.54, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso916620e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531202; x=1690123202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcTsHXprrXBV5XpDzdocrF4ZW+TTGJ/VAS1ZjlQeWv4=;
        b=y2DDTlDbyuBibSgay8oB/LcCaSsU4+rqJbLrIFnJtnfGo58R4DnZtBNtMLBfmDCaJ7
         BrPa+t4IUOMReQCgFPA5X3DFsVKc24s6TetuqBk+YaKAQ82KVPA0V76MMRe+JotfFCSp
         LmASj4i4VN/3r/h7B7NG/gJmNCEiy2Mq3y4uRUzDsbTQu12sGck4l7k6oRZz4KojNFca
         Oe0aQJv91+o1BMllBHyvv5R+okILbqxZK7J4ul+47RlBPBDS4R77mk5ah3qEtczmJCKb
         eSbhyMRj6jqG1xdqT7EpW7gMBwiwusc8iTvgUR2TsIuICMg+5cu4Ljx+kU2/3zrLkgcE
         tA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531202; x=1690123202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcTsHXprrXBV5XpDzdocrF4ZW+TTGJ/VAS1ZjlQeWv4=;
        b=alu5qXeaytLAhukkpq0oMvKTEW8vbaX1DEA4RX0i1UxZ2u8t5G1FYXhfeu785/xwm1
         Nh9nISFUHVi0qS0Xv5l4RWpUvGsbjSC5N4+sUrbE3wq9kMkjMVhJKoCbrtMU5VydK1V3
         gxS4wsuS1IcCOy68L/FEKvhKabfmE4Cw1uNruqEdDq/jVcrFfFK9eBzkkeut44kOsFl3
         Vh/H4SQj/eGyVApb6VOlXuy9pAbzaxtfQMkDHuiLnFp2YPj56MnckGUjSUQ4G1nEZDwW
         fhoW37KPx/lSMUjV0rhXmRT7/nm2PC2OwSHKi95M6rdv2R0yuCPZ3dv+P74GL3TxL9GW
         PqPQ==
X-Gm-Message-State: AC+VfDzGRlSlqWMvaFmtnwgsi9XgZWVnh9KqPIhLtLQ8qhn60N/r2PWU
	U50KHkoUUduHXEsEhLebahZ3BQ==
X-Google-Smtp-Source: ACHHUZ4HF4pQseNRGqjPx8mz/6uBzis+AgN5Q1tyG6JGKxcttTW8OyA8y01NbVKM8AiMu8JqdcNKeA==
X-Received: by 2002:a19:6909:0:b0:4f8:7513:8cb0 with SMTP id e9-20020a196909000000b004f875138cb0mr8678087lfc.2.1687531202227;
        Fri, 23 Jun 2023 07:40:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 30/55] python3-flask-sijax: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:56 +0200
Message-Id: <20230623143921.146338-31-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103526

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python-flask-sijax.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-sijax.inc b/meta-python/recipes-devtools/python/python-flask-sijax.inc
index 036cf7c3b..239c843fc 100644
--- a/meta-python/recipes-devtools/python/python-flask-sijax.inc
+++ b/meta-python/recipes-devtools/python/python-flask-sijax.inc
@@ -5,4 +5,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
 
 PYPI_PACKAGE = "Flask-Sijax"
-RDEPENDS:${PN} += "python3-sijax"
+RDEPENDS:${PN} += " \
+    python3-flask \
+    python3-sijax \
+    python3-werkzeug \
+"
-- 
2.39.2


