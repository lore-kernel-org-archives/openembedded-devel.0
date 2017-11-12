Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DD59C785C6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 18:24:59 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id e19so12355650qte.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 10:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tke7XVKwcQi0yQeTf5n0LSHfp4yRW1n5sfS7TBG0+6c=;
	b=MJSVtnxW7uwJgjpi3pe8AuNBQhEZYVjGkMrJVNysF5Yd8gLs1m6BMW+6AGfUt2pRtA
	9LbkVAFlhDvbDAi9xheP0PhgmVQfGo8nVEdpu5hvTObQrA/MfkzqOsOVNmftX4hzcOj9
	AKd0OHEIQQ9MA0wB0Tnj3MBJ5vE/tnobQuj79gvdYzJ0gOKEn57R7MhAUwxtafqfqvku
	3N6qtI6qG6dRZXafcOfJfNcL74hxgda9FFusBngFGNAwyc5c2b80TZqqhqlJq0HWvgcM
	Lu0fbCg+96VKl8QDOH8rsA6Rp07A2dzRrbg9TO8syK7UNrz9e0XrHZsAusCGkZQD5791
	hqTg==
X-Gm-Message-State: AJaThX6MJt+XYBOJ7xtVVTlFOHSsEpMgGQHQzl3iPwhXoQwk3aGeR14c
	e7NnekrJSMf4Zed0VZ+ImrIJ+Q3/
X-Google-Smtp-Source: AGs4zMZLjoJOM469NMp9br/ABUbhIC62lvm5NZssV08Hk9WTnoKxXHSusYNnsLOr86zrRkhwBUIMjw==
X-Received: by 10.200.0.131 with SMTP id c3mr10205648qtg.221.1510511100466;
	Sun, 12 Nov 2017 10:25:00 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id t4sm9744687qtj.9.2017.11.12.10.24.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 10:25:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 13:24:50 -0500
Message-Id: <1510511090-24779-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pandas: update to version 0.21.0
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
X-List-Received-Date: Sun, 12 Nov 2017 18:25:00 -0000

Update the license and checksum to reflect the package

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pandas.inc             | 8 ++++----
 .../python/{python-pandas_0.20.3.bb => python-pandas_0.21.0.bb}   | 0
 .../python/{python3-pandas_0.20.3.bb => python3-pandas_0.21.0.bb} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pandas_0.20.3.bb => python-pandas_0.21.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pandas_0.20.3.bb => python3-pandas_0.21.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index d1f3707..4c00a1a 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -3,11 +3,11 @@ DESCRIPTION = "pandas is an open source, BSD-licensed library providing \
 high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "http://pandas.pydata.org/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=66017d3134349017409386be85176145"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "4df858f28b4bf4fa07d9fbb7f2568173"
-SRC_URI[sha256sum] = "a777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"
+SRC_URI[md5sum] = "6f14884caaa87a0824b5e93fe032b904"
+SRC_URI[sha256sum] = "5cd5cb30e72eeaf202f0e5e180780b897570e889d2db328c689a5a263405c559"
 
 PYPI_PACKAGE = "pandas"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb b/meta-python/recipes-devtools/python/python-pandas_0.21.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
rename to meta-python/recipes-devtools/python/python-pandas_0.21.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb b/meta-python/recipes-devtools/python/python3-pandas_0.21.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_0.21.0.bb
-- 
2.7.4


