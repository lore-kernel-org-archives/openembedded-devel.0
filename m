Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3048C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 06:23:18 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.9347.1721283798327659383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 23:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgBYIG/j;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eedebccfa4so4913881fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721283796; x=1721888596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu4061oKhcOcFngdQtYYe5ziEXG6Jj98/ctRkb18fJM=;
        b=SgBYIG/jzCdAm/QtKgMzh2tNkhDWPOUH1u6Q9gBV1EX1gnlFLEUcMkpPPM5C2qrlip
         jH6ZuQ6mVTDmU6pAVusFkg8g99deW2PEE4DJwj1qwC6U5g65e8eKSjUWiM0ucwY7GiCo
         DOSB3i2TIdaD+T+sjF41aGCPVznR7famHebVBuFQ8N6zlgabxdxb7sQEo+EG5psyCiZ7
         WDseUPafihHn141abflHh25Ms80/jhztejs/cArnOrqst20lj2pon1erm6aJ6oPSYL6o
         0whafPusaGFoFT1D8isZql0dO3X2zvycAAunM/qOqZ6qttVUwSEk138WVjK+PvlR2x2y
         uupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721283796; x=1721888596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gu4061oKhcOcFngdQtYYe5ziEXG6Jj98/ctRkb18fJM=;
        b=pe7EDlM32F/xsAHg+ql79AN9CPBkovcrDg1ZOWM0dHd3ovcI/Tie5EX6Tdp+3niQol
         HfJLFuE0uWnBaaOAHibiSQo4A4p8o3lEsXZw5ewnk5iMvLfLH467SL7JbtodPPFxkbWm
         UtgixzEWdutcUsRaloEW7eHoJYlnHsj+S4+XbCBAD49ZJNnQ4XipoClGJ/1cDnEgQefM
         6XbI0efJI2d0AXqEgf2XyYMKchIHGm78n4xYmzPIrYmZGOnqXvh4/9J1T/1P6TavVkPG
         8rKGFUk6HOb1RhSOUJD2fcD2S8WlAyv+M/WAIWn5ihXdcSgPGh1ZfU7x5Zh0svgZ6FRp
         VctA==
X-Gm-Message-State: AOJu0YzhDpj9zcqdbM/dc28aUZolSPlJM5BPPoT0pRchKJrwLhLZ7hla
	Hg4ZfSnyETxkbHLEITV/Sa5FDWxUTiPDQjTuZg5Y9P+oTVij7n/Ynz64Ag==
X-Google-Smtp-Source: AGHT+IFqb0DUsxgE4f9UdHb7Wll5ICzUOfOl5E3KIhAxvWiIJq8spRMVp4z6vMsV++Ve2vI/ItSQeg==
X-Received: by 2002:a2e:3306:0:b0:2ee:52d5:c4a3 with SMTP id 38308e7fff4ca-2ef05d2ca0fmr11083411fa.39.1721283794971;
        Wed, 17 Jul 2024 23:23:14 -0700 (PDT)
Received: from Unimatrix08-Jammy.marelli.com (mob-5-90-46-50.net.vodafone.it. [5.90.46.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59fac90f253sm3378335a12.83.2024.07.17.23.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 23:23:14 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.18 -> 7.0.20
Date: Thu, 18 Jul 2024 08:23:11 +0200
Message-Id: <20240718062311.172869-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 06:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111392

Also update copying file md5sum

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...{vboxguestdrivers_7.0.18.bb => vboxguestdrivers_7.0.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.18.bb => vboxguestdrivers_7.0.20.bb} (96%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
similarity index 96%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
index 47f616e99..444b86a1b 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
@@ -1,7 +1,7 @@
 SUMMARY = "VirtualBox Linux Guest Drivers"
 SECTION = "core"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/${VBOX_NAME}/COPYING;md5=fff5fe1c81dd6dc3d522e7862e44881e"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/${VBOX_NAME}/COPYING;md5=217590d3a513571b94632edf5fa1169a"
 
 DEPENDS = "virtual/kernel"
 
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "d999513533631674a024762668de999411d8197060c51e68c5faf0a2c0eea1a5"
+SRC_URI[sha256sum] = "5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc56d064de44222dd02"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


