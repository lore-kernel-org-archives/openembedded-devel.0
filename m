Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.12750.1586703822393193614
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 08:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=hln/zy8O;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 8737D600BB;
	Sun, 12 Apr 2020 17:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586703818;
	bh=3IiISdocMhHqvoRHzvs18kW/t73x2cL7xZE0VgY7MhE=;
	h=From:To:Cc:Subject:Date:From;
	b=hln/zy8Oh8sot/xtEex7nV6W/Y6Y4Y7D7C8dtBnacp4/UoRi1heNgoebizcvQ1FFv
	 xL5FAu7oP86aj+Nn8CazY5e2pcO0Sy6UV8WiC1QCrbp6qkbZKv8uE2VzJvc4rlw55x
	 o+rDZBwlagpiOk3t6OPkAweMhqfgkD3VeJIcMpL+YF+8RJdUKThZ6oRGzq4KQjyWLu
	 k4AyiaVLb40peCtSi1GTSEjTgkKfq1M/e9CzVYNnr+qnfqVMip4LmYy2wXx/PlPgYq
	 BMBwDmbXNuh5WVFXPW/CKDJUqkVafAjv6x3/JZA0HsQDKf4gWqKcccaJ60oDN3t+rz
	 Yxgkp0/nZAFsQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 1/5] python3-pychromecast: upgrade 4.1.0 -> 4.2.3
Date: Sun, 12 Apr 2020 17:03:30 +0200
Message-Id: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/balloob/pychromecast/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../{python3-pychromecast_4.1.0.bb => python3-pychromecast_4.2.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_4.1.0.bb => python3-pychromecast_4.2.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_4.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
index b79e795..f561753 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "46fbd33212f3869c5dc2d8b4a1d667e5"
-SRC_URI[sha256sum] = "b6979f1ddce1ff8760586aa6b8828290964b38f34c01aa1380ab1740330eeee2"
+SRC_URI[md5sum] = "56632e0d94f2648a29d89affddddaaec"
+SRC_URI[sha256sum] = "d7b7b35254203ab4617389061bee25b0fa67c6628c48bd6a75ccfefef74f1edb"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.7.4

