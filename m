Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id B48047F8A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 08:07:23 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a6so14928246plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 00:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uKY3uXcXsGu/DjKcM/u/3nLxPG/YB+kGzl/6UBoNWQ8=;
	b=OqHH7aVqGyMX+1wTPtkBXbCw9IxgUmOpBcnHUT6uerw3/UsbwslV4R2/AhPvkbU9Xd
	R55EQbFX8OsilNlMeRB3MMBlhFFlkSSBhT3mmddS8nGLYJyrWWZqiPyrb20e9tjb5X1l
	/v74NZdZ/LnzrIVQ0KvNC9W4MEotPoGNp+SfRgSVQaREqmrz11kawGUZzX7+VXPwA2Kn
	4KgVnSO2un6WY1L5WTLnA4XZ97U69VC0n+1RhrN/fWQtxWMtU7oNR1OV2Xanqt2Navkv
	fh3PyIRLqbNQgOtId2cBtQ4UePUskkKda0wfcnJ81cNPpaEnbGgE76KodOlrz9EScaSf
	BWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uKY3uXcXsGu/DjKcM/u/3nLxPG/YB+kGzl/6UBoNWQ8=;
	b=CoJmnxRYV9lADWmfSKdQBpCoUb1hydao8iaoQ6wwnFqE5Lx/0VWkOCVRLlm+YNQOzQ
	BaXI9Gnki6q7Hu4tIZPBBbV6/iqO4uXz0KVNir9WufuzOZaiDnnEZp73Un/dSJpZdqcA
	wSt/tkCani91whGX/LE+8f1bOCtbiZLQVzvJKJyPeoFlMD+xQ2OzVn6UVEP8Y2mjauVK
	Fi4o2NctqMw6K7dK29cXIW6XP/7yFizHyY1B4OqqUswU2oqHKrEWpuX5xI4+0W/ciRxY
	7y/gC2aK46reeWiGnj9WVA0VDUGJuGoKz6QUQ3R2YMkLyca7O6miiPoni7XdM+rGguaQ
	QVPQ==
X-Gm-Message-State: APjAAAW/16vRSTCEHmKqZfxDoqpnnGhAihgNVyEmznoiX00aeh2SUV24
	6qhZzewk1dfdAoUN+TFczthUw0MtMj8=
X-Google-Smtp-Source: APXvYqyyK5yf5UrSt5LWWEADrdA3V9a4ISRAdwbHwIulQKx/Q1kAeBeMb86WIgxmg/OqTLOJ4oZlFQ==
X-Received: by 2002:a17:90a:8a12:: with SMTP id
	w18mr4761971pjn.68.1577779644343; 
	Tue, 31 Dec 2019 00:07:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id d1sm2294599pjx.6.2019.12.31.00.07.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 00:07:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2019 00:07:18 -0800
Message-Id: <20191231080718.651764-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] sanlock: Upgrade to 3.8.0+
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
X-List-Received-Date: Tue, 31 Dec 2019 08:07:23 -0000
Content-Transfer-Encoding: 8bit

The original SRCREV was at 3.7.3 even though PV was 3.8.0
this upgrades to latest on top of 3.8.0 to get py3 support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Append +gitSRCPV to PV

 .../recipes-extended/sanlock/sanlock_3.8.0.bb | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
index bf7eaf4111..ffd46da0af 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
@@ -9,13 +9,16 @@ HOMEPAGE = "https://pagure.io/sanlock"
 SECTION = "utils"
 
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
+LIC_FILES_CHKSUM = "file://../README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
+
+PV .= "+git${SRCPV}"
 
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
-           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
+           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch;patchdir=../ \
           "
-SRCREV = "7afe0e66f5c7f24894896fad20ffa6f39733d80f"
-S = "${WORKDIR}/git"
+SRCREV = "cff348800722f7dadf030ffe7494c2df714996e3"
+
+S = "${WORKDIR}/git/python"
 
 DEPENDS = "libaio util-linux"
 
@@ -24,15 +27,13 @@ inherit distutils3 useradd
 do_configure[noexec] = "1"
 
 do_compile_prepend () {
-    oe_runmake -C wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
-    oe_runmake -C src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
-    cd ${S}/python
+    oe_runmake -C ${S}/../wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
+    oe_runmake -C ${S}/../src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
 }
 
 do_install_prepend () {
-    oe_runmake -C wdmd DESTDIR=${D} LIBDIR=${libdir} install
-    oe_runmake -C src DESTDIR=${D} LIBDIR=${libdir} install
-    cd ${S}/python
+    oe_runmake -C ${S}/../wdmd DESTDIR=${D} LIBDIR=${libdir} install
+    oe_runmake -C ${S}/../src DESTDIR=${D} LIBDIR=${libdir} install
 }
 
 SANLOCKGROUP ?= "sanlock"
-- 
2.24.1


