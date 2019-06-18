Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id D1A787CECA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 22:54:02 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 16so1194683ljv.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=WpEKUTAMHMDqG3pglEYac3qF4JI55LFObAHF7Pj16iM=;
	b=ltYczTH2cTxCVkbaiv/rUnZB0Xc2AivhK6O8RktqRV63Kds3pe0C7id3auvf5ZO+4E
	gowXV/Lez2CBndxMR6NO14kCXc6dBuAyv0+wokF3IrqJLDcBdkYYZW0pN7EK21gHYXx/
	R2Y46VhyTCdbV/rXQDWjRB3zpJORJ6L68FndDV9xIWJqGamgmpWsVMKURA9Xs6zfqVL5
	VsH+WGr0WSxiBqV+eamh/DexlFkv4U9k0QP5QPVDszTe6zhSa8ulJS+izvy/j2gdg0hi
	wuYNaD7Dqclsk4j2SN76jtTaNH4C488IOQxa3XhoF4gBH7br9UVg2kGTVjgXh0mdfxEk
	fM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WpEKUTAMHMDqG3pglEYac3qF4JI55LFObAHF7Pj16iM=;
	b=HOVw1XzJN178JecxKOka2cRmRQ5HR5100G+T0vLlpyVvHW60F/GEjLhw93OXY8z4DL
	NAgVDi7jKF9u+bhoeWHigJx7b7oWG1eDQVs8W/1LTONRkIBK+hklBEIsMboUGem2FHTy
	dONZ9KjESskZNt2VfLDR8+7pvG4Zf7dGN5v+zrW9XlLsGrQY8BzkassbmrjakFPXbYbI
	Qp7pnOpxtBStkSgTe4KAylSEmp6V/gyiBURPzaEdo8sAc4BGP8e5M5zuV7mUbOhq2JEb
	piB8OW0RvY1osYUVhgoLolXbzjx3ZGgqqaduO7Tlmf6pe7BLGhoYdq/Wk43RcveHsji6
	ce1Q==
X-Gm-Message-State: APjAAAXeTc1+98+ocBmtOQCFUq4aR4HesxCTR74sYlUVd0fjI03g4azT
	mtrt4KdOK5gqEkBxoiPbiR6RTnwh/tQ=
X-Google-Smtp-Source: APXvYqzA0xzcllheAVoG912CIygcAKPSUvyjDhXbYJ89y8BFfdYh8DggHevZVsXoHsurRr/LTXt6yQ==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr12589606ljg.80.1560898442998; 
	Tue, 18 Jun 2019 15:54:02 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id z6sm2659160lfa.45.2019.06.18.15.54.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 15:54:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2019 00:53:58 +0200
Message-Id: <20190618225358.28518-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH][meta-networking]] openconnect: update to 8.03
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2019 22:54:03 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../openconnect/{openconnect_git.bb => openconnect_8.03.bb}   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/openconnect/{openconnect_git.bb => openconnect_8.03.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
rename to meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
index 050a2833c..ec36a375a 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git"
-SRCREV = "6487ee8763e1b6345718684909aca970befbc49d"
+SRCREV = "ea73851969ae7a6ea54fdd2d2b8c94776af24b2a"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
 RDEPENDS_${PN} = "bash python"
@@ -18,8 +18,6 @@ PACKAGECONFIG[libproxy]  = "--with-libproxy,--without-libproxy,libproxy,"
 # not config defaults
 PACKAGECONFIG[pcsc-lite] = "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
 
-PV = "8.02"
-
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.17.1


