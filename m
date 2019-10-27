Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4927FA92
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:10 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id r141so7252306wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rEbqJSLxIG7MlsrgYx3HWsPNQkkO1qXm8YprTO/cAuM=;
	b=W6IlihN0b6Wn7uPboqa31W8T4DsUSB9eBuV8ptrSm1sQmlMvR0ITpSP656RR5XNqDx
	cDS1VZFGECs6XR1hfFic78KXTc+FXGN3Urt5JZSUuW5j0jkmI4qjhNvFM0btFqnxElq5
	Qc7Gsy4dE9Vf2ycuJ7aQDk2Y5ZllMNayriOLM6zkSk8yZZSJ3Gnh0rbQkzYiY12KtRV/
	aPM5+9laR9YjM8ZJ7ISTqfvPsLzkY6v3y1yNsaZVPjjjkAsGBa6UWSTVDohrGCZwWQ4K
	XCuDkiwHAlJq/QUoatSaLeY3ok20ZUHUdZMHnIjQA45zf7irjnDQ38+soM2pw0IIPUit
	VYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rEbqJSLxIG7MlsrgYx3HWsPNQkkO1qXm8YprTO/cAuM=;
	b=HkQQ3/YcZkhA/6DvFSZcSsU8Fd3eqzX/BEKN9IwoCh5SrIjsArqaG+nEPw7ZnXLdnk
	ZmRWkdfjCOsZw6fi+nvDBoxMxM4FIVe2EN6544Zv5EEFkogg5XBZrNF0ll+NUH4CPUvL
	JC+uw5PcA1Tvg1dOkJs6SM7/n9/81co9MDfBQi491LdiqT5Dbsoi6/+Y2vxvqOb6nw7C
	bueCtoiSx9a1XaG4Ij6v1hoN5XeAkssrZfrYcuW299iKX3S0avYz4vwvs5usFwqFET2b
	vIgd0SNaBk5S2Bk4J3ERAdPkfZhvivHW5ypNfSnoI7nInA+pnL0U2o/8k6YeObV6ZK3U
	/vWg==
X-Gm-Message-State: APjAAAXLvHMSUGHGLIbndlQI80mTnmotR2gtM4DlPcSW/uj1AS/L7+5O
	nyNktp6dc3I0xFZYowEC4dHLKv4G
X-Google-Smtp-Source: APXvYqwWZhOC+wVBFCl/RrGSF1m8dcVzbP3eStMyd4XfNgw+yz0i5WCZVZAnVCn9FBtUJymNeqcJvw==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr13083796wmk.29.1572219370900; 
	Sun, 27 Oct 2019 16:36:10 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:39 +0100
Message-Id: <20191027233545.4146-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/19] gnome-desktop3: upgrade 3.34.0 -> 3.34.1
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{gnome-desktop3_3.34.0.bb => gnome-desktop3_3.34.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.0.bb => gnome-desktop3_3.34.1.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
index 77aa3fb61..0e3cf5b59 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
@@ -8,21 +8,21 @@ BPN = "gnome-desktop"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase pkgconfig upstream-version-is-even gobject-introspection distro_features_check
+inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspection distro_features_check
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "3149bbd12eaf6f4420b1a999131ec470"
-SRC_URI[archive.sha256sum] = "8d331ee655c1d56b2b97562a07c7a7598ff6706a11ff1cdce97423ebc6b62426"
+SRC_URI[archive.md5sum] = "357b4e63960830c1399d3341d05746ea"
+SRC_URI[archive.sha256sum] = "c1dbeb5666dad27166c769e48e2ab41dd5ed74718ea35eb57c8488790662dc5a"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
     file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \
 "
 
-DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
+DEPENDS += "gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES += "x11"
-- 
2.21.0


