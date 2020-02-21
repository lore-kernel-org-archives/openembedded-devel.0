Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 58CC16023B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:47:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNnc0W2jz40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:47:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318068;
	bh=zGCGDw2wCCh+pLZlsVmBkvaepuePZ4CeMXq1LzNzygA=;
	h=From:To:Subject:Date:From;
	b=TKRILHNyghwtP80wty3+XvfF38PDtD2jH4htvtsy6Zd7RqlSrpTzlG4UR+h9WhmTu
	qPIwsVDcE8iG3jeyb2bbpv7R1JJ2h8qy9sXCDVcaopqrn8j6+Yq3iCvhSDLlamTLu6
	MmwiHGOxvQS8yd06w0g+lQt21EcSCm/QP8E2hiFGbw1wqWtAoOxFdsWnmquY9Y8IJy
	wqs83aqZ4GsFgJI5l9khkx4CQyPE1tlMtDnD9Be8TCACZPsVv6WvrTHhaTHusEqsMZ
	LB9Qmr/IApkp62t/QGpVSnwQMmIhtHr0zdXHkJToY0FducS5Ida2/oNIOpDpdh+On5
	5Lfci0Fwd3RpGlPE8XWLKln6J8M9F3xvLYIeCGSo1ebwpwfqJyFpC38+C7FL9ntIYO
	/ELbBJ+aa0gh4OSPINCAC0uBUxOupC2TnG9l6kGqU6u4hLAxU+gk8h1CCeeL9BNvH0
	hVixWOuvCa1z0fTKJtUcUVc0qfsW0SmvD8FQIc66+skRb7Znr9qw8HmNoiYDuxjb58
	Aa4jhTaaiN+l5wUTaeYScmi2vlao+xvR5abc+9HzZxzzgw6rrYyxYuns/5Xe81eduU
	ipAwhtYOWGbxTzMWB4fgLNW9NhKe7OTs99zrXCyYW63y5xeFarDM/OEjAa05KlkgXT
	LBXsQDDPNj1TlU+IXle0UJMc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:47:45 +0200
Message-Id: <20200221204746.14560-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH 1/2] wireshark: upgrade 3.0.3 -> 3.0.6
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
X-List-Received-Date: Fri, 21 Feb 2020 20:47:47 -0000

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[Bug fix only update
includes:
CVE-2019-16319
]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../wireshark/{wireshark_3.0.3.bb => wireshark_3.0.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.3.bb => wireshark_3.0.6.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
index efcd5e42e..9436231cd 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "e945d76a57db2c3e6cf776f95da2cf0e"
-SRC_URI[sha256sum] = "af92729c781d870110885c31ebcbe4c4224ed51bb580d00c896fe9746994211c"
+SRC_URI[md5sum] = "c6f8d12a3efe21cc7885f7cb0c4bd938"
+SRC_URI[sha256sum] = "a87f4022a0c15ddbf1730bf1acafce9e75a4e657ce9fa494ceda0324c0c3e33e"
 
 PE = "1"
 
-- 
2.17.1


