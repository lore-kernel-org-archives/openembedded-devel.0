Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.3373.1627007132260804853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cA8zU8wE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627007130; i=@fujitsu.com;
	bh=1MSh0LwtC+CuOphGbqENArCWQRGM4xgumdwQBZkCUUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cA8zU8wE18xAv0X+8j+pf1V1ONNzZwNhBPpYYmJ7WcjNyQtEuzmLp2a1N0F7rNU3E
	 qsv7RwWpYbEyV4UEBCIO3oZlFj8+UTz0/Df2oEkzpMFIlQBlYckfSZ9LBfLdc3/cox
	 V5rYbehJGLx8uo34OtVXMN1syZceq46Z7jNjOLmUr3L5UvbWFPJywKD5tYiiRrE3On
	 fJhF5hOvL5dAHiuKUgoGx8evknUMk2VpBO29wn5stWWAwTstp4S/q+eyk3jTj3Wzsb
	 XYDOKw3D3a7PY/a9oMiLARYKBc0R9jFzqfsbxRNBzN9prspzhTkbosCc9vmF6EFSDP
	 RL2REVX0UMP+w==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id FE/13-07211-9982AF06; Fri, 23 Jul 2021 02:25:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYojtT41e
  CwcKt0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bELd/YC1rFKv4sOsnUwLhQuIuRi0NIYDaT
  RNftmcwQzglGif+3pjB1MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC3hJ3NjxHsjm4GARUJWY9
  7oCJMwr4CZxeUs3I4gtIaAgMeXhe2aIuKDEyZlPwMYwC0hIHHzxghmiRlFi+84zLBB2hcSMGd
  vYJjDyzELSMgtJywJGplWMlklFmekZJbmJmTm6hgYGuoaGxrpGukaGZnqJVbqJeqmlusmpeSV
  FiUBZvcTyYr3iytzknBS9vNSSTYzAQEopZLqxg/Hb6w96hxglOZiURHmlDv9MEOJLyk+pzEgs
  zogvKs1JLT7EKMPBoSTBu0LmV4KQYFFqempFWmYOMKhh0hIcPEoivKUSQGne4oLE3OLMdIjUK
  UZFKXHeo2pACQGQREZpHlwbLJIuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmjVYHmsKTmV
  cCN/0V0GImoMWnun6CLC5JREhJNTC138rSEJC+v2929P/07KWm16/HLQhheWrUnHi5jC/cKD3
  ku4p+8CupMx8ydV4HeVgZNVbvW+rgYN+9cMZxM6FJYUzn+CxYRf1XnzujkHKcN9dS3eBKfWyn
  /lyxSC5u1pLHdpE+XzPX/k1ue/1LaF/XLOW8M4u7Z8cFej697j6vbNKVGY8PMgbYrPRrajjn6
  aFyq5xh26s/x6wPLt31RPJu1af54U23DG7byx1yXDrvWE+m6ifvJKHfp948/sUmcyNC1kbVru
  Cl5pe5hlpRtpxtmUnJu8t5vokZ1tUuTDyUaiL6841nuunF+WW+HNyXWfZfFrkTscI9Wl3Sg4m
  hS712y9zIqk8n0nqr9+pNVWIpzkg01GIuKk4EAA/M0p8fAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-26.tower-232.messagelabs.com!1627007128!201284!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7117 invoked from network); 23 Jul 2021 02:25:29 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-26.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:25:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2PSFK010806
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:25:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:25:27 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-rdflib: upgrade 5.0.0 -> 6.0.0
Date: Fri, 23 Jul 2021 22:25:20 +0800
Message-ID: <1627050320-7324-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

2021/07/20 RELEASE 6.0.0
========================
6.0.0 is a major stable release that drops support for Python 2 and Python 3 < 3.7. Type hinting is now present in much
of the toolkit as a result.

It includes the formerly independent JSON-LD parser/serializer, improvements to Namespaces that allow for IDE namespace
prompting, simplified use of `g.serialize()` (turtle default, no need to `decode()`) and many other updates to
documentation, store backends and so on.

Performance of the in-memory store has also improved since Python 3.6 dictionary improvements.

There are numerous supplementary improvements to the toolkit too, such as:

* inclusion of Docker files for easier CI/CD
* black config files for standardised code formatting
* improved testing with mock SPARQL stores, rather than a reliance on DBPedia etc

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/python3-rdflib_5.0.0.bb              | 15 ---------------
 .../python/python3-rdflib_6.0.0.bb              | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
deleted file mode 100644
index d037a74bfa..0000000000
--- a/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "RDFLib is a pure Python package for working with RDF"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840"
-
-SRC_URI[md5sum] = "80d7c6adc2e4040cdd8dade2e0e61403"
-SRC_URI[sha256sum] = "78149dd49d385efec3b3adfbd61c87afaf1281c30d3fcaf1b323b34f603fb155"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-isodate \
-    ${PYTHON_PN}-pyparsing \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
new file mode 100644
index 0000000000..47cdc49d97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "RDFLib is a pure Python package for working with RDF"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=89aa9a14f80a6ac70e1d5da763a309ed"
+
+SRC_URI[sha256sum] = "7ce4d757eb26f4dd43205ec340d8c097f29e5adfe45d6ea20238c731dc679879"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-isodate \
+    ${PYTHON_PN}-pyparsing \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-xml \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

