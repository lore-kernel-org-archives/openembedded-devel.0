Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.16602.1595955029345918163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 09:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Av33glX1;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id r4so16005119wrx.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZMd4Qp03ffEpQIvwfDS6lQUS0xOkpTYMnrg0vFBgEzs=;
        b=Av33glX1vepHEezClJznoATO/cOcMeVm/HjkMEzSLzs4M8zupKiB4WaUrgigmGVFTr
         R3Uk+L0MpVIdreFGLAuVJsqPTUZXDnDV/PQu3QZcuxmf2svR6gzdKkmm58jU02EhtrXx
         V/khC5H8m1sx7iLLsBLeRThMLlnpPQLLpmbdwGoFXLwNtFAivbPZmuG3Rvfj3OxF3b9J
         ZvPdLJgi3bi/leY7i9qDf5UNdC9v1J4pE+Bp42Nw41Y1sO5OZfMIO8vPu/rJ3TYQaozg
         8ockCSlOEAJs/NxkIJbnUnGoedRqCe9XdI3G+rhjctDWo/lYBRGXlMRsT8WBNXdS1d/3
         1U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZMd4Qp03ffEpQIvwfDS6lQUS0xOkpTYMnrg0vFBgEzs=;
        b=hBPGEGZ/ozi6aFi/boWLJMl/3ai39dz/ZCu4lNPxjGdR8jthWNHXLK8zmyTBGAyppI
         RqU1m6DaHw6LCMheNFXodQcD1t8YpRqEPPmS1sVQ386pmnUBX6HN9uRinwmR/y095lbb
         AOLO+ctbKYwZz3bmYxpCShSl5li9U06sgZF4420W38aeM0nJ6XUYzYMAJ/EurpvS51Im
         PtTft3czFywx++1/IJKhLayt32WmOkKFNZseTxFG5GlKp+pZCVuuPVLeK1j039KGxSOt
         PTa1SBaCpjCicwdrwmndm8KfiNX7q6cHR1gtZPfh9n6AT48WYKMhNT6C3dw38XAPHrDJ
         N9nQ==
X-Gm-Message-State: AOAM533ove9eTXuUb4RXElxyR2XsOg64T6JNSZ2vKs+28BDcxIEJy7mQ
	b2H9x3ZLP8VmbvmZIflpWiK6Phy6
X-Google-Smtp-Source: ABdhPJwd6IU79j7cKojUah2m9z7ZE7bXlNwxESZlkyzxswyXzkD6MbfMDsWWKiXuooJbYo/Z6IJeew==
X-Received: by 2002:a5d:5486:: with SMTP id h6mr24618080wrv.136.1595955027393;
        Tue, 28 Jul 2020 09:50:27 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.8.158])
        by smtp.gmail.com with ESMTPSA id l1sm19975988wrb.12.2020.07.28.09.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 09:50:26 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
Date: Tue, 28 Jul 2020 18:50:22 +0200
Message-Id: <20200728165022.862-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.12.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
index 89b1ee11e..dfa15da2d 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "fe6328d22dfb20ea372daa4b58b12374"
-SRC_URI[sha256sum] = "b031c30d770f28c5f884071ad933e8c1f83e65b93aaba03a4012077c1d90a54f"
+SRC_URI[md5sum] = "3c351f7fd6376e0bb3c8489505a9450c"
+SRC_URI[sha256sum] = "05eff0321daa72f6d00fb121a6b4211f39964778823806fa0b7b751667dec362"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.17.1

