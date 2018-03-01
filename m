Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7BED378889
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 17:52:29 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id a23so8647021qtn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization;
	bh=LcN8zL6N53vO5lKXXamLc/Ol5FNFYi2ClxCrzPOVZw4=;
	b=cxGwglfQXfF4zHpIYfizdzV+2L/rlPIuJbYZ28+KuUyMQY0VPytO8ALZ1+3sMQGC1q
	q4/IzT8PbDvZ+QpblSFWc1UccPmneAlEJPOqjuqAara5y+bDqCZab1qPUTL9tl5Q/Zs+
	pfRICNOgQxNxrRILbt9yLjhT0yUeXmkeC2fw5sHV4MSlxS2CxoPUlISIFe6GDJ5b7WlJ
	of3F7wIZiD8M7N7l7V5qKPsZC1A7qNdfMbsrbjSIX1Uv9LAgQJtweSZroEwwQeaobXyV
	2nAaToynCZEn2BMukEWMfnwDclGZDKP2ZlwhhtYO1mRg8K0WZMz3/68LVYu8CJAKoyAX
	SHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization;
	bh=LcN8zL6N53vO5lKXXamLc/Ol5FNFYi2ClxCrzPOVZw4=;
	b=Qao5gswFSxRoYXs4cMMYQTgK5gY/6mHBW7Nh3qf9tE0MJoH2dRGJB9BJirvh6BqJv+
	qffs5DLXDBS134qdMmkz0F690eamjBN0T2+jXHW6ogwxRN/jECr2xoLHdYGWXmIuewFC
	K+y3GEsEMGhHs8qz4H/XaprkqGJjuNuba9DOPN4RM+63ptadRPHSZLk4BkDBFPRD2A09
	lWJOXnqnpIJA5z1kpRIo1EiuQ8T8B4+tsRRyRBeQuEI4CLczBJ4C/UY8kD/t8lPTC/WQ
	RHlsTsDXTTfSoLbTckLPIpi2oCL//dP9IKEclHvZPcB4HsrjIZYI4O+s/ovCFsyKowRG
	Qc3g==
X-Gm-Message-State: AElRT7GfeqwBggAe3GViFxgM8WaBKiK/Q1fnv/HaOeWb5Kay2vDN60qB
	oow9H7/FfzeG0kRfmDrfqPKnY3UY
X-Google-Smtp-Source: AG47ELvw4zpHAriooaaS5tWcMM1EdTTuBjIkEHwXqtqs4sW3VSp/M2VMU+CNYF8qTx6ZL1qqUePleQ==
X-Received: by 10.200.53.220 with SMTP id l28mr4253271qtb.273.1519926750185;
	Thu, 01 Mar 2018 09:52:30 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id t38sm3318389qtb.4.2018.03.01.09.52.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 09:52:29 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 14:52:15 -0300
Message-Id: <20180301175215.23791-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [meta-qt5][PATCH] cinematicexperience: Add liberation-fonts to RDEPENDS
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
X-List-Received-Date: Thu, 01 Mar 2018 17:52:29 -0000

Install liberation-fonts package to show cinematicexperience fonts.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-qt/examples/cinematicexperience_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
index 0c53573..7f921d8 100644
--- a/recipes-qt/examples/cinematicexperience_1.0.bb
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
 #S = "${WORKDIR}/Qt5_CinematicExperience_${PV}/"
 
 DEPENDS = "qtdeclarative qtgraphicaleffects"
-RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
+RDEPENDS_${PN} = "liberation-fonts qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
 
 require recipes-qt/qt5/qt5.inc
 
-- 
2.14.2


