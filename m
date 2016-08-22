Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 43702738AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:37 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so5560476qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ZD7ccvawY7WmCXMHRYxDuEfIq8bePFVLuAlTS3eu0Q8=;
	b=H6ylpRfimlPPgBsvscs+yIHkjGVFM4/0z5ydAVh3CUAG0AQ9oNtCG2rBcE8tIW035F
	6/8FJGYRD3zYhgw6ADmCrHbOHA4E/z2NY1scSn68Zd89O+anasFnYr5RaaBxlozzWF8X
	QICZOoV6b+m4v0VSjjxq6YwQfcIsP2eGPy9D2zuzn2Oqc3yqxQiSiDia/aYf/VvWjxmx
	/aJAEJ6+Y9C1AAuonCSxOmGFtOH+Jz91pOOdeL3MheOkKWLyf798SC24CALO/n57D1pj
	16TAxFkkA9J1nNZ//iPzx8lCbCtpB7/MbAUXul1C9OL+K8o99wyDKFpoLpob3FBZMN1S
	SXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ZD7ccvawY7WmCXMHRYxDuEfIq8bePFVLuAlTS3eu0Q8=;
	b=AM0JfrA2gv1UsNWj4CtrXYXnBvdwzZJVTFTgwhzxtJZs4d53f/+YaP6l47xoghxSM+
	Ps2GDkVFPT1Vwga7f6yxg86OaHFow/UKnTVWxBAl8x2J907a6GBY2ACLARs9sEORmODO
	E/mvd9oH4hl5L535DT6n3Cu1aN4CD7tJy8J07k15KNgdmyoK5nCdoU2VSDE2S9O0Z4R0
	ZBSDwONRG/iqfL108NVn8QtsQtBrAqOHN42mb/2Tdbfv1lLdFuum8aOOzHOQ7mW482Ju
	a3D7DPHndjFGfF7htkZX47wSlkQ4F49WN5Vz+Oc2fzzPs4qRr2if3HzHqsnITon2nxX0
	SwOQ==
X-Gm-Message-State: AEkooutMxrO728M+GeRtRPbD3yP0lEfhWABCWEZdSp++IorpwJ+NTSMP1CwhUNo5QQPtLQ==
X-Received: by 10.233.237.75 with SMTP id c72mr24772789qkg.162.1471892617637; 
	Mon, 22 Aug 2016 12:03:37 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:36 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:30 -0300
Message-Id: <1471892491-6177-16-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 16/17] python-ndg-httpsclient, python3-ndg-httpsclient: Add recipe for version 0.4.2
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:37 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/python-ndg-httpsclient.inc                 | 19 +++++++++++++++++++
 .../python/python-ndg-httpsclient_0.4.2.bb            |  2 ++
 .../python/python3-ndg-httpsclient_0.4.2.bb           |  2 ++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
 create mode 100644 meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
new file mode 100644
index 0000000..ae2bca1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
+HOMEPAGE = "http://python-requests.org"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
+
+SRC_URI[md5sum] = "b3a958c0e9aaf4d3f8dd933f46f8c1a9"
+SRC_URI[sha256sum] = "580987ef194334c50389e0d7de885fccf15605c13c6eecaabd8d6c43768eb8ac"
+
+PYPI_PACKAGE = "ndg_httpsclient"
+
+DEPENDS = " \
+    ${PYTHON_PN}-pyopenssl \
+"
+
+DEPENDS = " \
+    ${PYTHON_PN}-pyasn1 \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb
new file mode 100644
index 0000000..2da1112
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-ndg-httpsclient.inc
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
new file mode 100644
index 0000000..3f07b2e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-ndg-httpsclient.inc
-- 
2.1.4


