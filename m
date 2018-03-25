Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 92CF9785B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:34 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z73so16242603wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PSRnEfRICNzwHTJ7vpLQeoq9vVi+9zogjxAQnWcsjPE=;
	b=NlIt+gsvv52P25Y2+XecdiK5w6GlsbNAEwyj1B2I5xqe98i9TFNwx72vn3O8kAFkDY
	GTzkgYB2HtnIWYiqdEN1f5kzgA0/iMy1Z1NvAW8CYB/z42C+X2SCLbzolOWbHQvoQ8FT
	3tlTtE/5bhQgsKA6KiGVQacet3fup7xFMyu6aGNKdwx3fNfklW8pmEALinDuweVv71ke
	8j0TRfoIY2USVqyTl9agQwBEw1kEoQIxjJTwug37FDmYv/G5TMb+PjdG2doWuprsjuuu
	yc7ukyzNbD+Gcx2bhq8wnPio777a8jdQx1Qs2YERiEcw8mtNxqNHlwY82hKPVMrMcih9
	yiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PSRnEfRICNzwHTJ7vpLQeoq9vVi+9zogjxAQnWcsjPE=;
	b=D1c5k91V5m3phFBsgYYaxM8+kRckbAi9oAoEaMPa2Eo+PLBmSDrcSqM0crtd91sbd+
	54sE6Iy0Y44njV6GAdVhi+lQTYdGWUBN+VChmUZCVIbLsxB9fBCjL7eqZv0jUjxFhgRf
	kNPdCj713jEV4BKPFdLwJKDP9nm3CNZx5TDP5yBqGGXxTR9IaXCqS7K+oUn7MvoBvUlh
	nRTC89NW84le+AU1pf+yJYUgJ16rScJIVL9bDYoulr+k8H3Rs/NRSLIOw1q59ddRqGwJ
	1vdSujQrhSqjVhDvhsd09xj2JwO3zYYfqBvktxLdrtST9lHTdtwhiIvNC3sFPaBuCOd+
	KJ7w==
X-Gm-Message-State: AElRT7EvBuy+FNkNBArdkGTTDzjLUANkJOtbR8t1UgBQyZT4wIEWgmGN
	412LQEMFz08ff0uRcO/LhGEnug==
X-Google-Smtp-Source: AG47ELtLcCkdefHb7IOVJGy/MqXu0FQ1NGlZpF7Nu8sIhFxDFgkr4tEJOk3sBuq8zkP7NplO0lxJuQ==
X-Received: by 10.223.192.3 with SMTP id z3mr19856794wre.177.1521981335088;
	Sun, 25 Mar 2018 05:35:35 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:03 +0200
Message-Id: <20180325123520.16452-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/20] libgtop: update 2.30.0 -> 2.38.0
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cleanup recipe while we are at it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb | 15 ---------------
 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
deleted file mode 100644
index 946d11845..000000000
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "LibGTop2"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
-
-inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspection
-# depends on libxau
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-           file://0001-netload-Include-libc-net-headers-unconditionally.patch \
-           "
-SRC_URI[archive.md5sum] = "ee29a9ef60659ebf4b075ac281f71cb2"
-SRC_URI[archive.sha256sum] = "463bcbe5737b1b93f3345ee34abf601e8eb864f507c49ff1921c2737abafc1e5"
-
-DEPENDS = "glib-2.0 intltool-native libxau"
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
new file mode 100644
index 000000000..494934fe7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "LibGTop2"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspection gettext
+
+# depends on libxau
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "bb0ce7de6b28694b40405eedac8a31b5"
+SRC_URI[archive.sha256sum] = "4f6c0e62bb438abfd16b4559cd2eca0251de19e291c888cdc4dc88e5ffebb612"
+
+DEPENDS = "glib-2.0 libxau"
-- 
2.14.3


