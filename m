Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1288073196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:17:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6J7Hsm9006926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:17:54 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 00:17:53 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 03:17:52 -0400
Message-ID: <1468912672-231243-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wireshark: inherit perlnative
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
X-List-Received-Date: Tue, 19 Jul 2016 07:17:54 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

wireshark needs pod2man and pod2html (provided by perl-native)
to create doc files, inherit perlnative instead of the
dependency only, so it sets the correct path to find these
native commands.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
index 8aec230..d36c3f3 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
-DEPENDS = "perl-native pcre expat glib-2.0 sbc"
+DEPENDS = "pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "9ea9c82da9942194ebc8fc5c951a02e6d179afa7472cb6d96ca7615451
 
 PE = "1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
2.8.1


