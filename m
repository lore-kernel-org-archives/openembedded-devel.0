Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C59160746
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 14:00:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n184so3244688wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=d3t+3f39IhOonJ9sLKD/PgqgRXFKEfqs8/nnb2MHpQ0=;
	b=RZsl4miEVdZ1H4CkU0wDZhifrl/65XXOLSyJVU9x2o3xKbSRApK+C0APLU/bD5Kgqq
	/uuLrKf+EU5D6Tyr85AV3bZXc/RB9lD8w64ebIrU5f/zT48ERRKwvC5CqedLwjLVGrR6
	X1KRPEh3RiPeY3Nza6rCTX5HSGWcXoyA3/ez4Pn9IX4EHo0P/9qVIjhvJHvczPWo4rVq
	+OQHi+9SIRBz9reBlRkqVz1oP4lCYGIRtj4EXYB4Aiu6PYGpV0SkSYQDmpz0/imlM9hH
	3IWprAIpfyMJl8EaKWeOVcBzoYgeGrC4PgEwzhbikChmgZRDLrghJhn92n4zjTJ4+Ysn
	uHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d3t+3f39IhOonJ9sLKD/PgqgRXFKEfqs8/nnb2MHpQ0=;
	b=BYwsf52gQ9KEJg/NgRN8wXv6JdwfBPaILjV3th4MhaGChFnO6onU0oM/MIXtpdYkgW
	oRH7tWYdXHfoP7j2EGP5WUvdhCQgg+vADLcHUW96H4K11yZI5brigD0ewYVeMoSSrrUT
	qPwmrdfJv+yqwbGB+m/tiQKZ/UnRhcsUP6tPPgiAc3inm2ljOIg6R0IfO2KlBg/6JGl6
	FDOc8EgwnEwJJrWs9430SW12oIeEXNSWeYIEAEnERY0Y2TOh7ZEP7nmCkjs/VQhnJU44
	pMq1MhFi3JzWwBzHS8cYC5V6/9cyOSafk3JbxUcwVmyREbry2ZDmkLBZLhBEr24SnmV1
	tVpw==
X-Gm-Message-State: ALyK8tKmPzsAKhZ8XmtaPFDeJaIzNtnbJvsG7vmRJZUpiXGBZv/fo9cPbOAEQJEAwRHO5w==
X-Received: by 10.194.58.162 with SMTP id s2mr5400964wjq.37.1465394400530;
	Wed, 08 Jun 2016 07:00:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b77sm4987608wme.0.2016.06.08.06.59.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jun 2016 06:59:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 16:00:18 +0200
Message-Id: <20160608140019.6787-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCH][meta-qt5 1/2] qtcharts: Add dependency on qtmultimedia
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
X-List-Received-Date: Wed, 08 Jun 2016 14:00:00 -0000

* fixes QA:
  qtcharts-5.6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-examples rdepends on qtmultimedia, but it isn't a build dependency, missing qtmultimedia in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtcharts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 5aaddc9..99d1471 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
-DEPENDS += "qtbase qtdeclarative"
+DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
 SRCREV = "8a781841812a42ed728a76c0dcdcaa6196eac44e"
-- 
2.8.4


