Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id E07457D5EA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 21:30:58 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id a22so11783903ljd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=soxeF77y/61kBSFaUqCo0tJlMOXcSVMlPIgZvQfLNcg=;
	b=sTBkP9+PhDEnxWA4C5l8J7DNT8mZNeIXmyXz+It48AHGojZyCHCCMdqm+TzNRAzpTB
	Y5eCVcSiu/wKo/wz19yMXQ33GI5UD/tPq6S+NED0tJlXGRjqAJlwg2ZDvqVVwWoc4AdY
	q1qrxMUz8L5oTbcoX8Y/cjJCUtfuCVmCL4LNhuIMik3HNZbC7ADwplzQzEMUg0KidV8R
	BNILzVGsAVw/gwor5w80PipoTv639Ocx9TATNETT6EjrCl/JRTPTgjf4CGHfZxwFW7vn
	n/CTZhk60EpV53dTZNrUFptqIaVYqOeryOMUbYBHe7M7e4PGUUq/DpuUl0vsJSoHnCS9
	qrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=soxeF77y/61kBSFaUqCo0tJlMOXcSVMlPIgZvQfLNcg=;
	b=QCq+hmz/0PaWMOofojzMucfQKdFz/NSDvAK5bZpZBFm/CP11EizVOhEa7F+POUucAz
	AE3B2Gw8MwdzNUt8x5dWNtVCoH4Y27Qks4XKervRLx0PozxLK80ef4er41TRoPG+4OsZ
	fk7rw/pYKTOrIvfUg1jdHVQNCGNxh1vqr6d2xl6xCgkAVa+r/4Asik74x5YgBEDMGsK0
	qDYkdjTzhZjx4fDUWPk++DxM/yRfT3JzDhPQyi+DCEHziB/5S5WNiUHUb9XDP5P5jp+Y
	cxmJLkDEtxl+y5661mA2rsVjHgLwi/39XWh64eH2DwfQNK6OeCaPSHUJJHAxFxJE27gA
	zAcQ==
X-Gm-Message-State: APjAAAU0Jt5cDJLTblflfVVV1ay2SAc0D1nHXBGuIwSXksolCixfxeay
	wl9Y1wm2BSHgRoglIlG1XQV5SQqXZkM=
X-Google-Smtp-Source: APXvYqxS29+WaY/HJ+vmwOYqHPDv9kHQQiC0OiAAJAkVN3VtcqRsZIP3oWEIvfyksX3yxUJUUJmE+A==
X-Received: by 2002:a2e:a313:: with SMTP id l19mr14560639lje.205.1569187858959;
	Sun, 22 Sep 2019 14:30:58 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	f22sm1793155lfa.41.2019.09.22.14.30.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 22 Sep 2019 14:30:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Sep 2019 23:30:52 +0200
Message-Id: <20190922213052.14068-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] jasper: update to 2.0.16
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
X-List-Received-Date: Sun, 22 Sep 2019 21:30:59 -0000

Licence change due to modified copyright years (see @11ef9d44ac9795f4).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-graphics/jasper/jasper_1.900.1.bb | 18 --------------
 .../recipes-graphics/jasper/jasper_2.0.16.bb  | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper_2.0.16.bb

diff --git a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
deleted file mode 100644
index d2c7ffdab..000000000
--- a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Jpeg 2000 implementation"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=baa697d7510288a9cdcce9bd7edaf9bc"
-
-PR = "r1"
-
-SRC_URI = "git://github.com/mdadams/jasper.git;protocol=https"
-SRCREV = "b13b8c86be870107f83b0a9a4b77557cb2b65d69"
-
-S = "${WORKDIR}/git"
-
-inherit autotools lib_package
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
-PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,freeglut"
-
-EXTRA_OECONF = "--enable-shared"
diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.16.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.16.bb
new file mode 100644
index 000000000..1d5a29438
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.16.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Jpeg 2000 implementation"
+HOMEPAGE = "https://github.com/mdadams/jasper"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
+
+SRC_URI = "git://github.com/mdadams/jasper.git;protocol=https"
+SRCREV = "9aef6d91a82a8a6aecb575cbee57f74470603cc2"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=true, -DJAS_ENABLE_LIBJPEG=false, jpeg"
+PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=true, -DJAS_ENABLE_OPENGL=false, freeglut"
+
+EXTRA_OECMAKE_append = " -DJAS_ENABLE_SHARED=true"
+
+do_install_append() {
+    chrpath -d ${D}${bindir}/jasper
+    chrpath -d ${D}${bindir}/imginfo
+    chrpath -d ${D}${bindir}/imgcmp
+    chrpath -d ${D}${libdir}/libjasper.so.*
+}
-- 
2.17.1


