Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1RYoS1-0000uV-Pl
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 01:36:34 +0100
Received: from jcn (79.2.146.244) by smtp207.alice.it (8.6.023.02)
	id 4ED236CF01C16913; Fri, 9 Dec 2011 01:29:43 +0100
Received: from ao2 by jcn with local (Exim 4.77)
	(envelope-from <ospite@studenti.unina.it>)
	id 1RYoLO-0000oS-3G; Fri, 09 Dec 2011 01:29:42 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 01:29:28 +0100
Message-Id: <1323390570-3088-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.7.3
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Subject: [meta-handheld][PATCH 0/2] Little EzX fixes
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
X-List-Received-Date: Fri, 09 Dec 2011 00:36:34 -0000

Hi,

these are little touches for motorola-ezx in meta-handheld.

The first one is an actual fix, without it we can't build anything using EzX
MACHINEs. After this at least meta-toolchain builds fine.

The second one is taken from zaurus.inc, it makes settings less scattered
around motorola-ezx-base.inc.

Thanks,
   Antonio

Antonio Ospite (2):
  motorola-ezx-base.inc: do not define TARGET_ARCH
  motorola-ezx-base.inc: enable "iwmmxt" as extra arch only when needed

 conf/machine/include/motorola-ezx-base.inc |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?


