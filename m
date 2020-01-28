Return-Path: <prvs=28964afd6=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 7B09C7FA02
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 05:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580188977; x=1611724977;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=eL7na7P5PgoeSjFGkxU3ClHnG3r3GpsQfDZPrZs5zpM=;
	b=LSNNyBJ/g4tqWVBl2BbEHnCstB6rbdvu3aMh5G9iWCBwU4I4ucmbBTm7
	Mq4kNyrzni69q6Rw1n/ka5RE7/Gugz9V6QMEcpC3Xlp0IibwfomY8JrQU
	xmoycZmhnGMOMG7D5wYSChFB739MYLQmAV3fcYPb1B0PWSNJv1xQPXoWU
	FQP/GyGb/ylWBqu7agHlDQtlwvL8UL/pmuw8fynFu7OeHHiFm05Fvhjtf
	AfcQN/IxDD44UKAqmX96+JftmxZXTG3OCElY3qAeTGIPslzYyfEouhavr
	RSr36Iig3/ZWyWO0c7eL4UbybnNmE772isV245PKrSVU4LrjLSP5lLZLn w==;
IronPort-SDR: oehQu6GIAyCxpq0y5EFkrr0sX63bCPaAeLEq8SvDNMiXSVJ6TC4vlQaMuBKGgrp7sqOPy6uVl6
	x7n3qr8P47FV8K7lR6Gs/6tmAibEVsefbmPbcL2o/iq0URnGJSUXgQRI93ztJq8NjRs3wapTbY
	GlynNTh2BOikkebhxW0nV/vRCdX1rJ2kwwZZSSWKf2Foef1lGv1QRDyoo97zjMd2pquDZla52V
	cBIs4lh+bY+8F9tk3Cv7JJ6clOZ3P8MtdVukPnYnQ25DF63tgvCfeDstLKjMfdDKs8sdtGu9cj
	L70=
X-IronPort-AV: E=Sophos;i="5.70,372,1574118000"; d="scan'208";a="22293130"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jan 2020 06:22:24 +0100
Message-ID: <20200128052225.2455848-4-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128052225.2455848-1-richard.leitner@skidata.com>
References: <20200128052225.2455848-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH v2 3/4] openjre-8: remove debuginfo fixup from do_install
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
X-List-Received-Date: Tue, 28 Jan 2020 05:22:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

OpenJRE doesn't create any debuginfo files, neither in JDK nor in JRE
HOME. Therefore remove it.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjre-8_242.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_242.bb
index 4ed2e6b..ce6392a 100644
--- a/recipes-core/openjdk/openjre-8_242.bb
+++ b/recipes-core/openjdk/openjre-8_242.bb
@@ -11,7 +11,6 @@ do_install() {
     cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
     chown -R root:root ${D}${JRE_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
-    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
 }
 
 FILES_${PN}_append = "\
-- 
2.24.1


