Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f170.google.com (unknown [209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id DD11565F49
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:17:12 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id lf12so2094140vcb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/VGEl2twr1i1aYwzULfaTRcXVT2Qsw9yPtN1I6fJyDc=;
	b=ftvVGe/VdZooJiaIDL8jNqHzHhdBBzpEuIM+pwzFt3seCbUDvS9wJWicvkGf2h113L
	MXsyQDVrEM4dQ///ap/SjcgsczyGa9NgjWrXTyoS+RWqz8sKIM7zlnKMjtDuc6QPtBA6
	JuTskYhM7wfekqcC5zh0p3tILQkFrNWHj2EXwJK7hIwo2yVcaTfHU750FFcwZ70ZFXGD
	DqYQ0lyxUJLvVOEv3yrGTOt/wdTRxHAc9imig51xZepsRrpa8WZjPDjG/W40f+VMEJDH
	G4zpEZ4KejQDAYZmt3oG8srsxs10Kh8m72RLUit9jzC3CMlvnGairoLvqkFx6okD9epd
	hzUA==
X-Received: by 10.220.167.2 with SMTP id o2mr2187008vcy.8.1400059033439;
	Wed, 14 May 2014 02:17:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ix8sm2269347vdb.18.2014.05.14.02.17.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:17:12 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:17:38 +0200
Message-Id: <1400059058-7158-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][WIP][PATCH] log4cplus: use better file for LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 14 May 2014 09:17:15 -0000

* simplify SRC_URI
* INSTALL file is changing checksum

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
index a5a827a..20b58fc 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
@@ -3,11 +3,10 @@ SECTION = "libs"
 HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
 BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://INSTALL;md5=0278479fa183a2ff8ab216669424b764"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/log4cplus/log4cplus-stable/${PV}/log4cplus-${PV}.tar.gz"
+LICENSE = "Apache-2.0 BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=65053a46f707ee2b93f09ad22f692170"
 
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "104bd6dd07ee71bc52ee9adca4d4d5fc"
 SRC_URI[sha256sum] = "96905e763fc6f1e3a854c3d1964c21e877de909bdddd0aed99806c62a68be838"
 
-- 
1.9.3


