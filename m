Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 334167C85D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 16:51:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u8so4826970wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 08:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x+wOdDgHh6Qp7ZTIMCoU19TnNJH1KWK2PieajxjdzI0=;
	b=froitcEGabkCfaBLaNMWQK5V+zCvKyhSTsaFWDl6Ojp0+7b9qCAYnKcDjBgFA1rhsf
	+67dOqT6wCHM2++sWsyvYaI4Ij1nokXd4JovVyuccZdE65DMTqrQKUvkS3TNMmhY/Cxp
	J2vXDxFRE2fNKAJaQPyotJdr01SpkpkUK7vYXlvx7BpVLKY9Sh5BQRI1kGrT/ufIwudN
	ZPyhaO3CDQ+Ubr5lbkS/k0vulKXl6Ybf4q1y/yK+6rcARIM17fyaHeK5pv2ZP9xjfnzu
	IJt8VnBg/LD9QNTK1pv6O25EVEzZPHXvCx1bk1lMnnE8/qgivUO/IOAzhflhcB+4cuSH
	VOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x+wOdDgHh6Qp7ZTIMCoU19TnNJH1KWK2PieajxjdzI0=;
	b=qMrm31Gqt3LdwIbJbie18bfUkjlRKzVKKdybKmwhzzKer8hE+Jw1L9h9AmnOc73xHS
	6LNSjNS21s7ny2gxb+qtcvoEJuBkwoXHGe3VBKPpgKwBUCg1GUhQlYfbeLT7DQACTJ7J
	9FLo4yIGTOD0gk4W45DZTo1rcSBz/tsEx3Yse5hMgouGxkdYGY2N9tLnlJQ8OZoUUrFM
	bQNkxQnrEVKFo9+MhxU94npXQGI3v4NTKaVADMbs8/TKA/jzsUCwddPnkfdQTzlotYNf
	SAOVNeZGSBAFbkAbOfweRRVj8D/NR8/HaWzdb0GeThSoxpVRv0J7WKZEwkeaUUOA+Der
	UnxA==
X-Gm-Message-State: APjAAAU1ohOCUno2ybyXIElw8Hu+G//+OKnTzKcyi1G5vSrmKuiWeg3J
	/DVPO77IbwypHQWI/qSdELU2oLGw
X-Google-Smtp-Source: APXvYqyQQRAxUUV092lSbnyCXxJTHL/hGc6X4DgwcsGc3Nt2WEcbSTlW7j3Eg5+e4c59PMFKnn/MRQ==
X-Received: by 2002:a05:600c:249:: with SMTP id 9mr23609044wmj.2.1575219093247;
	Sun, 01 Dec 2019 08:51:33 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id g7sm6228088wrq.21.2019.12.01.08.51.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 08:51:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 17:51:17 +0100
Message-Id: <20191201165123.12699-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/7] libgnomekbd: cleanup DEPENDS inherit gsettings / remove unused config
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
X-List-Received-Date: Sun, 01 Dec 2019 16:51:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* DEPENDS: gconf and intltool-native are not required / gtk+3 pulls glib-2.0
* --disable-schemas-install is leftover from times gconf was used

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
index d3b3bde43..52d6eeb13 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
@@ -4,14 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
+DEPENDS = "gtk+3 libxklavier"
 
-inherit features_check gnomebase gobject-introspection gettext
+inherit features_check gnomebase gobject-introspection gsettings gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "98040022484406e7ebe25f82cef93344"
 SRC_URI[archive.sha256sum] = "f7ca02631576e9b88aee1b1bae37ac1488b80ee7975f20a97f29e761a7172679"
-
-EXTRA_OECONF_remove = "--disable-schemas-install"
-
-- 
2.21.0


