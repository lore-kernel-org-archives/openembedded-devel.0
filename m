Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E5CD5782E1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 01:05:59 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r125-v6so10065409wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jun 2018 18:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=g9OjWkUpEmvzceeXhRB8j29Vej/xlR4dvsCHPmA8/1c=;
	b=kgiNtejc1kS8FwKUHt3sNf5ZnW3CRj8ZNLBjgwgRzIWb+XO2Uy3R3aE7X0FXFczv92
	GJrnr8a1Q53WKHSbTiSp7+RBiZRP7oxjctA19O2S7rC9a8FNkrfmExKHh8HoqWgvvgn3
	qyuFpG1+mqPBLWBDupSX/2fCzDQeZxuhOtnk4mNZ+afbk6C+8hyEjpnJtb+Fn0b9RdYZ
	ZWQxpwbBU94XjisGoftqEN9jdA1QGRzr0ItijY+gqYFWfA3B21R8ycytoPkDWbVaS/C5
	RBvgJMukWWTpcCHjE0Z3281bAI2tiNfzkXEQnqiKDKC/VJ6V2oSqylaebaVpnAj9QG1P
	ZWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g9OjWkUpEmvzceeXhRB8j29Vej/xlR4dvsCHPmA8/1c=;
	b=uWXzoKZxBXXDvb+8GC+fR9FozT7S/9iHQyhSImE4BQKcmepS57mNqf0DSbSkK4QWFR
	Xd7l0LsWlRWR1oZ5UB7CJSfaZs4ks2EPnPcC+HOMIp/kRiPy6yMQcXsnp75DsTaOUVoe
	nqEO3X8Wv+Cf2h/atXaX0tQiQsEA6jwuYJIViV2R5s6ihyxswpjE93QmItQf1R2v57Ya
	Yptl9A+hhFatn8UOkvW0dSpPExyA0DvCuFtL+A9pdPm1j6eEDw+Xe1chMXzBWT3afHmS
	VMBcjbctR2hx9rItJoWWTQtIg8SSu8rNyf8sW+b3Wu3qIcCpsbWucXN4GKf6+5l5Os4H
	sVPg==
X-Gm-Message-State: APt69E04OeNUJX7/uoRyYE/MvroB5c8y2itALFyyiqTaJp0kucRHv1ww
	YZcHM1vq2FbLbYng0pt4Mf/M4GBK
X-Google-Smtp-Source: ADUXVKJ9SaoKp7/xILBYJQhGih1yinH6cceCMuILpYEXPqOO12NuXSp4OlIp1/nwhfA4VIuXu5J3Ww==
X-Received: by 2002:a50:89d3:: with SMTP id
	h19-v6mr13078314edh.225.1528592760282; 
	Sat, 09 Jun 2018 18:06:00 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:ddc6:6bd0:776b:2bb8])
	by smtp.gmail.com with ESMTPSA id
	l13-v6sm5351017edn.74.2018.06.09.18.05.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 18:05:59 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 03:05:37 +0200
Message-Id: <20180610010537.14941-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] libconfig: update to 1.7.2
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
X-List-Received-Date: Sun, 10 Jun 2018 01:06:00 -0000

Updated the package and SRC_URI, since the project is now maintained at
github.com/hyperrealm/libconfig.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../libconfig/libconfig_1.5.bb                | 14 --------------
 .../libconfig/libconfig_1.7.2.bb              | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
 create mode 100644 meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
deleted file mode 100644
index fb6e50e51..000000000
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "C/C++ Configuration File Library"
-DESCRIPTION = "Library for manipulating structured configuration files"
-HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
-
-SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
-
-inherit autotools-brokensep pkgconfig
-
-SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
-SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
new file mode 100644
index 000000000..eb0a2c3ec
--- /dev/null
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "C/C++ Configuration File Library"
+DESCRIPTION = "Library for manipulating structured configuration files"
+HOMEPAGE = "https://hyperrealm.github.io/libconfig/"
+BUGTRACKER = "https://github.com/hyperrealm/libconfig/issues"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
+
+SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz"
+
+inherit autotools-brokensep pkgconfig
+
+SRC_URI[md5sum] = "6bd98ee3a6e6b9126c82c916d7a9e690"
+SRC_URI[sha256sum] = "7c3c7a9c73ff3302084386e96f903eb62ce06953bb1666235fac74363a16fad9"
+
+FILES_${PN}_append = " \
+    ${libdir}/cmake \
+"
-- 
2.17.1


