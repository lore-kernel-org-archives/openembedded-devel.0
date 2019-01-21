Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 37ACC79EF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 18:35:10 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k12so24591204qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 10:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hqmJp8SZ345IdGxU4PkaHH0JkB7I4hvz6ldjPgQxCww=;
	b=GQ5EgtAITbriUKTDru63WXKPY2IqoC9JyNM9O0cAsPRve7ilHzQ6OCQlQAFYo5v9dP
	LrK7lmGcqMLgqDiI5KbxchTYuzHwb6ve4YaIrQI5As9Oqk6fuyXvgocH07bXTqSkC3S9
	3NmESLHhObki44q48kBRbLlOp3moC2oU8bzS42p8/Wl3qvXzWe7dF+L82LXWr6L94yeq
	/aEk45i3vOnjM0EmADObQmiH9JJLVI5IMlWBXwpW73suPRgTgmbJDXBYvBMot4tH9bhl
	XtHkPPmGXp3FdlGioTaQV4T1Yr8SsYctRaOAmuhGCGnKb+Pqv8qzUzVzx7tYmunAhG7j
	Z2UQ==
X-Gm-Message-State: AJcUukc8TfKdrQHcpqNrwNsSoaP3uvCcQ2v3xMWPRqx11KETbAk1M/Kz
	57NDJY9fPwj8nDbJScNqaHouOeDC
X-Google-Smtp-Source: ALg8bN4JZZAO2qz5XbZTqrtdtFHTWxD16e2QZSmzRE45f4xwDFEYMsjx7NBPd0WWsptoCgJxzcumug==
X-Received: by 2002:ac8:3a64:: with SMTP id w91mr28066818qte.70.1548095711905; 
	Mon, 21 Jan 2019 10:35:11 -0800 (PST)
Received: from mfe-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.googlemail.com with ESMTPSA id
	f201sm48211788qke.0.2019.01.21.10.35.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 10:35:11 -0800 (PST)
From: ferlandm@amotus.ca
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2019 13:35:02 -0500
Message-Id: <20190121183502.15609-1-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] usb-modeswitch: upgrade to 2.5.2
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
X-List-Received-Date: Mon, 21 Jan 2019 18:35:11 -0000

From: Marc Ferland <ferlandm@amotus.ca>

Upgrade usb-swithmode to version 2.5.2 and the accompanying
usb-switchmode-data to 20170806.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 ...witch-data_20170205.bb => usb-modeswitch-data_20170806.bb} | 4 ++--
 .../{usb-modeswitch_2.5.0.bb => usb-modeswitch_2.5.2.bb}      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20170205.bb => usb-modeswitch-data_20170806.bb} (75%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.5.0.bb => usb-modeswitch_2.5.2.bb} (85%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
similarity index 75%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
index eeed5e275..6abd94168 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
@@ -7,8 +7,8 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0cc107cd0c4c83df0d9400c999e21dfd"
-SRC_URI[sha256sum] = "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1"
+SRC_URI[md5sum] = "fb50d15b52e909d742dd16f0a9882316"
+SRC_URI[sha256sum] = "ce413ef2a50e648e9c81bc3ea6110e7324a8bf981034fc9ec4467d3562563c2c"
 
 do_install() {
     oe_runmake install DESTDIR=${D}
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.2.bb
similarity index 85%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.2.bb
index ac0df8bab..33e40b36b 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
-SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
+SRC_URI[md5sum] = "16b9a8efa1bf8fbd7d5612757eae4f26"
+SRC_URI[sha256sum] = "abffac09c87eacd78e101545967dc25af7e989745b4276756d45dbf4008a2ea6"
 
 inherit pkgconfig systemd
 
-- 
2.17.1


