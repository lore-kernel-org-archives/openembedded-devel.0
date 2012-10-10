Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TLpPE-0007ri-6u
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 08:04:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1071; q=dns/txt; s=iport;
	t=1349848286; x=1351057886;
	h=from:to:cc:subject:date:message-id;
	bh=2cz/KuzVhs5I/AiVkxjSOMYfEcjIkqB6P+5Yex68Qyg=;
	b=AjQOYlbQTiqbRavdBzMQEZTr5MJWASebBe77yBWWnby+0/MYvH8A7jup
	2c4nhgEJ6oGb4bUhBXCyMcUIVriKtm3sx3AcMP08gi1HLvJ7yoVc3pXyk
	BmhEFtjxTESCilIn7H5F/Xwzy4WuXaj6fDd13iTDEPG7xIi9wfrDTdHf5 c=;
X-IronPort-AV: E=Sophos;i="4.80,563,1344211200"; 
   d="scan'208";a="8667697"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-3.cisco.com with ESMTP; 10 Oct 2012 05:51:24 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q9A5pNTE014279;
	Wed, 10 Oct 2012 05:51:23 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Oct 2012 07:51:23 +0200
Message-Id: <1349848283-31455-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH v2] libftid: Change to use GPLv2 intead of GPLv2-RLE.
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
X-List-Received-Date: Wed, 10 Oct 2012 06:04:32 -0000

libftdi itself is licensed under LGPLv2, with some parts (eeprom programmer) is
licensed under GPLv2. There doesn't seem to be any part licensed under a
GPLv2-RLE variation of GPLv2, and so we should use GPLv2 instead of
GPLv2-RLE.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
index 2dba3f4..d3d6dcf 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
@@ -4,7 +4,9 @@ including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1 GPLv2-RLE"
+PR = "r0"
+
+LICENSE = "LGPLv2.1 GPLv2"
 LIC_FILES_CHKSUM= "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
                    file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
                   "
-- 
1.7.8.6



