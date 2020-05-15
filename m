Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20118.1589567984610983396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 11:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D14A140A9E;
	Fri, 15 May 2020 18:39:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-nKqdd6EDqN; Fri, 15 May 2020 18:39:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B8F2540AB5;
	Fri, 15 May 2020 18:39:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A766917316D;
	Fri, 15 May 2020 14:39:41 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-python][PATCH 2/2] python3-pyelftools: moved to OE-Core, remove from meta-python
Date: Fri, 15 May 2020 14:39:40 -0400
Message-Id: <1589567980-26597-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589567980-26597-1-git-send-email-denis@denix.org>
References: <1589567980-26597-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/python/python3-pyelftools_0.25.bb     | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
deleted file mode 100644
index 03d96db..0000000
--- a/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
-HOMEPAGE = "https://github.com/eliben/pyelftools"
-SECTION = "devel/python"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
-
-SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
-SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
-
-PYPI_PACKAGE = "pyelftools"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
-- 
2.7.4

