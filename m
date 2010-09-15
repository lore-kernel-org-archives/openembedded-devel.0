Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Ovsl5-0007WP-FN
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 16:15:02 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Ovsk6-00052X-W3 from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 07:13:47 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Sep 2010 16:13:39 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Sep 2010 19:13:17 +0500
Message-Id: <1284559997-21926-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 15 Sep 2010 14:13:39.0576 (UTC)
	FILETIME=[31D6CF80:01CB54E0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] nkf_2.07.bb: fixed build error (QA Issue with nkf: No GNU_HASH in the elf binary)
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
X-List-Received-Date: Wed, 15 Sep 2010 14:15:02 -0000

* added TARGET_CC_ARCH += "${LDFLAGS}"
* added PR = "r1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/nkf/nkf_2.07.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/nkf/nkf_2.07.bb b/recipes/nkf/nkf_2.07.bb
index 52044b4..ef6e23d 100644
--- a/recipes/nkf/nkf_2.07.bb
+++ b/recipes/nkf/nkf_2.07.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Network Kanji Code Conversion Filter"
 LICENSE = "GPL"
+PR = "r1"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/n/nkf/nkf_${PV}.orig.tar.gz"
 S = "${WORKDIR}/nkf207"
@@ -14,3 +15,4 @@ do_install() {
 
 SRC_URI[md5sum] = "af11dcd3fe71d67831c020e3bfd5073b"
 SRC_URI[sha256sum] = "71d2ba992df209a00bb1dca45e3336729dc16e51b71526bd20f897cc6127a275"
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.6.3.3



