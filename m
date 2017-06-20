Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4520877E78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 04:30:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f134so2850213wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 21:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2ihTh5oJNosyRRJj/gleqNHXbxqZWyGOd0KXEaaRVxM=;
	b=hMKlZ0aiPV1JmrOEa6ATWrANlJwkFYgaJm5bpWcuZmfIAFxaAuTBV6x/n3jBzSjmXJ
	J/cEcpL4PH5SDEk7egpEZxBxqgMhn+tJLnmePdUZKoBcrWn8YLyV7bOutyqoEt8iZ332
	36PhH588F+Gt3ynm/UmZfjsL6V1uHiO0mFu5dcxo6v2uFJ6kZ4GlSaohDKU8soelMImJ
	y2zeLSxJHXOly1vhANrqx0E2V7eVvMGJJRNA7qTet39BToEajoy9Z0uhmJFDp2GFSbvn
	3d2AYX1F/LGVnvYjp8JYGeBsjGnQ05BJeRZ5gwQXjz3ACleK/ag1vCzbvFX2/mfu77MY
	zXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2ihTh5oJNosyRRJj/gleqNHXbxqZWyGOd0KXEaaRVxM=;
	b=gEzLe7d5fgH09Iqs5O0quU16zJTchHosCTUMQ/3JYMNKWp1s95jD8SItv8R7ykKRho
	87XlSuHU7Tfu/aPtMfAcfUy8sl2Qc4PKG6r/pxhPhhkLi/wfIj5214dECMFIB6oL+jKb
	qXHuHKkzzsnNxkce2pc3c0Oqn3MnWg/3XlZlw976Vsv/4Mdq5/U1ZO109ir5dM4XbR6b
	MwAmLhnvnkCoebEqottK6kbtcnAWh9FMCzSqCdQDXuydUz0mR/N6TYJacAMSQBP5c1p7
	vwuRAIzf/Y2d22uikh1OtffY6Wq4XctzGLPG45phTschmuX212BRG9u3nKtFmrJNAxWm
	E3tw==
X-Gm-Message-State: AKS2vOyRw335BsltaVcUogspLUu834MlyZpkgQ2DJP/SUBkoNOFgL9te
	re3LKjulHHmDx3wr
X-Received: by 10.80.157.71 with SMTP id j7mr19528097edk.4.1497933042325;
	Mon, 19 Jun 2017 21:30:42 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.84]) by smtp.gmail.com with ESMTPSA id
	k44sm6056238ede.16.2017.06.19.21.30.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Jun 2017 21:30:41 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Tue, 20 Jun 2017 06:28:32 +0200
Message-Id: <1497932912-30016-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-qt5] [PATCH] qttools: DEPENDS on icu
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
X-List-Received-Date: Tue, 20 Jun 2017 04:30:43 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This fixes a following QA issue:
| QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicui18n, but it isn't a build dependency.
| QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicuuc, but it isn't a build dependency.
| QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicudata, but it isn't a build dependency.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-qt/qt5/qttools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 5c0f51c..1108390 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
 
 inherit ptest
 
-DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
+DEPENDS += "qtbase qtdeclarative qtxmlpatterns icu"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.7.4


