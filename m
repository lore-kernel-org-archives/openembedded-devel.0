Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OCt0D-0007kV-4G
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 13:24:25 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 May 2010 13:20:28 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 May 2010 13:20:29 +0200
Received: from jcn ([87.1.14.62]) by FBCMCL01B01.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 14 May 2010 13:20:27 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OCswL-0000qF-Uk; Fri, 14 May 2010 13:20:25 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 May 2010 13:20:15 +0200
Message-Id: <1273836017-3206-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 14 May 2010 11:20:27.0802 (UTC)
	FILETIME=[74A2EFA0:01CAF357]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/2] tzcode/tzdata updates
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
X-List-Received-Date: Fri, 14 May 2010 11:24:25 -0000

And a question for future updates: when renaming recipes it is not needed to
change PR, is it?

Would it be even better to reset it to some zero value? I mean, like in
tzcode-native_2010j.bb, should one set PR to "${INC_PR}.0" after a rename?

Thanks,
   Antonio

Antonio Ospite (2):
  tzcode-native: update to 2010j
  tzdata: update to 2010j

 recipes/tzcode/tzcode-native_2010f.bb |   16 ----------------
 recipes/tzcode/tzcode-native_2010j.bb |   16 ++++++++++++++++
 recipes/tzdata/tzdata_2010i.bb        |   10 ----------
 recipes/tzdata/tzdata_2010j.bb        |   10 ++++++++++
 4 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2010f.bb
 create mode 100644 recipes/tzcode/tzcode-native_2010j.bb
 delete mode 100644 recipes/tzdata/tzdata_2010i.bb
 create mode 100644 recipes/tzdata/tzdata_2010j.bb


-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?


