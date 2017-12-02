Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA1878757
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:20 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id b12so7439682plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sWNL0zqu6qovPOtVUXRJ1iw04XjTU654NwIwRkrpWpw=;
	b=YD55kfhn265dxQ9D58EIg2E6GIHnIJ+Vaw68OuuZdAkKHJtgGMC+ACX8Q2+Z02SaHQ
	y/zxzGAfyaRFNy7mxTcIZEik7ZgY3gKGPo5cSPe9EsdVBM3jxiGwTbl7FM00lnq2/Ndm
	aE+NGJDm7kg1dFhtBkmDYjftbAC6ak+y8lcLacBXHsAGQMSq2XH79a/bR3svUzyu4ePI
	6YBo3AZnWshVhFKTxwbUZhewWwyhOONSaFc+MF+Ho6Elm3tqx5Ae/LnkAarztTSay8Uw
	9Lv94ZIDpyfjXHx0aMeRFwxVjtDFlmjk5DiFgSQ78WR4eiEMubkU3z7tXlCYByDLsQ0j
	3/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sWNL0zqu6qovPOtVUXRJ1iw04XjTU654NwIwRkrpWpw=;
	b=NbZZsqnDPuWXoWrLP8LYFaz4xTpXcomoZiobTYS2j3460E6jS+ky79x4HKffF/gWOb
	Bum7HG8N5k7i5SfoyLvKTcOkTE0acXK8jVr5onTdj76YtfQ4ASlK2DAZbcW5ArEGXu8u
	5APMkslvS+1vQeu7mGoQ0sVqb6oFgPLRrtlcG+FvQOD1ULMhUKiokR73dIoHP6nuLVdP
	p+lwdxxBa+RKyOLj5DOPWPmliUTxIXVIdNV87DkPXq9ClAwaOTwshPHKqLeyOniaJrRA
	CKAwyQmC3nRZ6WX5jrbqkuTp1J6HhzO+xjokdbN+YYjL2Qkqg2ZzYKxJArdLxD34iV2+
	nWsQ==
X-Gm-Message-State: AJaThX6GqYm/EN9iZWfuIR0B9xkYuybBcXAtpIqGmNPv4lewjzeflNkP
	AT7lQIpIt624363hIBY1o4uQRw==
X-Google-Smtp-Source: AGs4zMYrAaOXsRaStdD0aTmghPWC12qH8OJQLpNqzkLYAJPHO7LdAS22ca9WZhQqo6sv98+uxml41Q==
X-Received: by 10.159.231.22 with SMTP id w22mr8149691plq.125.1512191601893;
	Fri, 01 Dec 2017 21:13:21 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:21 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:56 -0800
Message-Id: <1512191576-2302-14-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 13/13] python[3]-flask-xstatic: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:22 -0000

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
index 0000000..d992f53
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "XStatic support for flask"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=659968f6ebd4b70b6c3190d20b4a924c"
+
+SRC_URI[md5sum] = "2f56023e1444c8bd1fec41afe93de743"
+SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381490133"
+
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


