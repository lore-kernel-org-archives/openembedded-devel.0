Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6471478690
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t6so10735809wmt.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DC1PYN0xKv61paihtdpNCCHa7dZHa4y0D9pNgt41FUk=;
	b=RhibMJ7fXLNwOMTi4ywmIKU3lxFAGVCR4m4mrVlO/88X25UZC4F3AAyPPjqmeL3OMf
	QSwTczi/G4RkEGSHXoWHm2zF0m3QZTbhkbdcmVYSGqTLmLSHvHY8hKL6yTLbtNmg94se
	PoMpscoSUAtJk0XV8+oGbuE2rZ4p4zZtKaBtcYLIkfOfaDjpBl2Rc/pOjmQyJa2dIDO6
	KHLGhiy4K++wIVvnG0rUN2oj93uuqZwN8hOPMrNnrvtBub7NPhKsevUmewgiPH8/pg8t
	Uppa/53B76VgyfGrGNsLBqIPSLWPSbHjJ+7J1tufcPTlI5J0wiX5kyZWwbwTYo/2cWte
	8hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DC1PYN0xKv61paihtdpNCCHa7dZHa4y0D9pNgt41FUk=;
	b=irFsdPwZ7NUv7HlKno2QjhrkAICHy3LbpG9sKM6CgjorYAIQCsH7gcZBCWFQikWpdE
	BZKD1pWx5duiUbXIzu5S+lO9Nb76FH4iporNLCt2VqyObjX/3LK+rZP7HNAk6brE/+Hy
	0icTV+lWBXtp+cr6gTkQplvaXM5RqLYRSHG8GeCAF1zbhPs1nfiD0WCLK42f0x5NWq6P
	dUqkjCJCKLpbAgTNoUWttpVdsei5AB4TICv4cTRU5+MQ9xuGlNBKlNLn3f/FcVOdrs8q
	52O6JMUMkZN5pigVnAq9sm5F56r0aObHiCkDS9EyMCFSwEHIt+QfZwKOPDvH3ESS45XQ
	1jww==
X-Gm-Message-State: AElRT7GxFj8HcZG62UAE6Cucalq8BcpicAe3PNeN87PQ6iX/6wrzOdVr
	FrTgwpDpmZvZSMaWr0kxNNQaaA==
X-Google-Smtp-Source: AG47ELvl7URmIZctBKQ9y4MtCdXKEe360lmmDkfLvWXEFMIB/O4j/xp+B21ggPW6hJiq6utkayto1Q==
X-Received: by 10.28.178.208 with SMTP id b199mr13677341wmf.125.1521981343247; 
	Sun, 25 Mar 2018 05:35:43 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:12 +0200
Message-Id: <20180325123520.16452-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/20] gvfs: update 1.34.1 -> 1.36.0
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
index 8d7865fd6..5f7391285 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
@@ -8,8 +8,13 @@ DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit sha
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "44012824aa75797a7d272cd60f07b488"
-SRC_URI[archive.sha256sum] = "7ef9b2aec234004271a575118a0e35b3c36ce3309e5f9da109635651843372b4"
+SRC_URI[archive.md5sum] = "216d461c5e96e2cea74253be407af6dc"
+SRC_URI[archive.sha256sum] = "9ec388afeb373a213f2cc489184f76a17ae273a000e8a4ec720c1995943256bb"
+
+do_configure_prepend() {
+    # make automake happy..
+    touch ${S}/ABOUT-NLS
+}
 
 EXTRA_OECONF = " \
     --disable-gdu \
-- 
2.14.3


