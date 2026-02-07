Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39A2EE0AC8
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:10 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2679.1770460450229671095
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ISOYq0JD;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43626796202so2031637f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460448; x=1771065248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBu6RJ+CQHrfcvtyH2TUqdnk37pG48gaHUurRr8+BaQ=;
        b=ISOYq0JDivJ5ktQkd+HOhkivl+Kp4e0h2QQxsHvv/2mznMXH1vd2TEiCVkBlk/F9Mi
         2uXeLcQYBmMBxHDj8SIo8cRqj1q+Pv2A4IQUg6oj4Nkd8GmwjHG0UT7djtl33mP4/ceL
         iEdpgjMTPSnkVhBLfzj9vOcrfd7x+5HA0Idge68EwGWGMIKujEiO0p5ReOYQZ66HbcFx
         p9NAaOnN/DNEVVqKjptXruCIHJzUVQTN3o5zBy9MEg5uWKxl0vZmMiOMUxVOM+escWYy
         8mUYwTK1DWVscdnFMQnR4bjM7GWDEU8ufiqPAjGMi3iskFvsrj9AwqW9HDOY7ddlwH8P
         NEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460448; x=1771065248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PBu6RJ+CQHrfcvtyH2TUqdnk37pG48gaHUurRr8+BaQ=;
        b=A3cmDYKtCpk+MVI9lY3eUN9SwWF81CuAwkOK35JCkVopVM2XNMi2KfFhMsmofZIepa
         f4lknizgV9kE4KF1uSAC+ZBKjAfXrzKtKd8g+n1LHZ/fF7ImKqMbzzyout4BoQJqFb6c
         ShTfk8Yv6ESRSEyM6JCtYiGQmY6p4mrIvwI0UcFTTjvM0YetSq5LPc1HZr2wmRk/1BRN
         ffddhmu6URSvQixV5PZfRLJ+cKQpk4nUwq5CXI3cNV9p5lm87pdBq8fAcBncAJ1lUZhm
         L48lF9Wx9FuMzQ8Vw61GLzsTdzWQeitwe2+n5wGIgbRs2ywlYNl9OBr47wBmIBSQuCOy
         Gygw==
X-Gm-Message-State: AOJu0YxLejN08ZbZ+okOlT/woTIqJtRVvIN2dCsnSqWt7Khz79Jp9/MY
	zfqNmx6JCiCl0isZZfOCwoN87PR4TFGepWejENKmbnPu+FhMAtvrBa6HiFdKhw==
X-Gm-Gg: AZuq6aJtoTA/bz88maP+gdjeFSuNV1RfyX6ZE0ZVQhy8vYS1T3aeK7Rey+68LsE9WaJ
	6+uMXRGVAI262tQp+MBWJ0jlh4zzOV52xUeqRWXz9Pxs+tmPyccrnUka2qBBcTgnHYAX0FA+ZOB
	ExG+pnRDMz3iHQ84Q5S7bpVuNqHrldeLdnY2GVgrHl1u1+UU4AqSNtccarCt/6U2I1ExkrJFv2d
	1dXYbV55K4Rf0is3AcPDzYJQF6UMdK7s5w2KKA3L/5w7xqJ8i5kV7N6H06FXskP7lBhOgr75TGf
	fu05V85KUCe18AOBWynWbVgsxcfWwfARibJtZQ5+OY0fPIgEyeiyZKJl8xTzCdh6n46OaY2tlkh
	a6XRSarObfUAsvhpFdKFM9IGYLrXCeiNBXL0rXyrGLDhIQk10VzqfpxkpbJ+QoPVW49MgJVbipV
	iC25gEEE5E
X-Received: by 2002:a05:6000:2583:b0:430:fdfc:7dd3 with SMTP id ffacd0b85a97d-4362937bd01mr8387380f8f.50.1770460448360;
        Sat, 07 Feb 2026 02:34:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 11/15] python3-django: patch CVE-2025-64460
Date: Sat,  7 Feb 2026 11:33:53 +0100
Message-ID: <20260207103359.4177243-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124252

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64460

Backport the patch that explicitly references this CVE in its
commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../CVE-2025-64460.patch                      | 199 ++++++++++++++++++
 .../python/python3-django_5.0.14.bb           |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64460.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64460.patch b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64460.patch
new file mode 100644
index 0000000000..c7a2928536
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64460.patch
@@ -0,0 +1,199 @@
+From f8fd8a25e04e2b6601fc9cdb69dea41db7b4ff18 Mon Sep 17 00:00:00 2001
+From: Shai Berger <shai@platonix.com>
+Date: Sat, 11 Oct 2025 21:42:56 +0300
+Subject: [PATCH] Fixed CVE-2025-64460 -- Corrected quadratic inner text
+ accumulation in XML serializer.
+
+Previously, `getInnerText()` recursively used `list.extend()` on strings,
+which added each character from child nodes as a separate list element.
+On deeply nested XML content, this caused the overall deserialization
+work to grow quadratically with input size, potentially allowing
+disproportionate CPU consumption for crafted XML.
+
+The fix separates collection of inner texts from joining them, so that
+each subtree is joined only once, reducing the complexity to linear in
+the size of the input. These changes also include a mitigation for a
+xml.dom.minidom performance issue.
+
+Thanks Seokchan Yoon (https://ch4n3.kr/) for report.
+
+Co-authored-by: Jacob Walls <jacobtylerwalls@gmail.com>
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+
+Backport of 50efb718b31333051bc2dcb06911b8fa1358c98c from main.
+
+CVE: CVE-2025-64460
+Upstream-Status: Backport [https://github.com/django/django/commit/0db9ea4669312f1f4973e09f4bca06ab9c1ec74b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ django/core/serializers/xml_serializer.py | 39 +++++++++++++---
+ docs/topics/serialization.txt             |  2 +
+ tests/serializers/test_xml.py             | 55 ++++++++++++++++++++++-
+ 3 files changed, 89 insertions(+), 7 deletions(-)
+
+diff --git a/django/core/serializers/xml_serializer.py b/django/core/serializers/xml_serializer.py
+index 16b6977..b2837bc 100644
+--- a/django/core/serializers/xml_serializer.py
++++ b/django/core/serializers/xml_serializer.py
+@@ -3,7 +3,8 @@ XML serializer.
+ """
+ 
+ import json
+-from xml.dom import pulldom
++from contextlib import contextmanager
++from xml.dom import minidom, pulldom
+ from xml.sax import handler
+ from xml.sax.expatreader import ExpatParser as _ExpatParser
+ 
+@@ -15,6 +16,25 @@ from django.db import DEFAULT_DB_ALIAS, models
+ from django.utils.xmlutils import SimplerXMLGenerator, UnserializableContentError
+ 
+ 
++@contextmanager
++def fast_cache_clearing():
++    """Workaround for performance issues in minidom document checks.
++
++    Speeds up repeated DOM operations by skipping unnecessary full traversal
++    of the DOM tree.
++    """
++    module_helper_was_lambda = False
++    if original_fn := getattr(minidom, "_in_document", None):
++        module_helper_was_lambda = original_fn.__name__ == "<lambda>"
++        if not module_helper_was_lambda:
++            minidom._in_document = lambda node: bool(node.ownerDocument)
++    try:
++        yield
++    finally:
++        if original_fn and not module_helper_was_lambda:
++            minidom._in_document = original_fn
++
++
+ class Serializer(base.Serializer):
+     """Serialize a QuerySet to XML."""
+ 
+@@ -209,7 +229,8 @@ class Deserializer(base.Deserializer):
+     def __next__(self):
+         for event, node in self.event_stream:
+             if event == "START_ELEMENT" and node.nodeName == "object":
+-                self.event_stream.expandNode(node)
++                with fast_cache_clearing():
++                    self.event_stream.expandNode(node)
+                 return self._handle_object(node)
+         raise StopIteration
+ 
+@@ -393,19 +414,25 @@ class Deserializer(base.Deserializer):
+ 
+ def getInnerText(node):
+     """Get all the inner text of a DOM node (recursively)."""
++    inner_text_list = getInnerTextList(node)
++    return "".join(inner_text_list)
++
++
++def getInnerTextList(node):
++    """Return a list of the inner texts of a DOM node (recursively)."""
+     # inspired by https://mail.python.org/pipermail/xml-sig/2005-March/011022.html
+-    inner_text = []
++    result = []
+     for child in node.childNodes:
+         if (
+             child.nodeType == child.TEXT_NODE
+             or child.nodeType == child.CDATA_SECTION_NODE
+         ):
+-            inner_text.append(child.data)
++            result.append(child.data)
+         elif child.nodeType == child.ELEMENT_NODE:
+-            inner_text.extend(getInnerText(child))
++            result.extend(getInnerTextList(child))
+         else:
+             pass
+-    return "".join(inner_text)
++    return result
+ 
+ 
+ # Below code based on Christian Heimes' defusedxml
+diff --git a/docs/topics/serialization.txt b/docs/topics/serialization.txt
+index 0bb5764..dc403ca 100644
+--- a/docs/topics/serialization.txt
++++ b/docs/topics/serialization.txt
+@@ -173,6 +173,8 @@ Identifier  Information
+ .. _jsonl: https://jsonlines.org/
+ .. _PyYAML: https://pyyaml.org/
+ 
++.. _serialization-formats-xml:
++
+ XML
+ ---
+ 
+diff --git a/tests/serializers/test_xml.py b/tests/serializers/test_xml.py
+index c9df2f2..03462cf 100644
+--- a/tests/serializers/test_xml.py
++++ b/tests/serializers/test_xml.py
+@@ -1,7 +1,10 @@
++import gc
++import time
+ from xml.dom import minidom
+ 
+ from django.core import serializers
+-from django.core.serializers.xml_serializer import DTDForbidden
++from django.core.serializers.xml_serializer import Deserializer, DTDForbidden
++from django.db import models
+ from django.test import TestCase, TransactionTestCase
+ 
+ from .tests import SerializersTestBase, SerializersTransactionTestBase
+@@ -90,6 +93,56 @@ class XmlSerializerTestCase(SerializersTestBase, TestCase):
+         with self.assertRaises(DTDForbidden):
+             next(serializers.deserialize("xml", xml))
+ 
++    def test_crafted_xml_performance(self):
++        """The time to process invalid inputs is not quadratic."""
++
++        def build_crafted_xml(depth, leaf_text_len):
++            nested_open = "<nested>" * depth
++            nested_close = "</nested>" * depth
++            leaf = "x" * leaf_text_len
++            field_content = f"{nested_open}{leaf}{nested_close}"
++            return f"""
++                <django-objects version="1.0">
++                   <object model="contenttypes.contenttype" pk="1">
++                      <field name="app_label">{field_content}</field>
++                      <field name="model">m</field>
++                   </object>
++                </django-objects>
++            """
++
++        def deserialize(crafted_xml):
++            iterator = Deserializer(crafted_xml)
++            gc.collect()
++
++            start_time = time.perf_counter()
++            result = list(iterator)
++            end_time = time.perf_counter()
++
++            self.assertEqual(len(result), 1)
++            self.assertIsInstance(result[0].object, models.Model)
++            return end_time - start_time
++
++        def assertFactor(label, params, factor=2):
++            factors = []
++            prev_time = None
++            for depth, length in params:
++                crafted_xml = build_crafted_xml(depth, length)
++                elapsed = deserialize(crafted_xml)
++                if prev_time is not None:
++                    factors.append(elapsed / prev_time)
++                prev_time = elapsed
++
++            with self.subTest(label):
++                # Assert based on the average factor to reduce test flakiness.
++                self.assertLessEqual(sum(factors) / len(factors), factor)
++
++        assertFactor(
++            "varying depth, varying length",
++            [(50, 2000), (100, 4000), (200, 8000), (400, 16000), (800, 32000)],
++            2,
++        )
++        assertFactor("constant depth, varying length", [(100, 1), (100, 1000)], 2)
++
+ 
+ class XmlSerializerTransactionTestCase(
+     SerializersTransactionTestBase, TransactionTestCase
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index d176123893..c2c44b4cc7 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -4,6 +4,7 @@ inherit setuptools3
 # Windows-specific DoS via NFKC normalization, not applicable to Linux
 CVE_STATUS[CVE-2025-27556] = "not-applicable-platform: Issue only applies on Windows"
 
+SRC_URI += "file://CVE-2025-64460.patch"
 SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
 RDEPENDS:${PN} += "\

