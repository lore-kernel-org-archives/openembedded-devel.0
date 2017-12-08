Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5957868D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l24so6521960pfj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wB+EG5/nHJaisSV34mPVgO8R9Mn0RrwWK0fHLVDuqDI=;
	b=seP4nU644+pG+X5ApcbdfbzVI+6DLIJpo6sLZb5ti1FpGgCf5UJK2U5xeRx0tmyKR+
	NRTjTVEWy5mUCVP3AOiVSHR6AS/mvTPKBjX6Vfbu0Q7RkG+Tbutw9NXLWgoHomxlQkP3
	z3DMVMM52fDaSCpAdh/8eTsGGsv/RoEPKVA1bNfKF3yy4kcUUOGDLZJD02qElFVlI9Z3
	Pf8x+eJBdWYpX7nn0QD60LidLvPlDYY+rklc3IgMMRF85ECwYHuUar7AK/B53fYOGux4
	Av6SlF1h5C4wCPdNo1p97LMvE0ecDXxDhnVbmYT5xcl/VQUCh1u2lxorJNiaQuV56cMs
	uroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wB+EG5/nHJaisSV34mPVgO8R9Mn0RrwWK0fHLVDuqDI=;
	b=IrksRd5NM46VN14iLF9b7I0D2YUc28nvzDWeZy117Y8rxIPMXodlj0yg3A50w0soCX
	cHk7ALyMpxdjMuHHr1SpilG6PScU9+XN3H27Wap/s46hnpluSCiTLZF6aqyDbTLmoQI+
	XOoq0q+OvEi+GXBNSXJVxOeB2f0Iaq9XWIXRHhVE6JPuCMGvFxZJ7xxnzc+bOSPk4dS+
	ejfSKTJB0OEgt4DA1e2G9Z494xsKwErku/RViHFCghvQtEKVF/MgdvwjFNeHXnNk8QmL
	9IT4ZVb/NavVEZz1h+g3OMmlB8zEPHBI3LITVGBsFmd25IQYkfDOqESiXOxP/9GInNiv
	YtiQ==
X-Gm-Message-State: AKGB3mKqo2Bs6BmLQ+MMPCr5YeEPjo3VT5i/TOq5ztdx5Dd1zpNlDj6S
	mdsBP/XZZ6TJsbwpdnR+xI8utw==
X-Google-Smtp-Source: AGs4zMafd5+eYxFIF3Sg6uhWz8iI46FL+TtE8aQtyELo+AQsp5Vh+5dy/nNqNPpSqcL1C1KOl2ajqg==
X-Received: by 10.84.139.1 with SMTP id 1mr18095590plq.178.1512711995606;
	Thu, 07 Dec 2017 21:46:35 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:35 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:47 -0800
Message-Id: <20171208054548.26218-12-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 11/12] python-wtforms: move core of recipe to a .inc file
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:34 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-wtforms.inc | 16 ++++++++++++++++
 .../recipes-devtools/python/python-wtforms_2.1.bb      | 18 +-----------------
 2 files changed, 17 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-wtforms.inc

diff --git a/meta-python/recipes-devtools/python/python-wtforms.inc b/meta-python/recipes-devtools/python/python-wtforms.inc
new file mode 100644
index 0000000..916697f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-wtforms.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "A flexible forms validation and rendering library for python web development."
+HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c459accc90c6ed6a94878c8fe0535be2"
+
+SRC_URI[md5sum] = "6938a541fafd1a1ae2f6b9b88588eef2"
+SRC_URI[sha256sum] = "ffdf10bd1fa565b8233380cb77a304cd36fd55c73023e91d4b803c96bc11d46f"
+
+PYPI_PACKAGE = "WTForms"
+PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    "
diff --git a/meta-python/recipes-devtools/python/python-wtforms_2.1.bb b/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
index 5ddcb48..fdb015e 100644
--- a/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
+++ b/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
@@ -1,18 +1,2 @@
-DESCRIPTION = "A flexible forms validation and rendering library for python web development."
-HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c459accc90c6ed6a94878c8fe0535be2"
-
-SRC_URI[md5sum] = "6938a541fafd1a1ae2f6b9b88588eef2"
-SRC_URI[sha256sum] = "ffdf10bd1fa565b8233380cb77a304cd36fd55c73023e91d4b803c96bc11d46f"
-
-PYPI_PACKAGE = "WTForms"
-PYPI_PACKAGE_EXT = "zip"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    "
+require python-wtforms.inc
-- 
2.7.4


