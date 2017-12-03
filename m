Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A32E5601D4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Dec 2017 19:53:54 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id 33so18882623qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Dec 2017 11:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0GLifpJT0BEKBp4j8tsiAx/OXa2T0I3PLQtPZ6xkEMk=;
	b=pKFoyFC74+DxOiyVR33i3JSpfdDkeF4ZvuN6VKkrTR4mI2PFG4l6mswmpHwuswAtqT
	1A3iLkmM2qdg+jpCtfT9gEWiR1dmIWZpKKf9axocQsHH+2nYXLSRVzotXyexZaGXjoFG
	r5At3KI1C7s8tw3diHEL8B0Wwod7ag0DSZ14UUrxyOgfkCS2vgWzZc2htTa5N6Uv3VaS
	97YQrjbonDcZTX/eOaWj/0VC8r09qYXuZCi6meJBce00x9u59TSAPaLO/voNfyP931qQ
	ibvSunvlsETLau+XqmeGR6tzq95u52Yl9MxI6TmBxtIkq+RAs3jqgQnaLOaQAauUdsTP
	Wz/Q==
X-Gm-Message-State: AKGB3mJ1R0hdOl8tmf9Dhm9xTCGTgujHVRXJMJGZ6aAcyUN448+Ea3kk
	2M8sA5715nyJOvVUC9mwRIkFaxdu
X-Google-Smtp-Source: AGs4zMZAhtNZj1Q4ZKerQF9Ery1sMeRwbBV9skhRiuHfts9O86GzAw96JS7GD3ozIZ7MHF4yRdLNpQ==
X-Received: by 10.200.28.7 with SMTP id a7mr18569302qtk.206.1512330835290;
	Sun, 03 Dec 2017 11:53:55 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id b10sm975345qti.76.2017.12.03.11.53.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Dec 2017 11:53:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Dec 2017 14:53:47 -0500
Message-Id: <1512330827-4290-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ply: add a python3 version of the recipe
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
X-List-Received-Date: Sun, 03 Dec 2017 19:53:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ply.inc     | 18 ++++++++++++++++++
 meta-python/recipes-devtools/python/python-ply_3.10.bb | 13 ++-----------
 .../recipes-devtools/python/python3-ply_3.10.bb        |  6 ++++++
 3 files changed, 26 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-ply.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-ply_3.10.bb

diff --git a/meta-python/recipes-devtools/python/python-ply.inc b/meta-python/recipes-devtools/python/python-ply.inc
new file mode 100644
index 0000000..a6cdf4b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ply.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Python Lex and Yacc"
+DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/ply"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README.md;beginline=3;endline=30;md5=fcb04bc2f765e46ab7084d6ab6e452bb"
+
+SRC_URI[md5sum] = "1d63c166ab250bab87d8dcc42dcca70e"
+SRC_URI[sha256sum] = "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-ply_3.10.bb b/meta-python/recipes-devtools/python/python-ply_3.10.bb
index 9d019ae..2b6165c 100644
--- a/meta-python/recipes-devtools/python/python-ply_3.10.bb
+++ b/meta-python/recipes-devtools/python/python-ply_3.10.bb
@@ -1,11 +1,2 @@
-SUMMARY = "Python Lex and Yacc"
-DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/ply"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://README.md;beginline=3;endline=30;md5=fcb04bc2f765e46ab7084d6ab6e452bb"
-
-SRC_URI[md5sum] = "1d63c166ab250bab87d8dcc42dcca70e"
-SRC_URI[sha256sum] = "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
-
-inherit pypi setuptools
+require python-ply.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-ply_3.10.bb b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
new file mode 100644
index 0000000..de8881d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
@@ -0,0 +1,6 @@
+require python-ply.inc
+inherit setuptools3
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-enum \
+"
-- 
2.7.4


