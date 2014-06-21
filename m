Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF856FEB5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 17:21:45 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so2163634wiv.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wNPx9MRYJIscmipkgTFNzi2X045ugqPaAPn+wveHFFA=;
	b=ZcnJK/9TNLv3XfMKJjb2HvaOXyl3ZOs3FR2enKEutYwsQRgNQbdRaZDaav3eTZuruz
	pNrgOWX2aMhAG2pC9DOPeZVPmcakI7PKzSVaa8Pp99An+vlTDJJjqKlY3UOSUa0hoe1c
	texQTNe0vIlX4I8zRBltmFltWI196b9yRpIwtwvV2E1X0zoL3G5aO+OPXKD+C5SeFV4Q
	9M2ADnb8W/4Fr7ExImUubDBgAo9/WSAL3ZJ9e4qO1z6B8TmiQ3TAWiccU9IUu/xEQlgV
	YRUB9O3jsg9yZT9GkjJ6FrlvcSM9gMbtgLYyNc7MB+xY60rM5Rq+fAfleLi6hnSUM0eb
	M4Gg==
X-Received: by 10.194.5.103 with SMTP id r7mr13614425wjr.41.1403371306288;
	Sat, 21 Jun 2014 10:21:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq7sm15751325wib.7.2014.06.21.10.21.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 10:21:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 19:21:47 +0200
Message-Id: <1403371307-22839-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH] python-cython: upgrade to 2.20.2 and fix packaging QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jun 2014 17:21:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/{python-cython_0.20.1.bb => python-cython_0.20.2.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-cython_0.20.1.bb => python-cython_0.20.2.bb} (75%)

diff --git a/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.20.2.bb
similarity index 75%
rename from meta-oe/recipes-devtools/python/python-cython_0.20.1.bb
rename to meta-oe/recipes-devtools/python/python-cython_0.20.2.bb
index 6c7507b..9f357ec 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.20.2.bb
@@ -10,7 +10,7 @@ BBCLASSEXTEND = "native"
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "52431696c64e618036537c4d9aa79d99"
-SRC_URI[sha256sum] = "31a563744a21d7b10355f25a3bca96b37ec5d32bdecfc75e93d65a5f7e62766c"
+SRC_URI[md5sum] = "7fc13e1c665bdf7cea19ad08906af91f"
+SRC_URI[sha256sum] = "ed13b606a2aeb5bd6c235f8ed6c9988c99d01a033d0d21d56137c13d5c7be63f"
 
-inherit distutils
+inherit setuptools
-- 
2.0.0


