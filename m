Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.13104.1586703822464580661
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 08:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=D/d0iyUD;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 165E360389;
	Sun, 12 Apr 2020 17:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586703821;
	bh=S9uXMl5Rjm1qXMgZIEGdcvlClNzbUbkEH5Sba5tpHUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/d0iyUDmCCoADdoZGsqdryFtGmq0XU4o3BYDSb6HThDTsrMnPlKnHZw/5b0axrEj
	 ak9/rejYdEk9Ej1o5uCNWgN4t1edy2CukrH9JD+fzcAZeN0DlYt5YXhDZhjVV2k5q+
	 UFai7pHOCaXMtsvathNi7ZpkYgkbsQKQrg7lSIp6sW5ELHiQi65trGpGU7vRZYVVyq
	 N1l6ZRUCP6KCBSOiat7agXIs81bDQCHTF8XLUyMU4ZC9Ux3vti5BGpF00K9lSrTUms
	 ZJJknOIrzFi9DuISy8CQXu4fRzJrQvftQ5TlpMRnxppYtTdcqu/A5xnp/dbyrChN2I
	 DqavWkp3GtbSw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 4/5] python3-ipaddress: consolidate into a single file
Date: Sun, 12 Apr 2020 17:03:33 +0200
Message-Id: <1586703814-15536-4-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>
References: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>

For details see [1]

[1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415

Suggested-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-ipaddress.inc    | 11 -----------
 .../recipes-devtools/python/python3-ipaddress_1.0.23.bb     | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ipaddress.inc

diff --git a/meta-python/recipes-devtools/python/python-ipaddress.inc b/meta-python/recipes-devtools/python/python-ipaddress.inc
deleted file mode 100644
index 129cf22..0000000
--- a/meta-python/recipes-devtools/python/python-ipaddress.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Python 3.3+'s ipaddress for Python 2.6, 2.7, 3.2."
-HOMEPAGE = "https://github.com/phihag/ipaddress"
-LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
-
-SRC_URI[md5sum] = "aaee67a8026782af1831148beb0d9060"
-SRC_URI[sha256sum] = "b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e020e7e2"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb b/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
index 77e9787..796213f 100644
--- a/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-ipaddress.inc
+SUMMARY = "Python 3.3+'s ipaddress for Python 2.6, 2.7, 3.2."
+HOMEPAGE = "https://github.com/phihag/ipaddress"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
+
+SRC_URI[md5sum] = "aaee67a8026782af1831148beb0d9060"
+SRC_URI[sha256sum] = "b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e020e7e2"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

