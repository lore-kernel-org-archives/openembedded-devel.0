Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7266B730A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 15:03:32 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s186so11277301qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 07:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D2MYIRcqJo6e6No25AOyeAZLiA73K6h6A1PqDOWQvTk=;
	b=gY6Zz4QmHITSjN1jJGFSKZmw4MIFitqQOV2PTqRb9n1uAGQp5to4oIDl2mh+uneuQs
	CF5TzEsNm6JDCp5kpjhTIHgvJzOQ+Gu6rIWn/+TpS/b58s7FBJQ1D1pcqbbBoNt/sE2S
	Mec4Zbm4qOonAi5M/tsTpqj8yXk0iNRv1ZXIFE31M7SJelIklcNETOq9J41zh2ijs25o
	VuCujahQuPV0qHXdmyIbVlCiF2WETFI+Xvz+ZO2r03CgHkX2SUoxSDc9BjHoumSHaOEy
	vtO0BW5uHv94Zm755A8OjYddbVvVmH8GJBEvfDaK0zDHf4fpd6O+g8szxWAf3IldcAbe
	J5oQ==
X-Gm-Message-State: AMke39k/QnAUna1UOp0iQl+H3fTwq9xYz/Lo/9pMflviIlxCI2r2UZkzna9nazsbMLJ03g==
X-Received: by 10.55.79.140 with SMTP id d134mr9493978qkb.120.1488380613929;
	Wed, 01 Mar 2017 07:03:33 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	s22sm1286786qts.10.2017.03.01.07.03.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Mar 2017 07:03:32 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 10:03:24 -0500
Message-Id: <1488380604-16151-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.6
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
X-List-Received-Date: Wed, 01 Mar 2017 15:03:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc            | 5 +++--
 .../{python-sqlalchemy_1.1.5.bb => python-sqlalchemy_1.1.6.bb}       | 0
 .../{python3-sqlalchemy_1.1.5.bb => python3-sqlalchemy_1.1.6.bb}     | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.5.bb => python-sqlalchemy_1.1.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.5.bb => python3-sqlalchemy_1.1.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index ec6433e..80816bf 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "50685d97dca4b91945ae6309d03ab8c9"
-SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5abf0d53d9fbd515fec4e43326f601119b6"
+SRC_URI[md5sum] = "cdd2f57967c67e174dd99342111a7db1"
+SRC_URI[sha256sum] = "815924e3218d878ddd195d2f9f5bf3d2bb39fabaddb1ea27dace6ac27d9865e4"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-threading \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.5.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.5.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.5.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.6.bb
-- 
2.7.4


