Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id E8B527FAA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 6so8347172wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=N4hIc1Jde8CsBv0tFlqkPEOum3oLMm9SKsc/NP71tX0=;
	b=CNRrOMx/OI5d0bGRVC92pPK0q7lB1h7yeCzjIDcfa2dbzbRAupl4kkfpF27FKDwTyl
	r3ic/8Kd1fY0KKeGdHKmM6eKoUFyL4UG5MW4sBFdy/4zjRcWbB8rbciRQxPtwN+7zEtT
	jre02PPiDzjYG2L5SRxbk980rSSzfYBIqgMK1bRi6fu0V8wzo6O+PR20E6sR+MxbQ5zv
	9n9XZbTOgo0Cl42B70YoGxe0ptTPiWPwNfJblsg/BDEW3pnU+P4ICq6X/Mj6HI101JLH
	wBORAm2XXlgEoeU4xMSyQ7Ca9+9ycIB3fHj22zJHQbey0gc2/Z5MelICG5bFe8kCvF00
	kEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N4hIc1Jde8CsBv0tFlqkPEOum3oLMm9SKsc/NP71tX0=;
	b=IyeG0RXPeVKWt7jEWo27WHibn9nADCtFjyveWjpot6eabkBmmw5STg1CXRwvR+AGPV
	n5y5OeITahMgRAVzXdWIptBuglJibnkHW0UmtQxmCdlWgSUYxQXWHSGcV29bupWZ2T31
	2wMEEysKPsfhvla5whx7nahe32ypBjCPyxSa29s9VcU59VUebfbiXWrlfeM5BSVZEb3q
	5KzlTzqnM+Jzsc/k6QOFfY2FF5QosXl3Pi2s8c4M4FTSdUe1qqldFasYQvIz1n5caK93
	otwWxeBqEqXy8LV0XhfZkp5kWzkUWUvPUe921ZgI6Uo6Cc0MMzgPXBY/878NKQJW5hbb
	ZyRQ==
X-Gm-Message-State: APjAAAWQSzgkhEfiDINBi5082mkFFFyW3twM9Etz9ADZ1NtM2Np5vbXo
	tHEBmttBAUzBiX7rZ6Yy9yiltpON
X-Google-Smtp-Source: APXvYqxpZEVZ2la+bIn5o4fQ0JpkPAAF0csSWapexLPlD6+2rTBZYNRMUyYd0GxCEEQRV+cAFr6xgQ==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr12645668wmc.68.1572219372595;
	Sun, 27 Oct 2019 16:36:12 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:40 +0100
Message-Id: <20191027233545.4146-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/19] gnome-bluetooth: upgrade 3.32.1 -> 3.34.0
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-bluetooth_3.32.1.bb => gnome-bluetooth_3.34.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.32.1.bb => gnome-bluetooth_3.34.0.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.0.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.0.bb
index 3c4438e7e..ae6587be1 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.0.bb
@@ -16,7 +16,7 @@ inherit gnomebase gtk-icon-cache gtk-doc gobject-introspection upstream-version-
 # gtk-icon-cache bbclass will take care of this for us.
 EXTRA_OEMESON = "-Dicon_update=false"
 
-SRC_URI[archive.md5sum] = "5b3d66f564a5067ea154750cdb6d850d"
-SRC_URI[archive.sha256sum] = "6441cafd313af94fba28b701698074f97d693b9023788a74e8e6f16f817ba1aa"
+SRC_URI[archive.md5sum] = "0c567e124a52e8ddc31c8bed0c3e57a1"
+SRC_URI[archive.sha256sum] = "e867e67423e1dc78c56c2ea11dec066ce0254238d559e4777c80fa2935eb6baf"
 
 RDEPENDS_${PN} += "bluez5"
-- 
2.21.0


