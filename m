Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2005171DAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:18:51 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id n124so142737580lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 02:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pwciK4nVEtKnS90DOr3yNbiKsPeO2vFBT5x0LAbx4qM=;
	b=dt5zJ9Aakh8gSbI0MRdfkieUplv8dcQEChjpLdurTHS95+LHCCqBq0/OWMilmDLeik
	qvBO5bxgso2AO/HRBcDIB/E/rMBDEfW0TU/gdHrq/upia6ird6NxfLoXthUXRiGHPnYv
	fBmMnuPQjzv3AdQqs/iKOIu9hKKID1fTh+XdYK5NEFAH+Z70gAVb7RVdbIX8DRR3s86Z
	+DS4Bdd4Sx5y4TuLEaoRHO4ALP7tavilNi6X3QNB5Pmq00Omg+2+0gqgQhwy8G63xfUx
	TzjS3Dzaz8MnFx/RwZE6xKIcecvy/CYLvBvF57+phKR0sy5BYeVNMc71Mu5GyFWx+LtU
	XYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pwciK4nVEtKnS90DOr3yNbiKsPeO2vFBT5x0LAbx4qM=;
	b=opgEKuAEulPoZ53lJnFoGVdhzkyBFzeYDydbKRxl7TkVM1ZLcaQfjuEFNPId6Jc0O6
	2orpA7ohM6aMO5eehZorvh+ipiYImTwSWRtorLPOCcOadk7VOgC+5fWGmyV9/ebp/fvx
	vkvfXs7b//scLttcBDhE8TKI+BgiVUf7KtbYDXci7BbPBBnypII0GtYMEpVWwgxH97Np
	8d/fZTMzHMY9Dnkz+wIUlxf6J/dUV4CxMUkwsZO5sCQznorNdyqpidCbn2LGomKBI3ZS
	z3Hmen0NRSZ7IdE+PzFoPTZOo28m7lmnzIOM4SowWziz1oxAyaXXTlgJReet3v4fbERz
	LsUg==
X-Gm-Message-State: AIkVDXKXaU8rPirvvuAgPY45oospHvrcMMR3zso4QEM2uNnFqZ92eAeDFkDNXz73PzHIi2Fp
X-Received: by 10.25.136.8 with SMTP id k8mr577962lfd.47.1485425931734;
	Thu, 26 Jan 2017 02:18:51 -0800 (PST)
Received: from gordanmarkus-XPS13.office.pelagicore.net
	(c-5eeaaad1-74736162.cust.telenor.se. [94.234.170.209])
	by smtp.gmail.com with ESMTPSA id 87sm343467lft.27.2017.01.26.02.18.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 02:18:50 -0800 (PST)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jan 2017 11:18:35 +0100
Message-Id: <20170126101835.1011-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qtwebkit: depends on gperf-native
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
X-List-Received-Date: Thu, 26 Jan 2017 10:18:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index d679994..3d2dbdf 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee \
 "
 
-DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
+DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-native"
 
 # qemuarm build fails with:
 # | {standard input}: Assembler messages:
-- 
2.9.3


