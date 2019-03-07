Return-Path: <sean@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id CC1827CE8F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 09:06:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [95.138.208.137])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 1CC8D1C3F94;
	Thu,  7 Mar 2019 10:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com;
	s=hundeboll; t=1551949579;
	bh=+zePhT1+3Z9l9Ze2nW4hwlf0mBEPcBXpao9+VX6dtyQ=;
	h=From:To:Cc:Subject:Date;
	b=lrMMfVCWOHBhqt21TUzs5Hzh8DN7vCSbhouTlqSLFhijAMHs0KMLf7x3NHmrJlkSW
	60Kd65YSJ2nl06Vd3Q//a3ufP4d1KZfWo/gmxeTtwy5kRmj9mzy8IWsaE+rxFRH/SX
	SROyiSlgycmvfwrlhWesmrjx8yFKvZUXKKUQYX/LQYk6ABe2IW2No5A1oOJ+w1r4Me
	6Eynvg5BXROiYAXsDPjMPfh5uEassgOeSU4UDSFDc4YE3MgEX6q5ULlYAWe4hS0Klq
	YTxruoBPWt4mr1xIlwb+6GSNS49Kpi+TRdwwKpq/hS+V/tLoLWb1Fal9GgWuHCmcNZ
	ypEe25E1QU5ug==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Thu,  7 Mar 2019 10:06:04 +0100
Message-Id: <20190307090604.18747-1-sean@geanix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [meta-oe][PATCHv2] asio: add PACKAGECONFIG boost
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
X-List-Received-Date: Thu, 07 Mar 2019 09:06:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-support/asio/asio_1.12.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/asio/asio_1.12.2.bb b/meta-oe/recipes-support/asio/asio_1.12.2.bb
index ee548fd3a..35f875fdc 100644
--- a/meta-oe/recipes-support/asio/asio_1.12.2.bb
+++ b/meta-oe/recipes-support/asio/asio_1.12.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://think-async.com/Asio"
 SECTION = "libs"
 LICENSE = "BSL-1.0"
 
-DEPENDS = "boost openssl"
+DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
@@ -20,3 +20,7 @@ SRC_URI[md5sum] = "312e53385e2daad10f08d57f91ad3431"
 SRC_URI[sha256sum] = "4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
+
+PACKAGECONFIG ??= "boost"
+
+PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
-- 
2.21.0


