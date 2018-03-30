Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 87EF974708
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:23 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l49so8080482wrl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PSRnEfRICNzwHTJ7vpLQeoq9vVi+9zogjxAQnWcsjPE=;
	b=ODh1NVbpD/X0YlL+Nxj6tqxZJyaksJwxdUKkgQydHLbHdXIUVIvBP8Vt9FWPIW48MI
	0r5m1wDqZHh8ybRodruGn2LcuvMHtdAI/a0ownkfjyjadUzHFGmB15OlJaXwqc7HEAhM
	qQ8UbKd/WBGB/4toUIVAPsI58DANhbt6uJgsdX6oa9xkpDlEmoSmd+G+5yLWnfVS0kg0
	az3tJlxX1qt6kPy+MeC2ajDYgiH/RKSIrYSi8vdAS8FEKNjXEmLJyLfOTGCNN0kWu9ej
	QdKGU2lC+GZkMtpA5OnD1Uo6XLCGE82GMJNJ6xzKUK8CimCRul6+4z4ucgTtxJwAe06+
	RCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PSRnEfRICNzwHTJ7vpLQeoq9vVi+9zogjxAQnWcsjPE=;
	b=ZuqFWQ7cx3VeU5/Pty8IdGub714q8572B11wVzE10FTkyG1YZJyq1CgmgFK/xP0Zdu
	+F+swb06XymAHbGj9umqsCxnxJ5X1ZXMUECupi/ccmJI/l8T3YfhnwepcbmE9I9PuU7/
	CjGRZUTJ2f352t3YAmtiVsRv1Ns8OncQMdpOuqZag66JLaT7stBL7rmwrykO27ImigNL
	Z/SzzMqfONDfVkSXM2zQxukb2qyUzML5YtspvBVTItOGF7JzIU774ggso+hkLH5Dbyug
	W+/jkPgqqWo0QOfyBBG7xb+RtMlYXY8O3juK2Z6QySviiC8sghi81biwHGfTakVdGw16
	tTpQ==
X-Gm-Message-State: AElRT7ECb2r5WGMyg57xugtwpxBI2a0ruZPtdotUMA+TuHfVqJ8HX+JA
	2Ty6hpOdE/uEmhz6cTagXwrRXA==
X-Google-Smtp-Source: AIpwx4+qFsKZMCLIDI7jj9LZETVBAzZfBtzvEQlMXL+5FSFZeFunwNpD6pixvZqd0JJsrVAcDTO4BQ==
X-Received: by 10.223.183.75 with SMTP id n11mr9316366wre.22.1522416744108;
	Fri, 30 Mar 2018 06:32:24 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:31 +0200
Message-Id: <20180330133151.25882-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/39] libgtop: update 2.30.0 -> 2.38.0
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:24 -0000
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


