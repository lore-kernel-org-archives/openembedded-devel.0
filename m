Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 557617D141
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o10so5106570wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UIJERsLVDeS/VHTgHZb3wipbDCAy7B4ZfNeETrUX4P8=;
	b=GcOh6QFRJWre0m6lioWQ5uz3Lzz+yrVH95lSJFT5ar553NfqL0VmAFJcqAxoMB+Mvc
	5qgbvqvtDXCIeUJywmsuTRfrWA270Bji5/82D3fG0xcfXnI/ecCXrQQj/dDrUmIq0a0N
	BFj/ibV+3avNuTKiD+UOj4XypCS+safXeIHERHe2rqVWs2X9rQvTIQWSNsotA0yRkCmd
	Wbf71gHLQBTdzUIgeLdaFSYDQ5eO+TzzkaNO7jNFHJwdVBxWFSTWw6hFPDXj1xlCpCY9
	kEyHXH4+23W7c6JuQER836YB1nXk/VutNwoytht/+sJ/+69aUg+loMj7jVraUHjZRrJJ
	gGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UIJERsLVDeS/VHTgHZb3wipbDCAy7B4ZfNeETrUX4P8=;
	b=BBFmz80hcZpA90+YTq7IjpxyUjMKPRgmbetrBU4SSWgIa56CwqZwVYY2Hwz8tasGhW
	d3YTkoWfQYqoI8fChMiL8d3M+bb3XtDT4fRIDo43aPxHLp88bIDuuZEWEJRvI20kIwrq
	sOcQdJ4jWJ0bXtQNq9xGUTRTB6fgpOkD7WB9owyHfz0LyC1985UVOdUBuWq2cWzO1qjq
	XBk4a4blgy0icz3IWFN4xUDMkQ2Y/oMa6KeCFv5S1zMK7gjjb8MFNLUH8yFrrfJSVXP8
	E1sNAhNTfYqLjq5EGjOZkSAqoXtNl3yYzbX98O0DoMLMIz4VxWee0myMjIt17iSd5IvL
	n0xA==
X-Gm-Message-State: APjAAAVxCwrtX9BNGJtlX6fwOdBxUCMGDeAF3gmH2LWxDDXc4LJi312k
	le7Oi4dkGUAQkce/Mh4xL0nybgna
X-Google-Smtp-Source: APXvYqx0uNakw65gyEZJPuTGLiJDYyxKku5P+NC3sgZUEb/k1ZO+7PnHkoybAp0YCgCE973syC/1kQ==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr13551422wmj.31.1553700928574; 
	Wed, 27 Mar 2019 08:35:28 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:34:55 +0100
Message-Id: <20190327153509.23928-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 01/15] xfce4-weather-plugin: upgrade 0.9.0 -> 0.9.1
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most notable changes from announcement [1]:

1. Use https for all connections (bug #13645)
2. Use the latest sunrise API (2.0) (bug #14972)

Note on 2.: although met.no announced they will stop support for API 1.1 after
2019-02-15 plugin 0.9.0 still works for me. So in case of trouble on our stable
branches we should consider upgrading.

[1] https://mail.xfce.org/pipermail/xfce/2019-March/036322.html
[2] https://api.met.no/weatherapi/sunrise/2.0/documentation#version_2.0_released:_2018-11-19

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-weather-plugin_0.9.0.bb => xfce4-weather-plugin_0.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.9.0.bb => xfce4-weather-plugin_0.9.1.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.0.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.1.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.0.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.1.bb
index 1663bb9af..c53ca13c8 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.0.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.1.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "25d3d9fb2e688a619201655f6eea51c2"
-SRC_URI[sha256sum] = "34368cf2332774ad2a05226b2914ecb60e7550e9b2164be53ebe8f370198bb3d"
+SRC_URI[md5sum] = "e0bde3ba6a7e863022a86a23c7871255"
+SRC_URI[sha256sum] = "7cdc18b8df759dee4ceaaf6ce303eff7fda48e247dbc26b78142929213506cfd"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.20.1


