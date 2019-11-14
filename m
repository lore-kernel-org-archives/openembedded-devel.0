Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8105D7F74B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 20:29:50 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id l20so6506077oie.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 12:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=iTTonewRpVyWpwulrIOpIHtNS8bK88FiEPbjGXponmA=;
	b=UmR+4mgxcdDih9b7XC2peonwm6hxtYh/y9R9JIADcM5SVuJK85pdn2eExotzmIgnoP
	iQtnJGzwmaoQeLnL3auruJ5XDBIozAjkxqhMx0LKMGTVQdgdoHLg6YrqvjWLAMth6QWT
	frdFTc5k82i0Vz6o+WW4CprXoJ8zNEEBnKVfU+NaVEkWFSupZe3we1BYlekPt8KLVJeV
	q/hTH2DlhPsNdZlDWyRxpR0SiGcZf4rztrTu6WxOjuvFAXk9DE113DoANz2ItkxrKqTt
	tjRUo6QYiz4ro3UWGvylxVGVx7wUQav1qsg39JOry19fvBOBnndQwIuIsxTIti/4EZtt
	PeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iTTonewRpVyWpwulrIOpIHtNS8bK88FiEPbjGXponmA=;
	b=r0Fup9zrKJsREkNyPd3+acaDuYG0KP9wu0fvmuAsj26o/wLf9DMD1RMkaEm9c9wUI+
	aBVxyaDvpuWacRlP3YjTx6j1Um3S13BQ5ITo3BgVGYeIc2FJCzk/f3dF+mvhJ/dxC1Ja
	PqcJozcStL/IVPh+bWr0a8e+22l/qp8MZKj9O1PjMWYkvN4aLczOlrLfQoeFENKaWiOf
	Cxzm4YjmId45/leC0HNZs9pD1n5vR2p9KUiT3IaBUAA9+W+OOcFJ9ZHGAYSRgsYXODFc
	3DgHR9Nsg970n0h+RacJOyMFDXjZRSB2TzvLwm6J0iA+u6F9XwGmZLzYoLOXuIdMQNAm
	N28w==
X-Gm-Message-State: APjAAAUHD85ott679Qbt+SRQVWvxphlgx40CNFZDG/QBfjdP7THgbbVB
	eph+GxyeCPgh3u1tYDtRbzMYZm86T6A=
X-Google-Smtp-Source: APXvYqxp5mGtUIfqfq9lW7ickK7G7vUeqeVem5N232YK19Qd7rACcPJsENqgzagyisMgj7ivj9iRBQ==
X-Received: by 2002:aca:ea57:: with SMTP id i84mr4860416oih.73.1573763390971; 
	Thu, 14 Nov 2019 12:29:50 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 62sm2149130otq.78.2019.11.14.12.29.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 12:29:50 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:28:01 +0000
Message-Id: <20191114202759.26789-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114202759.26789-1-nick83ola@gmail.com>
References: <20191114202759.26789-1-nick83ola@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python-jsonschema: add PACKAGECONFIG format_nongpl
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
X-List-Received-Date: Thu, 14 Nov 2019 20:29:50 -0000
Content-Transfer-Encoding: 8bit

This is the backport of a patch upstream
- 10f8a3e Add format validators as separate modules

that add an option permit to use validator that don't contain GPLv3 code.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-jsonschema.inc              | 12 +++
 ...-setup.cfg-add-non-GPL-format-option.patch | 96 +++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index df41f06a2..9b81b7ad4 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -6,10 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
 DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 PR = "r1"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
+
+SRC_URI_append = " file://0001-setup.cfg-add-non-GPL-format-option.patch"
+
 SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
 SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
 
 PACKAGECONFIG ??= "format"
+# PACKAGECONFIG ??= "format_nongpl"
 PACKAGECONFIG[format] = ",,,\
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-jsonpointer \
@@ -17,6 +22,13 @@ PACKAGECONFIG[format] = ",,,\
     ${PYTHON_PN}-rfc3987 \
     ${PYTHON_PN}-strict-rfc3339 \
 "
+PACKAGECONFIG[format_nongpl] = ",,,\
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-webcolors \
+    ${PYTHON_PN}-rfc3986-validator \
+    ${PYTHON_PN}-rfc3339-validator \
+"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-attrs \
diff --git a/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch b/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
new file mode 100644
index 000000000..96fd48447
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
@@ -0,0 +1,96 @@
+From 8df0332475991884b8e1801d31f9c3e06d06bf9f Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nick83ola@gmail.com>
+Date: Thu, 14 Nov 2019 18:58:56 +0000
+Subject: [PATCH] setup.cfg: add non GPL format option
+
+This is a rewrite of the following upstream commits:
+
+ - 10f8a3e Add format validators as separate modules
+ - af37707 non GPL format option
+
+removing all the non necessary bits (tox in particular)
+
+Original author: Nicolas Aimetti <naimetti@yahoo.com.ar>
+
+Upstream-status: Invalid.
+---
+ jsonschema/_format.py | 33 ++++++++++++++++++++++++++++-----
+ setup.cfg             |  6 ++++++
+ 2 files changed, 34 insertions(+), 5 deletions(-)
+
+diff --git a/jsonschema/_format.py b/jsonschema/_format.py
+index aa04090..c967d98 100644
+--- a/jsonschema/_format.py
++++ b/jsonschema/_format.py
+@@ -248,7 +248,26 @@ else:
+ try:
+     import rfc3987
+ except ImportError:
+-    pass
++    try:
++        from rfc3986_validator import validate_rfc3986
++    except ImportError:
++        pass
++    else:
++        @_checks_drafts(name="uri",)
++        def is_uri(instance):
++            if not isinstance(instance, str_types):
++                return True
++            return validate_rfc3986(instance, rule="URI")
++
++        @_checks_drafts(
++            draft6="uri-reference",
++            draft7="uri-reference",
++            raises=ValueError,
++        )
++        def is_uri_reference(instance):
++            if not isinstance(instance, str_types):
++                return True
++            return validate_rfc3986(instance, rule="URI_reference")
+ else:
+     @_checks_drafts(draft7="iri", raises=ValueError)
+     def is_iri(instance):
+@@ -280,15 +299,19 @@ else:
+ 
+ 
+ try:
+-    import strict_rfc3339
++    from strict_rfc3339 import validate_rfc3339
+ except ImportError:
+-    pass
+-else:
++    try:
++        from rfc3339_validator import validate_rfc3339
++    except ImportError:
++        validate_rfc3339 = None
++
++if validate_rfc3339:
+     @_checks_drafts(name="date-time")
+     def is_datetime(instance):
+         if not isinstance(instance, str_types):
+             return True
+-        return strict_rfc3339.validate_rfc3339(instance)
++        return validate_rfc3339(instance)
+ 
+     @_checks_drafts(draft7="time")
+     def is_time(instance):
+diff --git a/setup.cfg b/setup.cfg
+index 74bc4a7..878221c 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -40,6 +40,12 @@ format =
+ 	rfc3987
+ 	strict-rfc3339
+ 	webcolors
++format_nongpl =
++	idna
++	jsonpointer>1.13
++	webcolors
++	rfc3986-validator>0.1.0
++	rfc3339-validator
+ 
+ [options.entry_points]
+ console_scripts = 
+-- 
+2.20.1
+
-- 
2.20.1


