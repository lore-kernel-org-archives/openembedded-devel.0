Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C9DCCD184
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 14:22:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.25533.1760883722427672478
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 07:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f1fZEx0Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b463f986f80so699563066b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760883721; x=1761488521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxVnNCvXJ8nTXmgYb0OBOqYhYEDGCbL/DbvSq9Sh2fk=;
        b=f1fZEx0YNO8HkKSc1aO7p2yLZaxfudFgtlHMYMCD2RL/2Lm6nPsrZk7MTJvIzj1h8+
         KVBuNoXVpCQU78X0YnYW6sNlpw7zBc5JaVfIzvzNL4SCjMn55nj7s6boZPQoUYAvuoSx
         wDssZdwEtZHbUulWaOVNVSpLtQc1AEFVrEd4kmhHI9e+WTTtXF7kW86zXk6GJs2sr+yO
         Toh2PlBC3p1mmewx+R0Aaa/XK+hGZsLiGacV7lCCP16NTulaEoNaYbrMjwoOLjwlSd2U
         E06Wc0yxnL3+RH4GaDz/b2tWlgpOzCY0UM4K0K7qewEKeIIzJTfPewIHMSqf2dlLWY98
         nxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760883721; x=1761488521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxVnNCvXJ8nTXmgYb0OBOqYhYEDGCbL/DbvSq9Sh2fk=;
        b=EfP0/QRMH5AbapoqGlAPneK9tXehcsni6eVzVSJQHNs/UkVsYNjnx70lmG/V87+7Sf
         2sa96TV9bsK/k1Ob9gJJ7hG7+Jefxqmd+qr4yAjz5r++C+Uc32OKcuTE8e84uAH0qEtt
         A8mzLoQxAzYT/fs+GysyFnk5iMC4Dd4tCCzwvOyKWVScFT8Ma2SIyMWxd7fSMY3jivki
         Tw5obwRAa7EmLYKttyPiWKqI6pxOm/39jPZGUBHOSLi1KNe+338sjChv1NEQjVwFMmBr
         RhH3/dtwgtv8QIzxS/S9wbOjO/nqDolk9mqjD33LM2C/7KIj1j+qJ7BlzI+GqMaRL0v4
         AVDw==
X-Gm-Message-State: AOJu0YwXnNmUrcUvmHGiTTHRruRCbFnjSEGqj1kNTxa9KvU1sYXVNcOb
	To1QwCQR4LGmmvWHnKHnH/fpeaPWh5b7dCSYRUPtezT/XbgbZiiASInV9kkh+g==
X-Gm-Gg: ASbGncty0q/NyjEFU6qU6roLkGQPN/8lTNI/zoHXhWtdlIkTIncr2tmq0BDZscRfM89
	Orn5812vCsXZJDhWkCE4RA5XQY18I6hhx3G4HRYE7ZartZnUtayYMG9a2HjyN9/eOAKs2LcNVMH
	QSE8c9ZtiGXQMmL+EFFYS+QV1fxk7x7DqucCUNruEZSlQE3AXbSzV7iRAP26zeAbnmozZRqbNo2
	J61V+Bgl6A1TEHeWvxkoL8glUiLFo9B8PQiKedOe2HbJlwexS0ucyx10QO8UVVevKaLlD5tB7f4
	RLwr70i357SfHThMDthYEGGMElhpRspPXC0yWobEuewmXgYToMWsBSQ5okSX3aXtZnUE4b7VrN5
	PWn/G8/mRKvn+Mzbn2YDjFU+Of+o2nfqwSrAuFgQUmUYuN+h2vnae7Rqwr4ZF3sbLoGnFRJK1hb
	A54Drc79IJ
X-Google-Smtp-Source: AGHT+IHT+XrgHfkzaRql8eBn8aELIDz5UQbDcQ4eEjzUPZp3gUAX4nuMRTu8WLaZT89Q9W+btb1CCw==
X-Received: by 2002:a17:907:7ea3:b0:b41:873d:e220 with SMTP id a640c23a62f3a-b6474f18597mr1014251766b.50.1760883720452;
        Sun, 19 Oct 2025 07:22:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb49a83sm511500766b.72.2025.10.19.07.21.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 07:22:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-soupsieve: fix ptests
Date: Sun, 19 Oct 2025 16:21:59 +0200
Message-ID: <20251019142159.1166584-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 14:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120794

Some ptests have started to fail, due to a change in libxml 2.9.12 (oe-core
ships with 2.9.14 currently).
See upstream issue: https://github.com/facelessuser/soupsieve/issues/220

This backported patch solves this issue.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../update_tests_for_latest_libxml.patch      | 162 ++++++++++++++++++
 .../python/python3-soupsieve_2.3.1.bb         |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/update_tests_for_latest_libxml.patch

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve/update_tests_for_latest_libxml.patch b/meta-python/recipes-devtools/python/python3-soupsieve/update_tests_for_latest_libxml.patch
new file mode 100644
index 0000000000..3792565d1a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soupsieve/update_tests_for_latest_libxml.patch
@@ -0,0 +1,162 @@
+From 64748a27d4cbd701c364bab1511c57c69b2b05a8 Mon Sep 17 00:00:00 2001
+From: facelessuser <faceless.shop@gmail.com>
+Date: Thu, 16 Dec 2021 13:31:37 -0700
+Subject: [PATCH 1/2] Update tests to account for latest lxml and libxml2
+ versions
+
+Fixes #220
+
+Upstream-Status: Backport [https://github.com/facelessuser/soupsieve/commit/a8640aad6ae0476e6b62f4f15e12ad4efc7605c4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+diff --git a/tests/test_extra/test_soup_contains.py b/tests/test_extra/test_soup_contains.py
+index 1de8a04..af5fa3b 100644
+--- a/tests/test_extra/test_soup_contains.py
++++ b/tests/test_extra/test_soup_contains.py
+@@ -144,7 +144,7 @@ def test_contains_escapes(self):
+             flags=util.HTML
+         )
+ 
+-    def test_contains_cdata_html(self):
++    def test_contains_cdata_html5(self):
+         """Test contains CDATA in HTML5."""
+ 
+         markup = """
+@@ -155,7 +155,40 @@ def test_contains_cdata_html(self):
+             markup,
+             'body *:-soup-contains("that")',
+             ['1'],
+-            flags=util.HTML
++            flags=util.HTML5
++        )
++
++    def test_contains_cdata_py_html(self):
++        """Test contains CDATA in Python HTML parser."""
++
++        markup = """
++        <body><div id="1">Testing that <span id="2"><![CDATA[that]]></span>contains works.</div></body>
++        """
++
++        self.assert_selector(
++            markup,
++            'body *:-soup-contains("that")',
++            ['1'],
++            flags=util.PYHTML
++        )
++
++    @util.skip_no_lxml
++    def test_contains_cdata_lxml_html(self):
++        """Test contains CDATA in `lxml` HTML parser."""
++
++        from lxml import etree
++        LIBXML_VER = etree.LIBXML_VERSION
++
++        markup = """
++        <body><div id="1">Testing that <span id="2"><![CDATA[that]]></span>contains works.</div></body>
++        """
++
++        results = ['1', '2'] if LIBXML_VER >= (2, 9, 11) else ['1']
++        self.assert_selector(
++            markup,
++            'body *:-soup-contains("that")',
++            results,
++            flags=util.LXML_HTML
+         )
+ 
+     def test_contains_cdata_xhtml(self):
+diff --git a/tests/test_extra/test_soup_contains_own.py b/tests/test_extra/test_soup_contains_own.py
+index 1a1be88..cb4118b 100644
+--- a/tests/test_extra/test_soup_contains_own.py
++++ b/tests/test_extra/test_soup_contains_own.py
+@@ -35,7 +35,7 @@ def test_contains_own(self):
+             flags=util.HTML
+         )
+ 
+-    def test_contains_own_cdata_html(self):
++    def test_contains_own_cdata_html5(self):
+         """Test contains CDATA in HTML5."""
+ 
+         markup = """
+@@ -46,7 +46,40 @@ def test_contains_own_cdata_html(self):
+             markup,
+             'body *:-soup-contains-own("that")',
+             ['1'],
+-            flags=util.HTML
++            flags=util.HTML5
++        )
++
++    def test_contains_own_cdata_py_html(self):
++        """Test contains CDATA in Python HTML parser."""
++
++        markup = """
++        <body><div id="1">Testing that <span id="2"><![CDATA[that]]></span>contains works.</div></body>
++        """
++
++        self.assert_selector(
++            markup,
++            'body *:-soup-contains-own("that")',
++            ['1'],
++            flags=util.PYHTML
++        )
++
++    @util.skip_no_lxml
++    def test_contains_own_cdata_lxml_html(self):
++        """Test contains CDATA in `lxml` HTML."""
++
++        from lxml import etree
++        LIBXML_VER = etree.LIBXML_VERSION
++
++        markup = """
++        <body><div id="1">Testing that <span id="2"><![CDATA[that]]></span>contains works.</div></body>
++        """
++
++        results = ['1', '2'] if LIBXML_VER >= (2, 9, 11) else ['1']
++        self.assert_selector(
++            markup,
++            'body *:-soup-contains-own("that")',
++            results,
++            flags=util.LXML_HTML
+         )
+ 
+     def test_contains_own_cdata_xml(self):
+
+diff --git a/tests/test_extra/test_soup_contains.py b/tests/test_extra/test_soup_contains.py
+index af5fa3b..66240db 100644
+--- a/tests/test_extra/test_soup_contains.py
++++ b/tests/test_extra/test_soup_contains.py
+@@ -177,13 +177,13 @@ def test_contains_cdata_lxml_html(self):
+         """Test contains CDATA in `lxml` HTML parser."""
+ 
+         from lxml import etree
+-        LIBXML_VER = etree.LIBXML_VERSION
++        libxml_ver = etree.LIBXML_VERSION
+ 
+         markup = """
+         <body><div id="1">Testing that <span id="2"><![CDATA[that]]></span>contains works.</div></body>
+         """
+ 
+-        results = ['1', '2'] if LIBXML_VER >= (2, 9, 11) else ['1']
++        results = ['1', '2'] if libxml_ver >= (2, 9, 11) else ['1']
+         self.assert_selector(
+             markup,
+             'body *:-soup-contains("that")',
+diff --git a/tests/test_extra/test_soup_contains_own.py b/tests/test_extra/test_soup_contains_own.py
+index cb4118b..a4b33b4 100644
+--- a/tests/test_extra/test_soup_contains_own.py
++++ b/tests/test_extra/test_soup_contains_own.py
+@@ -68,13 +68,13 @@ def test_contains_own_cdata_lxml_html(self):
+         """Test contains CDATA in `lxml` HTML."""
+ 
+         from lxml import etree
+-        LIBXML_VER = etree.LIBXML_VERSION
++        libxml_ver = etree.LIBXML_VERSION
+ 
+         markup = """
+         <body><div id="1">Testing that <span id="2"><![CDATA[that]]></span>contains works.</div></body>
+         """
+ 
+-        results = ['1', '2'] if LIBXML_VER >= (2, 9, 11) else ['1']
++        results = ['1', '2'] if libxml_ver >= (2, 9, 11) else ['1']
+         self.assert_selector(
+             markup,
+             'body *:-soup-contains-own("that")',
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
index 631a45c99e..0ef0c7e791 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
@@ -10,6 +10,7 @@ inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
         file://run-ptest \
+        file://update_tests_for_latest_libxml.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \

