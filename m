Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id DE4337736C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:41 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id i5so451532pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=athpzUIYUIa/tuAF1sPzwqzPD+AgqMIugW59y30fMt8=;
	b=nYAx+poPcd06vr78I/bBaFtmuN5T25Q6USm07FKfCO4+xvAaTIUOXSHEkO75MTmdR+
	9d5AKzK02Leh1YCadGih476+BBUyD95z/dHCV2NUwC0510KlL7mE6a4HZfmozQkLMrwJ
	0Iv1JKDCIlvowFKCO8USJmH0CGNZuz/Ll3i8sWW2NlWt2pbvTQAU55Uq4dFqXLmb0CLQ
	Ju0k1jw8p8WYN0T00tiolMYkqL2pMz18ohbQvTHDiRP4fdXh1+jeFrWxyvMLC57Vy5z8
	g4M0BynzIG6gF2Yos1xNkpuWF4K1cY2qLQtQkckXmy2y7ghimLuAJvB3NlOMW/zV8sv/
	mBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=athpzUIYUIa/tuAF1sPzwqzPD+AgqMIugW59y30fMt8=;
	b=sxL0aAgHrOSu7U8OrWYw3h7wrTzREhEdJWvUVvK6BCcQwBW6nB+FEQFXPHK+iyE6ei
	jq19k7CmKy/lnHVPFQ4/Xs26m0KaJLD0x1zry0h22RQ4CtnvNoIwSBVUmO0I1gWI9TYz
	VDbcf9KB5GQGCTi6lDWHUMFSX9mejTWstRLe+Y6DAd37H8i8vmi9y1SynF8rWxtrfMH/
	w8dxpCtgzx7zaYlCujoeUaM47zxtOkrU1Ce2XlSLPDev63DY3bQhSv9FbEnmj2N42VD3
	Ftb1lj6qdQrsSHMcHvosHxYn5835fZkQVOIE0sUE0E2l4vnvDL1e7J6v4poYmHLmBy5v
	mrpg==
X-Gm-Message-State: AN3rC/4iB2VVC4OSBYCT2dosl3XYgGNIth1NtWPbNY5ZAQP1jQGJlfVP
	qKxlJhJmeTW6PmMQ
X-Received: by 10.99.24.86 with SMTP id 22mr19314284pgy.238.1492539762788;
	Tue, 18 Apr 2017 11:22:42 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:42 -0700
Message-Id: <20170418182142.27253-32-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-python][ 32/32] python-lxml, python3-lxml: Fix libxslt format warnings
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:42 -0000

Found with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-lxml.etree-Add-empty-variadic-argument.patch | 40 ++++++++++++++++++++++
 .../recipes-devtools/python/python-lxml_3.7.3.bb   |  4 +++
 ...01-lxml.etree-Add-empty-variadic-argument.patch | 40 ++++++++++++++++++++++
 .../recipes-devtools/python/python3-lxml_3.7.3.bb  |  4 +++
 4 files changed, 88 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch

diff --git a/meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch b/meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
new file mode 100644
index 000000000..efaecd69c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
@@ -0,0 +1,40 @@
+From f8d2c3394767025b3b27b71248b3ecb50480cde7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Apr 2017 17:10:45 -0700
+Subject: [PATCH] lxml.etree: Add empty variadic argument
+
+format checker says that argument 4 is a printf formatted argument
+but there is no more arguments to follow
+
+Fixes libxslt format warnings
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lxml/lxml.etree.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lxml/lxml.etree.c b/src/lxml/lxml.etree.c
+index d482091..faab06c 100644
+--- a/src/lxml/lxml.etree.c
++++ b/src/lxml/lxml.etree.c
+@@ -186086,7 +186086,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
+  *         except:
+  */
+             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 228, __pyx_L18_except_error)
+-            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
++            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
+ 
+             /* "src/lxml/xsltext.pxi":229
+  *                 c_inst_node.name, _cstr(e))
+@@ -186136,7 +186136,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
+  *     except:
+  */
+             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 234, __pyx_L18_except_error)
+-            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
++            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
+ 
+             /* "src/lxml/xsltext.pxi":235
+  *                 "Error executing extension element '%s'", c_inst_node.name)
+-- 
+2.12.2
+
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.7.3.bb b/meta-python/recipes-devtools/python/python-lxml_3.7.3.bb
index 81ccb12d8..5c93a3f84 100644
--- a/meta-python/recipes-devtools/python/python-lxml_3.7.3.bb
+++ b/meta-python/recipes-devtools/python/python-lxml_3.7.3.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-lxml.inc
+
+SRC_URI = "${PYPI_SRC_URI} \
+           file://0001-lxml.etree-Add-empty-variadic-argument.patch \
+           "
diff --git a/meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch b/meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
new file mode 100644
index 000000000..bb012dc44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lxml/0001-lxml.etree-Add-empty-variadic-argument.patch
@@ -0,0 +1,40 @@
+From 36e64cf2f0676ee422c1fd41456967f3015b2fa3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Apr 2017 17:10:45 -0700
+Subject: [PATCH] lxml.etree: Add empty variadic argument
+
+format checker says that argument 4 is a printf formatted argument
+but there is no more arguments to follow
+
+Fixes libxslt format warnings
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lxml/lxml.etree.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lxml/lxml.etree.c b/src/lxml/lxml.etree.c
+index d482091..faab06c 100644
+--- a/src/lxml/lxml.etree.c
++++ b/src/lxml/lxml.etree.c
+@@ -186086,7 +186086,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
+  *         except:
+  */
+             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 228, __pyx_L18_except_error)
+-            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
++            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
+ 
+             /* "src/lxml/xsltext.pxi":229
+  *                 c_inst_node.name, _cstr(e))
+@@ -186136,7 +186136,7 @@ static void __pyx_f_4lxml_5etree__callExtensionElement(xsltTransformContext *__p
+  *     except:
+  */
+             __pyx_t_26 = __Pyx_PyObject_AsString(__pyx_v_message); if (unlikely((!__pyx_t_26) && PyErr_Occurred())) __PYX_ERR(19, 234, __pyx_L18_except_error)
+-            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26);
++            xsltTransformError(__pyx_v_c_ctxt, NULL, __pyx_v_c_inst_node, __pyx_t_26, "");
+ 
+             /* "src/lxml/xsltext.pxi":235
+  *                 "Error executing extension element '%s'", c_inst_node.name)
+-- 
+2.12.2
+
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb b/meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb
index ff4bc7faa..8b13d2dd2 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb
@@ -1,2 +1,6 @@
 inherit setuptools3
 require python-lxml.inc
+
+SRC_URI = "${PYPI_SRC_URI} \
+           file://0001-lxml.etree-Add-empty-variadic-argument.patch \
+           "
-- 
2.12.2


