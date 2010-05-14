Received: from smtp-out108.alice.it ([85.37.17.108])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OCt1C-0007pJ-HH
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 13:25:27 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out108.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 May 2010 13:20:28 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 May 2010 13:20:28 +0200
Received: from jcn ([87.1.14.62]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 14 May 2010 13:20:27 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OCswM-0000qJ-Ds; Fri, 14 May 2010 13:20:26 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 May 2010 13:20:17 +0200
Message-Id: <1273836017-3206-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1273836017-3206-1-git-send-email-ospite@studenti.unina.it>
References: <1273836017-3206-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 14 May 2010 11:20:27.0687 (UTC)
	FILETIME=[74916370:01CAF357]
X-SA-Exim-Connect-IP: 85.37.17.108
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] tzdata: update to 2010j
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
X-List-Received-Date: Fri, 14 May 2010 11:25:27 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/tzdata/tzdata_2010i.bb |   10 ----------
 recipes/tzdata/tzdata_2010j.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/tzdata/tzdata_2010i.bb
 create mode 100644 recipes/tzdata/tzdata_2010j.bb

diff --git a/recipes/tzdata/tzdata_2010i.bb b/recipes/tzdata/tzdata_2010i.bb
deleted file mode 100644
index fbd0d7d..0000000
--- a/recipes/tzdata/tzdata_2010i.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require tzdata.inc
-
-# Note that elsie.nci.nih.gov removes old archives when new is being
-# released. So if this doesn't build for you because of missing source file
-# just bump it to the latest available version, removing old one
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tar.md5sum] = "4d2a90afd5bffe8df97f3def245e178e"
-SRC_URI[tar.sha256sum] = "bee0a26cca54db3413416d968c0a6361d83188b112d2512559d0e3602f254dc3"
diff --git a/recipes/tzdata/tzdata_2010j.bb b/recipes/tzdata/tzdata_2010j.bb
new file mode 100644
index 0000000..79b7769
--- /dev/null
+++ b/recipes/tzdata/tzdata_2010j.bb
@@ -0,0 +1,10 @@
+require tzdata.inc
+
+# Note that elsie.nci.nih.gov removes old archives when new is being
+# released. So if this doesn't build for you because of missing source file
+# just bump it to the latest available version, removing old one
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tar.md5sum] = "f668f66b260e14b477eac3f48bcfb5f4"
+SRC_URI[tar.sha256sum] = "dcf2101d0c5bb20a7f182866ea3e52b54c8f4d129c025a96c9a31377676f554b"
-- 
1.7.1



