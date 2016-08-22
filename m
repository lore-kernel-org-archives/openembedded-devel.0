Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4042873259
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:03 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so5559481qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=P1V/XWGB6VNMzF2HOJIsGjeX9plTMb9IPWdrfLoEvYo=;
	b=yA5+kOB54aaVZMYl/nX3ZXZcyLbVQLvXHsGEKCN4D5eG7yZg0LDioMKfdshhBxTCth
	tigJNj5KgokXZxIbP3YukzUCtC+QPSaNgGzMDuO9FKE/w2ZyvQdFbpWGKV5aOrKR8IIn
	z/aN3R1q51dj2Pp++pCPCakIehRpFlRP3mtIJ23hqq6FmdW/po4WoMA8lt/835wzilSv
	/ut7KCILvUpBJsdHiBiR6yzhEiXL7NYpB2+j5kGioHJEquGVObpd49BCTVTL1GzuUle+
	SefOUqZETi7L+AF7TNncY8rDf+AF+Rc7Ma/in4F1TvCHvVYgv1Mxm6cy25rSTezWSKKF
	JjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=P1V/XWGB6VNMzF2HOJIsGjeX9plTMb9IPWdrfLoEvYo=;
	b=i5+IXl8fJy8p0lVKma4PpKiSZwa6/r3Rr4q5imQy4nghOKtE0hXtbTbVJY4AL/gRX6
	PvVFK0vJ4xPfr3cKR0rpb8zHawG/597OgGhSzPp4aD5oZD+C7K/IH8UzMVm9yG7UtWgL
	4AjoTph2fuhO087N0NnIiVp7MA2ZWKmU6liQyS6STu9ALJICLni/mAZ9oIwtOHqlaGSr
	iKny+/YmvoB8FkjQHEdHSv32hTIOYni10FRw3N/bSfmbQbHJKu6SmrxZBeY9KgXqyCll
	Mat9uHg7gslJssCi6F4MR7ofGCjZ4fyjQqGDhay9GuNzB6fVQwgXIFzQvD0sdC6w7VjB
	E3MQ==
X-Gm-Message-State: AEkoous6n6Tqi3loNgaAcjzE7268HBKZjCldbfWrLjtEctCEbvww+tpATrOTuQ9MA+K4dQ==
X-Received: by 10.55.67.139 with SMTP id q133mr24144947qka.71.1471892584007;
	Mon, 22 Aug 2016 12:03:04 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:03 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:20 -0300
Message-Id: <1471892491-6177-6-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 06/17] python-pyopenssl: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:03 -0000

- Add Python 3 recipe
- Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-pyopenssl.inc       | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-pyopenssl_16.0.0.bb | 17 +----------------
 .../python/python3-pyopenssl_16.0.0.bb                 |  2 ++
 3 files changed, 21 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyopenssl.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
new file mode 100644
index 0000000..88b4306
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Simple Python wrapper around the OpenSSL library"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS = "openssl ${PYTHON_PN}-cryptography"
+
+SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
+SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
+
+PYPI_PACKAGE = "pyOpenSSL"
+
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
+
+RDEPENDS_${PN} = "python-threading python-six python-cryptography"
+RDEPENDS_${PN}-tests = "${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
index 8173858..d7177e2 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
@@ -1,17 +1,2 @@
-SUMMARY = "Simple Python wrapper around the OpenSSL library"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS = "openssl python-cryptography"
-
-SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
-SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
-
-PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools
-
-PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
-
-RDEPENDS_${PN} = "python-threading python-six python-cryptography"
-RDEPENDS_${PN}-tests = "${PN}"
+require python-pyopenssl.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb
new file mode 100644
index 0000000..0f0f83e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pyopenssl.inc
-- 
2.1.4


