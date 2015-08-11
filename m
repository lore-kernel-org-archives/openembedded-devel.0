Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id F02EF76959
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:15 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so49989173wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=lK1UOFtP6jjenPUGe8xZcLpeu9Afz5la1YjnPJntGPg=;
	b=dAXc6Tf5lJNEk+zNWHwsfPdCcFbs5vfHdiMVkmrquVxpc2s0O25elxL73Y672SoLTm
	lU8ojp+iMUA5DYY33NksOuU66qixRCj9QSPVxbsOBvDz4RffEBS+zND9BI0accv2EHQW
	jfa/SxFUnXrlCtkbsH3YvR/7Rn4cGgbLs3+xMlXsIqWpKYVtxwVZyS8/rKinblPAD9vO
	A81dP8S8z/ewYL6+7MQ3sUz57+nJY3c5bL59xteN4RW/5Sd/mY3PIL+Ez8v5cmye2ox9
	tUef43Vf9ioy4hGabWZSk3FrKP3/7iImyJYCUyP6aaAmAf/0HKclYvDwqTI6Ly3I9mve
	cyXA==
X-Received: by 10.180.182.115 with SMTP id ed19mr27095630wic.29.1439279895747; 
	Tue, 11 Aug 2015 00:58:15 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:28 +0200
Message-Id: <1439279859-1815-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/17] xfce4-weather-plugin: update to 0.8.6
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-weather-plugin_0.8.5.bb => xfce4-weather-plugin_0.8.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.5.bb => xfce4-weather-plugin_0.8.6.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.5.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.6.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.5.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.6.bb
index 3fc5eae..56531a3 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.5.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.6.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "cc6d9039540a71e57102ae75224a3f5e"
-SRC_URI[sha256sum] = "be8ac0e5635355d568e4095a3459f53efd5f10a8ef46976a43dc30cbb277e5cd"
+SRC_URI[md5sum] = "955581375d4860d10e52b5bc8935feff"
+SRC_URI[sha256sum] = "927c3b2c699208d63b2baf469b74c8c0dfcb98006ca9f80d75e7aec62658e6fa"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.1.0


