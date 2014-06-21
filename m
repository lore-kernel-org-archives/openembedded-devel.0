Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 79BD170195
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 11:44:46 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id u57so4878867wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7QcP33bWNLGAtb6lCpOiWiIm4RjdBPmmU0uNQHjrcbk=;
	b=hycZ13ojGs6wDt2YeRD+KIHX/kTwdchgGil0T3VdQwPjdp8ssPopbJq9euAoo6aOTX
	pBrmwoTp+S76C4QO/oW1mmPl0shdUeokLn/dkpAHwtyxF5DxHX1pQ8r0run5bC5sU2Y2
	FDgs8pAVcgPsnGqlc7+bd9jrhGgPqWSXsV/W9rc2L9lp4ZGoN0IQt3sHMpar+doA52hh
	vSbulGuM7Q+1UceUYvbzgNs31VQJZLGtPvcfFTAfxlkmWPec/OfXzXzUgnht61MOSDJD
	/6e6UnrNZOEWryoV9lqWMoa2adaUMdfJnyINyxOdKEY23Dha6OZW6J7PtzFyHJEDeyJo
	Gh4A==
X-Received: by 10.180.74.9 with SMTP id p9mr10961947wiv.39.1403351086296;
	Sat, 21 Jun 2014 04:44:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	am10sm21886153wjc.45.2014.06.21.04.44.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 04:44:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 13:44:46 +0200
Message-Id: <1403351086-15789-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][DONT-MERGE][PATCH] python-cython: downgrade to 0.19.1
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
X-List-Received-Date: Sat, 21 Jun 2014 11:44:49 -0000

* this is only temporary, until I find better fix for 0.20.1
* I don't plan to merge this unless fixing 0.20.1 became too
  complicated, but use it if you need to fix it sooner (notice
  intentionally missing PE bump)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/{python-cython_0.20.1.bb => python-cython_0.19.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-cython_0.20.1.bb => python-cython_0.19.1.bb} (80%)

diff --git a/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.19.1.bb
similarity index 80%
rename from meta-oe/recipes-devtools/python/python-cython_0.20.1.bb
rename to meta-oe/recipes-devtools/python/python-cython_0.19.1.bb
index f8cf245..e9b56e4 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.19.1.bb
@@ -10,8 +10,8 @@ BBCLASSEXTEND = "native"
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "52431696c64e618036537c4d9aa79d99"
-SRC_URI[sha256sum] = "31a563744a21d7b10355f25a3bca96b37ec5d32bdecfc75e93d65a5f7e62766c"
+SRC_URI[md5sum] = "df4cfb2b8e3345272e3fc451b76bd630"
+SRC_URI[sha256sum] = "0b90aaa286acdd1bf75a6dd144dfc45192f011f2c2401cf5f80ed6ab5f8bf778"
 
 inherit distutils
 
-- 
2.0.0


