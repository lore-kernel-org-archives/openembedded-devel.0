Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC3FCCD183
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 13:10:55 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.24331.1760879452071882043
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 06:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FASB8lHm;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso593777266b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760879450; x=1761484250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAEYO0akzzjRgDi97we9DV3l7XGgUPrGhiWHJOAfihQ=;
        b=FASB8lHmBkgca6Br0iQI0gKdMpRiJ6d9fbStS4Stz/d/pBzTTAb73lS+J23ZqV8CE8
         aVlsOsa12NRKJovG701+atxP8ZPBEhbKrLZ9vSYD78E8b9s/q7oFAZXUFmlXar0VMNzf
         z84n9QhJnORqH6hyCkoFFcONlV7d5tpPYKnbLTT5m5tpj1Zk1K8ii/nidlF657XneJaU
         90YK1P+oep8EFk0Ob2gL+0KMfPrWd15s6i35zJJ7bNJg8hR7b2DSrfLBgNnUvEmmjK7N
         T7qtTgpLvXo+vboOYdDcQCT5FCRpmA4qjxI8z/O1S9qmlrvq8tHL/pOz2P+2Go18t8xv
         LcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760879450; x=1761484250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WAEYO0akzzjRgDi97we9DV3l7XGgUPrGhiWHJOAfihQ=;
        b=S6NcL6dTOgFFK+mW3iQ4kehIESuD9zADi23Zs1K4RNdGpwOUwW0zrM1G7exq6iEwxB
         XfB0f/hVemW5/lxx0vnKGMAfD2R0MCJpDgceJzLZyyGi1vILxrV2DjOGucFUUimZJYWY
         9IM6qO55W/TZH3Eu3nonjLgx1u8mJVGRgq+NxX/6zBFvXnb7mSSs64rgwRPjgbxaki/R
         cG6w7cxKeqpiiVJfk87v2victfshBnxeMwVas+V+FyqSCaNazSVAG0DafBugu/S74mL9
         9TjDrf7O0SbZZBqXlcobb7vZJZZqfcBjKCygt/MwvUnoMdmEu68eHWYHKepEUtgris/q
         9UQg==
X-Gm-Message-State: AOJu0Yz0/WJ7/TsbUodUVDy6/XpmdDeKJEMJYRG6NdjNp+U6Y/zVHFSg
	v3tnhi5R7iIcO+dsomwcGjHLdjQjujvw6n8LNNVRGOzuS9dU2BdjAJg4YfqFPA==
X-Gm-Gg: ASbGncu27CIASBX3ivl0wH6dgJK+uzwWx32JNVhipEp0t9qysCjO83zFnSt6yw4OGKa
	35rt6V4hFyJ+zsp6N2iUt6TbSZVyOeOP4oW7K8m5oQKDy2UtA5GPt6UWxfTjDcccW5+YCrs8gLm
	wQIpZ8/JzYQ4Q1ZDSxllryZwK0LwWVY44S0viU30Ocjk+cjnGYlERF8Wzo/4Ty9oqi8Gt69Hc04
	Yt9bVSbWmALP6fMk2NUGmOxCb5mqduHKYL302gkUpyuvcodS8Kz2a+04JxWsKLLmOqf/IzvXjbM
	jhpUN8sXmLjWEN+7K0StuD1+nD0ODl4AMctu8NLJzhaKbi+ZffGhM5vJJTi6iITwPBFQWKI5Oe/
	bNhBCZOdR7SqV1L7v4Ub8dWzWj4Q5PjvHG+JMQfFl0Qe9KlfiqyCZG8cB1sQ/wM+fMgRaJVTKst
	xZonP6OshM
X-Google-Smtp-Source: AGHT+IFS1jm6fCGkjvei6qXb6isbaMp4Pl/Ox9Q1t5QHTJIRC+kwBwjkJVn4UDcFr2CMsPGo1CZ/ow==
X-Received: by 2002:a17:907:6090:b0:b2e:e87e:ef2e with SMTP id a640c23a62f3a-b647395240bmr1126211466b.39.1760879449975;
        Sun, 19 Oct 2025 06:10:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4869746asm4119384a12.0.2025.10.19.06.10.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 06:10:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-yarl: fix ptests (and make it compatible with current python)
Date: Sun, 19 Oct 2025 15:10:46 +0200
Message-ID: <20251019131047.787427-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 13:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120790

oe-core currently ships with Python 3.10.18.
Python 3.10.17 has introduced a change in urlparse library, regarding how
brackets are handled by urllib.parse.urlsplit() and urlparse() functions
(which makes it more conformant to the specification).

This has caused a regression in yarl: some tests have failed, and it also
revealed a bug in how yarl treates brackets.

This backported patch corrects this behavior, making it compatible once
again with the current Python version - and it also allows the the ptests
to pass once again.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...e-bracket-handling-in-URL-netloc-882.patch | 138 ++++++++++++++++++
 .../python/python3-yarl_1.7.2.bb              |   3 +-
 2 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-yarl/0001-Correct-square-bracket-handling-in-URL-netloc-882.patch

diff --git a/meta-python/recipes-devtools/python/python3-yarl/0001-Correct-square-bracket-handling-in-URL-netloc-882.patch b/meta-python/recipes-devtools/python/python3-yarl/0001-Correct-square-bracket-handling-in-URL-netloc-882.patch
new file mode 100644
index 0000000000..293ce88a13
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yarl/0001-Correct-square-bracket-handling-in-URL-netloc-882.patch
@@ -0,0 +1,138 @@
+From 0a94c6e4948e00fff072c0cf367afbf4ac36f906 Mon Sep 17 00:00:00 2001
+From: Martijn Pieters <github.com@zopatista.com>
+Date: Wed, 14 Jun 2023 11:17:16 +0100
+Subject: [PATCH] Correct square bracket handling in URL netloc (#882)
+
+- The human representation of usernames and passwords should percent-
+  encode square brackets.
+- Clean up the test suite to remove tests that use invalid hostnames
+  (square brackets in a host name must only be used for IPv6 addresses).
+- Rename the remaining test using IPvFuture address syntax to make this
+  explicit.
+- Drop a test for IPv6 addresses with a zone id; zone id support is
+  controversial and expilictly excluded from the WHATWG URL standard.
+  Zone ids *without percent characters in their name* continue to work
+  as long as urllib.parse.urlsplit() accepts them but this is not
+  something that yarl.URL() needs to support explicitly.
+
+Upstream-Status: Backport [https://github.com/aio-libs/yarl/commit/0a94c6e4948e00fff072c0cf367afbf4ac36f906]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ CHANGES/876.bugfix.rst    |  1 +
+ tests/test_url.py         | 10 ++--------
+ tests/test_url_parsing.py | 28 ++--------------------------
+ yarl/_url.py              |  4 ++--
+ 4 files changed, 7 insertions(+), 36 deletions(-)
+ create mode 100644 CHANGES/876.bugfix.rst
+
+diff --git a/CHANGES/876.bugfix.rst b/CHANGES/876.bugfix.rst
+new file mode 100644
+index 0000000..ef62c7e
+--- /dev/null
++++ b/CHANGES/876.bugfix.rst
+@@ -0,0 +1 @@
++Fixed the human representation of URLs with square brackets in usernames and passwords.
+diff --git a/tests/test_url.py b/tests/test_url.py
+index 1981b20..295c063 100644
+--- a/tests/test_url.py
++++ b/tests/test_url.py
+@@ -236,12 +236,6 @@ def test_compressed_ipv6():
+     assert url.host == url.raw_host
+ 
+ 
+-def test_ipv6_zone():
+-    url = URL("http://[fe80::822a:a8ff:fe49:470c%тест%42]:123")
+-    assert url.raw_host == "fe80::822a:a8ff:fe49:470c%тест%42"
+-    assert url.host == url.raw_host
+-
+-
+ def test_ipv4_zone():
+     # I'm unsure if it is correct.
+     url = URL("http://1.2.3.4%тест%42:123")
+@@ -1660,8 +1654,8 @@ def test_human_repr_delimiters():
+     s = url.human_repr()
+     assert URL(s) == url
+     assert (
+-        s == "http:// !\"%23$%25&'()*+,-.%2F%3A;<=>%3F%40[\\]^_`{|}~"
+-        ": !\"%23$%25&'()*+,-.%2F%3A;<=>%3F%40[\\]^_`{|}~"
++        s == "http:// !\"%23$%25&'()*+,-.%2F%3A;<=>%3F%40%5B\\%5D^_`{|}~"
++        ": !\"%23$%25&'()*+,-.%2F%3A;<=>%3F%40%5B\\%5D^_`{|}~"
+         "@хост.домен:8080"
+         "/ !\"%23$%25&'()*+,-./:;<=>%3F@[\\]^_`{|}~"
+         "? !\"%23$%25%26'()*%2B,-./:%3B<%3D>?@[\\]^_`{|}~"
+diff --git a/tests/test_url_parsing.py b/tests/test_url_parsing.py
+index 0f0dd7e..60f128c 100644
+--- a/tests/test_url_parsing.py
++++ b/tests/test_url_parsing.py
+@@ -178,14 +178,6 @@ class TestHost:
+         assert u.query_string == ""
+         assert u.fragment == ""
+ 
+-    def test_masked_ipv4(self):
+-        u = URL("//[127.0.0.1]/")
+-        assert u.scheme == ""
+-        assert u.host == "127.0.0.1"
+-        assert u.path == "/"
+-        assert u.query_string == ""
+-        assert u.fragment == ""
+-
+     def test_ipv6(self):
+         u = URL("//[::1]/")
+         assert u.scheme == ""
+@@ -194,15 +186,7 @@ class TestHost:
+         assert u.query_string == ""
+         assert u.fragment == ""
+ 
+-    def test_strange_ip(self):
+-        u = URL("//[-1]/")
+-        assert u.scheme == ""
+-        assert u.host == "-1"
+-        assert u.path == "/"
+-        assert u.query_string == ""
+-        assert u.fragment == ""
+-
+-    def test_strange_ip_2(self):
++    def test_ipvfuture_address(self):
+         u = URL("//[v1.-1]/")
+         assert u.scheme == ""
+         assert u.host == "v1.-1"
+@@ -210,14 +194,6 @@ class TestHost:
+         assert u.query_string == ""
+         assert u.fragment == ""
+ 
+-    def test_strange_ip_3(self):
+-        u = URL("//v1.[::1]/")
+-        assert u.scheme == ""
+-        assert u.host == "::1"
+-        assert u.path == "/"
+-        assert u.query_string == ""
+-        assert u.fragment == ""
+-
+ 
+ class TestPort:
+     def test_canonical(self):
+@@ -320,7 +296,7 @@ class TestUserInfo:
+         assert u.fragment == ""
+ 
+     def test_weird_user3(self):
+-        u = URL("//[some]@host")
++        u = URL("//%5Bsome%5D@host")
+         assert u.scheme == ""
+         assert u.user == "[some]"
+         assert u.password is None
+diff --git a/yarl/_url.py b/yarl/_url.py
+index 74190d9..c8f2acb 100644
+--- a/yarl/_url.py
++++ b/yarl/_url.py
+@@ -1118,8 +1118,8 @@ class URL:
+ 
+     def human_repr(self):
+         """Return decoded human readable string for URL representation."""
+-        user = _human_quote(self.user, "#/:?@")
+-        password = _human_quote(self.password, "#/:?@")
++        user = _human_quote(self.user, "#/:?@[]")
++        password = _human_quote(self.password, "#/:?@[]")
+         host = self.host
+         if host:
+             host = self._encode_host(self.host, human=True)
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
index 0867d1cb53..902cace048 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e581798a7b985311f29fa3e163ea27ae"
 
 SRC_URI[sha256sum] = "45399b46d60c253327a460e99856752009fcee5f5d3c80b2f7c0cae1c38d56dd"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-Correct-square-bracket-handling-in-URL-netloc-882.patch"
 
 PYPI_PACKAGE = "yarl"
 

