Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 87A667FA80
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:08 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id e11so7994846wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oqdEPB3Ur8Kc1M7PTIMtk1X16qls7C+Of38E1fWkEIM=;
	b=XzcMojC6Be7Ee3Yby8vgnEhktvjc/R81vVPbyL7L8UgTKlH88hywChU6+TWWqGsMAM
	wDVx4nRUw2ggPwv/WUBwF1vsHtU5y/WsoUmE5CwV8/uqdABBWhGy7uUua2HVGBh2WUin
	jiHssiTNcg9W5arSrZazCqLg5hGlWD7FZ3gu3/xFvbFKGsnbhCGV57KnIVgka0pPmm0k
	kxxTlzKh5AeFAvXF0I7zhrvGUuBPbz4YFhPdanQ5PGXeY858Q1LtKjeJZxvLpgk+vXCu
	8aFyf39yHfN5X3yvNbQXOgeWD/6vqPs6guKuQaZGbo88V/+KL3svFDTMMaltEa20sP03
	rCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oqdEPB3Ur8Kc1M7PTIMtk1X16qls7C+Of38E1fWkEIM=;
	b=A4fZ0pwsb20atU66G+HhlETwyRPTjw0o5wpCN2B3KKTHRwWdxJT6PtUVjvF4CrlynO
	xgbiJZvLOgJrNDs+7LLmXf8vRlDJVTwKzUDwHlL+WSyWWIDiVXV5exkI+cb7gP+hOISc
	8d0rNFDS2htNCharTjzxhdjZ3LAQ1yXH1omh2UK5EgRXpF70XacS+sDeBGg6SuWNpm5y
	HPc5IJBhGX20N9hJB/DDi9s3JHwZO4E7lUrhct8ZCfAU+HBx4AlrFDqwpXhua3jHi/h5
	q/HWKhGTCeVIkSFEYZywXeBwMCZmrcCzHCBN4RrACWpCiaiEKw8R58J1NEJjL0Mv6L9/
	2VGQ==
X-Gm-Message-State: APjAAAWmAgJ2ap/fkpdSyImpdKfQ7oI6Zhf1FTF6TEKOm9MtCcNpYpPc
	7CD18vQ+MaffDwZt4RwSl2hkp7g3
X-Google-Smtp-Source: APXvYqzImwpftqdRotNGWt75RtPi3IBKcIEB2LrJXbcORvhi3JdfFDhst3z2yIHK77oqDXaAtn6IRA==
X-Received: by 2002:adf:f989:: with SMTP id f9mr4564444wrr.163.1572219369034; 
	Sun, 27 Oct 2019 16:36:09 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:37 +0100
Message-Id: <20191027233545.4146-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/19] gtksourceview4: upgrade 4.2.0 -> 4.4.0
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...sourceview4_4.2.0.bb => gtksourceview4_4.4.0.bb} | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.2.0.bb => gtksourceview4_4.4.0.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
index 10deaffb8..63bbb2547 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
@@ -10,12 +10,17 @@ PNAME = "gtksourceview"
 
 S = "${WORKDIR}/${PNAME}-${PV}"
 
-inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection vala
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.2/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c9e6913c2fd30ca2fcdd71482faf8b99"
-SRC_URI[sha256sum] = "c431eb234dc83c7819e58f77dd2af973252c7750da1c9d125ddc94268f94f675"
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.4/${PNAME}-${PV}.tar.xz"
+SRC_URI[md5sum] = "5c47e314517692f2622a0b724c65e628"
+SRC_URI[sha256sum] = "9ddb914aef70a29a66acd93b4f762d5681202e44094d2d6370e51c9e389e689a"
+
+GIR_MESON_OPTION = 'gir'
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 FILES_${PN} += "${datadir}/gtksourceview-4"
-- 
2.21.0


