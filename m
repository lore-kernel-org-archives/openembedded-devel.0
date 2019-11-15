Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 737B07FAB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:21:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i10so11823009wrs.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LIfIXw2oTT4KIu4q67cj+ucUAmTQ10okc2t67biypWo=;
	b=OMgANaSvAW9FIFpviXbFn3GnYtSrjoNlUesAvwoHnvIk9a99oraQtajg48ONDZEG2P
	SqExwOYkmdYbCR+2l/ubxxcIvscwI8G7qbX9OgGeSV4FNJFe89SFy6kIpPw09T4Sdn5+
	JvxTJ/j3KpWOL6Ih8Fe3FvNMMPVDjsbcMTh7ktqZwZ3CtAp0D0+Zq3rGwdZDm05S2C6M
	jl+SdvK16UE1/AuCGoaQi4K+z/SLHEdthM2vyDUkpROdBbNy6NFrdwR+QgYTzsqkbMc9
	u4vxg6yFgVFzF6UAfCf9j+hHFb37LQ+7gwAsTpeZYPWYHVotRj3JfeO/HgQSCUz61+Wq
	kEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LIfIXw2oTT4KIu4q67cj+ucUAmTQ10okc2t67biypWo=;
	b=r1BCczsLF3T339k4oqrRbBzc6rgpLJlHpAiCgKcncJ3Y9w0tzIklRrA1GS4Vydk3VM
	F9yjQpL8pOWGeBKbopjgJVeJ/i5a4X5f7fdhUmUVREEzuyrK5uPJRL/LFjP1rCwAhYUs
	ReYu3sCVjFSxUlXYcBiOhXTZzoNUHQx3PQCiBb2UwBkDTEhJ6DzqHBG6mxuma5sFdr+X
	YTVScxjq8nnrbUYd/e3J3/qtLPZV/VjDZOPvAjGmUTT2bB4xxgBqAEFxRx4l/xvj6wdw
	gJZ9TpCQwaTosRjvEV450rVA4k6NXZTpF9nJ0sdZ+7GUueCrJZ1eTSpBlxERXYyRguU5
	UIKw==
X-Gm-Message-State: APjAAAXzg21uEdVL9wMUoaGHvJTy/SH4QoPDsbVl3xsDpaxjO9kXiBRK
	waZojElRdRuSL1ZbtBw3c9gxPzo1AfE=
X-Google-Smtp-Source: APXvYqycvrmyehc9L3I23s4fjlBDdJQia5lIO4KQQhoW0e3hay50vfXysZ7ydpoNRhDVEU9k4eC6Mg==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr15459378wri.298.1573838471786;
	Fri, 15 Nov 2019 09:21:11 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x8sm9938666wmi.10.2019.11.15.09.21.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 09:21:11 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 17:20:25 +0000
Message-Id: <20191115172024.34819-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH v2] python-jsonschema: add PACKAGECONFIG format_nongpl
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
X-List-Received-Date: Fri, 15 Nov 2019 17:21:11 -0000
Content-Transfer-Encoding: 8bit

This is the backport of a patch upstream
- 10f8a3e Add format validators as separate modules

This will add a PACKAGECONFIG = "nongpl" option to include only dependencies
not licensed under the GPL license.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-jsonschema.inc              | 11 +++
 ...-setup.cfg-add-non-GPL-format-option.patch | 96 +++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index c1b11a2cc..837d5760c 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
+
+SRC_URI_append = " file://0001-setup.cfg-add-non-GPL-format-option.patch"
+
 SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
 SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
 
@@ -16,6 +20,13 @@ PACKAGECONFIG[format] = ",,,\
     ${PYTHON_PN}-rfc3987 \
     ${PYTHON_PN}-strict-rfc3339 \
 "
+PACKAGECONFIG[nongpl] = ",,,\
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
index 000000000..afc38a30b
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
+Upstream-status: Backported. [ to be removed for releases > 3.1.1 ]
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


