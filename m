Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S3.hotmail.com (blu004-omc4s3.hotmail.com
	[65.55.111.142])
	by mail.openembedded.org (Postfix) with ESMTP id 172D860B05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:24:36 +0000 (UTC)
Received: from BLU436-SMTP50 ([65.55.111.135]) by BLU004-OMC4S3.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22712);
	Wed, 13 Aug 2014 14:24:38 -0700
X-TMN: [CkmceHxd1Ew7SKPfy8BvngO5yFy4btFq]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP50D01295E957678D343638D6EB0@phx.gbl>
Received: from localhost.localdomain ([174.45.121.196]) by
	BLU436-SMTP50.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Wed, 13 Aug 2014 14:24:35 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Aug 2014 15:24:28 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 13 Aug 2014 21:24:35.0994 (UTC)
	FILETIME=[FB5A17A0:01CFB73C]
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] Add cyassl to meta-networking/recipes-connectivity
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Aug 2014 21:24:37 -0000
Content-Type: text/plain

Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
---
 meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
index 441d321..0c0cac2 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
@@ -9,13 +9,10 @@ SECTION = "libs/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://www.yassl.com/cyassl-${PV}.zip"
-
+SRC_URI = "http://www.yassl.com/${BP}.zip"
 
 SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
 SRC_URI[sha256sum] = "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
 
-S = "${WORKDIR}/${PN}-${PV}"
-
 inherit autotools
 
-- 
1.9.1


