Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4AA7F285
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:03 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q21so1676363pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lg1SleBDFy5GCrdh+06XPrpo5gH+0ClvpCdHMMOkmjU=;
	b=Hb7Ro19UOT7Edxjohep80JMyPQSsWuram+4fiTV/uJQiUfdL1LZWqyj8Ir7Wi9tzt+
	vPb11Xlzol005jbMFtJEU1hMY/G5y9YgjoU/jynBQ1NrPM0tubSZ6vxswgBsW09hheB4
	c3fxeY9aCI0SHqBhcZkhrfVhMArgiPIKaQRZxM4LPilp0urhgqtZG9A3adf65zSerHAU
	T+fSsVoaev/g6bO5bUKpSeks06tRzlWXESfegBDKMQbExY65owZwNNqQfISXggLzkuIh
	aIDJR+nDN/vcK4grJnnkjhi6wcZw2ovM+XQGkg/B5qDFT/tGAATrl6a30Tkfncu68EpW
	RGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lg1SleBDFy5GCrdh+06XPrpo5gH+0ClvpCdHMMOkmjU=;
	b=RZFrSZ0ZFXX860jm8jOsc29nZMJ+A9pfnLxBWbMOju1iTGJ9x9GW3E9aI9K1digOOP
	UzklZjujJ2jLbKjHsZ/YEIoZiwykFir3ldQYkWBxqxiJRMOFWV80tdFzRB7MCLCbYgUb
	H6FylSW3ltOq9hmR/02I+hWO/cO8CPJK7cm7GOQiX3FIUHldi+uNiB8AiH+LDsHlL1Iq
	xp4zMFMFbUVFs4obxrq+jK4HO8gE8FVXl+0BKd9zE7LiGYSoAWLBrLBnNKezyXsZtyJf
	cTeKbR0LiA5Hks6wkioVUzwbztpvFRrpj/vgdRHwibIINojPzeGi8JxBeCsJhBhKT5aD
	u8vg==
X-Gm-Message-State: APjAAAVElQrGcku/VfAebbNEX4bHUQTl5pyessw3aV+ycKdAUD5IHRZs
	KxLV4IbhzSlX8lSGtAPWm341WTHM
X-Google-Smtp-Source: APXvYqwpuow0r4SnG1RZL0N/iM10G8WxcDg2IMV8Pm3ry2yJ/opv5wiahnf2Rip+39APJInktO1QpA==
X-Received: by 2002:a62:ce0e:: with SMTP id y14mr26394977pfg.73.1567287125076; 
	Sat, 31 Aug 2019 14:32:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:40 -0700
Message-Id: <c70fddb13221e42bb296d829e762b7ddcf522863.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 19/23] gnome-desktop3: Fix REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:04 -0000

From: Adrian Bunk <bunk@stusta.de>

Append instead of overwriting the previous one.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index 0acbb21..1dad1e9 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -25,7 +25,7 @@ SRC_URI += " \
 DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES += "x11"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 EXTRA_OEMESON = "-Ddesktop_docs=false"
-- 
2.7.4


