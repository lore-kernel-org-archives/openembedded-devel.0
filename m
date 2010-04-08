Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nzo7G-00043y-Hu
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:33:40 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 11:30:09 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 11:30:09 +0200
Received: from jcn ([82.59.101.2]) by FBCMCL01B04.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 8 Apr 2010 11:30:09 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nzo3r-0001c5-T5; Thu, 08 Apr 2010 11:30:07 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Apr 2010 11:30:02 +0200
Message-Id: <1270719003-6168-2-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
References: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 08 Apr 2010 09:30:10.0141 (UTC)
	FILETIME=[155500D0:01CAD6FE]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] tzcode-native_2010f: Update tzdata SRC_URI and checksum
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
X-List-Received-Date: Thu, 08 Apr 2010 09:33:44 -0000

tzdata2010g is no longer available, use tzdata2010h

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/tzcode/tzcode-native_2010f.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/tzcode/tzcode-native_2010f.bb b/recipes/tzcode/tzcode-native_2010f.bb
index 6c361ac..fdd35ba 100644
--- a/recipes/tzcode/tzcode-native_2010f.bb
+++ b/recipes/tzcode/tzcode-native_2010f.bb
@@ -6,11 +6,11 @@ require tzcode-native.inc
 # fix this URLs
 SRC_URI = " \
 	ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
-	ftp://elsie.nci.nih.gov/pub/tzdata2010g.tar.gz;name=tzdata-2010g \
+	ftp://elsie.nci.nih.gov/pub/tzdata2010h.tar.gz;name=tzdata-2010h \
 	"
 SRC_URI[tzcode-2010f.md5sum] = "e530cc9bbdfd5e8c1eac21a68f4d5656"
 SRC_URI[tzcode-2010f.sha256sum] = "651d866c91ada925b4ac9491e69ebd5c355c46b2c01dd1741b5e6a609d93eb1e"
-SRC_URI[tzdata-2010g.md5sum] = "d0e8f560977470b0fc65b79b585cf5e4"
-SRC_URI[tzdata-2010g.sha256sum] = "a069dbea2989613466f9f4adb6de381efb46aeb9ff89e03fabb23dcae2c4cd90"
+SRC_URI[tzdata-2010g.md5sum] = "d384ac091e6d56802f9b3e6b3d3f0f2e"
+SRC_URI[tzdata-2010g.sha256sum] = "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
-- 
1.7.0.4



