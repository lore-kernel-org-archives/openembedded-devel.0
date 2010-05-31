Received: from smtp-out09a.alice.it ([85.33.3.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1nB-0002SV-P6
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:00:23 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-OUT09A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:09 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:07 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B01.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:06 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j3-0007Wu-Ac; Mon, 31 May 2010 11:56:05 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:45 +0200
Message-Id: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:07.0143 (UTC)
	FILETIME=[7D456770:01CB00A7]
X-SA-Exim-Connect-IP: 85.33.3.9
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 00/12] motorola-ezx related changes
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
X-List-Received-Date: Mon, 31 May 2010 10:00:23 -0000

Hi, here's some motorola-ezx related changes, plus a couple of other fixes I
am using here.
Namely, the non ezx related changes are 01 and 02.

Can anyone review and apply, please?

Thanks,
   Antonio Ospite


Antonio Ospite (11):
  fso-image.inc: add an even shorter alias for ls -l
  device_table-minimal.txt: fix input device nodes path
  device_table-ezx.txt: add needed device nodes
  xserver-kdrive-common/Xserver: fix EZX settings
  tslib: Add config file for a780 machine
  motorola-ezx-base.inc: use PREFERRED_PROVIDER_virtual/xserver
  motorola-ezx-base.inc: refresh machine definition
  openezx-kernel_git: update recipe
  ezx-gen-blob: bump SRCREV
  ezx-boot-usb-native: bump SRCREV
  frameworkd_git.bb: bump SRCREV

Ilya Petrov (1):
  motorola-ezx-base.inc: Add support for ubifs

 conf/machine/include/motorola-ezx-base.inc         |   64 +++++++++++++++-----
 files/device_table-ezx.txt                         |   12 ++++-
 files/device_table-minimal.txt                     |    2 +-
 recipes/ezx/ezx-boot-usb-native_svn.bb             |    2 +-
 recipes/ezx/ezx-gen-blob_svn.bb                    |    4 +-
 recipes/freesmartphone/frameworkd_git.bb           |    4 +-
 recipes/images/fso-image.inc                       |    1 +
 recipes/linux/openezx-kernel_git.bb                |   17 ++++-
 recipes/tslib/tslib/a780/tslib.sh                  |    5 ++
 .../xserver-kdrive-common/Xserver                  |    5 +-
 10 files changed, 87 insertions(+), 29 deletions(-)
 create mode 100755 recipes/tslib/tslib/a780/tslib.sh


-- 
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?


