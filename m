Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0479B61127
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:56:26 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 77so10285503oty.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HuEHTivd2dAIVgvYR39iYC0gUDH7lLo0TEL0gGYMMqc=;
	b=LwGvVLQnD0cO29vyu8e9VrhGkd7O+poljeJ5+cYEFVVmIMfFpdz1vX/EgyXnwsP/uI
	xamps2zQNg5CYZ2/aPHlhBxgV4MkW3dtErrRuMzP4RzNiheGjuHJ0zR5sSN4KvdypkjV
	F3wwZ8zzkvzMP/InRZVmFtlUh/UrhDjnmTovX/H1OMJI3tZ07OAB+Mtv1NThgC0c39Zc
	wqYxlvTODK6BPjqrDDD57Aqy5r3Pi47/ZC9aYP/Fcc0JJAflpBO79XvJjw4pDR0p6FAc
	WIo1iDml/oHF8eKZ2UNg1hqcCiOh2YoirHCk2XIA0N9bKwmpygODW/yR03ma5TMQhGh3
	6RPg==
X-Gm-Message-State: APjAAAVtIYHfChH5E6Wohudx3sRudXty9q9DK+CIqtOzF0HW5Fv82LwE
	dP9CsqiVm1nF8I0/B1eE5ZdfhDmVVWE=
X-Google-Smtp-Source: APXvYqzhqFspCOnPakG/hJs/2yR4RTSwKxCBcPbiKI5OGd4bl5tj11TmpVJ2lKqYbiLe2htyasCkhw==
X-Received: by 2002:a05:6830:1e2d:: with SMTP id
	t13mr3695218otr.128.1581710187757; 
	Fri, 14 Feb 2020 11:56:27 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id i2sm2296803oth.39.2020.02.14.11.56.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 11:56:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 14:56:19 -0500
Message-Id: <20200214195619.2731-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-can: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 19:56:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-can.inc     | 18 ------------------
 .../python/python3-can_3.3.2.bb                | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-can.inc

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
deleted file mode 100644
index 7d0100d7d7..0000000000
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Controller Area Network (CAN) interface module for Python"
-SECTION = "devel/python"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-SRC_URI[md5sum] = "b724553a330478270267380b4888a18e"
-SRC_URI[sha256sum] = "5fefb5c1e7e7f07faefc02c6eac79f9b58376f007048a04d8e7f325d48ec6b2e"
-
-PYPI_PACKAGE="python-can"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-sqlite3 \
-    ${PYTHON_PN}-wrapt \
-"
diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb b/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
index aaa9e811ce..4597795d50 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
@@ -1,7 +1,22 @@
-require python-can.inc
+SUMMARY = "Controller Area Network (CAN) interface module for Python"
+SECTION = "devel/python"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI[md5sum] = "b724553a330478270267380b4888a18e"
+SRC_URI[sha256sum] = "5fefb5c1e7e7f07faefc02c6eac79f9b58376f007048a04d8e7f325d48ec6b2e"
+
+PYPI_PACKAGE="python-can"
+
 inherit pypi setuptools3
 
 RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-sqlite3 \
+    ${PYTHON_PN}-wrapt \
 "
-- 
2.17.1


