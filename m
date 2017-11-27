Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8F737832A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:02:52 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r37so31618252qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 08:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d3cscW4+gwyGWr/C8Yy9FSwslf5PR1x+2oCXQN0yQYs=;
	b=Ae28GIDXErIXTU60QLhcIAswwvPjbbwe7TN/xOiuGcdVGeKxCnYtftNqvaDWhVlF4R
	VB2DBnKQYz0Gf+5M05qCG6eJR9+iNPfmhyYEy2wteOykEI/hRjJ0+D8jQXDe1PnSWznz
	VXcUFbwZnAF3fPGC6fBHGr8HjoglxTmXg2jFcKnbJx6zPVq29IoUd8pqjoj1UnkvqUNV
	EfQ/3IN5IooqvV58yr2o8Sq7jIs9FAeNgDTSkBvM9aJjKPdsg+FaCQAY1B7GvLILQK0Z
	dL9oFoB0Pb4+fkp4eQ6ndq+qhsP5zbD2t4KobYxIq9NyXlHuLgIm5/GHfpM0CadTWkU+
	sY1g==
X-Gm-Message-State: AJaThX6+iQqgk3YSQTbCuX3fJGuxcnkjp0J3GIvKW1fa49ZTdPBFHGb7
	eQuhn9oZ/K7PW6Jy52zSF8DaphFM
X-Google-Smtp-Source: AGs4zMY/+Jz8OH82fC0NYPXTxl8T+kOthtkJ+xddXpZYDeiMtk8iGGtrobWKmSytQGO5QH4YBAnyBA==
X-Received: by 10.200.57.39 with SMTP id s36mr60984478qtb.208.1511798572868;
	Mon, 27 Nov 2017 08:02:52 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id s1sm1041690qts.29.2017.11.27.08.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 08:02:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 11:02:46 -0500
Message-Id: <1511798566-17180-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyparted: remove unneeded DEPENDS on python{3}-re
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
X-List-Received-Date: Mon, 27 Nov 2017 16:02:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb  | 2 --
 meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
index 8a15a89..81d61c6 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
@@ -1,7 +1,5 @@
 require python-pyparted.inc
 
-DEPENDS += "python-re"
-
 PV = "3.10.7+git${SRCPV}"
 
 inherit distutils
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
index ff72c2a..4d6f97b 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
@@ -1,7 +1,5 @@
 require python-pyparted.inc
 
-DEPENDS += "python3-re"
-
 PV = "3.10.7+git${SRCPV}"
 
 inherit distutils3
-- 
2.7.4


