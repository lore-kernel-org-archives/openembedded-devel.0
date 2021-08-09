Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.22754.1628515073989623248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pie0I6qE;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id b13so21426506wrs.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Aug 2021 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NI7L473liBiOjQVL4f0r82fkx0J4gPCOd3cnKaqaTm0=;
        b=pie0I6qEtMNTRNozpjJqAuxkxhPk6Wer5Tn2/LN0UmbCyRlb4Mfcdt3Vj+f3sYlOSM
         xPBsLn0mH9qeZtGxpirByqjLeUoljwkPeJKPyOXdbiy9/JvozwUVbX5p5f/wfCHX3Bxa
         w1xLpyTJEIHbrChs0xbSJzcwFEGow1KCahcbJwxa7OxU2XNEspxLnFHv03VSpFeAwSAP
         TOouvDdbxEEnbk1h/Pl1EKWNdfcNtm8TTJPdx4UI/IRGUiw7DgXHGiinptiCGfjGWHCh
         nnyPn/8LzhtvS6JnkPn/vN68hdYQAEbCguH4lvjLXHjEOB/us9yWXtIsdOdoh0tV6k3k
         5y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NI7L473liBiOjQVL4f0r82fkx0J4gPCOd3cnKaqaTm0=;
        b=gPgJRhlMHf3/rgAT4w7aWftYd0+exegc9lDqGRpxZRyNsz9r+RriI+k9+pWIErWECe
         lHDy2WZDnoDEtYQ5frhOs3coXrWc98LS8IAEtWUarlnHJpNR32epe3LPHorqVUWCyhPs
         LXV+lDEcYLc7LXXNsMX9B5aMPGbRuDt/VAmon1/4kROKq/bem+z/ITmCcj9lEixkEi3x
         yPTKZmJtYtvkeH+zkASYa2ksKtwWtSUjYG9MY1JMRqmX88fUtnthZVkhXyZk3L2diAGJ
         yX18rSrIcfMgAmo846q4MRwBROvEQnn8D1AqYq74BCG7CNp2sS+RyhzVrQrs4/V35WrH
         Yn6A==
X-Gm-Message-State: AOAM530I2dckkB4f3qrKcpF783n/2qenx59cT1m87W6k3fm8UWYUsq11
	WFnQI9ZFhUb5VvDVG6T+zD6MFQXt/GM=
X-Google-Smtp-Source: ABdhPJxTmNfRIhFlpJ1aKAJogMeCaGc4TPNQ/wq9Gs18dqz53GpeKZTFPMSh7s3hsxq9wtyq6UrWCw==
X-Received: by 2002:adf:a309:: with SMTP id c9mr7577901wrb.99.1628515072253;
        Mon, 09 Aug 2021 06:17:52 -0700 (PDT)
Return-Path: <aj.bagwell@gmail.com>
Received: from localhost.localdomain (cpc108959-cmbg20-2-0-cust309.5-4.cable.virginm.net. [80.0.21.54])
        by smtp.gmail.com with ESMTPSA id n18sm19772353wrt.78.2021.08.09.06.17.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Aug 2021 06:17:51 -0700 (PDT)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-devel@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [meta-java][PATCH] layer.conf: Update to new honister release name
Date: Mon,  9 Aug 2021 14:17:40 +0100
Message-Id: <20210809131740.12242-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7ef116d..7791178 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott honister"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.17.1

