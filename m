Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7BD7321C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:57:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7H6vmQk000165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 23:57:48 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 16 Aug 2016 23:57:47 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2016 14:57:43 +0800
Message-ID: <1471417063-1606-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH v2] wireshark: update to 2.0.5
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
X-List-Received-Date: Wed, 17 Aug 2016 06:57:49 -0000
Content-Type: text/plain

The following vulnerabilities have been fixed:
    * [1]wnpa-sec-2016-39
      CORBA IDL dissector crash on 64-bit Windows. ([2]Bug 12495)
    * [3]wnpa-sec-2016-41
      PacketBB crash. ([4]Bug 12577)
    * [5]wnpa-sec-2016-42
      WSP infinite loop. ([6]Bug 12594)
    * [7]wnpa-sec-2016-44
      RLC long loop. ([8]Bug 12660)
    * [9]wnpa-sec-2016-45
      LDSS dissector crash. ([10]Bug 12662)
    * [11]wnpa-sec-2016-46
      RLC dissector crash. ([12]Bug 12664)
    * [13]wnpa-sec-2016-47
      OpenFlow long loop. ([14]Bug 12659)
    * [15]wnpa-sec-2016-48
      MMSE, WAP, WBXML, and WSP infinite loop. ([16]Bug 12661)
    * [17]wnpa-sec-2016-49
      WBXML crash. ([18]Bug 12663)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../wireshark/{wireshark_2.0.4.bb => wireshark_2.0.5.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.4.bb => wireshark_2.0.5.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
index d36c3f3..7e07be0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
@@ -8,8 +8,8 @@ DEPENDS = "pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "622928dc6cb31c227c672ec3ec697f28"
-SRC_URI[sha256sum] = "9ea9c82da9942194ebc8fc5c951a02e6d179afa7472cb6d96ca76154510de1a5"
+SRC_URI[md5sum] = "627b5fc6cf0aeca196c75debd5e69b14"
+SRC_URI[sha256sum] = "0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b"
 
 PE = "1"
 
-- 
2.7.4


