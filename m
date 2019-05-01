Return-Path: <hainsvdbosch@ziggo.nl>
X-Greylist: delayed 1017 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 May 2019 17:20:28 UTC
Received: from smtpq4.mnd.mail.iss.as9143.net (smtpq4.mnd.mail.iss.as9143.net
	[212.54.34.167])
	by mail.openembedded.org (Postfix) with ESMTP id 49E737DACC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 17:20:28 +0000 (UTC)
Received: from [212.54.34.115] (helo=smtp7.mnd.mail.iss.as9143.net)
	by smtpq4.mnd.mail.iss.as9143.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1hLsdo-0000jp-Br; Wed, 01 May 2019 19:03:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=ziggo.nl;
	s=201809corplgsmtpnl; h=MIME-Version:Message-Id:Date:Subject:To:From;
	bh=LsBcvk34LbLN34gCU7DShh8OoRV60m+SB6iys6kSXro=;
	b=iLF2dJ3Rfr1v7XtkoBlSaBlQkU
	tLEYg8qZYGhnC6TKxj7flb+uSk0V5SOd/7FedxnwaBVhvqHq2hRvhUnHIxOHMc+eHBhzfrQaff7L5
	TdSZMjpATXj7uIrXcQ/jXKq/nxxrjaqjGkQTFDPUjVqgUhHmyR9+AM0M9sz65qx222WmzuAol/7X4
	CSICE/sIjtXKjMu1n5Y11L44ZIYsQ8nDelst97BvRt0ESgJ3EHNQGimt8OPF8685a7RuC5u6610nR
	gibNLtZ0XNQf6ykehTCt0xvepX1aWhIM9fyjSeeMutQo55tE8cJO8Q7JeZoMIMaAvP1GqiCD3gJza
	AezdpYtQ==;
Received: from 82-73-120-193.cable.dynamic.v4.ziggo.nl ([82.73.120.193]
	helo=localhost.localdomain)
	by smtp7.mnd.mail.iss.as9143.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1hLsdo-0003pq-6x; Wed, 01 May 2019 19:03:32 +0200
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 19:03:15 +0200
Message-Id: <20190501170315.3656-1-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SourceIP: 82.73.120.193
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=caasUULM c=1 sm=1 tr=0
	a=Q7YWMR2eS1SS1617XCK1UA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
	a=E5NmQfObTbMA:10 a=KA9O7LQ_giGCryJPBK0A:9
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [meta-oe][PATCH] libcdio: update to version 2.1.0
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
X-List-Received-Date: Wed, 01 May 2019 17:20:28 -0000
Content-Transfer-Encoding: 8bit

Use tar.bz2 instead of tar.gz since tar.gz doesn't exist for 2.1.0.

Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
---
 .../libcdio/{libcdio_2.0.0.bb => libcdio_2.1.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_2.0.0.bb => libcdio_2.1.0.bb} (82%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
similarity index 82%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
index 6bf64d663..e282e89b7 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
@@ -4,10 +4,10 @@ SECTION = "libs"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "0cb25905113b930e4539d2f4eb6574b0"
-SRC_URI[sha256sum] = "1b481b5da009bea31db875805665974e2fc568e2b2afa516f4036733657cf958"
+SRC_URI[md5sum] = "aa7629e8f73662a762f64c444b901055"
+SRC_URI[sha256sum] = "8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b"
 
 inherit autotools pkgconfig
 
-- 
2.20.1


