Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nzo7D-0003dR-T4
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:33:36 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 11:30:12 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 11:30:08 +0200
Received: from jcn ([82.59.101.2]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 8 Apr 2010 11:30:07 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nzo3p-0001c2-MI; Thu, 08 Apr 2010 11:30:05 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Apr 2010 11:30:01 +0200
Message-Id: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.4
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 08 Apr 2010 09:30:07.0663 (UTC)
	FILETIME=[13DAE3F0:01CAD6FE]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/2] Updates to tzcode-native and tzdata
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
X-List-Received-Date: Thu, 08 Apr 2010 09:33:37 -0000

Here are some updates to tzcode-native and tzdata as tzdata_2010g is no longer
available at the default location.

In tzcode-native_2010f I just changed the minimum to make it work, if it
should be converted to BBCLASSEXTEND = "native", that can be done later.

Thanks,
   Antonio Ospite
   http://ao2.it


Antonio Ospite (2):
  tzcode-native_2010f: Update tzdata SRC_URI and checksum
  tzdata: move tzdata_2010g.bb to tzdata_2010h.bb

 recipes/tzcode/tzcode-native_2010f.bb |    8 ++++----
 recipes/tzdata/tzdata_2010g.bb        |    7 -------
 recipes/tzdata/tzdata_2010h.bb        |    7 +++++++
 3 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 recipes/tzdata/tzdata_2010g.bb
 create mode 100644 recipes/tzdata/tzdata_2010h.bb

-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?


