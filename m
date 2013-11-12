Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id B84386D2FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 11:39:33 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.279.1; Tue, 12 Nov 2013
	12:39:32 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Nov 2013 12:39:28 +0100
Message-ID: <1384256368-13335-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.8.4.3
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] ktap: fix SRCREV for v0.3
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
X-List-Received-Date: Tue, 12 Nov 2013 11:39:35 -0000
Content-Type: text/plain

When ktap made the release announcement, the tag v0.3 seems to have moved. Set the
correct SRCREV for the announced v0.3.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-kernel/ktap/ktap.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/ktap/ktap.inc b/meta-oe/recipes-kernel/ktap/ktap.inc
index 7fde165..278b63e 100644
--- a/meta-oe/recipes-kernel/ktap/ktap.inc
+++ b/meta-oe/recipes-kernel/ktap/ktap.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.ktap.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE-GPL;md5=eb723b61539feef013de476e68b5c50a"
 
-SRCREV = "6a5100b77321ce5792dfea34fa500ea537b1858c"
+SRCREV = "c507eeca662ff00bf67f8c94df35254e0966f214"
 SRC_URI = "git://github.com/ktap/ktap.git"
 
 S = "${WORKDIR}/git"
-- 
1.8.4.3


