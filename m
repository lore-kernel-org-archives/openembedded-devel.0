Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6E661476
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 21:22:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g1so15201792wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 13:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=spxOi1zGGrZSNyIGmsFdEfrZQCjf90Wpu2bhsdfV4JE=;
	b=SXAvz0ZPdJ6HmpjekyD6BPHJYcMEQsgJ7fGl/c0EV3K2o7VuRZoOBVEDqnMPUuuUt6
	Hqull9yZjAOVHQPLqdM3tfKMut2bCyxvYqYlveSYLX/M+fjgkCrwTC/IPkLs+qCiaP5N
	oIm8QCMhpYWqcy6HxiyTV2kqPGZOVocWTKbW7w5JOj3ypuvLwB9cQE7/AUBfYvf3cqwh
	jqmSoxEJQbAcFhjSc3LC62lNsF76fbhIfw8PLupOamSBK2IFSyTn42etxrS54GC6vUmr
	M9xstFWCHEHHfEHSSD5vMEwE7d+EkVqUZxc+MksSCXcEP+Kd2k3qfKqNbyFo1BPxUorw
	fShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=spxOi1zGGrZSNyIGmsFdEfrZQCjf90Wpu2bhsdfV4JE=;
	b=IZlgwhtY0/bWyqJX1OWTuhVA9ZtgMJAqdMONWtCJv+wFVglZrehAcdjfaBSnesqi/h
	Zhpaoq+RvqRUSiKp4aX+IJo3UjLcUvGwX6Mp9cfnAKYn62Wik1YpGG2c/V6FPPDFpInr
	YBEK4wmSMAgET0103M6UtYTwvJxaF8qoRA0sWzCMJyuk8ngr1IVHxee+vOUNO4OLdH3e
	gKs3Ow4fJwc2MqS7eeRLyU6tWtUhc6zbpSsQn2O8IOofuxfcGMFxzFcRtf/WHl6zyqRD
	i3ornh9dP2zN9JEUS4Rg5BxcRYVGfUUF/37weUuii3iio/bLBHVNM5C6XVH8+8kYGkl6
	UNLQ==
X-Gm-Message-State: APjAAAV6INQ7XNYBbCA+ueZjAPIzFNCOqjkl1UmOF1FMLTmac8BwMvaG
	sLkeobxDlFlnUpnmQIjhcpZVZ568
X-Google-Smtp-Source: APXvYqx5Uya0xMOTs8fwbJzFkZkRvcqvbC8jFqlb66a1D4R9NriXBPUqX0fO82jSp1d+QhJWcRR6eA==
X-Received: by 2002:a05:600c:20e:: with SMTP id
	14mr17851348wmi.104.1581888174886; 
	Sun, 16 Feb 2020 13:22:54 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0689870B30080CC68E0727.dip0.t-ipconnect.de.
	[2003:f0:7f06:8987:b30:80c:c68e:727])
	by smtp.gmail.com with ESMTPSA id
	e22sm18296776wme.45.2020.02.16.13.22.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 13:22:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 22:22:44 +0100
Message-Id: <20200216212244.30653-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200216212244.30653-1-schnitzeltony@gmail.com>
References: <20200216212244.30653-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] xfce4-whiskermenu-plugin: upgrade 2.3.5 -> 2.4.2
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
X-List-Received-Date: Sun, 16 Feb 2020 21:22:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.4.2
=======================
- Fix crash when selecting desktop action. (bug #16445)
- Translation updates: Chinese (China), Croatian, Georgian.

Release notes for 2.4.1
=======================
- Fix narrow iconview columns.
- Fix bad hyphenation by increasing iconview column width.
- Translation updates: Finnish, Serbian.

Release notes for 2.4.0
=======================
- Add option to show as icons. (bug #15675)
- Add hiding menu items. (bug #14816)
- Add searching keywords of menu items. (bug #15047)
- Add tooltip to profile picture for editing profile. (bug #15501)
- Adjust wording of switch user command. (bug #15398)
- Add icons to context menu.
- New default layout.
- Make panel button square only if single row and title hidden.
- Rearrange settings dialog.
- Redesign session confirmation dialogs.
- Refactor code.
- Rewrite menu load to match GarconGtkMenu.
- Switch categories with keyboard focus if hover enabled.
- Use custom icon renderer.
- Use link time optimization if available.
- Increase C++ version.
- Translation updates: Bulgarian, Catalan, Chinese (Taiwan), Czech,
  Danish, Dutch, Finnish, French, Galician, Georgian, German, Greek,
  Icelandic, Indonesian, Interlingue, Italian, Japanese, Lithuanian,
  Malay, Nepali, Norwegian Bokmal, Polish, Portuguese,
  Portuguese (Brazil), Slovak, Spanish, Turkish.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.3.5.bb => xfce4-whiskermenu-plugin_2.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.5.bb => xfce4-whiskermenu-plugin_2.4.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.5.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.5.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.2.bb
index 75b5a319a..25fc72d97 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.5.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "b5242d7922fa4253cc99c253efcff7cf"
-SRC_URI[sha256sum] = "8f7134f4c1b5ff5290048c5b96b130e1238a286002cbe35255c2cd7d5a1ab6b4"
+SRC_URI[md5sum] = "f553d3be2ffebd8d9fa5b6415647e4ff"
+SRC_URI[sha256sum] = "fb2e1d44744d851c5339900e7af9068397028efa9ee5235a66ab273e95740dee"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.21.0


