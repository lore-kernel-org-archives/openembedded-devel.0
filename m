Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBEA7E407
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f10so4888175wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jepvPYCvSPq8zjTFryxOCm/yznQUU+SPzcPwkloE+h4=;
	b=qMg2PsCuZToDOyS0xask9KnKKd+ylxGGxm3fmCb4kaKdz+4iQwRjvIPgMPeW1/JP4/
	wEnOSB7rJb9Cyk8OaX87Un3t31eNCTNKUJBbslRtqNnMqiwxBEAJ63e3QDhNs+svrdur
	hxJvaEWEZ2pOyX78iLk6z5YW+ucIRihEQV/MFgw0yRfhswLFHxHoP6LUY//ZTqq9w2ou
	WbNGDfVrgDaMCNAszJz75XWjFSZs47p1RmEaBeFXs8KJTclKA8iBrXC08DJ7YqeE8azr
	fpwJjlITPsKofND2F2PafotKST6ksmEVbouiHwTzdgX5mA0Oy+yWfajyR+50vEXsx3xZ
	1LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jepvPYCvSPq8zjTFryxOCm/yznQUU+SPzcPwkloE+h4=;
	b=fTYhPGsHBGisvEDrru6VE5sWu4cRYEtBmBFZ90mlrjlGdUmUQgzwK/UuIOIFef8HYZ
	fVgHFu88jKpS5RkojU6TXnm4BcOazcD1bhpMJWjS9eNHuAgLmEREAQMuKwxqF2WPdncb
	UYiQqqSTqLQGe1TcySQlLFA0xNBaxz0lKW+w68tVGpxXBcK1JpaAcC7xvXGEiPDKq+cf
	KsP8QO/0VA2gHf1uEsAVr9Uyj3bX32qWcYLsAujj8JJFqiO5dh1oZ7vzzU++SCD34lVq
	kDO4Rf/2IutdcUoIFcYssQrI5pTO56dzJZ6QQiIhvbv2xq9r1vztO0GQA64EjSb5hOe6
	JIvg==
X-Gm-Message-State: APjAAAXPTX9oxyWZCkOPguq4EVcOnQf2UZaxLWScCOWzxRFBUKMckVS3
	F4rgrtzJ1lyzu8UpfqLQw/OEeU2LYcU=
X-Google-Smtp-Source: APXvYqxi7GI6IROj/rdWbZB6AlBvbC9X/7eFh6MLxgtwuVtzgukkJid1K6lu1kqkE6hlSQvxrMtzZQ==
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr2183823wrp.113.1558594156785; 
	Wed, 22 May 2019 23:49:16 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:28 +0200
Message-Id: <20190523064859.24336-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/41] gnome-bluetooth: upgrade 3.18.2 -> 3.32.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* move to meson-build
* they do not maintain a changelog but suggest to clone the repo

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...uetooth_3.18.2.bb => gnome-bluetooth_3.32.1.bb} | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.18.2.bb => gnome-bluetooth_3.32.1.bb} (48%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
similarity index 48%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
index 8cfd65af3..181cb1f68 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
@@ -6,14 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 SECTION = "x11/gnome"
 
-DEPENDS = "udev gtk+3 libnotify libcanberra intltool-native gnome-common-native \
+DEPENDS = " \
+    udev gtk+3 libnotify libcanberra \
     ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)} \
 "
 
-inherit gnomebase gtk-icon-cache gobject-introspection distro_features_check
-REQUIRED_DISTRO_FEATURES = "x11"
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gtk-icon-cache gobject-introspection gettext distro_features_check
 
-SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
-SRC_URI[archive.sha256sum] = "d8df073c331df0f97261869fb77ffcdbf4e3e4eaf460d3c3ed2b16e03d9c5398"
+REQUIRED_DISTRO_FEATURES = "x11"
 
-FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
+SRC_URI[archive.md5sum] = "5b3d66f564a5067ea154750cdb6d850d"
+SRC_URI[archive.sha256sum] = "6441cafd313af94fba28b701698074f97d693b9023788a74e8e6f16f817ba1aa"
-- 
2.20.1


