Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6D777E13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 15:16:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d127so4317286wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fX9ljYDPTeK3lvL6MXl2qswZ/dlRQnI2EkKq0+agCRw=;
	b=YJ+FrU66V9u0X3VLTWTdLOk2K0g+Qn01c7ls86N4hmbG5W21wXbogMMJci9km2TroJ
	oBkWEN2PHKuwafTFubXTn2IDgnDl5HCIRFOBtLif0dNiNwrmzWrjkn9q7+IrllKC5UvL
	DsR4d+XU88Y9M85ZtXQLsbZnhFdRrlG2nw/bI/EDrNVqOC+6v97mL3nqx5CQX9JcA2mv
	9qVso8MHorSpjokW+a7mkSToITGKDAOP6dP3xb0V197aIYFB8vkwY9cWWweb3yCc2kiy
	lZRNnU0oi9IDPWGrQRomBZ5ya8qNRTV4voV7DdVW/ppiS4zwqJzun8urvLxc9lK9SNEF
	6Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fX9ljYDPTeK3lvL6MXl2qswZ/dlRQnI2EkKq0+agCRw=;
	b=WY/oXRX0ZPceEEY0odMn64nkkxLqIsU8lC/18OG5DBDajBnd6MtrPduwafdU/y7GrM
	ZENwuIAwgPPsx+1haB9rjiYB4uPHt0THKn1J86Fkys/sspO5m6ngxEcnJz5WUtBhJ7XI
	5LQTewVFtTRvkuNYYaS0Lh1CHA03MtvP5hw78WrL2xkGcrAVmLAETU5Et/q5cuOil6w+
	kHNf3a6voY+ssKiJr2CQH660gcxKh3OJQp1QQy3H2+Ihs39OLSrO9vnnb6sQ01ZcIsxF
	LBZ89Necd3ejbOjTJZkUSzxSb2gkmGu3lcC0VqBTVMhqFAnOfdj4pbi3hOgbLpvjj0J8
	b4Uw==
X-Gm-Message-State: AODbwcBqvxik5q89OA5eki5/3cMbTyssjlM6ASTXp2WVzXvXger69J6G
	s85EJWn7VD0+6g==
X-Received: by 10.28.84.67 with SMTP id p3mr2725174wmi.40.1495034194282;
	Wed, 17 May 2017 08:16:34 -0700 (PDT)
Received: from localhost.localdomain ([37.159.50.168])
	by smtp.gmail.com with ESMTPSA id q16sm3374094wmg.2.2017.05.17.08.16.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 May 2017 08:16:33 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 May 2017 17:16:28 +0200
Message-Id: <1495034188-28333-2-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495034188-28333-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1495034188-28333-1-git-send-email-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] wvdial: inherit pkgconfig Missing pkgconfig does not let build the package.
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
X-List-Received-Date: Wed, 17 May 2017 15:16:39 -0000

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index f7adf4c..3a71fb9 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "WvDial is a program that makes it easy to connect your Linux work
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
+inherit pkgconfig
+
 DEPENDS = "wvstreams"
 RDEPENDS_${PN} = "ppp"
 
-- 
2.7.4


