Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6A30C71D06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:04:27 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i34so19957765qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 15:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BKFn18yj5jD3C+PLvSBbRXLH/E2tnVU6dvwN/l9x02Y=;
	b=Qaqw9wgW6a1pwyUVBM9fh6FfmmjRMeVYYxn0wTiKL43Y8C94t4WZ5AhRzlSxfiE7XT
	g05ctshUW5+XUfpnRfZW0d8pQjhVEyys53ItbYr4vMz18TDUp45ql+SFex6e3qE9M0uG
	uByolo74h0yE68GxFoxstQpzeV6tpx8I8ILuXIawki92/+MxICAFaMHC4CrjEAA6oRSA
	AHTXSe/tExO4cD4W++ciTYnIMxDTmemRxWl6DPHXv/FTM5xIT40OS8x7iYX9wsKFc6Tw
	3vdgIIFu+3zRxh92/hWkyP2WwcIkNlg57KQabPVLIrfqRnyDGk9JcoK3AnKC0i0u1nzP
	siuA==
X-Gm-Message-State: AMke39ncgI5sThDPbz4DIpPWPX7aaaUW30uXGazitLjDNyQiqf4cOQ76nwutJ2pi9idlTA==
X-Received: by 10.55.46.2 with SMTP id u2mr25003585qkh.231.1486595068211;
	Wed, 08 Feb 2017 15:04:28 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	t67sm7425668qkd.41.2017.02.08.15.04.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 15:04:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 18:04:20 -0500
Message-Id: <1486595060-14641-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.5
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
X-List-Received-Date: Wed, 08 Feb 2017 23:04:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc  | 14 ++++++++++----
 ...thon-sqlalchemy_1.1.4.bb => python-sqlalchemy_1.1.5.bb} |  0
 .../recipes-devtools/python/python3-sqlalchemy_1.1.4.bb    |  2 --
 .../recipes-devtools/python/python3-sqlalchemy_1.1.5.bb    |  5 +++++
 4 files changed, 15 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.4.bb => python-sqlalchemy_1.1.5.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.5.bb

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 471c109..ec6433e 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -2,12 +2,18 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d7dba1721bc8ce05d421f7279cb87971"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "be5af1bebe595206b71b513a14836e4f"
-SRC_URI[sha256sum] = "701b57d628b9fa1cfb82f10665e7214d5d2db23251ca6f23b91c5f56fcdbdeb5"
+SRC_URI[md5sum] = "50685d97dca4b91945ae6309d03ab8c9"
+SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5abf0d53d9fbd515fec4e43326f601119b6"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-numbers"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.4.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.4.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb
deleted file mode 100644
index 86cf9ed..0000000
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-sqlalchemy.inc
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.5.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.5.bb
new file mode 100644
index 0000000..01f1e97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.5.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-sqlalchemy.inc
+
+# Requires _pydecimal.py which is in misc
+RDEPENDS_${PN} += "${PYTHON_PN}-enum ${PYTHON_PN}-misc"
-- 
2.7.4


