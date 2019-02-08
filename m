Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 71BC87C55C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 07:02:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m1so2275547wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 23:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dB6iyYwQ62XnokMtcQ4DzNCmbIlHGmdv2VfMI3NhY0Q=;
	b=LKy+AfW9DMiAld2bRDy59GH7auVMCvaTOr6gWzDnN0UphFzgjTuMIa/XDSJ8JQ+n85
	jilmuQweml8SqGqIji79xT2uBScdJE4GTdlCp1PXqDi7x72EG43s2c/cX+Mqsw5MC8aD
	ozCyp9x33zjw7W6Krs2B7UHXJrUe6yXWhM8ESCjHimGunBQy5amHpLTQJgCOzU9KNknZ
	7xAZbZ6J2Akwb7YLZZyNntKNk5Rwe9lTTdKlysJ/S+kN83FeT033Gtil4F1KtQwu8yc4
	yz1VW6ZD8NFdsKHnqdrowTKmZSDf9xKAzW8y0ww1DT/TpSUqpu/Ikmaq8ZYkY+OD7YWU
	AVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dB6iyYwQ62XnokMtcQ4DzNCmbIlHGmdv2VfMI3NhY0Q=;
	b=WcsJnLlu3gFFnou6ncwZwZbh6c4mjtxxERU82KwElADMjFzNuHO1CZTsOQKZL/8/hC
	6EAcw+il+Vkgsuvrbx5QclBn26iKYEh1VNf58KQx+fnHdsVNHYjRWTunIJVYmm89v/+o
	6VxyuewyMc1/0aSN1cvuQVXy7aHJR9Zm6736T8k6z9VpTtQhrH46IDCotf2u8kyRVGzb
	54uQpi340hAxR+AR9+ctrAS70MAZ0YLHBLWJa1i435amm7dM15qBHFvSYMUKYARgZm+j
	XtDcsdtxY5Wv9ePe1384M5sv85SeB348twUmsWvVlwmsABqvctrfMBFfE14uOPSLCUS+
	71RQ==
X-Gm-Message-State: AHQUAuY4jBd+ALYehk1iZyWNfzyP3AXOnxJWADwXvaW7h4lAk5x+lgVJ
	yyB55d3cSIw9fgrrzEkYNTB8Yjz7
X-Google-Smtp-Source: AHgI3IZ9HTWljVHoV2vmjj3v58iJeuQnLykRr8w3MalXTOazcbjP13N1MeFA78Omr8lBZZHEdpoYhQ==
X-Received: by 2002:a1c:7601:: with SMTP id r1mr646934wmc.123.1549609356806;
	Thu, 07 Feb 2019 23:02:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F02D8847C49AEC1D0D8828A.dip0.t-ipconnect.de.
	[2003:f0:7f02:d884:7c49:aec1:d0d8:828a])
	by smtp.gmail.com with ESMTPSA id w14sm589722wrt.95.2019.02.07.23.02.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 23:02:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2019 08:02:27 +0100
Message-Id: <20190208070227.23858-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] menulibre: Fix multilib fetch
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
X-List-Received-Date: Fri, 08 Feb 2019 07:02:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| /home/superandy/data/oe-core/sources/meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
index b0e4784fe..1e9e5f1a1 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
@@ -13,7 +13,7 @@ inherit distutils3 gtk-icon-cache distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://launchpad.net/menulibre/2.2/${PV}/+download/${PN}-${PV}.tar.gz"
+SRC_URI = "https://launchpad.net/menulibre/2.2/${PV}/+download/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "9690848dbf9196c3f7baa574e90378d8"
 SRC_URI[sha256sum] = "546fec87f451c8f5c220d02b1f36dd850f4ce9ab607f8e9711ed8f2009e349fe"
 
-- 
2.20.1


