Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id ABF75605C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 23:14:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c13so6684263qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 15:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3SwtCGBXB5T/qybW7yenpcDGBG8xy9XS2zFP84KfNFs=;
	b=XaDYaB9x/gfj5KzlF6Zl4izY0hNuet/UM/O92nyZ+C8QwsCJgaDLbl1WieCldaM+ET
	8kNVnVajeDW4i2zYca4GdnkGxRsJwLlea9GJTmWtEYrJPW3r097SIzR/Al7uCGzBGgnI
	mHN7Y2ZKYvnqJvOiHD0bbykZ4KOCeFuM5uwfhQ9iH8VjMHLK2AGZaqwkDeknDdDUYszt
	DyALwdDKowq+C4ylmVczZzUYVxmSefIA9w44fffoN306JWLqagxR3h6yVyXRzzMJWRG5
	TtdUDWGYoS10Q47O5V+eS2BTI5lVFWFujNgMuq0uhZOKiVZZP/LHriK1l/Ic59SZU3Yr
	0ojg==
X-Gm-Message-State: AKGB3mLpYws8E0RWBWYx4SZkvhVn3xcBnJ7YUdA/jQ9PG+5j8/ciM9Ul
	gdA9hzu/wvoIAWNu2NUVZ8tLwFtz
X-Google-Smtp-Source: AGs4zMYIZXdisSGh3LgpI06M+L0QfB9tC/4N2F8EoWgBmBpMUFAOB3BndMWTB0txvSVmujrouzT6zg==
X-Received: by 10.55.183.132 with SMTP id h126mr94646qkf.259.1511997241353;
	Wed, 29 Nov 2017 15:14:01 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id f5sm2098154qte.87.2017.11.29.15.14.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 15:14:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 18:13:54 -0500
Message-Id: <1511997234-13779-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-can: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 23:14:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-can.inc         | 11 +++++++++++
 meta-python/recipes-devtools/python/python-can_2.0.0b1.bb  |  4 +++-
 meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb |  5 ++++-
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 1dbc809..ecfae3c 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -7,3 +7,14 @@ SRC_URI[md5sum] = "b2a164887c1c6a2a2490b5afb36e36db"
 SRC_URI[sha256sum] = "b961b6ce75a7f08b586f4d2cae8cdc409881731b851fc405fa21cb16bad00d87"
 
 PYPI_PACKAGE="python-can"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-importlib \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-sqlite3 \
+"
diff --git a/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb b/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb
index ec81a9e..a698ad3 100644
--- a/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb
+++ b/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb
@@ -1,4 +1,6 @@
 require python-can.inc
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "python-sqlite3"
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-zlib \
+"    
diff --git a/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb b/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb
index a1d45b8..aaa9e81 100644
--- a/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb
@@ -1,4 +1,7 @@
 require python-can.inc
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += "python3-sqlite3"
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-compression \
+"
-- 
2.7.4


