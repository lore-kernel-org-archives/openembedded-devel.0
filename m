Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 26D927162E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 05:19:56 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id at20so7011369iec.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 21:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3iuqGlcQfPOArF1ymnJG+rb1/NmCGsOp+sBSfu8bnuQ=;
	b=N0vCSaiYvzjHEOuEBHIFdTrY1bCJqFsTuClkV3On6epCeTv8UvLwRdZZiaPZLD+QMK
	n3LhinPUpsnUf+x+hofGyO05GOLKigzJg+qG0vqW5r3CrRtQV6J0FiVUNsBQIdKyL1Gh
	CwOICewaxwczXcACy/sfH2Hn3F0gJPWrKiTJNFCJG24VC7a0EGsmdQhdELkhvVbRfiw2
	n5BOVBBT460vuP89i+cWV5+8YUvV0HUtcNUXm6rBy9BdCHtx6hoqGGf7lm0QuQ7B/SM2
	G1l0p/viXNmwWhIWttReVafaArRYkY6lBX+HNd5n0Pbv9zwtbL1vDEovQxft3ApSzriF
	WAcw==
X-Received: by 10.43.92.9 with SMTP id bo9mr2981998icc.54.1421212797262;
	Tue, 13 Jan 2015 21:19:57 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id t5sm1456506ign.12.2015.01.13.21.19.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jan 2015 21:19:56 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jan 2015 21:19:42 -0800
Message-Id: <1421212782-5067-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] cryptsetup: update 1.6.2 -> 1.6.6
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
X-List-Received-Date: Wed, 14 Jan 2015 05:20:04 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../cryptsetup/{cryptsetup_1.6.2.bb => cryptsetup_1.6.6.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.2.bb => cryptsetup_1.6.6.bb} (84%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
similarity index 84%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
index 500dc57..d84ad2f 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
 DEPENDS = "util-linux lvm2 popt libgcrypt"
 
-SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
-SRC_URI[md5sum] = "cd834da49fbe92dd66df02cc5c61280f"
-SRC_URI[sha256sum] = "15723f0198303d4bcb99d480b7a773918e2d319f0348457988c063bdd03e109a"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.6/${BP}.tar.xz"
+SRC_URI[md5sum] = "179c0781de59838a4e39f61b2df5ea48"
+SRC_URI[sha256sum] = "2d2ce28e4e1137dd599d87884b62ef6dbf14fd7848b2a2bf7d61cf125fbd8e6f"
 
 inherit autotools gettext pkgconfig
 
-- 
1.9.1


