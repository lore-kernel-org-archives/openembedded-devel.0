Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A61661338
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:39:00 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r16so12274443otd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zAAHUDA577Iw5FmDwrZEJEE/C7/zHibbKuaL8so5mRY=;
	b=sdXipvugOnIj7GIXqJ0r+wiAkRS3e1hpgcA47/xj2t5o9fwJKSdsvM901jf9SUpT0v
	vgGhSB5REePDMXa/cv7nuwjSKnCjwzB/ROFlEidFGyx8gglrGOsifSvLAHT6yXezGWK1
	KyuyoughI7fnwxkpmQiI/4Y5RRGLd2UllwsLxNv4ja/PjW7Cx8lX9XFT/fc0tzNlQ0GS
	WCudfsv4DiFrQrlLcbQM2xACU7KS00AFZdAtZay6xBA5ZfxZx7PnsNxPHZl3TNsw/38r
	mearBnXZT5ry7STFz0AUr7p5DD5wedCwvzZg7qvk6kmPYK9DtD1M5s41AmtBygukC5I1
	A6/g==
X-Gm-Message-State: APjAAAXfowIYjOK795WGLVgKaKohsobf7bE53AWGaODF0s2TrvwnUgSl
	ByqcMR3rcMRBRHTal1dtyUsM4wBMtW8=
X-Google-Smtp-Source: APXvYqzm0KsQyHzByZN4hZ317EcAP6TG6kSXxGhhl9O2PVYyJSeeyQkdbyxgxmF6T7YWz2xzJ1axhw==
X-Received: by 2002:a9d:6181:: with SMTP id g1mr6916967otk.104.1581788340699; 
	Sat, 15 Feb 2020 09:39:00 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	p24sm3277404otq.64.2020.02.15.09.38.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:39:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 12:38:48 -0500
Message-Id: <20200215173848.1052-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-configparser: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Sat, 15 Feb 2020 17:39:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-configparser.inc               | 14 --------------
 .../python/python3-configparser_4.0.2.bb         | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-configparser.inc

diff --git a/meta-python/recipes-devtools/python/python-configparser.inc b/meta-python/recipes-devtools/python/python-configparser.inc
deleted file mode 100644
index bce7cee467..0000000000
--- a/meta-python/recipes-devtools/python/python-configparser.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "This module provides the ConfigParser class which implements a basic configuration language which provides a structure similar to what's found in Microsoft Windows INI files."
-SECTION = "devel/python"
-HOMEPAGE = "https://docs.python.org/3/library/configparser.html"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
-
-SRC_URI[md5sum] = "35926cc4b9133f1f9ca70a1fd2fdf237"
-SRC_URI[sha256sum] = "c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb b/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
index 770cba5962..196660925c 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-configparser.inc
+SUMMARY = "This module provides the ConfigParser class which implements a basic configuration language which provides a structure similar to what's found in Microsoft Windows INI files."
+SECTION = "devel/python"
+HOMEPAGE = "https://docs.python.org/3/library/configparser.html"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
+
+SRC_URI[md5sum] = "35926cc4b9133f1f9ca70a1fd2fdf237"
+SRC_URI[sha256sum] = "c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


