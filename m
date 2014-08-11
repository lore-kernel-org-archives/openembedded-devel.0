Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S10.hotmail.com (blu004-omc4s10.hotmail.com
	[65.55.111.149])
	by mail.openembedded.org (Postfix) with ESMTP id BC38765D5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 17:32:55 +0000 (UTC)
Received: from BLU436-SMTP78 ([65.55.111.137]) by BLU004-OMC4S10.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22712);
	Mon, 11 Aug 2014 10:32:56 -0700
X-TMN: [EpuMyrgD5Zjf7K17R75gcXjrzhlrlGeZ]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP782D203C1A9AF2454095C9D6ED0@phx.gbl>
Received: from localhost.localdomain ([174.45.121.196]) by
	BLU436-SMTP78.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Mon, 11 Aug 2014 10:32:54 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 11:32:36 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 11 Aug 2014 17:32:54.0804 (UTC)
	FILETIME=[48C55540:01CFB58A]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] 'Update cyassl bb file'
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
X-List-Received-Date: Mon, 11 Aug 2014 17:33:01 -0000
Content-Type: text/plain

Signed-off-by: lchristina26 <lchristina26@hotmail.com>
---
 meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
index accc144..441d321 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
@@ -9,8 +9,6 @@ SECTION = "libs/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r1"
-
 SRC_URI = "http://www.yassl.com/cyassl-${PV}.zip"
 
 
@@ -21,6 +19,3 @@ S = "${WORKDIR}/${PN}-${PV}"
 
 inherit autotools
 
-# Detect and build with correct endianness
-# CFLAGS += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '', '-DBIG_ENDIAN_ORDER', d)}"
-
-- 
1.9.1


