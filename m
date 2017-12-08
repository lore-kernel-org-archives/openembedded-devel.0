Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 14E67785AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y6so6172000pgp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UstiTsEZLKhozOQnKBzLL8wayua4lN3eVilR1HMGZ4o=;
	b=cV/K1c+2nPh5+Zh+kru3wzpBOs9b7xMErkIlrpd72Qyvl8gpHvqvi80ELkknBv6iN+
	aN7uLjblRElJGPL+guRoK0i2zt/bRjb9BPM52RGEYH0gxZGdhkjacer1y6lk4rXm8J2m
	DNEhO50s3AWm6lN8IdtMi3HL1vDjKwIqTRIbWaGtm6KlIuMK3BpBiw/6xmqNcH7bHnqy
	Km2OX1iT+iRTthevwmTMiK34Za8u9hgLGyr8sjdzA4jzVK/NR+qBgIu4qqRnE6JiVqpV
	101K67rLPxqm5fObUcbARlgU06j5hx8pnAkDhZ+9ZsVP3LCm3yvCpsb2kuUJB1jfr+ud
	Hn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UstiTsEZLKhozOQnKBzLL8wayua4lN3eVilR1HMGZ4o=;
	b=AUBp03ns3Utg9TrPiaBixrzwKslhzbx922oHwgHJ/vyAvPGVxvuMyfJLc1yj0JfPl5
	4cAiQj0WYo5JtrNigKMgTFfgHsDZZhSMXhP4SRneasHuoMO6iUEuApUYmk7mC54kMbGK
	eiSkUkgIIpG5k+xQGYXQzlUWWVWvb7+uqm3CyfoLcipyrCM+7NOJ1RgZQ8qRUY0Eso6Z
	68h9+wGa5cT2/cp+LLSslmA/OYF/ccktSQzo17PQystcTf1HUp4Q3b6pFP5VoEqK71NE
	ehdoXW1glm0F0YWnsuIX210f+pE0UR7TeImXMd3u/X7c63spaEGquo0HTafs67q7K4If
	mJ4A==
X-Gm-Message-State: AJaThX5DuJrXOY1wnqqOM3topw85jazH5IgoKmrvaEV1oGshWMmGmCf4
	Nc9L0AM7TXBA6X7NjX1ISKpULA==
X-Google-Smtp-Source: AGs4zMYfLmrOdicPpfdxmKAbvrU6lbc0ww+HOYF9xwaIeBI0D0m7Q14XvotuIPZZw4OLOh8wLh8d6w==
X-Received: by 10.84.244.193 with SMTP id f1mr29396267plt.32.1512711988590;
	Thu, 07 Dec 2017 21:46:28 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:27 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:39 -0800
Message-Id: <20171208054548.26218-4-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 03/12] python-flask-bootstrap: move core of recipe to a .inc file
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:28 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-bootstrap.inc   | 14 ++++++++++++++
 .../python/python-flask-bootstrap_3.3.7.1.bb             | 16 +---------------
 2 files changed, 15 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
new file mode 100644
index 0000000..0723b97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
+
+SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
+SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
+
+PYPI_PACKAGE = "Flask-Bootstrap"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dominate \
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-visitor \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
index 2b2a6f9..eeaade9 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
-
-SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
-SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
-
-PYPI_PACKAGE = "Flask-Bootstrap"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-dominate \
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-visitor \
-    "
+require python-flask-bootstrap.inc
-- 
2.7.4


