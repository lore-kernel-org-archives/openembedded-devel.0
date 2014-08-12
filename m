Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S24.hotmail.com (blu004-omc4s24.hotmail.com
	[65.55.111.163])
	by mail.openembedded.org (Postfix) with ESMTP id B175860B05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 17:21:19 +0000 (UTC)
Received: from BLU436-SMTP25 ([65.55.111.136]) by BLU004-OMC4S24.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22712);
	Tue, 12 Aug 2014 10:21:20 -0700
X-TMN: [jb7CnyOY9C7mGEDisOOEsH+Py/E+Z7cZ]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP25D2D90D21B574BE00B964D6EA0@phx.gbl>
Received: from localhost.localdomain ([174.45.121.196]) by
	BLU436-SMTP25.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Tue, 12 Aug 2014 10:21:18 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 11:21:10 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 12 Aug 2014 17:21:18.0683 (UTC)
	FILETIME=[D44372B0:01CFB651]
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] CyaSSL: Sumbit cyassl recipe to meta-oe/meta-networking/recipes-connectivity
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
X-List-Received-Date: Tue, 12 Aug 2014 17:21:24 -0000
Content-Type: text/plain

CyaSSL is a lightweight SSL library for embedded systems.

Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
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


