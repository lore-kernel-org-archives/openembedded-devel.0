Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03EAA7D3C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:46:19 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z11so785296wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 16:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/zKUciMo5r3M+MVaCmi7am2UhlXVVNhFvaZupGB3K+Q=;
	b=L2y5kZAF3dvB5Xz3rEHBHofGE7L8jU2i93VgMqJXnZFiQ4LzjA2stXvT8GUlvrkLCl
	noJYeh4eTeAWDmLAGLTu+1alIbqLXI5xXEPhDZozSkGIXhEiwOT/ZXvZjs9+X36dc84j
	2qA2F2d5LXC56FwuPDd5T6PV5gVB4TI/o0F1O9y8NPTU+rtmHEUF+LvMeKwekyx7uE9/
	BqN1vaNCzuTZtDt6U2y3cIekyt4XxcP7Zm/ajYjDJHFyR09ASH0jEHX4tG3tyu0FDqOH
	g8jR3IGGRJAd29xUgRQn8mke3/uxX5q+qAM57Tgsu9ExCEr+oYz3o4IGdMb7nxwwHuyQ
	Ub5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/zKUciMo5r3M+MVaCmi7am2UhlXVVNhFvaZupGB3K+Q=;
	b=lmc6yQmOcJ4zwNZq+EEoiYlao6Xwv8mpGAGbLc0HzOV59RY/dHJn3qBE/zkqwJG1o4
	XkZ6au+j6OYL34ZiwM2RA/ePDjKWFmagIi/sbQETo33bFf81mxtTs92Q2DHVmJ+SINDL
	t9GfyXScRnW0N8sFq0xXnYcBCOxRPtG/+gxHeaiqYiCqm6RHOcc6txH2yo7JBgJkbwoC
	720P77NIGanJ0d5O/CTA/7qy8tip4IVGQYMtRg2eEJWUuD4TTsLIHPRnpUh+FiHNuDs0
	lzz333aOe6JXNB5JOMwB12X/6LCeS9W9MM+5PLUqZiI3VX4oYODkr3sPERCzM69QLtmq
	pQcg==
X-Gm-Message-State: APjAAAUvKN1Mt8NFyknR4kMCv0DHaE19ydZhJxuHSf0H8xcvpn1TQFHf
	q9LnA7NWc6WQDVohoXXIxfbA3jYt
X-Google-Smtp-Source: APXvYqwJbTpLP7MON58DKM6R8ZFnqi47zjG6wbMTbLzQORsd8i6ftQhjT7rnegz0SjoyKlJO8ND6sw==
X-Received: by 2002:a1c:a7c5:: with SMTP id q188mr1767194wme.126.1554335180218;
	Wed, 03 Apr 2019 16:46:20 -0700 (PDT)
Received: from superandy.speedport.ip (p579734E4.dip0.t-ipconnect.de.
	[87.151.52.228]) by smtp.gmail.com with ESMTPSA id
	u2sm17400158wmc.45.2019.04.03.16.46.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 16:46:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2019 01:46:07 +0200
Message-Id: <20190403234608.20046-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gnome-desktop3: remove gconf from DEPENDS
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
X-List-Received-Date: Wed, 03 Apr 2019 23:46:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Modern gnome does not use gconf anymore.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index 185a25359..c1a67bda9 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -15,7 +15,7 @@ SRC_URI[archive.sha256sum] = "a6393dc5fc29fc0652ac84c73b3da205d0b0168128c4cf6d27
 
 SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch"
 
-DEPENDS += "itstool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
+DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.20.1


