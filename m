Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id DAA9E786BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:36 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g7so6188959pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Ut6AdRrhmk7LWnHAZmsH9oOY8UNQnaTtaZ25uH4uS4=;
	b=DvSAa8gR/D4s3EZJps5M6bX79mke6EEWfJeC7BiersUM2dwgL6zcz7mpZBD2XDcN3E
	lCQg2mnud24Zb516Ag5uLxpvgaP8fFIJDCiPODkDLJJQeVpKEklMukvNltpfCLoFJAtX
	BwKqvjNjhT99FyWMhZoV7aweWI1eg9t4Cykv4jsuM3erib36kCIjchXvoDwBSaxWEr0Z
	VNfq8TeUjp5J1+81WXhNfs1x9RNoA/AGcwAYvUOCbUUW2+cNXIO6Z0WH948rUYB4ZrA2
	O2LMzSSKed2roYH4AKIJWAXruafMxExw8nBsV16YQu+FtNO1OB2vUCBiqkO2NUmHojS9
	l8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1Ut6AdRrhmk7LWnHAZmsH9oOY8UNQnaTtaZ25uH4uS4=;
	b=Eoi0B4LDelj7BCPb4laPisxdQGp/XLJWAbDqLHYOT2RFx5DGS+Z+Tf6/hVRKx1BPoS
	gsbwArhTG+Oa1iDpVDDSfbSa8caqjqPd4jg05GGK2g4fcdY1XRSR5jH1xlvAw6iZXJGE
	8BaUMxLpBSJSqTwS7NpKatCV3KIcJ2InN3Jh0YCvLwuxRzzngvHMj44ISpC3MQXST+mo
	/oK8w5K9dZMJNK5nSEr6ncxHd0WUMqD2YtlIYdxr5Ep3S2eM6l0ItfcrS0fS+2VP3+qO
	FvceLo9xsgAw8fjd+ZkEHN9ITSfsxzt8vvfe5d3z4ayeZztQi6sc8govdXDlaZCOYJjV
	QH+A==
X-Gm-Message-State: AJaThX75wbuh9yCGRSFadA/cPJsUiN/Z8PJur+mv6CisDniUESI3Vyty
	NUWuhi213bhyfkhXw9l2puhoKg==
X-Google-Smtp-Source: AGs4zMamnSJsn40pem674H5nBoG/FG1OQ0ZUFmPEYKLbEleiKGEIEl8foNsPQG0EpR9XTFt6EUVSTA==
X-Received: by 10.101.82.139 with SMTP id y11mr27527747pgp.109.1512712178066; 
	Thu, 07 Dec 2017 21:49:38 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:37 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:11 -0800
Message-Id: <20171208054911.27014-14-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 13/13] python[3]-flask-xstatic: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:37 -0000

V2: add missing FILESEXTRAPATHS_prepend

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-xstatic.inc      | 15 +++++++++++++++
 .../python/python-flask-xstatic/remove-pip-requires.patch |  7 +++++++
 .../recipes-devtools/python/python-flask-xstatic_0.0.1.bb |  2 ++
 .../python/python3-flask-xstatic_0.0.1.bb                 |  2 ++
 4 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
 create mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic.inc b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
new file mode 100644
index 000000000..a1fe14ed4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "XStatic support for flask"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=659968f6ebd4b70b6c3190d20b4a924c"
+
+SRC_URI[md5sum] = "2f56023e1444c8bd1fec41afe93de743"
+SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381490133"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-flask-xstatic:"
+SRC_URI += "file://remove-pip-requires.patch"
+
+PYPI_PACKAGE = "Flask-XStatic"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-xstatic \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch b/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
new file mode 100644
index 0000000..a2d620a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
@@ -0,0 +1,7 @@
+--- Flask-XStatic-0.0.1/setup.py.orig	2015-01-30 08:01:56.000000000 -0800
++++ Flask-XStatic-0.0.1/setup.py	2017-04-17 21:40:32.570181626 -0700
+@@ -1,4 +1,3 @@
+-from pip.req import parse_requirements
+ import setuptools
+ 
+ with open('README.rst') as f:
diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
new file mode 100644
index 0000000..dff14a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-xstatic.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
new file mode 100644
index 0000000..5412bef
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-xstatic.inc
-- 
2.7.4


