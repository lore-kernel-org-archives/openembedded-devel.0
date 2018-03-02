Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E2C896E660
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 14:06:12 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id g2so11982324qkd.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 06:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mi1Cuai2xFCxytN7V9Yp3UseLDhfpyz0ke+kCXrX9cM=;
	b=nfY5AWVSwMBzHhB6brvteq5MraMCBvSjQoiOIX6SwCO27vGP5L5vxZbLDQ83NlZPN5
	gcLuYsZ9pVdb3eto4o+2ZERhOS66YTYfqzXP4aiq1Hj9AuBQ3tLUJD/YghmRi8UdryNS
	iKlDxntGKCCQGclv5Je+MxRbvew1hf4wrcEOD0PyUvP+H76nacH9CZe4DUaRvGZ92slj
	gnTq7Exdt6fRcw17aV4/GZH9qaVuFO2C2bBTKobqS/PM8iLF+t7Wi6TCPkKkqPy1CulZ
	HaHGDOMeuoDcSKcrgkahOulRV23E0JA8mvwAWBqmBAfy4jx9mqM2et+F91GC12DpvixA
	SS6g==
X-Gm-Message-State: AElRT7HLhjhuksi+amVR9yP/LZy2IUxXGNHVzCFpsDBBwlMOoYoP+iAJ
	ZFIqH0qLUJVgzOKQaaNJfx1N9UnP
X-Google-Smtp-Source: AG47ELvQDS6FWlH0lR8jE+FATj3t7j26Wfccs2C9ciSh+rjyoUni7b6+JjfUqiWG3G8jSxtSRkEAgQ==
X-Received: by 10.55.189.196 with SMTP id n187mr8281093qkf.141.1519999573611; 
	Fri, 02 Mar 2018 06:06:13 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y14sm4881179qth.84.2018.03.02.06.06.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Mar 2018 06:06:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 09:06:01 -0500
Message-Id: <1519999561-9599-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Fri, 02 Mar 2018 14:06:13 -0000

Update the license checksum and verify the terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6 +++---
 .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
 .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 2683a6a..0c191ae 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
-SRC_URI[sha256sum] = "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
+SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
+SRC_URI[sha256sum] = "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
-- 
2.7.4


