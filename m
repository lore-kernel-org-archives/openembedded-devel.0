Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 64D3072FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:14:17 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n37so2518328qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LtQLNIfPbGjjgeu/CY6d0T0EijfxGjr6kVsgvFcZEmg=;
	b=b4FxoHTCa+IF9y4azM8im9xjG3wUNOW9Riam1vqBJNPH6T0VJ8vj5M0sNvjX9/0aD5
	KoHEtBC3RYch82m+taSFIsQ7wuWkEJKOp3eFdsMSFsuCuGdExd7qu+nnnGuALTX0t0bx
	fvIWoPBivSItGMxvX3wfxlp+QNh1X55qX0YhPr55w5JNT6yJFV7BVvCuRyEtI8mySMIX
	SIHMO0qKShS+rJhEE3UZpbK+EKUQVu5fNkeUYtQtdsmR/JxjP5IUVp8O5KIDwdnKHDJB
	1gC9yB+o35LV7zuzrUf2cnLTj13isILQ5+IZfoAuxPKCGufRWDNG57hrm1Rwme3T740Y
	1EtA==
X-Gm-Message-State: AMke39lf2tootMH0A1luq9SyTfopUuDk3ZRLtZkNgdlrg2pSg/sAUN9oqbJqx8xRVEL9RA==
X-Received: by 10.200.50.231 with SMTP id a36mr17150284qtb.156.1487808859364; 
	Wed, 22 Feb 2017 16:14:19 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j14sm1716046qkh.11.2017.02.22.16.14.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:14:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:14:11 -0500
Message-Id: <1487808851-26000-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-jinja2: update to version 2.9.5
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
X-List-Received-Date: Thu, 23 Feb 2017 00:14:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jinja2.inc              | 7 ++++---
 .../python/{python-jinja2_2.8.bb => python-jinja2_2.9.5.bb}        | 0
 meta-python/recipes-devtools/python/python3-jinja2_2.8.bb          | 2 --
 meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb        | 7 +++++++
 4 files changed, 11 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jinja2_2.8.bb => python-jinja2_2.9.5.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index c3ed6de..cf8010e 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -4,11 +4,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
 PYPI_PACKAGE = "Jinja2"
 
-SRC_URI[md5sum] = "edb51693fe22c53cee5403775c71a99e"
-SRC_URI[sha256sum] = "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4"
+SRC_URI[md5sum] = "9e55f0db6620dd99a1b366183a94270d"
+SRC_URI[sha256sum] = "702a24d992f856fa8d5a7a36db6128198d0c21e1da34448ca236c42e92384825"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-textutils \
-    ${PYTHON_PN}-lang ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe"
+    ${PYTHON_PN}-lang ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
+    ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
 
 CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python-jinja2_2.9.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jinja2_2.8.bb
rename to meta-python/recipes-devtools/python/python-jinja2_2.9.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
deleted file mode 100644
index 61156b6..0000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-jinja2.inc
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb
new file mode 100644
index 0000000..8375f8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.9.5.bb
@@ -0,0 +1,7 @@
+inherit pypi setuptools3
+require python-jinja2.inc
+
+# Requires _pydecimal which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+"
-- 
2.7.4


