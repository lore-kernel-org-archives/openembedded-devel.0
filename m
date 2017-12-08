Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A78AF7867C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:29 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j124so6519938pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BBehXKTBH+bHr5iheBJlytZ/jiAkKgW4kG3SUQRmBVQ=;
	b=SbOqx3k0vTfFLdELa1bipkgoPuHpBbXcUyASSfFbljuaKkrNL0s3/qg2ioYDmpw+YS
	Bs2cQW88x695gpyrz/T3GyPrBjZlCQZuSESGSWOP/3LqtNpo/C1qd7V/YVVlnCbvNGlm
	KB07ZYxh1KIF37MTcMwnjTG0PQKLpX974K+LU8lDJ0WkqYYzMmBu0aGAZdVVM1M9hcnr
	2dp0Yw9l3lYH0p9Eh1dahONeg6AkCwJUKyhLnVrereKUv7J0qD/eZDczLJO24QUemSVz
	GP4a2gMenzqPitGx0LEeFwz2g0aNOVz1SHAxMcx1tCGazZo9T+eOoJZCe80E5vqH2iHd
	BQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BBehXKTBH+bHr5iheBJlytZ/jiAkKgW4kG3SUQRmBVQ=;
	b=T9bMEbiTJuc0F6s5zmqRuqYq+5EjjO0aQPoBiEC/eEPHariBEltpHpwaCL1euiopYI
	6IzPyxnzdjw5YMlvjFVKF29ElesbguwqIYeqeTKB9600mgthjrjl3ILf72SxcUvNXEcu
	OlmZCDscjVMCmhIGCxyI5yFqDADIGUG207uklO/qsUBxVOYS22bYzeHSh8jAdvjdLcWk
	a4RkHZr911xwmkJwRWFhxCnjji4MBAkG/dw+xlRUhDo461BVSJySkivrPpdXqdmyh6Wd
	xJHHAyPfhOHqrRgcvv+LlRo3cbv0sA4UTFyMgL4kggQUHZhNajRHvTV2UuooINPh1or1
	l4WA==
X-Gm-Message-State: AKGB3mKhXEqCA8CQ26S4cxmon+KD+KptWd8umCzr0g898k4ttiz0EDCN
	XHTn1dcgcOV3yvJAi08lfOB6Gg==
X-Google-Smtp-Source: AGs4zMZg8VVlYHyFXtPN/Uia55dcMiY2BFpSBGN8JjJBACJie4nUt1j1arCdUymROXCa9229aAcHKA==
X-Received: by 10.84.130.4 with SMTP id 4mr6594139plc.94.1512711990421;
	Thu, 07 Dec 2017 21:46:30 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:29 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:41 -0800
Message-Id: <20171208054548.26218-6-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 05/12] python-flask-sqlalchemy: move core of recipe to a .inc file
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:29 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-sqlalchemy.inc      | 10 ++++++++++
 .../recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb | 12 +-----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
new file mode 100644
index 0000000..e0efbc6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
+
+SRC_URI[md5sum] = "373ce61dfd03b593ad2eaba68c9fee35"
+SRC_URI[sha256sum] = "5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53"
+
+PYPI_PACKAGE = "Flask-SQLAlchemy"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
index 7650917..3dc355c 100644
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
@@ -1,12 +1,2 @@
-DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
-
-SRC_URI[md5sum] = "373ce61dfd03b593ad2eaba68c9fee35"
-SRC_URI[sha256sum] = "5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53"
-
-PYPI_PACKAGE = "Flask-SQLAlchemy"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
+require python-flask-sqlalchemy.inc
-- 
2.7.4


