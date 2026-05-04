Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367D3FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 14:08:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15545.1777903736804624336
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2026 07:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=it8mBI0A;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d73422431so3812542f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777903735; x=1778508535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/bYFesHn1kIDI8fklk+0lHQz2id7d/lJYv40PzE0Ww=;
        b=it8mBI0AdT0ysbYv2PUcR9FHMYSu3pgfFokbm2y5npAF1RKDOQLlLx2aOqudPtn2We
         2mg4mqIJNm5BVXxGKjhqsrxqhDUlMlmswM3igg/cWgtO2jFm0K5bVzZjucKj2TIeXDZK
         RkA5n+zF+pMvqV5iUnSBPTkdihMMWZfiigWW0FlaiCZaHT7dsWQSAvnsrF+dIQQCe0d9
         r7qkxMltlUO+tnUSr/Vr/uyNrfuC+LucP/z2b7eOMJxE04iR76x6lIqQru8VYnCHtxZq
         uuCcAQ5M3pPSCLr5/lqeoQAfJKMCHZW6GipYZ1szKzmmvo1o+ZFaLuO12RHyl1AtJgc3
         P12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777903735; x=1778508535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/bYFesHn1kIDI8fklk+0lHQz2id7d/lJYv40PzE0Ww=;
        b=VQMI9aY2mWWqoZTs8yJm9Ut2g6cpPprt+Cjzac4hQbYSLSpjh1tsiiiEqnSbgxocOe
         1pA7kRv9VHxHUa5InUJvZ+4Cf0qgblHnVT5HqdRo/DzAWLZtEpxVM+jMkDDPqPK/v00I
         o2pIQd/rhUaV3YCnMD0J7JmuLt88J9lwTjRtCsQ3f2d4qKQsJzGtHg0O0zDfVaEnnNT3
         PJHCDqwt0PoZSdIi+FWVUreo8XfSeBvVznzbaDjRNJWmutkbcU85ybbD1Pg1LgvML87s
         qqjP2MhsccZz/Gf9sv6NhFQDRIRM3OxL/QiWwJU67sgX/bH4uBrojogg4gqI10detl72
         dPcA==
X-Gm-Message-State: AOJu0YywlVh6L/z6kTEnLhQisbWvp6FraZ75D74dCxv/s0mzXovMTHOz
	ZMHTfkuMmQovtPcZrCfe+Ejt/F1rx8+CBIC/NDlIDFLGPFX4QnV2OEQL5OOQcw==
X-Gm-Gg: AeBDieuqT9muAcPUAZbi/U1hLNSunIztd+eWeZ9C7YEzW4bQqGHbQmBSgYjn7oDSk1Q
	X53QJuj7WP2v5l+NlwMJI8T6JFBhme8FghxbqYMGtBSp3q5R2IY8GcbWccIGct5HoAkUbiBxU5j
	hSB+cN3WFWTl1MqiZgufpm45gy/eWecoo2aStg7z8a8Ck8yGzspnlL9+DdUtko3idOF8ggRHj4q
	8mTgxbzz8HDZEhtEKqxWi5FXYgM/xFW+se3pAZdGwv2zsQqu87ryk46ZlxXnN9iLgbakIGijo7c
	/+yBPqzUSRhSfD4SxmWUF2lLpRZYHuN8GqW2pO1lrwodKqJWwrINA+XS+5sbiMGH4Jug8jVeFox
	9/TJjlbhyZ/Ae29Wio0lPdHsbp8WGlhJep988NCN9sav/LDr1odoS5gUE09ulmi2WOLefMNoXdz
	wONYbgYr9q58DSwScVb00AUUiWgJUbugbRqqa4eKR8Rw==
X-Received: by 2002:a5d:6a04:0:b0:44b:e349:e6bc with SMTP id ffacd0b85a97d-44be349e6d8mr10361087f8f.3.1777903734820;
        Mon, 04 May 2026 07:08:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defb3sm35263394f8f.20.2026.05.04.07.08.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:08:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-soupsieve: fix tests with Python 3.10.20
Date: Mon,  4 May 2026 16:08:53 +0200
Message-ID: <20260504140853.741289-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 14:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126777

The latest Python upgrade in oe-core has broken some
ptests. This backported patch fixes them, they should work
with both the latest and previous versions.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ments-for-changes-in-HTML-parser-285.patch | 190 ++++++++++++++++++
 .../python/python3-soupsieve_2.3.1.bb         |   8 +-
 2 files changed, 194 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/0001-Adjustments-for-changes-in-HTML-parser-285.patch

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve/0001-Adjustments-for-changes-in-HTML-parser-285.patch b/meta-python/recipes-devtools/python/python3-soupsieve/0001-Adjustments-for-changes-in-HTML-parser-285.patch
new file mode 100644
index 0000000000..6e0d225b31
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soupsieve/0001-Adjustments-for-changes-in-HTML-parser-285.patch
@@ -0,0 +1,190 @@
+From b799b964ef020f18daab3d0b7193b217e7412050 Mon Sep 17 00:00:00 2001
+From: Isaac Muse <faceless.shop@gmail.com>
+Date: Wed, 17 Dec 2025 19:33:55 -0700
+Subject: [PATCH] Adjustments for changes in HTML parser (#285)
+
+Fixes #284
+
+Fixes running with python 3.10.20
+Upstream-Status: Backport [https://github.com/facelessuser/soupsieve/commit/046ce54956a0c30120038561e53b40994d29de2c]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ soupsieve/css_match.py                  |  2 +-
+ tests/test_extra/test_soup_contains.py  |  4 +++-
+ tests/test_level2/test_lang.py          |  4 +++-
+ tests/test_level3/test_root.py          | 11 ++++++++---
+ tests/test_level4/test_default.py       |  4 +++-
+ tests/test_level4/test_dir.py           |  4 +++-
+ tests/test_level4/test_indeterminate.py |  5 ++++-
+ 7 files changed, 25 insertions(+), 9 deletions(-)
+
+diff --git a/soupsieve/css_match.py b/soupsieve/css_match.py
+index 79bb870..c168436 100644
+--- a/soupsieve/css_match.py
++++ b/soupsieve/css_match.py
+@@ -1185,7 +1185,7 @@ class CSSMatch(_DocumentNav):
+         # Use cached meta language.
+         if not found_lang and self.cached_meta_lang:
+             for cache in self.cached_meta_lang:
+-                if root is cache[0]:
++                if root is not None and cast(str, root) is cache[0]:
+                     found_lang = cache[1]
+ 
+         # If we couldn't find a language, and the document is HTML, look to meta to determine language.
+diff --git a/tests/test_extra/test_soup_contains.py b/tests/test_extra/test_soup_contains.py
+index 66240db..fdd8027 100644
+--- a/tests/test_extra/test_soup_contains.py
++++ b/tests/test_extra/test_soup_contains.py
+@@ -2,7 +2,9 @@
+ from .. import util
+ import warnings
+ import soupsieve as sv
++from bs4 import BeautifulSoup
+ 
++IFRAME_TEXT = BeautifulSoup('<iframe><div></div></iframe>', 'html.parser').iframe.text == '<div></div>'
+ 
+ class TestSoupContains(util.TestCase):
+     """Test soup-contains selectors."""
+@@ -250,7 +252,7 @@ class TestSoupContains(util.TestCase):
+         self.assert_selector(
+             markup,
+             'span:-soup-contains("iframe")',
+-            ['2'],
++            [] if IFRAME_TEXT else ['2'],
+             flags=util.PYHTML
+         )
+ 
+diff --git a/tests/test_level2/test_lang.py b/tests/test_level2/test_lang.py
+index 83b9ee4..082921c 100644
+--- a/tests/test_level2/test_lang.py
++++ b/tests/test_level2/test_lang.py
+@@ -1,6 +1,8 @@
+ """Test language selector."""
+ from .. import util
++from bs4 import BeautifulSoup
+ 
++IFRAME_TEXT = BeautifulSoup('<iframe><div></div></iframe>', 'html.parser').iframe.text == '<div></div>'
+ 
+ class TestLang(util.TestCase):
+     """Test language selector."""
+@@ -58,7 +60,7 @@ class TestLang(util.TestCase):
+         self.assert_selector(
+             markup,
+             "p:lang(en)",
+-            ['3'],
++            [] if IFRAME_TEXT else ['3'],
+             flags=util.PYHTML
+         )
+ 
+diff --git a/tests/test_level3/test_root.py b/tests/test_level3/test_root.py
+index 60f7e75..3c6843c 100644
+--- a/tests/test_level3/test_root.py
++++ b/tests/test_level3/test_root.py
+@@ -1,6 +1,10 @@
+ """Test root selectors."""
+ from .. import util
+ import soupsieve as sv
++from bs4 import BeautifulSoup
++import pytest
++
++IFRAME_TEXT = BeautifulSoup('<iframe><div></div></iframe>', 'html.parser').iframe.text == '<div></div>'
+ 
+ 
+ class TestRoot(util.TestCase):
+@@ -65,7 +69,7 @@ class TestRoot(util.TestCase):
+         self.assert_selector(
+             self.MARKUP_IFRAME,
+             ":root",
+-            ["root", "root2"],
++            ["root"] if IFRAME_TEXT else ["root", "root2"],
+             flags=util.PYHTML
+         )
+ 
+@@ -85,17 +89,18 @@ class TestRoot(util.TestCase):
+         self.assert_selector(
+             self.MARKUP_IFRAME,
+             ":root div",
+-            ["div", "div2", "other-div"],
++            ["div", "other-div"] if IFRAME_TEXT else ["div", "div2", "other-div"],
+             flags=util.PYHTML
+         )
+ 
+         self.assert_selector(
+             self.MARKUP_IFRAME,
+             ":root > body > div",
+-            ["div", "div2", "other-div"],
++            ["div", "other-div"] if IFRAME_TEXT else ["div", "div2", "other-div"],
+             flags=util.PYHTML
+         )
+ 
++    @pytest.mark.skipif(IFRAME_TEXT, reason="Requires old Python HTML handling")
+     def test_iframe(self):
+         """
+         Test that we only count `iframe` as root since the scoped element is the root.
+diff --git a/tests/test_level4/test_default.py b/tests/test_level4/test_default.py
+index 852948d..dd7b53a 100644
+--- a/tests/test_level4/test_default.py
++++ b/tests/test_level4/test_default.py
+@@ -1,6 +1,8 @@
+ """Test default selectors."""
+ from .. import util
++from bs4 import BeautifulSoup
+ 
++IFRAME_TEXT = BeautifulSoup('<iframe><div></div></iframe>', 'html.parser').iframe.text == '<div></div>'
+ 
+ class TestDefault(util.TestCase):
+     """Test default selectors."""
+@@ -113,7 +115,7 @@ class TestDefault(util.TestCase):
+         self.assert_selector(
+             markup,
+             ":default",
+-            ['d1', 'd3', 'd4'],
++            ['d1', 'd3'] if IFRAME_TEXT else ['d1', 'd3', 'd4'],
+             flags=util.PYHTML
+         )
+ 
+diff --git a/tests/test_level4/test_dir.py b/tests/test_level4/test_dir.py
+index e427715..e1a68f2 100644
+--- a/tests/test_level4/test_dir.py
++++ b/tests/test_level4/test_dir.py
+@@ -2,7 +2,9 @@
+ """Test direction selectors."""
+ from .. import util
+ import soupsieve as sv
++from bs4 import BeautifulSoup
+ 
++IFRAME_TEXT = BeautifulSoup('<iframe><div></div></iframe>', 'html.parser').iframe.text == '<div></div>'
+ 
+ class TestDir(util.TestCase):
+     """Test direction selectors."""
+@@ -170,7 +172,7 @@ class TestDir(util.TestCase):
+         self.assert_selector(
+             markup,
+             "div:dir(rtl)",
+-            ['2'],
++            [] if IFRAME_TEXT else ['2'],
+             flags=util.PYHTML
+         )
+ 
+diff --git a/tests/test_level4/test_indeterminate.py b/tests/test_level4/test_indeterminate.py
+index 8e949ff..6867dae 100644
+--- a/tests/test_level4/test_indeterminate.py
++++ b/tests/test_level4/test_indeterminate.py
+@@ -1,5 +1,8 @@
+ """Test indeterminate selectors."""
+ from .. import util
++from bs4 import BeautifulSoup
++
++IFRAME_TEXT = BeautifulSoup('<iframe><div></div></iframe>', 'html.parser').iframe.text == '<div></div>'
+ 
+ 
+ class TestIndeterminate(util.TestCase):
+@@ -68,6 +71,6 @@ class TestIndeterminate(util.TestCase):
+         self.assert_selector(
+             markup,
+             ":indeterminate",
+-            ['radio1', 'radio3'],
++            ['radio1'] if IFRAME_TEXT else ['radio1', 'radio3'],
+             flags=util.PYHTML
+         )
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
index 0ef0c7e791..eec68682e4 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
@@ -8,10 +8,10 @@ SRC_URI[sha256sum] = "b8d49b1cd4f037c7082a9683dfa1801aa2597fb11c3a1155b7a5b94829
 
 inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI += " \
-        file://run-ptest \
-        file://update_tests_for_latest_libxml.patch \
-"
+SRC_URI += "file://run-ptest \
+           file://update_tests_for_latest_libxml.patch \
+           file://0001-Adjustments-for-changes-in-HTML-parser-285.patch \
+           "
 
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \

