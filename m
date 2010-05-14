Received: from smtp-out20.alice.it ([85.33.2.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OCt1F-0007pf-Ph
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 13:25:30 +0200
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out20.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 May 2010 13:20:31 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 May 2010 13:20:28 +0200
Received: from jcn ([87.1.14.62]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 14 May 2010 13:20:27 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OCswM-0000qH-3M; Fri, 14 May 2010 13:20:26 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 May 2010 13:20:16 +0200
Message-Id: <1273836017-3206-2-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1273836017-3206-1-git-send-email-ospite@studenti.unina.it>
References: <1273836017-3206-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 14 May 2010 11:20:27.0690 (UTC)
	FILETIME=[7491D8A0:01CAF357]
X-SA-Exim-Connect-IP: 85.33.2.20
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] tzcode-native: update to 2010j
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
X-List-Received-Date: Fri, 14 May 2010 11:25:31 -0000

Update checksums; tzdata version bumps to 2010j as well.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/tzcode/tzcode-native_2010f.bb |   16 ----------------
 recipes/tzcode/tzcode-native_2010j.bb |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2010f.bb
 create mode 100644 recipes/tzcode/tzcode-native_2010j.bb

diff --git a/recipes/tzcode/tzcode-native_2010f.bb b/recipes/tzcode/tzcode-native_2010f.bb
deleted file mode 100644
index 8585de2..0000000
--- a/recipes/tzcode/tzcode-native_2010f.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tzcode-native.inc
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2010i"
-
-SRC_URI[tzcode-2010f.md5sum] = "e530cc9bbdfd5e8c1eac21a68f4d5656"
-SRC_URI[tzcode-2010f.sha256sum] = "651d866c91ada925b4ac9491e69ebd5c355c46b2c01dd1741b5e6a609d93eb1e"
-SRC_URI[tzdata-2010i.md5sum] = "4d2a90afd5bffe8df97f3def245e178e"
-SRC_URI[tzdata-2010i.sha256sum] = "bee0a26cca54db3413416d968c0a6361d83188b112d2512559d0e3602f254dc3"
-
-PR = "${INC_PR}.2"
diff --git a/recipes/tzcode/tzcode-native_2010j.bb b/recipes/tzcode/tzcode-native_2010j.bb
new file mode 100644
index 0000000..fb37f1e
--- /dev/null
+++ b/recipes/tzcode/tzcode-native_2010j.bb
@@ -0,0 +1,16 @@
+require tzcode-native.inc
+
+# Note that elsie.nci.nih.gov removes old versions when new is coming out
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2010j"
+
+SRC_URI[tzcode-2010j.md5sum] = "5ba8345720296d3a659b349b2052d139"
+SRC_URI[tzcode-2010j.sha256sum] = "f32b46405190e3a5f1ee4db9fb50aaf1379e6af4e5493402ebfc8ee757058e97"
+SRC_URI[tzdata-2010j.md5sum] = "f668f66b260e14b477eac3f48bcfb5f4"
+SRC_URI[tzdata-2010j.sha256sum] = "dcf2101d0c5bb20a7f182866ea3e52b54c8f4d129c025a96c9a31377676f554b"
+
+PR = "${INC_PR}.2"
-- 
1.7.1



