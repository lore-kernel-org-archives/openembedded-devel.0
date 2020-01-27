Return-Path: <prvs=288f39d4d=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 71DE17FD6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580124327; x=1611660327;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=k723xvzT1Yn9i3nC6m4qiNcrCM/YVKPnaqAGr0LiVLk=;
	b=KI0tIr4/eHwozBfgYCxR1OAvVH1JnaC6FkcVe1L6wHP79C0rb8Y2nneg
	KeKIQs6ugafAd1Wtf0wNhihLTXpMqp2sIYAUIofmYsQ4r0n+ekYYBIzv9
	W5r/9Wi14Z3FfpGFM57/EpJr0TeGRdBCNZPWQOLUGiUzj0uOCV8nSWLj5
	E4QTD3fk2CHPBFCVMVt94ooirTgpz1PVPxdQwDn2UTo9nbLXXX/9pOO/+
	lel4fmPSYHM+cPodH7KJWuRnI+gpmftQIeemR/LWjfUZHIt+itqEIIChz
	DUFGTI33Qvi79wtQY9BGci4AubayM8XV3yojkU3RFQcsaDnpVZsBFP1yP g==;
IronPort-SDR: 19GK7Ss3ETz8s7D7Ne32pbfSK3MaPmm+qpBhMECoj7CqHx/JeIIPvKtUuhjBL7p3DOnbGs/e75
	tY2A4zCwn/qIZjuCZZl3iLd5l5IKt9/DJbKkE2ZG7JR3U+FKoP6gpNKtRoKox4+AfDuAGPeO5l
	e8MVHvSeqsVIcBW9nqOdcnAPi4YsA5psS4iRTMvKskUizYhx3g5J5kWtoQFPk726Lb214+6vZ9
	zdMmqJcQteEyDPntO1oaXW/QLowO0plJ4nFybQE8D1Z1wOQosq9ldfvmzjvzifEYGadEvQMDsF
	XQk=
X-IronPort-AV: E=Sophos;i="5.70,369,1574118000"; 
   d="scan'208";a="2501324"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jan 2020 12:24:50 +0100
Message-ID: <20200127112451.165555-4-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127112451.165555-1-richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 3/4] openjre-8: fix debuginfo fixup in do_install
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
X-List-Received-Date: Mon, 27 Jan 2020 11:25:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Based on a patch sent by Jacob Kroon.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjre-8_242.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_242.bb
index 4ed2e6b..2c8a6a5 100644
--- a/recipes-core/openjdk/openjre-8_242.bb
+++ b/recipes-core/openjdk/openjre-8_242.bb
@@ -11,7 +11,7 @@ do_install() {
     cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
     chown -R root:root ${D}${JRE_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
-    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
+    [ -d ${D}${JDK_HOME} ] && find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
 }
 
 FILES_${PN}_append = "\
-- 
2.24.1


