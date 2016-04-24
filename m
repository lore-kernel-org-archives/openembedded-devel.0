Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04B22607A4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2016 14:18:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w143so14841724wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2016 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qAYXHlbcenB6hGDra/8M+lnGBaJ/jo9OtfsHxiEJ/wU=;
	b=rzkkg2Ex6agdya37dXK/H8N5LKBc5+asl2QdyVtCGH00GjDPxUsjgRuUzb9e8u7OoV
	rXlNuAQNork9E4WbS6mtpbG4RkgSCYSAKGNM20GzoLYth26ff9cm4rYh4MNgjAvVKXj1
	QuROi/JgZIOWm7eeqoePUc41LhKw7ZAualGlkUqdKWT+vnciW63NGGt4QGaZNzeyl/Pf
	EofP04cd3th01lLvbUSyr4k9pHTKu2Iev1PXqgkk41RBMistA2WbWHlLf2bPVoebLpPT
	QGdm4aGoZPFa9ZeHhzOlwDgEiU6rt6rKgGOMIpwgf/vWfjm+X67BGGe5bnAT7z1Gk3TW
	DoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qAYXHlbcenB6hGDra/8M+lnGBaJ/jo9OtfsHxiEJ/wU=;
	b=fq8uN9AcV5bOqIEdUWsTWI3WP8XS9Y6ZiraXZt2pDFGKKzW1JF364fi/7FUf3uRdes
	OXjt6T/yzZQplAmvP9nmEcZspu8zCfntaV/Qt04A+DhZ1szFcXghub9w6If/NQ954QqU
	l2ONylE4pUi8qPI9UBiP4M6H+QfR4a7/SQ2o8borMEcKgJG+0FiDjYXBv3J82rbK4yuX
	HiQ/IRG2XBjA0mgNExQ4X+jS6RmJFXvPh8z0AZJ0mRUZBBJW5z90Tp1AG+adk/p6vjbr
	7bf+LaJhEIF69WDUrCd0Sj4RyP6yPzMM28dyEA//TiEGtgUWpILTOvmcmNEmqe1PfswE
	RLJQ==
X-Gm-Message-State: AOPr4FXP6GgDrI2oum6PyEPO5Thb9d/waoqrygd2PHAg0/yBPnLsDI+N521l7k7/ve+U0A==
X-Received: by 10.28.125.8 with SMTP id y8mr7196577wmc.87.1461507509716;
	Sun, 24 Apr 2016 07:18:29 -0700 (PDT)
Received: from localhost.localdomain (p5B0A19FB.dip0.t-ipconnect.de.
	[91.10.25.251]) by smtp.googlemail.com with ESMTPSA id
	gt7sm18710562wjc.1.2016.04.24.07.18.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Apr 2016 07:18:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2016 16:18:16 +0200
Message-Id: <1461507496-31242-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1461507496-31242-1-git-send-email-schnitzeltony@googlemail.com>
References: <1461507496-31242-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] xfce4-weather-plugin: update to 0.8.7
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
X-List-Received-Date: Sun, 24 Apr 2016 14:18:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-weather-plugin_0.8.6.bb => xfce4-weather-plugin_0.8.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.6.bb => xfce4-weather-plugin_0.8.7.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.6.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.7.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.6.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.7.bb
index 56531a3..3519f4a 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.6.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.7.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "955581375d4860d10e52b5bc8935feff"
-SRC_URI[sha256sum] = "927c3b2c699208d63b2baf469b74c8c0dfcb98006ca9f80d75e7aec62658e6fa"
+SRC_URI[md5sum] = "ecab0eaad870e460da4597e76f43e6e6"
+SRC_URI[sha256sum] = "071e71106868c7d90c936256d837ca834d0ca6f54daea59a9b5fc11b318e65b0"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.5.5


