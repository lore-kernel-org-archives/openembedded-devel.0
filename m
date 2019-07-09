Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5FFE97ED5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 20:52:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45jvdy6lCLz56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 22:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562705559;
	bh=0z1jXk6JaI3f7bgw80KKHVo86G5oruRQQcxQQTSdcAE=;
	h=From:To:Subject:Date:From;
	b=VjMmoRPWHg8w8yrvQ8j3sHQWP9eE591OdPd7W3opuuDJaR5y1xtgxlNJDNa37MQoV
	h9mw3r3UupPkYves590M9luO7D+U8pUFl2G4pymopopigwMjM/RWm1CaeBN6y1zApa
	ngYGdHkO0jRL9XiM6tzq+K7bSX4q81DzqyAapuNWh+ja391opSHcIW5VY2+1lgyHiB
	ZpVWKwINekdfFrtl5cK0aOcS7IPGWb8v1xi5hxfL+AejGwWVtvdo8P/LS+5WoYDYlJ
	xBD12RAkoJnOaxZJ+3WP0pKvuKePX/ONmMuHPhN6YtU9+uX3+S8GXofzUK4Zj04z2T
	VH9k/fb3Js85JHw/DC6j70EnvliPJlLrV9sX3YT3QlhKjuXwmp2muUK/CVgvjIHr6w
	/a/3AoqgffYXeylOI5iALtJf3WwdR4ngWL5MwdR4BERj1ofOZkI3+z81yakQqtQQpR
	QNSaVkO90A2enac2jmtOIt23L2+g25UuqkJOFHegGBvfHaqNhjGGmhCP3OxDsQzECY
	I0Yp7DTZ/k779MeP156K7JW5zZgT3WmFQWMvFwl3+LpXGQOfStGPPSMJqoSJqNFmGY
	GPqSNc0x7nI5hIgzEXPOTXzGiEkgKlzyCfzF4TSTn+OdZ1lImUq12DWTXd+5oRJo6l
	dyFReXQlF85Vo19sDiW/kifE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jul 2019 23:52:34 +0300
Message-Id: <20190709205234.13737-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] gpsd: Don't build without optimization
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
X-List-Received-Date: Tue, 09 Jul 2019 20:52:38 -0000

What the upstream debug option does is to add -O0 -g.
-O0 is unwanted, and -g also added through CFLAGS.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v2: better description
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
index 91b1b9399..b0f946cee 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
@@ -35,8 +35,8 @@ PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
     libQgpsmm='false' \
-    debug='true' \
-    strip='false' \
+    debug='false' \
+    nostrip='true' \
     chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
     libdir='${libdir}' \
-- 
2.17.1


