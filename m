Return-Path: <gary.bisson@boundarydevices.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 562CF731F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:47:32 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p65so15958649wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eop5xuY7JAEeaIJz+1f4HdVx16dt6AIBfkzakwD8r4k=;
	b=xeQTn1pWOdO6yoVMGei+h29wN+WGpSzQZ/0O2hx7JDh6U3WakkvZKaPZ9+zBBIw9n9
	qurV3TSukDihjKyianwQA3pSfCKoa/Ayj4SzvFJeLnOkAcsfsW4Z53ZxAZAx/7xT9B2W
	10rr36EzZQBDTR15+qJuWZWj4+jYUvvx1EIKTxPyJtNzj+hPLAsmmBNdxhnk50/f32YB
	rbZSh0RFyMEICsFfMlZfHz0t+gtrDV8IfmxhX6s4ARGRNZQx04HZXZFlfQ9d1JbrZ+Dd
	ODsrUUn+4VFCpLhxxI2DkD9A4LQPG3XU64n8271ws83StumrlRhOJ6mMcqbSK5ESzp5w
	1zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eop5xuY7JAEeaIJz+1f4HdVx16dt6AIBfkzakwD8r4k=;
	b=Hpu12ytv2L7uAU8A8WfKpgSJ8vTA8s8VybQP5l5uEkzaZF8rkNr47d6eHaE7DInn4t
	tW260Ghaaw3rUnCI5NkvNstTnR6rE0dH9/MwoZ5PGuq47+uPYVYNX3/sYc7USOSE4xq9
	n/IK25p+wKtyLl02mi9+whqZ90SBW74QmVQlgUD+vtVpeLJupaTAO+1v4ZJMpsKL1idE
	JRWoyKOKoUmVci827b/3WnU6fQeUT6/80uQmHsYnaZzbNdgVJqs5t863dWfygUNkg3Hm
	AfhhEQblSp3PZLU8nF2WPv94rqgsCDlQUbjzLYF1OktdyoVqDPGGg/qBBetnQ7UwhFGv
	C0Ow==
X-Gm-Message-State: AD7BkJJkTYPKmy/MMFxs/PIXtNd+8LE9OtqtqSg/Qj+G6yswDo3EefkFpcMxT6jUKav2vw==
X-Received: by 10.28.99.6 with SMTP id x6mr2944338wmb.46.1459504052652;
	Fri, 01 Apr 2016 02:47:32 -0700 (PDT)
Received: from t450s.lan (89-92-156-188.hfc.dyn.abo.bbox.fr. [89.92.156.188])
	by smtp.googlemail.com with ESMTPSA id
	lz5sm13225506wjb.5.2016.04.01.02.47.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2016 02:47:32 -0700 (PDT)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 11:47:29 +0200
Message-Id: <1459504049-29180-1-git-send-email-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.7.0
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [meta-qt5][PATCH] cinematicexperience: add qtbase-fonts as a runtime dependency
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
X-List-Received-Date: Fri, 01 Apr 2016 09:47:32 -0000

Avoids the following errors at runtime:
QFontDatabase: Cannot find font directory /usr/lib/fonts - \
is Qt installed correctly?

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 recipes-qt/examples/cinematicexperience_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
index 116127f..5194b10 100644
--- a/recipes-qt/examples/cinematicexperience_1.0.bb
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
 #S = "${WORKDIR}/Qt5_CinematicExperience_${PV}/"
 
 DEPENDS = "qtdeclarative qtgraphicaleffects"
-RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins qtbase-fonts"
 
 require recipes-qt/qt5/qt5.inc
 
-- 
2.7.0


