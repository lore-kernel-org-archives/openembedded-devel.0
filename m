Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S35.hotmail.com (blu004-omc4s35.hotmail.com
	[65.55.111.174])
	by mail.openembedded.org (Postfix) with ESMTP id 43027709D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 17:15:39 +0000 (UTC)
Received: from BLU436-SMTP190 ([65.55.111.136]) by BLU004-OMC4S35.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22712);
	Tue, 12 Aug 2014 10:15:41 -0700
X-TMN: [2JrNSGEiaxbQQTVkxGNhCuz8Jf3elIjE]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP1908A526128629C3203DD01D6EA0@phx.gbl>
Received: from localhost.localdomain ([174.45.121.196]) by
	BLU436-SMTP190.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Tue, 12 Aug 2014 10:15:39 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 11:15:31 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 12 Aug 2014 17:15:39.0096 (UTC)
	FILETIME=[09DA9580:01CFB651]
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] cyassl: add cyassl to meta-oe/meta-networking/recipes-connectivity/
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
X-List-Received-Date: Tue, 12 Aug 2014 17:15:47 -0000
Content-Type: text/plain

Created cyassl_3.1.0.bb file to be considered for adding to meta-oe
CyaSSL is a lightweight, portable SSL library designed for embedded systems.

Signed-off-by: lchristina26 <lchristina26@hotmail.com>
---
 meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
index 441d321..accc144 100644
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
@@ -9,6 +9,8 @@ SECTION = "libs/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+PR = "r1"
+
 SRC_URI = "http://www.yassl.com/cyassl-${PV}.zip"
 
 
@@ -19,3 +21,6 @@ S = "${WORKDIR}/${PN}-${PV}"
 
 inherit autotools
 
+# Detect and build with correct endianness
+# CFLAGS += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '', '-DBIG_ENDIAN_ORDER', d)}"
+
-- 
1.9.1


