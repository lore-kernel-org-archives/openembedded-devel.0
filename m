Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id F242B60FEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:51:19 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c13so1866429wrq.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 22:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BoY3X7AVHiKgxX7inlAnOiotYSGQ655adAcLGx9jt70=;
	b=FEq0fzhxVjuS2yG3YFXAVf+yLT8WoXn4Kx/4WQqTJI6Ufz4xppuA6uQDMxF7K44TIb
	GVd9epgGaJKBJcnllgFWeIb0HhEOneBw2Rf71hBqSuA7FSQy3xpQ1IB+aSwnVSWESDA9
	MfK7qcYfZrkLMBMtOBzNuql2VlMcsKl5KwuCk0YhPJhNKbqBLWNmhe3qWEK1xY/7WuCx
	Wy+rVXGF+D1zkhY+4oYCMAU8wKhcfCdZtbpXaxyKt4Ub4fRbVSlCdigXwOWhn9vQ2arw
	nR0jOSh1TSRNinBXv2zD7I0WqZx+qpV/PR2/RxrCeLG3kfhvNfzCEF/XMaRa3y3/BjY6
	KpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BoY3X7AVHiKgxX7inlAnOiotYSGQ655adAcLGx9jt70=;
	b=Ia3NHzmVrMi0yr9GKdNzXayAXW4ZWJOAwHT6dJ96CXe95dh5G4GdGXuxbqRTKWa8x4
	qKRcXwvBDZmvlBI01qCDI2cGxhZ552yxtRA+ZfYJL8OsqCcEl1/uTVjp9ebtHXou+jfK
	W56p3G7q5rJO2i1OOpWsjf8U/vtgw1jcWPc8iIdHFG1FTgtkHJvxPPwrqxtJa/08ZPr3
	rxRjG2O/NW7M8GFCxVGnEY92PmZ3FAab9+G3Dx8MWS5x9SXc6sc5mRqjE5jLSt8aVqJD
	fYy2KyQn8GOq9ihDSCWiyi8fiwJgHIdPRTbqYWhy/QX1BO6zX/UgzsxQnHhPBsqzvtGE
	UN1w==
X-Gm-Message-State: APjAAAUZcU6X2fht1oNxAskx/WHLmyHau0aQvGoWsgj6dP2+/lKFgOaL
	g5dBanUCnw85rpsnNGSXE2/YsC6Z
X-Google-Smtp-Source: APXvYqz1DqzpieQx2xdb+LSI+88utfRs5P9Utt6+Hnc6eWO/cJM/zZYuXbEJsITf9XEEtqPnJZlCKw==
X-Received: by 2002:adf:aa0e:: with SMTP id p14mr3050769wrd.399.1582786280354; 
	Wed, 26 Feb 2020 22:51:20 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id u8sm6470066wmm.15.2020.02.26.22.51.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 22:51:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 07:51:03 +0100
Message-Id: <20200227065105.29865-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/3] xfce4-weather-plugin: upgrade 0.10.0 -> 0.10.1
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
X-List-Received-Date: Thu, 27 Feb 2020 06:51:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.10.1
========================
- Switch to 'locationforecast' product and use a more recent API version
(bug #16268)
- Fix invalid scrollbar index to add a label (bug #16023)
- Update URLs from goodies.x.o to docs.x.o (bug #16182)
- Fix build with panel 4.15
- Make build output less verbose
- Use standard icon names (bug #16059)

Translation Updates:
Albanian, Croatian, Finnish, Galician, Greek, Portuguese, Slovak,
Slovenian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...eather-plugin_0.10.0.bb => xfce4-weather-plugin_0.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.10.0.bb => xfce4-weather-plugin_0.10.1.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.0.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.1.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.0.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.1.bb
index 96c2048be..ad9b6e9e7 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.0.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.1.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "7ff4ab636f93addba0817bf6436d2964"
-SRC_URI[sha256sum] = "4423a0c27830fd1f08e063aaefbf70f31d89235d75549ca841d677ab2e409572"
+SRC_URI[md5sum] = "203ad16e74d4823f6fb6e9a18bb7df55"
+SRC_URI[sha256sum] = "afb2af5f3effc2ea6181636ed0e82e6dafd556ec1b8478100802f85a5d167a89"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.21.0


