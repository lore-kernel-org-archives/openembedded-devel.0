Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cbrake@hq.bec-systems.com>) id 1PBDsu-0006Wb-1i
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 23:50:38 +0200
Received: from cbrake by happy.bec-systems.com with local (Exim 4.71)
	(envelope-from <cbrake@hq.bec-systems.com>)
	id 1PBDVs-0008Fh-5f; Wed, 27 Oct 2010 17:26:28 -0400
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Oct 2010 17:26:18 -0400
Message-Id: <1288214778-31692-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 69.34.21.229
X-SA-Exim-Mail-From: cbrake@hq.bec-systems.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] libfontenc: add font-util depend
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
X-List-Received-Date: Wed, 27 Oct 2010 21:50:49 -0000

From: Cliff Brake <cbrake@bec-systems.com>

when building, I got the following error:
configure.ac:44: error: must install X.Org font-util 1.1 or later before running autoconf/autogen
---
 recipes/xorg-lib/libfontenc_1.1.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-lib/libfontenc_1.1.0.bb b/recipes/xorg-lib/libfontenc_1.1.0.bb
index bce1aa5..757431f 100644
--- a/recipes/xorg-lib/libfontenc_1.1.0.bb
+++ b/recipes/xorg-lib/libfontenc_1.1.0.bb
@@ -1,7 +1,7 @@
 require xorg-lib-common.inc
 DESCRIPTION = "X11 font encoding library"
 LICENSE = "BSD-X"
-DEPENDS += "zlib xproto"
+DEPENDS += "zlib xproto font-util"
 PE = "1"
 PR = "${INC_PR}.0"
 
-- 
1.7.0.4



