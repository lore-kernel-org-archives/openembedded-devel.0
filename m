Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BDD4179A4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d17-v6so560076wre.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4dclJpZHVLjoKtfjaBSHjepVkP8fG/YyEdHAJRkQqpQ=;
	b=efre5yGpFW9iNrc+IV/rONbasSGjNl75kWguh0XEpCNjsZkwM+yc2dAKg3Ixm0LF3O
	1FT9567zD0QyvnaKIBcTX1Tor+l0tC5AXQNOyZvj/mfsmbt9etMzZXdg76qSxix9Cc0I
	+tOtbNm+0Mo/bIpdPxc2syQjBjeWj8gIIudVy6kfymHxWgjh0BX3Tku1NTTJQMHG5cBC
	8A3DDRR5iQZdBedUemQYLQEaIttFZwvhlXwR9r6OnG0a4nCI1ZvmiHTOtEVnYzkGMhG/
	vPda3CadOdbxv8nGdhjx54l8dpHOcz0VaOrrzj3mgOCxxrqwYyAIeg6lBT/3Fyjr/a4C
	hMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4dclJpZHVLjoKtfjaBSHjepVkP8fG/YyEdHAJRkQqpQ=;
	b=Q6HSFxtkDnr98iPZCKbqmUJwE22wwrYwdWUxMQCsUss+9K3rVYL6OYRcuF4G6e9YtJ
	YPQI3duZI4/BBYyTWWMZZnngCa08JK865oKBgPQzTeW/7J3Cq8A/4DjlOTlMC7PWQK9n
	zD8IjeYnh5N8U1iEmUcXdkk4gJ/PSVNDl2+L8x1y2k9QZ0ExvcC7Qpz9h/ZLisfYd/ZY
	hL1rF2SP5en2C9Czq5mAPEnzUH3V1p9y8U0GSWIX06s4IpaT/3I7BInOd7YWvFr/EQcv
	qfuZ84Z5oKUVhOREXdrIAEjSWfuuBbn23CemT0WJHkuoRYyTHOAS8MZrb7pOBWe6DAsh
	+azw==
X-Gm-Message-State: AGRZ1gLxcydAbY63WHX7QSdaDYbzY+9qLSitsR91bMpm423YBZv8kPE4
	sRIBkoDXq+wcXAE8V2S2qLO+VtZW
X-Google-Smtp-Source: AJdET5e++C1Xxo0qT+Q+v8Y2ETgciqZRAN8afkjtyeBIYxS6Q5PCOxFFP4rqnoj36U1s4NsiRzserA==
X-Received: by 2002:a5d:554b:: with SMTP id
	g11-v6mr250112wrw.222.1540550960049; 
	Fri, 26 Oct 2018 03:49:20 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:57 +0200
Message-Id: <20181026104857.32142-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] network-manager-applet: upgrade 1.8.14 -> 1.8.18
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a packageconfig for mobile-broadband-provider-info - disabled by default

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ork-manager-applet_1.8.14.bb => network-manager-applet_1.8.18.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.8.14.bb => network-manager-applet_1.8.18.bb} (78%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
similarity index 78%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
index 957516e1c..fffb57f9d 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
@@ -11,10 +11,11 @@ inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introsp
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "bcdd92645d36fc5778f27aeb2773509b"
-SRC_URI[archive.sha256sum] = "ca9b1233721f700a7190b98eea69ce6d0ccf74fbfde173ac868a4ec7a78840cb"
+SRC_URI[archive.md5sum] = "34923579b39360db64649342ee6735d8"
+SRC_URI[archive.sha256sum] = "23dc1404f1e0622b7c4718b6d978b101d5e4d9be0b92133b3863a4dc29786178"
 
 PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
+PACKAGECONFIG[mobile-provider-info] = "--enable-mobile-broadband-provider-info,--disable-mobile-broadband-provider-info,mobile-broadband-provider-info,mobile-broadband-provider-info"
 PACKAGECONFIG ??= ""
 
 EXTRA_OECONF = " \
-- 
2.14.5


