Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <r63875@freescale.com>) id 1UZauv-0003rJ-Ig
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 07:58:29 +0200
Received: from mail155-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.23; Tue, 7 May 2013 04:55:01 +0000
Received: from mail155-ch1 (localhost [127.0.0.1])	by
	mail155-ch1-R.bigfish.com (Postfix) with ESMTP id 1F9614808C4	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2013 04:55:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail155-ch1 (localhost.localdomain [127.0.0.1]) by mail155-ch1
	(MessageSwitch) id 136790249981412_21856;
	Tue,  7 May 2013 04:54:59 +0000 (UTC)
Received: from CH1EHSMHS032.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.239])	by mail155-ch1.bigfish.com (Postfix) with ESMTP id
	11EF8420A0E	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2013 04:54:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS032.bigfish.com
	(10.43.70.32) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 7 May 2013 04:54:58 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 7 May 2013 04:54:57 +0000
Received: from localhost.localdomain (tank.ap.freescale.net [10.193.20.104])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r474ssa3014531; Mon, 6 May 2013 21:54:56 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 May 2013 12:14:31 +0800
Message-ID: <1367900071-1778-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: yajl: pass the cmake variable LIB_SUFFIX to handle installation on 64-bit systems
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
X-List-Received-Date: Tue, 07 May 2013 05:58:29 -0000
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




