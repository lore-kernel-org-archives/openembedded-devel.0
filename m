Received: from 8.mo1.mail-out.ovh.net ([178.33.110.239]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UTX17-0002j6-5A
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Apr 2013 14:35:46 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 0CCC4FF8E96
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2013 14:18:11 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 20 Apr 2013 14:18:10 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 20 Apr 2013 14:18:08 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.235])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id E937F16009F;
	Sat, 20 Apr 2013 13:16:57 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Sat, 20 Apr 2013 13:17:04 +0100
Message-Id: <1366460227-18964-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
X-Ovh-Tracer-Id: 9763803993732188489
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH 0/3] vim: update and tidy-up
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
X-List-Received-Date: Sat, 20 Apr 2013 12:35:51 -0000

These patches bring vim up to date with the latest version available upstream
and do a bit of tidying up. I've tested this on a Rasberry Pi, browsing the help
in vim and editing a few files - everything looks ok.

Paul Barker (3):
  vim: use example vimrc from vim runtime files
  vim: use correct license file
  vim: update to 7.3.905

 meta-oe/recipes-support/vim/files/401-446.diff | 5426 ------------------------
 meta-oe/recipes-support/vim/files/vimrc        |   96 -
 meta-oe/recipes-support/vim/vim.inc            |   17 +-
 meta-oe/recipes-support/vim/vim_7.2.446.bb     |   28 -
 meta-oe/recipes-support/vim/vim_7.3.905.bb     |    7 +
 5 files changed, 14 insertions(+), 5560 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/files/401-446.diff
 delete mode 100644 meta-oe/recipes-support/vim/files/vimrc
 delete mode 100644 meta-oe/recipes-support/vim/vim_7.2.446.bb
 create mode 100644 meta-oe/recipes-support/vim/vim_7.3.905.bb

-- 
1.7.10.4



