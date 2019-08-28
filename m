Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBC27F2AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:54:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k2so265299wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AdqAz75n67ymFrHgDIW1H0dmfY4kFIlGBQF14YVa2DU=;
	b=ZkfxACrtP4naj/1rH5XgiKZUF2mV9imSI197i9qEkoyMZLrecH+k42xR1g6sLzM3/6
	L60Glv/9ypT2teyaAJWiEJTlijhPoRMaNnKTZ11UBC31/T8hPj/HkRJM7zPSQlxTu0OI
	SEFBiErS/PcfTziFgWl8xcXTE9P86obL4k8eb1qSXDV5oRQvXIOrPThkLf6bI7eq5emA
	Dxll9XAkafFWUkWB3qIZZ0qNURpMByCqy9p2vdhjAcx1eS+oghFpUOYEIAVojY/IzF2c
	kUQO4ErL4cOT/BD99SEqanqEqgPxMg3Qqdn6CcpKv+WDRVfdkTrnzSjPrVSxHbxSLAHy
	KVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AdqAz75n67ymFrHgDIW1H0dmfY4kFIlGBQF14YVa2DU=;
	b=b3+gkg5igLkT5FgAy1TMbh3RpHW6JkaNZ5V4aKtS9uZndnTn0qknjeMgdx9fGDHAST
	o821qtq8Ly6dENMytCbxXra0WvH/vWaeuRV1NrRYC3iY/Snu2u6jIdxlrh48oq8nMTBp
	Itxqy5+JuznjDiUvT+O8HDuPE3ywAIGmjqeErXWbFF/F3owRyDG/wihYao8UUm6ru68O
	zydQYTs+H4vGHWPn1EV1c3Tp0F2vco5G1i0EltI809ogTL9i1++m43lwjMeTkLEe5a//
	jIXlYMduammXs/xGT26/l+DDekRQweXIdn5VJ73xgA9SUiNHBPqrt59FyytSGCe0e9KJ
	LBTQ==
X-Gm-Message-State: APjAAAXEbOWIFmYCq155pgZ7LRemUchsVJmJIaQTe0+MNVpFpLBkRxBl
	nZHkEvdPrYO4PdLFx909G2tMZ7aN
X-Google-Smtp-Source: APXvYqwZnpBFAx+ktvL6M8d4FGrRSlPow2oO58s7EBUpVKcNooWLm2cTe7ZvUk+s7zu5tvmXFYZBcQ==
X-Received: by 2002:a1c:ca11:: with SMTP id a17mr7626510wmg.45.1567032880764; 
	Wed, 28 Aug 2019 15:54:40 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F43161224192BDF21814B6B.dip0.t-ipconnect.de.
	[2003:f0:7f43:1612:2419:2bdf:2181:4b6b])
	by smtp.gmail.com with ESMTPSA id a7sm1095886wra.43.2019.08.28.15.54.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 15:54:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 00:54:27 +0200
Message-Id: <20190828225428.15322-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828225428.15322-1-schnitzeltony@gmail.com>
References: <20190828225428.15322-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] glibmm: upgrade 2.58.1 -> 2.60.0
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
X-List-Received-Date: Wed, 28 Aug 2019 22:54:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../glib-2.0/{glibmm_2.58.1.bb => glibmm_2.60.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.58.1.bb => glibmm_2.60.0.bb} (87%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.60.0.bb
similarity index 87%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.60.0.bb
index 1e5094bd1..7163212b5 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.60.0.bb
@@ -13,8 +13,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI += " \
     file://remove-examples.patch \
 "
-SRC_URI[archive.md5sum] = "77f1016cbb27e15d4e04a2b7bfdb4cae"
-SRC_URI[archive.sha256sum] = "6e5fe03bdf1e220eeffd543e017fd2fb15bcec9235f0ffd50674aff9362a85f0"
+SRC_URI[archive.md5sum] = "0f6180d185c067bdb2aa30d035f9b867"
+SRC_URI[archive.sha256sum] = "a3a1b1c9805479a16c0018acd84b3bfff23a122aee9e3c5013bb81231aeef2bc"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.21.0


