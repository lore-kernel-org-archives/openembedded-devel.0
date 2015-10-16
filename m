Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id BE0B97714C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 13:58:09 +0000 (UTC)
Received: by wijq8 with SMTP id q8so12256822wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WHWt8lXZRIw736O0RXVgEJrEMWeH1CbR/WRn+kYCm+U=;
	b=mNSjxDrFTGYFPRb2Ek4+19/T6DwvkHwCgeQFPkPiah28hkNBge+Cd5F7eekB4hI9bL
	lCvJwtnJNYBpi3Xz//Dc3ngIrSykSKC0C2xop/3cUOtS/6bAJmIROWLX9f7pSOKW2Kk5
	PCabRl1MGHBAgDjvd9RP9/mAwPCDZkjACDHd0BHIyOMBUoUiq6howGzFiApPYp4gw0xB
	1axgQpbHsZYDfUC2LC+ry0SnddF7ehKNotTgA1Ju+uQK1eVQk96cu+Ze7rEIgvL7uxvZ
	5GbU5jjtOqPJ32Iua9mUUKm9WDGpYhmdfYofN5u5Hvkjw95jxg2Na1ho2TLiMipTVdrR
	oTHg==
X-Received: by 10.180.198.178 with SMTP id jd18mr5066767wic.34.1445003889313; 
	Fri, 16 Oct 2015 06:58:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z2sm3372231wij.1.2015.10.16.06.58.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 06:58:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 15:58:30 +0200
Message-Id: <1445003910-6444-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
References: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][dizzy 4/4] geoclue: add PACKAGECONFIG for geoip
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2015 13:58:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
index a0305fb..5e3d04e 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
@@ -20,6 +20,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "401ff99d530b177c62afacef0a33efd9"
 SRC_URI[sha256sum] = "4a82f184e55a163d86e0ad69bbe1bba9960bb5094220fe1f01350bceda8c67a1"
 
+PACKAGECONFIG[geoip] = "--enable-geoip-server,--disable-geoip-server,geoip"
+
 EXTRA_OECONF += " \
   --with-dbus-service-user=root \
   --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
-- 
2.6.1


