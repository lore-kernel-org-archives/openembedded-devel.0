Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 716097FB3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:47:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a17so10638998wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LIfIXw2oTT4KIu4q67cj+ucUAmTQ10okc2t67biypWo=;
	b=Nsbm8T98+tTy3CrSwHuMlg/bQEZAlNbazzPCXIZNNFXOAMpxCkWqnS9Oa26KUYfm8l
	uP2Zg/vufZWKHrQDNv74JAyQL19YD1Nr+TcHtwkDX3s+dT43kRoxgxH5vqnYngbZcIUx
	ckconeSr1v3M6GPvRlHnGZ4dbSAt3lJ60TLTl+itZfwl0hJCvTpvx76Q3c2xoyeiLlyf
	WDun55fXoRNk3IdXG3COoGqL1VuPi6dzQiRzRAGfnVTDusoJFapHhzpNXN26JlHgyzCM
	NVVMDA0Vu32AuSf4MCQLH4q6sj0913OcWA9hrBZQRJQlLsbHyLRoGOl3bC6/JghHwc04
	pMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LIfIXw2oTT4KIu4q67cj+ucUAmTQ10okc2t67biypWo=;
	b=oCkD5eHvh7XMwiCo++jt1bpZE8/sh93HRKZIXRa0VIchIkip36YKfZfvTql6+dcoWk
	l1TMOqLoBB2e7afM8YMGkKj+L5q0e1QPQZt5L4Pk9yS32esQoGFW3GDlepkTcN4hI7QU
	kNici+DFgDDtP2gxgTrvoUKA+QwSDrGyYW4lQM4mVwIB8x2s9nE7+I588vhl9QXRihZq
	07pEICehJ3a9AjIGiR4okIND/LHAniXHTpi5xSgUTczx0FmlYMIEM5alcyUJK6lqzaC+
	Wh16cR45XQVTpEgaj08dkDR5LufZSXc7p+3X4MuybnJ0fbVpQ/2/AQyXqs6R8EWhZSPh
	UH3g==
X-Gm-Message-State: APjAAAXs1hMQmEkkSSSoDqEbR58n2aLCiZr/6jDJSkxU8AcHrPWxzPv4
	42OoTJEt4/Rax0ZpBcZKJd8NUpzcq7Q=
X-Google-Smtp-Source: APXvYqwRpLGHWdBW+zipR3L8egSm1mYFedaT79hhxhL0xp1BE+VUy9BE68e41DV3yisl8Hy3LtwV8w==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr15565574wmc.68.1573840020735;
	Fri, 15 Nov 2019 09:47:00 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w7sm11811908wru.62.2019.11.15.09.46.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 09:47:00 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 17:46:20 +0000
Message-Id: <20191115174618.39355-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115174618.39355-1-nick83ola@gmail.com>
References: <20191115174618.39355-1-nick83ola@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v3 2/2] python-jsonschema: add PACKAGECONFIG nongpl option
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
X-List-Received-Date: Fri, 15 Nov 2019 17:47:00 -0000
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


