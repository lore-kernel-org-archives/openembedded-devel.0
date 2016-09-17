Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A764073204
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 10:04:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l132so5988512wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VptAQoNJ/s3Bz0NGNWnzn6L1tZLmZpQatigI7SZz5Nc=;
	b=pLQJHn1TVFA4k/nU7baryOyWa9Bet8ybapQ5VXf7vBFXnv3OBMtY39IQDlQ3Nas4Sn
	hlnGEAXdDES9e/VMXew1hIm0fBsNaSD6dkiy3uwJldx+4hryUonDJqRqYkFmIprFtnry
	y0QBwrnJ0Uz3UejfmkvfLbxQHi+v+lhaVwVt+S/Ufh+cN21smXCv70pIgLbrufWD15dj
	ZWJzirsrACTWQvBzxJ/uuP9P41e3e4jF+41aKQqZn7lqG75cY/KaXogMREhBEEETv/TC
	Sfmd30I6ywEp4EgE3yJSI23Wq7vOgoUCRI3Sg7tBopTCG72UgkXgmvGenvc3TztBrByq
	2Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VptAQoNJ/s3Bz0NGNWnzn6L1tZLmZpQatigI7SZz5Nc=;
	b=SGrGx+7/NQQIcKt9uUopnPopdY9F9kLyjkg7FV8uPyHkh4hbFNyOWHeNr2e3mogVaH
	kKfWtsJm7bdg9MbXhjVgGKWAXgDwUVgK3lEdesJpvtwCGYbp3WUiPUXInjaFFgNr/e0C
	t1vxoqfiiZwUdaUhlsOcrayNppJ5TLCc1CSRdPIwehXFDxB+TKjOeyF9qYfCi7WoM4mg
	zW/37kh93cgO4arPaBHJdfz/TIydyalrTbtE4ZeoxqM5AgPbJU4POvsyC6pSdm4cx9v4
	3INaVxN5rtJH2ReqXU2AZBMS30NQi8r0q2ZyBGh69Q+xX+btWgQWkR18kx3mLgz77U/K
	lnpA==
X-Gm-Message-State: AE9vXwNbnEZToxEVpV7dvm5kEjA/WexgMsG3+zyQTOMajGIzTUmTu7ceby6s1NqiicUOIw==
X-Received: by 10.28.236.199 with SMTP id h68mr1371496wmi.101.1474106698656;
	Sat, 17 Sep 2016 03:04:58 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	o2sm12473330wjo.3.2016.09.17.03.04.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 03:04:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2016 12:04:39 +0200
Message-Id: <1474106682-20512-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] gimp: update to 2.8.18
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
X-List-Received-Date: Sat, 17 Sep 2016 10:04:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rework DEPENDS:
* multiple lines
* add intltool-native

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gimp/{gimp_2.8.14.bb => gimp_2.8.18.bb}        | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.14.bb => gimp_2.8.18.bb} (70%)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
similarity index 70%
rename from meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
rename to meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
index 29ed4d9..1f83523 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
@@ -4,7 +4,23 @@ SECTION = "x11/graphics"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper bzip2 libgudev"
+DEPENDS = " \
+    gdk-pixbuf-native \
+    intltool-native \
+    gtk+ \
+    babl \
+    gegl \
+    libart-lgpl \
+    jpeg \
+    libpng \
+    libexif \
+    tiff \
+    lcms \
+    poppler \
+    jasper \
+    bzip2 \
+    libgudev \
+"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
 inherit gnome gtk-doc
@@ -14,8 +30,8 @@ SRC_URI = " \
     file://0001-configure-ac-do-not-check-for-freetype-config.patch \
     file://bump_Babl-GEGL_versions.patch \
 "
-SRC_URI[md5sum] = "233c948203383fa078434cc3f8f925cb"
-SRC_URI[sha256sum] = "d82a958641c9c752d68e35f65840925c08e314cea90222ad845892a40e05b22d"
+SRC_URI[md5sum] = "5adaa11a68bc8a42bb2c778fee4d389c"
+SRC_URI[sha256sum] = "39dd2247c678deaf5cc664397d3c6bd4fb910d3472290fd54b52b441b5815441"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.5.5


