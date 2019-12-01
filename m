Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D83EB7F638
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 19:27:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so9433127wro.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 11:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H/68OGFlizStkAB1DIbhpSBNNFmMv21YTbPHIMKKUfM=;
	b=J5xO8T/FooBnMRXT9Mdl7u8r8PNdvf2hm6RMcECYeHumcSBCl0HGly8JkA7r82s+sE
	/iVgo/6Snviud0A5A3Fwf2PcOv+MikklG80Jw+HoRoyn2Q84dlOkkx3toCWx2+WhfJHV
	WR4joFuTQDAFc1LtarBbCGPfUIGQ+TmpnkEN2N0sTWGuEE6Sy507cXGP8oAhbT9abW6n
	TRQC/pBsX9EDQ4VSc1ZhPP+OasD4F88pM+j3oX29RfJfIxcNfxhIez8xf6AgK/rAE9po
	xpD/b7iOnf0SkExMHTmyf4pVoY+ZYxwNk2SDzFWeeBCDRfNFXVBat3IgJ++PcEwwXCI/
	vjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H/68OGFlizStkAB1DIbhpSBNNFmMv21YTbPHIMKKUfM=;
	b=JbionEjFWLgl7HlsbsLME3DKVYoRlk8ZRMSq4xsxUuBJe2mJBJOaB6kGNxNhK2Qr5l
	k2etrEd0nHgcfwhQ4UJ/h/Qsn+yHAgmZCkRuX0hb9s52SE2LBjMyCBs9YeaRqNMtpO31
	oWv8yEwZMhOKx0KNH10UhbYClyGBcaKAn1zxy7VRLUyAJIaRjdVJdAYaQrL86feCMU+7
	6ANSfyH4RTRkcrW8hXEl+YnIQQtNwtwma2ua/1YuUoAgZs4nmF9KpihbAOr8uW81mfKZ
	WUdidx4AvMBUsWGr1GVk90ON5INy+sXtDAi8Y282DerekvCkyGvmO+sIFmxWSTSA0iul
	lyng==
X-Gm-Message-State: APjAAAWzcEmU6g6VOlt6+8BquKnPYEZwbAxJ72uzzLfq5CdUVQ4DAMFE
	2TNRkLLrqYowmnzrWqEmk5Nhz9rP
X-Google-Smtp-Source: APXvYqyWQTFs4bMYVXpiOCWZe/JQiisgpYDq1te01jAH3q1rz8+0pb1KqW6OZdeDUetuEBbu8HFNOQ==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr18245954wrv.250.1575228452317; 
	Sun, 01 Dec 2019 11:27:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id
	r6sm23889778wrq.92.2019.12.01.11.27.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 11:27:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 20:27:23 +0100
Message-Id: <20191201192723.17292-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [PATCH v2] libgnomekbd: cleanup DEPENDS inherit gsettings / remove unused config
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
X-List-Received-Date: Sun, 01 Dec 2019 19:27:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* DEPENDS: gconf and intltool-native are not required
* --disable-schemas-install is leftover from times gconf was used

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
index d3b3bde43..2a2db9c19 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
@@ -4,14 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
+DEPENDS = "glib-2.0 gtk+3 libxklavier"
 
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


