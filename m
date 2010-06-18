Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OPhQL-00005b-D5
	for openembedded-devel@openembedded.org; Fri, 18 Jun 2010 21:40:22 +0200
Received: from jcn (82.57.106.179) by smtp207.alice.it (8.5.124.08)
	id 4C1A26CF0019F505; Fri, 18 Jun 2010 21:30:26 +0200
Received: from ao2 by jcn with local (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OPhGj-0003JI-NX; Fri, 18 Jun 2010 21:30:25 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jun 2010 21:30:17 +0200
Message-Id: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-SA-Exim-Connect-IP: 82.57.200.103
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 0/3] ezx: move some _svn.bb recipes to _git.bb
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
X-List-Received-Date: Fri, 18 Jun 2010 19:40:23 -0000

gen-blob and boot_usb (now moto-boot-usb) are now managed with git, this
series replaces the svn recipes, all future development will be in the git
repositories.


Antonio Ospite (3):
  ezx: replace ezx-gen-blob_svn.bb with ezx-gen-blob_git.bb
  ezx: rename ezx-boot-usb recipe to moto-boot-usb, use git
  ezx: rename references to ezx-boot-usb into moto-boot-usb

 conf/distro/include/preferred-om-2008-versions.inc |    2 +-
 conf/machine/include/motorola-ezx-base.inc         |    2 +-
 recipes/ezx/ezx-boot-usb-native_svn.bb             |   29 --------------
 recipes/ezx/ezx-gen-blob_git.bb                    |   41 ++++++++++++++++++++
 recipes/ezx/ezx-gen-blob_svn.bb                    |   41 --------------------
 recipes/ezx/moto-boot-usb-native_git.bb            |   27 +++++++++++++
 6 files changed, 70 insertions(+), 72 deletions(-)
 delete mode 100644 recipes/ezx/ezx-boot-usb-native_svn.bb
 create mode 100644 recipes/ezx/ezx-gen-blob_git.bb
 delete mode 100644 recipes/ezx/ezx-gen-blob_svn.bb
 create mode 100644 recipes/ezx/moto-boot-usb-native_git.bb


-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?


