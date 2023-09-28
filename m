Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C984CE7B16
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 09:38:24 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.10159.1695893899851060861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 02:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BtHgnfxv;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso1036887366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 02:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695893898; x=1696498698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZ2RG5T/qTsn6hnhd7ZemVdI/L/Q5AnoArIhbmso/lk=;
        b=BtHgnfxv4+AxLYDGDeWCs+Sps1QpVaIm87U8l/CptsLDPt6XhLqzFRigs1Znk9kt8L
         pFKkKAKmHkTiieHu3Q8fjP01b8JJJvEq5vQovp7EGuoZ740CtCdu9vGDB1geALLlxKyE
         qof29QUE0mKMdSEP7JeY/r77Al9ovaLSLIZ/kcILF//V2U0Z7ctmQbXTCz2RIEDsJMaL
         7jgINPWhYGEMJufvs3sEYWgy/fN8X/A+aaecsF2dP4sUm9wAdYhKb5L8CHv07RuYLedy
         tRT7S4wWxE94tcJJZEikT4VFPikzF0t4sRa72pL2dWkMw4UKFxddPnOQk3JBENN9gkW6
         ufag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695893898; x=1696498698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZ2RG5T/qTsn6hnhd7ZemVdI/L/Q5AnoArIhbmso/lk=;
        b=PJQzMOjVP9FCU2cwlED2PV+skQqaJ2YXBaHz4Cw7RH1Yhs/XjwOhJZDu9Jt5Jcf93R
         GL6JY2EpQpnnlxpkB7OToH4bQ79SliCI6ea9agdCyRe92j/dHT7uYC8iB2rhbImkOITn
         CRs6tDTBsswHdIhP7mJYSOZDsqcpUM07JE416e7pdfz78Wzj8K/9n4BWyYYB6lICVaMr
         fcgVWM9g3kY24+J8RqenusFAsC3Tie4zeJ85HSZfl1Dhm8iJpu+NaRsnyoCT1EDYF+FY
         JhsGQ3NgO7pcrTEzzQ1ysxSjanO/ggCE+PZUkW4AkSKfv5InRKeprDDiTcWgSz2bYM+d
         HKWg==
X-Gm-Message-State: AOJu0YyvzzIt2BW6iUq3knSAuSEc5r6nSW/OAdM9fm8OpKb0fTKto1DQ
	InnrDjFDGInfiLhGIHvXtIndFhxHUqw1Rg==
X-Google-Smtp-Source: AGHT+IH+J0UsgmnXCv29gvmU78+VdkNlwJAKRCoytv5MTYh9MRJOOvmxS3ZzbSZ+Q7AasbPZoWxEMg==
X-Received: by 2002:a17:906:530c:b0:9ae:406c:3420 with SMTP id h12-20020a170906530c00b009ae406c3420mr622131ejo.30.1695893897916;
        Thu, 28 Sep 2023 02:38:17 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula (mob-5-90-41-13.net.vodafone.it. [5.90.41.13])
        by smtp.gmail.com with ESMTPSA id i4-20020a170906850400b00992a8a54f32sm10579340ejx.139.2023.09.28.02.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 02:38:17 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 2/2] dlt-daemon: also enable experimental coredumphandler feature
Date: Thu, 28 Sep 2023 11:38:08 +0200
Message-Id: <20230928093808.545770-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 09:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105220

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 3811772a7..c70f63e8d 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF"
 
 inherit autotools gettext cmake pkgconfig systemd
 
-EXTRA_OECMAKE += "-DWITH_DLT_LOGSTORAGE_GZIP=ON -DWITH_EXTENDED_FILTERING=ON -DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
+EXTRA_OECMAKE += "-DWITH_DLT_COREDUMPHANDLER=ON -DWITH_DLT_LOGSTORAGE_GZIP=ON -DWITH_EXTENDED_FILTERING=ON -DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
 
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
-- 
2.34.1


