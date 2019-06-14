Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6A37E8BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 00:59:13 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y17so517606lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 17:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3XTW5P4VHEnpNINtlYyrWSC9ha03uXvLjvCd45NqSE8=;
	b=zDB3Fc0fHDwOA7NzKIMmY3QodOpd4UbsD62YGEVS7Gg9g+GQVGQUh23LF/sAY/P9Q2
	wwjIEh4IBVGMZc+cnIRDdxJsDxJXz5+d2R0FR3oUanDTicBcRsbR0/EXkkkIJrBE/yEp
	BbZsINCZSTmYsX8/KI8z/vF9sPPr/W+MqSFk43Ftk/aUJFR48wGqbvztbTwsVoQKBhg1
	x5tS7hfvIB2jH93F1h2grZYpV8N0jHDI95fX8hjlfMSVXCuqdsKaiwIlI+4AxIcwEO6n
	l9cSwOcn3+Z3S5inAnlH3/UMzfc11H0HAKFkbCVqGKpbW7i6xRgOboTmQZcR9+ZPV+sM
	Ip1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3XTW5P4VHEnpNINtlYyrWSC9ha03uXvLjvCd45NqSE8=;
	b=SOMH69zLIqfvvAarzHkdl3n/cF8BzToF49yHj4Wr7tQRAw+BNlA0yosa7e7kNWwUt2
	Ku2xCItRPl42yiPhWD7fusg4sFf3ioMFRcKXFhmIqwNUFg5fl9jjq/9KRcv9NlanKLYp
	Ly9plqjR/FBi0xinuhff9FthCcnKqVx3X/nGqha/OiNts6irg4+dntLSGR/kL5gasfpZ
	7ys9dsVHnQnuo5dPijt2ArnmpcRWpiNL9DbuOOILYqeD0vaKSpG/kBNvmLIpSisN7t/V
	68cerEwwr05MSMbNSSA0lPaviPFZkBXVZnBHJ9ukHvoormpUjXLESXNrVi/LtNI7p52H
	nbRg==
X-Gm-Message-State: APjAAAWfTUB1XrNS1kGIs+hJnTnPKsTYem8fp3vG3Ira9P94d0vmTrNz
	KYzg9w4PvXlUo0Z6nC7iLGS30acZZCo=
X-Google-Smtp-Source: APXvYqzfzJr2bts5EVh0WZHYsArp3zzAzC1jLdssKVohyT+EvW+4J/KGmbzt7oUy7bqRNvvQlRc8xw==
X-Received: by 2002:a19:bec1:: with SMTP id o184mr17077610lff.86.1560473954405;
	Thu, 13 Jun 2019 17:59:14 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 25sm270176ljn.62.2019.06.13.17.59.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 13 Jun 2019 17:59:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jun 2019 02:59:06 +0200
Message-Id: <20190614005906.3342-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libspatialite: update to 4.3.0a
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
X-List-Received-Date: Fri, 14 Jun 2019 00:59:14 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../geos-config.patch                                  |  0
 ...{libspatialite_4.2.0.bb => libspatialite_4.3.0a.bb} | 10 ++++------
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-navigation/libspatialite/{libspatialite-4.2.0 => libspatialite}/geos-config.patch (100%)
 rename meta-oe/recipes-navigation/libspatialite/{libspatialite_4.2.0.bb => libspatialite_4.3.0a.bb} (73%)

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0/geos-config.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/geos-config.patch
similarity index 100%
rename from meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0/geos-config.patch
rename to meta-oe/recipes-navigation/libspatialite/libspatialite/geos-config.patch
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb
similarity index 73%
rename from meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
rename to meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb
index d66dc875b..a3f09036c 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb
@@ -6,7 +6,10 @@ DEPENDS = "proj geos sqlite3 libxml2 zlib"
 LICENSE = "MPLv1.1 & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e92e1a36cc384b60f5b31dde0bdd39e"
 
-SRC_URI = "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-${PV}.tar.gz"
+SRC_URI = "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-${PV}.tar.gz \
+           file://geos-config.patch"
+SRC_URI[md5sum] = "6b380b332c00da6f76f432b10a1a338c"
+SRC_URI[sha256sum] = "88900030a4762904a7880273f292e5e8ca6b15b7c6c3fb88ffa9e67ee8a5a499"
 
 inherit autotools pkgconfig
 
@@ -16,8 +19,3 @@ EXTRA_OECONF = "--enable-freexl=no"
 PACKAGES += "${PN}-plugin"
 INSANE_SKIP_${PN}-plugin = "dev-so"
 FILES_${PN}-plugin += "${libdir}/mod_*"
-
-SRC_URI[md5sum] = "83305ed694a77152120d1f74c5151779"
-SRC_URI[sha256sum] = "9f138a6854740c7827fdee53845eb1485fce3e805a7aa9fc9151f8046ebd312d"
-
-SRC_URI += "file://geos-config.patch"
-- 
2.17.1


