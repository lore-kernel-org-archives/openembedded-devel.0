Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1US8m0-0004RT-K9
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 18:30:32 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 43E3CFF9945
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 18:03:27 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Apr 2013 18:03:27 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 16 Apr 2013 18:03:26 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.235])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 6B9101601B4;
	Tue, 16 Apr 2013 17:02:26 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Tue, 16 Apr 2013 17:02:28 +0100
Message-Id: <1366128149-52411-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366128149-52411-1-git-send-email-paul@paulbarker.me.uk>
References: <1366128149-52411-1-git-send-email-paul@paulbarker.me.uk>
X-Ovh-Tracer-Id: 8524751146289039689
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrvdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.500001/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrvdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH 2/2] vim: prevent binaries from being stripped too early
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
X-List-Received-Date: Tue, 16 Apr 2013 16:30:38 -0000

By default, vim binaries are stripped during the build. This prevents us from
putting non-stripped binaries into a -dbg package. Passing 'STRIP=/bin/true' to
configure is the method recommended in the vim Makefile to disable stripping of
binaries during the build.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/vim.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index 1ae5e5c..100db86 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -54,6 +54,7 @@ EXTRA_OECONF = " \
   vim_cv_tgent=non-zero \
   vim_cv_toupper_broken=no \
   vim_cv_tty_group=world \
+  STRIP=/bin/true \
 "
 
 # Work around rpm picking up csh as a dep
-- 
1.7.10.4



