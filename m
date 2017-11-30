Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0B178515
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:00 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e14so2577235pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IDGXEklN0iAvW7sCkR1SXT+tuworULLC/0XTCshcEhk=;
	b=LAURasTLRld1sR+fOYQrCHgx6tKbeXCnKtZGWEklOA0iXqQcRpINPdB47oHCTEUm0R
	dKOGLKCVtO5dat4n7n+8U4mbBhKdNrYXLBndO8LA6lsdMY7chy9KrH3UY38hnzqlOuXb
	+WP/yv8CG3HirUMEcaQvKIC2KYNa8lfGfzX6C+jiZiyL1/r2cILtUqFZzZf2mX62IoRf
	o/4poHDke8w+ipMg5COxNJn4KT0NI0r43Qt0zsA10iUfmQE/xEu8BZ5ZIbEyyjJr/9Jk
	CUOmGcnb3FGI62WH728KkTUeqWEjvWAamLMr95k04OwFxuqCUbOMCdLYLZNwCrYfnahC
	+oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IDGXEklN0iAvW7sCkR1SXT+tuworULLC/0XTCshcEhk=;
	b=U+Fwc7OTrntrzFpGH53u0CJe5CV9OoApQUf4kLqna+jmnjcr1qEztFi5LCmwgqRGXC
	iobF+XbUfYCF3Tsi9/lFiEl2fcLv5PGaoTaN3ej6ajCtT0qnxgIsS2uru5uaFqdj3CiW
	gy/5TRrVplgCmvnwyYhxupQencoUbeMAcqtRqyVvgmosFv9+Nm1lkR5AUOx9wh+mkz/H
	RkZj/nBj81gq76r4H0zamnbCvNG38p7stEBOnreYUVhGnwUjCYEYE5LPvuHemW4Q/hew
	wZk1Y01b4r45m8vVAfLZBuNSUUHhoySRr2kXhSrSaZ7IFSLa+EtC/EPwVxHStqdUjtNn
	m44A==
X-Gm-Message-State: AJaThX5LPW0d6Gj+kUymPmUrhYxdXvs1kqAoYRYkUIB4nRcqgmt7L0G4
	uSniRq6N1ltzJT0pyS+ETpY2cA==
X-Google-Smtp-Source: AGs4zMbBsilhLIqbTRQqE6fcx3rz9VFDb9YtbZX8GjsvgvTJ0X1V18z5N2Vor88nJvjdw5lx9Wh1cA==
X-Received: by 10.101.90.199 with SMTP id d7mr1299919pgt.265.1512020881303;
	Wed, 29 Nov 2017 21:48:01 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:00 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:00 -0800
Message-Id: <1512020828-4040-2-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 01/12] python-dominate: move core of recipe to a .inc file
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:00 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-dominate.inc     | 11 +++++++++++
 .../recipes-devtools/python/python-dominate_2.3.1.bb        | 13 +------------
 2 files changed, 12 insertions(+), 12 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-dominate.inc

diff --git a/meta-python/recipes-devtools/python/python-dominate.inc b/meta-python/recipes-devtools/python/python-dominate.inc
new file mode 100644
index 0000000..ecf74a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dominate.inc
@@ -0,0 +1,11 @@
+SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+
+SRC_URI[md5sum] = "45bd97e6f7888aac24ae86013c57638e"
+SRC_URI[sha256sum] = "4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+    "
diff --git a/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb b/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
index 13ebf92..c19445e 100644
--- a/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
@@ -1,13 +1,2 @@
-SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
-
-SRC_URI[md5sum] = "45bd97e6f7888aac24ae86013c57638e"
-SRC_URI[sha256sum] = "4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-    "
+require python-dominate.inc
-- 
2.7.4


