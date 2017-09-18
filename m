Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2254D7823F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:58:40 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id r141so1829290qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vICr6DUYLQkZ0oLAco/GaQEja6dbNlly8qVQNujJkKs=;
	b=DhG90kWV6nbjCLz2AeQTNATfHABMPgsFcSr/8RoZ+L0kOJCjAslii41uIKZhc/z5dd
	GSswI3awin/3CKTQpoHDtwdMbwl84f7Q3KxFODUAu3tCzb2pvS+snS1+m9jYSjYsuxmG
	5RiSWZxAGntTRLRf9DxIAODQknFTe+1hK2hTjMAy/MaPqiMv23okB4RDhKUk5hfTMTPd
	F/OmoQKn9tnRh6nlFnXO3ilMfd3AtK+2Gtgkzi2Mzh4GIZlMi1a2H33rJtSrtp+RWCSO
	DoTaLxcqqUVGgZyL2Nmpaz8cMt+JPQmWlTPpE4BcKBItnoQ9/+p4RBoC21+U8zbBudmv
	JXBw==
X-Gm-Message-State: AHPjjUh2mNGnjBruHxdbhJf1DV1qVEB23j4I7y96aCgZ3smXZOVSG3jo
	q6m7OJyw1KVRvXo4NOo=
X-Google-Smtp-Source: AOwi7QDszwpz1TIb5DL1fi56xSWbgn/ESv3XsvwC8ULHxKi3hDADZMqjb/o6icr0IGsEQydWAYALog==
X-Received: by 10.55.162.131 with SMTP id l125mr20807007qke.29.1505768321496; 
	Mon, 18 Sep 2017 13:58:41 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	f69sm5822820qke.27.2017.09.18.13.58.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 13:58:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:58:33 -0400
Message-Id: <1505768313-6263-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.0.0
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
X-List-Received-Date: Mon, 18 Sep 2017 20:58:41 -0000

remove obsolete patch

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-lxml.inc        |  4 +--
 ...01-lxml.etree-Add-empty-variadic-argument.patch | 40 ----------------------
 .../recipes-devtools/python/python-lxml_3.8.0.bb   |  6 ----
 .../recipes-devtools/python/python-lxml_4.0.0.bb   |  2 ++
 ...01-lxml.etree-Add-empty-variadic-argument.patch | 40 ----------------------
 .../recipes-devtools/python/python3-lxml_3.8.0.bb  |  6 ----
 .../recipes-devtools/python/python3-lxml_4.0.0.bb  |  2 ++
 7 files changed, 6 insertions(+), 94 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-lxml_3.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-lxml_4.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-lxml_3.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml_4.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index c6ff160..04abe46 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "e54e2fae44d684d6b9c636fe189e93ff"
-SRC_URI[sha256sum] = "736f72be15caad8116891eb6aa4a078b590d231fdc63818c40c21624ac71db96"
+SRC_URI[md5sum] = "c30d7e752cc909c1c0c40bd34153443a"
+SRC_URI[sha256sum] = "f7bc9f702500e205b1560d620f14015fec76dcd6f9e889a946a2ddcc3c344fd0"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch b/meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
deleted file mode 100644
index efaecd6..0000000
--- a/meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f8d2c3394767025b3b27b71248b3ecb50480cde7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Apr 2017 17:10:45 -0700
-Subject: [PATCH] lxml.etree: Add empty variadic argument
-
-format checker says that argument 4 is a printf formatted argument
-but there is no more arguments to follow
-
-Fixes libxslt format warnings
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lxml/lxml.etree.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/lxml/lxml.etree.c b/src/lxml/lxml.etree.c
-index d482091..faab06c 100644
---- a/src/lxml/lxml.etree.c
-+++ b/src/lxml/lxml.etree.c
-@@ -186086,7 +186086,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
-  *         except:
-  */
-             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 228, __pyx_L18_except_error)
--            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
-+            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
- 
-             /* "src/lxml/xsltext.pxi":229
-  *                 c_inst_node.name, _cstr(e))
-@@ -186136,7 +186136,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
-  *     except:
-  */
-             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 234, __pyx_L18_except_error)
--            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
-+            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
- 
-             /* "src/lxml/xsltext.pxi":235
-  *                 "Error executing extension element '%s'", c_inst_node.name)
--- 
-2.12.2
-
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.8.0.bb b/meta-python/recipes-devtools/python/python-lxml_3.8.0.bb
deleted file mode 100644
index 5c93a3f..0000000
--- a/meta-python/recipes-devtools/python/python-lxml_3.8.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-lxml.inc
-
-SRC_URI = "${PYPI_SRC_URI} \
-           file://0001-lxml.etree-Add-empty-variadic-argument.patch \
-           "
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.0.0.bb b/meta-python/recipes-devtools/python/python-lxml_4.0.0.bb
new file mode 100644
index 0000000..81ccb12
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lxml_4.0.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-lxml.inc
diff --git a/meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch b/meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
deleted file mode 100644
index bb012dc..0000000
--- a/meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 36e64cf2f0676ee422c1fd41456967f3015b2fa3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Apr 2017 17:10:45 -0700
-Subject: [PATCH] lxml.etree: Add empty variadic argument
-
-format checker says that argument 4 is a printf formatted argument
-but there is no more arguments to follow
-
-Fixes libxslt format warnings
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lxml/lxml.etree.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/lxml/lxml.etree.c b/src/lxml/lxml.etree.c
-index d482091..faab06c 100644
---- a/src/lxml/lxml.etree.c
-+++ b/src/lxml/lxml.etree.c
-@@ -186086,7 +186086,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
-  *         except:
-  */
-             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 228, __pyx_L18_except_error)
--            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
-+            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
- 
-             /* "src/lxml/xsltext.pxi":229
-  *                 c_inst_node.name, _cstr(e))
-@@ -186136,7 +186136,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
-  *     except:
-  */
-             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 234, __pyx_L18_except_error)
--            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
-+            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
- 
-             /* "src/lxml/xsltext.pxi":235
-  *                 "Error executing extension element '%s'", c_inst_node.name)
--- 
-2.12.2
-
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.8.0.bb b/meta-python/recipes-devtools/python/python3-lxml_3.8.0.bb
deleted file mode 100644
index 8b13d2d..0000000
--- a/meta-python/recipes-devtools/python/python3-lxml_3.8.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools3
-require python-lxml.inc
-
-SRC_URI = "${PYPI_SRC_URI} \
-           file://0001-lxml.etree-Add-empty-variadic-argument.patch \
-           "
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.0.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.0.0.bb
new file mode 100644
index 0000000..ff4bc7f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.0.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-lxml.inc
-- 
2.7.4


