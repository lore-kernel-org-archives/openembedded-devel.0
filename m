Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2A974B52
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:27 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id l2-v6so10584844wro.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PNLQL67PmzvVpECgOvdX/WOHBUNk1Q4hG6uz0SiRFkE=;
	b=SmmyX1HB0rhvwppB1baZZD3HLMr7EARxAD6IUiFG885I7r14IFBKzyY6qDSgQMYcKD
	W7Ax8oXUvAGjmeCE/9PAnAK73gX2Gfeqz0j2DOuLc/Ahm2oOFkfyhsKWERjIEZsvKZze
	RCDsNmsHBqzrI3CLZdxym+YhQPB8sOLJVbSvg9R2C91mJJNrNhHc/yBLuz1ngSVI8Tzl
	o6q9B5N9mPi8p4sxRI5xyABIQ+PhwYxM0cIZKoM2KZaqbxk66lWXakKXA8iNk7BTIUn7
	7wK6OwCzLhGnfovAuaoz28o9vwtFZc0CAQ6Fn6Hx/RFVgjoZA+t9UU50DhkOCQ6hqI8T
	DkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PNLQL67PmzvVpECgOvdX/WOHBUNk1Q4hG6uz0SiRFkE=;
	b=DPnKYrEHM3nBrdLAjb9mpOIRpfycV5dqVzpmSpoqbhpPSnA6JLaC3xBEeLOKhmfLBc
	H7mwQ58iBevqlKO9evLoIG++jCc0yuGN4bOYoyi+2bR8A67oHHi+mB021KTTdV6orZan
	0Sq0O7XAkv1jmqHIar99ojy8GX370Krq2d+nZU3bNB2mP/EgZWdw4EiLn/QVycAau1ig
	ECe56AEck+/ePxpSY9iGrQTcM9asfFfdpDY1sW/OK7WSxoNoTy2X3Rj8uFOPwBBQyyx3
	40CnAS1nQtheEfVSodDZpjPtKtxI6QX/TsBrIjXtSrwY189JwM9eh4ucDypUmCIh4akb
	tiMQ==
X-Gm-Message-State: APt69E3NjSCAIY/B6unmVKOEKaHGAVNB6UkpgsvpaGZsq2nmV5vJxOom
	/TgFLAgIn9otE58Q7XyG0QLVeg==
X-Google-Smtp-Source: AAOMgpetLx5gpS6jyLi4pYDBDeQ4jXwxc0GkG40TwRzw9pOxfqWUchM4PyABhGyk7RAxHMyzGRxLNw==
X-Received: by 2002:adf:9345:: with SMTP id
	63-v6mr15171614wro.60.1530360207621; 
	Sat, 30 Jun 2018 05:03:27 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:05 +0200
Message-Id: <20180630120315.29414-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] thunar: upgrade 1.8.0 -> 1.8.1
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.8.0.bb => thunar_1.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.0.bb => thunar_1.8.1.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.1.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.1.bb
index c2f6f5954..726ce91bd 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.1.bb
@@ -9,8 +9,8 @@ inherit xfce gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "245ca8e9111c44667032023199ca7778"
-SRC_URI[sha256sum] = "acf151bceedb20aed45a6da61d7bb85a4a03964090c80454e72e61e7fc9e49c7"
+SRC_URI[md5sum] = "f0681eccff31c027097a3e1e7db85218"
+SRC_URI[sha256sum] = "96fabaa68db32f513e9bcb34fa2a26c1462127727fad0bc25a8a5ba9aab4c12c"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.14.4


