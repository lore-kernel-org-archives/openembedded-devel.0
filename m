Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9716028E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 11:42:34 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id q9so6832422wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 03:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QdkQrwwGDjM+KOW3jl6426pooPZsGkJ5kDWS/4FR+fk=;
	b=Y8RY18yFl9W76tTn5yx6HYma6Mx3N6WU0XRLW9gutqw008+6ZGx7ArSOchHzUyV/HV
	Ym6hTAcgSy6OCngoF4Oi5lhJatq0xOZ3NTfxaUJmqa9+aJJtXdIeZ+bvj/GbzNIswJYM
	wAuELWry6o+npi2rGRVcElIcmUyDTsSzqMTOGc+E86t+Q/EluWGTl/Mg0712rRMntrQQ
	wQdPY+tY2Q0J5cCH8HdGU2GLWIpHVbJnoSTICwMnSkOJQVEVuvJEEYWDm93LBVAHJhQg
	dQk/Tubng3VjHrPdklFKFgzHC2KtE0I3QWInDLFGutBbLwVf0euy4jI8C4VCXe7YCJ/e
	S4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QdkQrwwGDjM+KOW3jl6426pooPZsGkJ5kDWS/4FR+fk=;
	b=dTDc5nBdhZXAEAcyyIRHwR1bMTvLq50l9LnwEEfO4rq5JVgsBDeSnAlp481ypVJXML
	5VgVcyiN71pFGkGzhZefnpGibtDT6PE2RFkp+FJRuKmxe461ceCKfcMVa3F1ZBMZrEZJ
	PlgQ7LiJk3GKiZqq8Ss07GowLGRY+0SveEXaq2G02KAXqdTgisRRaOslwFdDtLNKJcvy
	hvN1tYHwcYl8YbwXXkKCR7ZUmSWXHwCMTvRYa7HY6mCGj0woc8mcXVF6Rg+yPWAZF25i
	O+vYbVMW8ce9mMIXBU+rRzec1V3Tn51PF/t28jyHGZhKJiTJqaagZp4LM/vY2oLRJdls
	k5yA==
X-Gm-Message-State: APjAAAXAX2NinXoDCvcha76tW34FscI7V7XtriKmmzjL8uVQCx2XF/TB
	e8o/5nSkGYJe66Kk0RlUpnoCtpXu
X-Google-Smtp-Source: APXvYqw4t7dgYhvKgkkIdMrHYEJJ/u1GS0qwi+0y3/FypfGfzYzeomVcCQycb6qVi5Zaob4FMLuTPw==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr9472667wmk.65.1581248554515; 
	Sun, 09 Feb 2020 03:42:34 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	a13sm11828426wrp.93.2020.02.09.03.42.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 03:42:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 12:42:21 +0100
Message-Id: <20200209114226.2584-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/6] babl: upgrade 0.1.62 -> 0.1.74
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
X-List-Received-Date: Sun, 09 Feb 2020 11:42:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* babl moved to meson build
* move to meta-gnome: latest gimp requires gexiv2 and nothing but gimp depends
  on babl
* extend to native build for native gegl (next patch)
* get sources from location gimp's homepage suggests

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/babl/babl_0.1.74.bb  | 17 +++++++++++++++++
 meta-oe/recipes-graphics/babl/babl_0.1.62.bb | 13 -------------
 2 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
 delete mode 100644 meta-oe/recipes-graphics/babl/babl_0.1.62.bb

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
new file mode 100644
index 000000000..59921d344
--- /dev/null
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Babl is a dynamic, any to any, pixel format conversion library"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+GIR_MESON_OPTION = "enable-gir"
+
+inherit setuptools3 gnomebase gobject-introspection
+
+DEPENDS += "lcms"
+
+SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
+SRC_URI[md5sum] = "d032853f2678bc95054c39d4f02045c1"
+SRC_URI[sha256sum] = "9a710b6950da37ada94cd9e2046cbce26de12473da32a7b79b7d1432fc66ce0e"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.62.bb b/meta-oe/recipes-graphics/babl/babl_0.1.62.bb
deleted file mode 100644
index 4a7dbcab3..000000000
--- a/meta-oe/recipes-graphics/babl/babl_0.1.62.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Babl is a dynamic, any to any, pixel format conversion library"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-
-inherit gnomebase
-
-SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.1/${BP}.tar.bz2"
-SRC_URI[md5sum] = "28fa9d43549378ceebe2871d7721dd46"
-SRC_URI[sha256sum] = "dc279f174edbcb08821cf37e4ab0bc02e6949369b00b150c759a6c24bfd3f510"
-
-FILES_${PN} += "${libdir}/babl-*/*.so"
-FILES_${PN}-dev += "${libdir}/babl-*/*.la"
-FILES_${PN}-dbg += "${libdir}/babl-*/.debug/"
-- 
2.21.0


