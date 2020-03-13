Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A23861CA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 10:19:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02DAJtv2022648
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 03:19:55 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 13 Mar 2020 03:19:55 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Fri, 13 Mar 2020 18:19:23 +0800
Message-ID: <1584094764-17831-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-python][zeus][PATCH] python-urllib3/python3-urllib3: fix CVE-2020-7212
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
X-List-Received-Date: Fri, 13 Mar 2020 10:19:54 -0000
Content-Type: text/plain

Optimize _encode_invalid_chars for a denial of service (CPU consumption)

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 .../python/python-urllib3/CVE-2020-7212.patch      | 54 ++++++++++++++++++++++
 .../python/python-urllib3_1.25.6.bb                |  2 +
 .../python/python3-urllib3/CVE-2020-7212.patch     | 54 ++++++++++++++++++++++
 .../python/python3-urllib3_1.25.6.bb               |  2 +
 4 files changed, 112 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch

diff --git a/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch b/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
new file mode 100644
index 0000000..a2bb0fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
@@ -0,0 +1,54 @@
+From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 21 Jan 2020 22:32:56 +0400
+Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+Upstream-Status: Backport
+[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/urllib3/util/url.py | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
+index 9675f74..e353937 100644
+--- a/src/urllib3/util/url.py
++++ b/src/urllib3/util/url.py
+@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+ 
+     component = six.ensure_text(component)
+ 
++    # Normalize existing percent-encoded bytes.
+     # Try to see if the component we're encoding is already percent-encoded
+     # so we can skip all '%' characters but still encode all others.
+-    percent_encodings = PERCENT_RE.findall(component)
+-
+-    # Normalize existing percent-encoded bytes.
+-    for enc in percent_encodings:
+-        if not enc.isupper():
+-            component = component.replace(enc, enc.upper())
++    component, percent_encodings = PERCENT_RE.subn(
++        lambda match: match.group(0).upper(), component
++    )
+ 
+     uri_bytes = component.encode("utf-8", "surrogatepass")
+-    is_percent_encoded = len(percent_encodings) == uri_bytes.count(b"%")
+-
++    is_percent_encoded = percent_encodings == uri_bytes.count(b"%")
+     encoded_component = bytearray()
+ 
+     for i in range(0, len(uri_bytes)):
+@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+         if (is_percent_encoded and byte == b"%") or (
+             byte_ord < 128 and byte.decode() in allowed_chars
+         ):
+-            encoded_component.extend(byte)
++            encoded_component += byte
+             continue
+         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill(2).upper()))
+ 
+-- 
+2.23.0
+
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
index 6c81f1d..9f2d2c8 100644
--- a/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools
 require python-urllib3.inc
+
+SRC_URI += "file://CVE-2020-7212.patch"
diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
new file mode 100644
index 0000000..a2bb0fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
@@ -0,0 +1,54 @@
+From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 21 Jan 2020 22:32:56 +0400
+Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+Upstream-Status: Backport
+[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/urllib3/util/url.py | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
+index 9675f74..e353937 100644
+--- a/src/urllib3/util/url.py
++++ b/src/urllib3/util/url.py
+@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+ 
+     component = six.ensure_text(component)
+ 
++    # Normalize existing percent-encoded bytes.
+     # Try to see if the component we're encoding is already percent-encoded
+     # so we can skip all '%' characters but still encode all others.
+-    percent_encodings = PERCENT_RE.findall(component)
+-
+-    # Normalize existing percent-encoded bytes.
+-    for enc in percent_encodings:
+-        if not enc.isupper():
+-            component = component.replace(enc, enc.upper())
++    component, percent_encodings = PERCENT_RE.subn(
++        lambda match: match.group(0).upper(), component
++    )
+ 
+     uri_bytes = component.encode("utf-8", "surrogatepass")
+-    is_percent_encoded = len(percent_encodings) == uri_bytes.count(b"%")
+-
++    is_percent_encoded = percent_encodings == uri_bytes.count(b"%")
+     encoded_component = bytearray()
+ 
+     for i in range(0, len(uri_bytes)):
+@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
+         if (is_percent_encoded and byte == b"%") or (
+             byte_ord < 128 and byte.decode() in allowed_chars
+         ):
+-            encoded_component.extend(byte)
++            encoded_component += byte
+             continue
+         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill(2).upper()))
+ 
+-- 
+2.23.0
+
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
index 19eb702..e3583a0 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-urllib3.inc
+
+SRC_URI += "file://CVE-2020-7212.patch"
-- 
1.9.1


