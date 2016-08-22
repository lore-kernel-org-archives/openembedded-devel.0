Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB2817328A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:06 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r128so8983373qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=mZsw7M+ig+U2xtULSrbLVMwks1bJ456qyycLeQFPuQo=;
	b=CknEPAbCxD0VrmjO1VhnB+gowxLh5XwNjS/uBSADdazdq20DvehYVAfwAuI2cUtBO4
	Jrw+rvrDI90YPL7gkwVh8m9QOPI9HWgyl+r77ujCn511ACPXfIA+agHHItJopbZvp/8d
	X5Pi+5iXLdUOnGBdchtcAo8Dy1gpLcUZlOqHGDlG+O8kpG9MbKMZ2paUWaPJ7hXs0mJR
	YO466vY/iCbscj6SdA6bis3tcL3nNyMqkUrSeRiN57dBiyS+hSlc+eSVWqsKBRZfZ09k
	0sMaknUoLa6ji21R0uHKpjqGKfcW022BsqU6lehfUxf7nHKd+tPAjm8ABorRB6wlF9a6
	odQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=mZsw7M+ig+U2xtULSrbLVMwks1bJ456qyycLeQFPuQo=;
	b=MqNxKrqIZKOIo2hvBsQn5cFZ+m/OHZ5K6zqFrt7P/S+/QxzBivpJW3Yii0hkT/yCcZ
	qOms9/JMoixxOTSmNN1vIjOK+sUJs1YFaALS+WQc2RnYl34SilXqMylfxclj4LkYPXJR
	xk5ZyXhS/+bOoWCIm7CkfCGRrP3ZmgP4o2i3H0aMOtYnwgDgLBdwVWqXFYD9UqmNVnsf
	ew3SJ3yMa0nu1ad4+4oR9vUhEQbkB9dIhh0lwy3Iah/UA4oz9kXJZaGvpWp4PuatsU3P
	7fj9nPwmDBz0d+EIB/n3vRX7mYK5Qk1vRmms7S8NueX9NvyrdDdPVr3bw3SFjmxLds1v
	80BQ==
X-Gm-Message-State: AEkoousmBaQfo2OtKXjuYnyys+JXy3u5aC/WPth+qmU/brEfkiyV1x1Ni7Z8sDlD6AG8Pg==
X-Received: by 10.55.126.194 with SMTP id z185mr25801837qkc.140.1471892587601; 
	Mon, 22 Aug 2016 12:03:07 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:06 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:21 -0300
Message-Id: <1471892491-6177-7-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 07/17] python-urllib3: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:07 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND
  - Add python-certifi, python-cryptography, python-idna and
    python-pyopenssl to RDEPENDS

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-urllib3.inc        | 19 +++++++++++++++++++
 .../recipes-devtools/python/python-urllib3_1.16.bb    | 16 +---------------
 .../recipes-devtools/python/python3-urllib3_1.16.bb   |  2 ++
 3 files changed, 22 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-urllib3.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3_1.16.bb

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
new file mode 100644
index 0000000..7b62be5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
+HOMEPAGE = "https://github.com/shazow/urllib3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
+
+SRC_URI[md5sum] = "fcaab1c5385c57deeb7053d3d7d81d59"
+SRC_URI[sha256sum] = "63d479478ddfc83bbc11577dc16d47835c5179ac13e550118ca143b62c4bf9ab"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-certifi \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.16.bb b/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
index 87a2852..6c81f1d 100644
--- a/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
@@ -1,16 +1,2 @@
-SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
-HOMEPAGE = "https://github.com/shazow/urllib3"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
-
-SRC_URI[md5sum] = "fcaab1c5385c57deeb7053d3d7d81d59"
-SRC_URI[sha256sum] = "63d479478ddfc83bbc11577dc16d47835c5179ac13e550118ca143b62c4bf9ab"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-zlib \
-    "
+require python-urllib3.inc
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.16.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.16.bb
new file mode 100644
index 0000000..19eb702
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.16.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-urllib3.inc
-- 
2.1.4


