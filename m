Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 578B4727DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:19:57 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so1461968wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2HGYLtpi3J4A/xOTzKw9f4HoDcIYOD6mcXk6k3Mj7AM=;
	b=wzLEJQnTv22IzCTv5kKpcWznr3VJD8FqSp7+F142eBCtY29nadRZyA/jNZMM0C8WFw
	DhaL9VX3Rk7g5LgY6gxzoYHRlCSpsUnereQXKc8qw/gRSl+Y5UthT0rqOzdiYDFk1Wds
	RjMGZYkB9Pdt6H7gAablv4uFY+ugvQ40db97vd/n787M5IVF9cQONTrfeiosWQdpZUwQ
	F2DnHDnPz0kJx3/cWWpU62UeSHO20IHr3vbmWj9PR5lb762luEyRpg+M/5rOfQlzAGgN
	Vp55k220xZokW0hMMgIv8Q4BqdjI47KVDe9zGi8hFuCMs947lxRhDflJdI+m+n1d4Af7
	KQMw==
X-Received: by 10.180.90.206 with SMTP id by14mr4611668wib.67.1418905196840;
	Thu, 18 Dec 2014 04:19:56 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jr4sm8750267wjc.20.2014.12.18.04.19.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:19:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:46 +0100
Message-Id: <1418905190-27541-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH 4/8] python-pep8: import from meta-openstack
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Dec 2014 12:19:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-pep8_1.4.6.bb   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pep8_1.4.6.bb

diff --git a/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb b/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb
new file mode 100644
index 0000000..b3c743e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb
@@ -0,0 +1,23 @@
+# Imported from git://git.yoctoproject.org/meta-cloud-services
+
+SUMMARY = "Python style guide checker"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=b0d37793ab91ca25ad5c200e9ea22331"
+
+SRCNAME = "pep8"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
+SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+    python-prettytable \
+    python-cmd2 \
+    python-pyparsing"
-- 
2.2.0


