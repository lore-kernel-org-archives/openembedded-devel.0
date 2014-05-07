Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7B0609BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 19:39:41 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id b57so1068008eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ucgkz7YAfMx1QUH6AJdum63FUq8Jr7Qns4Hw6SfPNhI=;
	b=CSsWeP7gDibp/w52+nI6L/A6mZgAQrHPvHN3DlBqU8AF512cifAwT9+tmQhtFy4nXK
	qPvTmc0QDSUxaFvzrE+OFJDxA/GxBmJLR44Po8qO0L8OdhNji9NhjgDxs0Dk+PJ/Pbnb
	83sVl2csRDTjQe0jYJMi+IvF6tSQ6Ku/1E+7kUYNjeM9XyvSLQBtPGgdp99/9cidfxJx
	c1vo81XhKLqymJ9ajc5b5Ifym3Xueb4A/9zJLn8S0QaqdTS7L/Mvc1P4enuxF3WGIjLU
	w9/fKBKXtEWK9faxLfZwW7WKsH+7D9ub2NYdH+dCMiblb1OHMCFVKtzq06hO0wR7J4US
	jysQ==
X-Received: by 10.14.5.71 with SMTP id 47mr11639297eek.101.1399491582530;
	Wed, 07 May 2014 12:39:42 -0700 (PDT)
Received: from localhost.localdomain (p5B0A08BA.dip0.t-ipconnect.de.
	[91.10.8.186])
	by mx.google.com with ESMTPSA id m8sm48389547eeg.11.2014.05.07.12.39.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 12:39:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 21:39:16 +0200
Message-Id: <1399491557-3073-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] xfce4-weather-plugin: add dbus-glib and upower to DEPENDS
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
X-List-Received-Date: Wed, 07 May 2014 19:39:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

detected in Martin's world with test-dependencies

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
index b57f91c..d03a259 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "libsoup-2.4"
+DEPENDS += "libsoup-2.4 dbus-glib upower"
 
 SRC_URI[md5sum] = "755b33089c02afe88abb39253003a7f3"
 SRC_URI[sha256sum] = "40a6a22be7653b15a47174a430da89040f178695b48e5e01e77990050f715ce4"
-- 
1.8.3.1


