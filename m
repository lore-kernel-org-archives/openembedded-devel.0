Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuqmQ-0004qp-M5
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 18:23:39 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:28 +0100
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:27 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 18:20:25 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuqix-0006tI-QD; Thu, 25 Mar 2010 18:20:03 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 18:19:52 +0100
Message-Id: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 17:20:28.0150 (UTC)
	FILETIME=[76CAF960:01CACC3F]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.openezx.org
Subject: [PATCH 0/5] Misc updates for EZX bits in OE
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
X-List-Received-Date: Thu, 25 Mar 2010 17:23:39 -0000

Hi,

here are some updates for EZX bits in OE.

With these changes we have a working image to experiment with ts27010mux
driver and ezxd, no fso support yet. Tested on Motorola A780.

Note that although ezx-gen-blob builds fine now, it seems to have issues with
GCC 4.4: the binary size is about 300KiB instead of the expected 64KiB, if
anyone has a clue please let me know.

Thanks,
   Antonio

Antonio Ospite (5):
  ezx: update openezx-kernel version
  ezx: update ezx-boot-usb-native version
  ezx: update ezxd version and ezxd.init script
  ezx: update ezx-gen-blob version
  ezx: update device_table-ezx.txt

 conf/distro/include/sane-srcrevs.inc   |    8 ++++----
 files/device_table-ezx.txt             |    6 +++---
 recipes/ezx/ezx-boot-usb-native_svn.bb |    2 +-
 recipes/ezx/ezxd/ezxd.init             |    5 +++++
 recipes/ezx/ezxd_svn.bb                |    4 +++-
 recipes/linux/openezx-kernel_git.bb    |    4 ++--
 6 files changed, 18 insertions(+), 11 deletions(-)


-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?


