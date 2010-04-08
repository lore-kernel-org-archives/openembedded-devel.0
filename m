Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nzo7F-0003qJ-UW
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:33:40 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 11:30:13 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 11:30:12 +0200
Received: from jcn ([82.59.101.2]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 8 Apr 2010 11:30:10 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nzo3t-0001c8-5A; Thu, 08 Apr 2010 11:30:09 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Apr 2010 11:30:03 +0200
Message-Id: <1270719003-6168-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
References: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 08 Apr 2010 09:30:10.0502 (UTC)
	FILETIME=[158C1660:01CAD6FE]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] tzdata: move tzdata_2010g.bb to tzdata_2010h.bb
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

tzdata_2010g is no longer available; change the checksums in the new
recipe

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/tzdata/tzdata_2010g.bb |    7 -------
 recipes/tzdata/tzdata_2010h.bb |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 recipes/tzdata/tzdata_2010g.bb
 create mode 100644 recipes/tzdata/tzdata_2010h.bb

diff --git a/recipes/tzdata/tzdata_2010g.bb b/recipes/tzdata/tzdata_2010g.bb
deleted file mode 100644
index acefb96..0000000
--- a/recipes/tzdata/tzdata_2010g.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require tzdata.inc
-
-SRC_URI = "http://ftp.uni-erlangen.de/pub/Linux/MIRROR.gentoo/distfiles/tzdata${PV}.tar.gz;name=tar \
-"
-
-SRC_URI[tar.md5sum] = "d0e8f560977470b0fc65b79b585cf5e4"
-SRC_URI[tar.sha256sum] = "a069dbea2989613466f9f4adb6de381efb46aeb9ff89e03fabb23dcae2c4cd90"
diff --git a/recipes/tzdata/tzdata_2010h.bb b/recipes/tzdata/tzdata_2010h.bb
new file mode 100644
index 0000000..6e8e28e
--- /dev/null
+++ b/recipes/tzdata/tzdata_2010h.bb
@@ -0,0 +1,7 @@
+require tzdata.inc
+
+SRC_URI = "http://ftp.uni-erlangen.de/pub/Linux/MIRROR.gentoo/distfiles/tzdata${PV}.tar.gz;name=tar \
+"
+
+SRC_URI[tar.md5sum] = "d384ac091e6d56802f9b3e6b3d3f0f2e"
+SRC_URI[tar.sha256sum] = "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
-- 
1.7.0.4



