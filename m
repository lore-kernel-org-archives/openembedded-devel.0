Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <r63875@freescale.com>) id 1UcCqS-0007j0-4g
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 12:52:37 +0200
Received: from mail110-tx2-R.bigfish.com (10.9.14.228) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Tue, 14 May 2013 10:19:20 +0000
Received: from mail110-tx2 (localhost [127.0.0.1])	by
	mail110-tx2-R.bigfish.com (Postfix) with ESMTP id E3AA1A01A6	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 10:19:20 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail110-tx2 (localhost.localdomain [127.0.0.1]) by mail110-tx2
	(MessageSwitch) id 1368526759795934_24280;
	Tue, 14 May 2013 10:19:19 +0000 (UTC)
Received: from TX2EHSMHS020.bigfish.com (unknown [10.9.14.245])	by
	mail110-tx2.bigfish.com (Postfix) with ESMTP id B892C48004E	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 10:19:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS020.bigfish.com
	(10.9.99.120) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 14 May 2013 10:19:19 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 14 May 2013 10:19:19 +0000
Received: from localhost.localdomain (tank.ap.freescale.net [10.193.20.104])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id r4EAJGcT024295;
	Tue, 14 May 2013 03:19:17 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 May 2013 17:37:29 +0800
Message-ID: <1368524249-8219-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [oe-core master] yajl: pass the cmake variable LIB_SUFFIX to handle installation on 64-bit systems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 10:52:40 -0000
Content-Type: text/plain

WARNING: QA Issue: yajl: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/libyajl.so.2
  /usr/lib/libyajl.so
  /usr/lib/libyajl_s.a
  /usr/lib/libyajl.so.2.0.4
  /usr/lib/.debug
  /usr/lib/.debug/libyajl.so.2.0.4

NOTE: for 64-bit systems where lib64 is used you can pass the cmake
      variable LIB_SUFFIX to cause installation into the system's 'lib64'
      directory.

Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
---
 meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
index 7359520..9d67e2d 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Yet Another JSON Library - A Portable JSON parsing and serialization library in ANSI C"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74f541bd9a2b6c8e5d0714bcdc327f32"
+PR = "r1"
 
 SRCREV = "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
 SRC_URI = "git://github.com/lloyd/yajl.git"
@@ -8,3 +9,5 @@ SRC_URI = "git://github.com/lloyd/yajl.git"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
-- 
1.7.0.4




