Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9gEW-0006Ho-Ib
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 17:42:13 +0200
Received: by eya28 with SMTP id 28so984883eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=JD7/U672ijkEgtg/dsGpmB8CQGKRO3/b2UQT+yoi4Q0=;
	b=BDHa01t1KLomxmFiWntkKUOsvejaaga78FjcAV5p9brPu2OYgtYWOI9uQtiokCLs6H
	MuYE8t2kRctGfHP/4DSHO51klBNq6rxk0aZ7SYNC3YPeHSpysEb4/MXgK77mOMvA2iDx
	JgkpMEuDihmdD3iQ9wWWaltHUyS2hH8JjODHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qL3SoJ5LQJ9Z3UHadwZ4P7etryF67JoxJjK9R7m9hgDe4v1LTMaWqmniha5Kmf6XjX
	4vYzEwyXkbv9UNYrxrR0pWZJh9OJvdv03N7lZATi07hHEt7j11CWjXHdPQM9wuJK2/nK
	7Q08VNz96D16r9HKVSXExswiLg/Hb1G97kOJM=
Received: by 10.213.14.1 with SMTP id e1mr441315eba.94.1287848493793;
	Sat, 23 Oct 2010 08:41:33 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id b52sm4872112eei.7.2010.10.23.08.41.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Oct 2010 08:41:32 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Oct 2010 17:41:26 +0200
Message-Id: <1287848486-14980-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot-sakoman_git.bb: updated SRCREV to head to make it building again
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
X-List-Received-Date: Sat, 23 Oct 2010 15:42:13 -0000

SRCREV was "ccd0c67858c6e2807c695e2c8f545284cb871866", but that is not in the
omap4s-exp branch any more. Guess it was gone after a merge. To make things
building I moved the the head of the branch
SRCREV = "8b931e51f46acffd61096553ae89dfb3ee30d398"

Note: there was no PR in the recipe or the inc file, I was not sure if I should add
one, so didn't but it could be that the version numbering now is wrong

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/u-boot/u-boot-sakoman_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/u-boot/u-boot-sakoman_git.bb b/recipes/u-boot/u-boot-sakoman_git.bb
index 341f99b..1cc04a0 100644
--- a/recipes/u-boot/u-boot-sakoman_git.bb
+++ b/recipes/u-boot/u-boot-sakoman_git.bb
@@ -2,7 +2,7 @@ require u-boot.inc
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-sakoman-git/"
 
-SRCREV = "ccd0c67858c6e2807c695e2c8f545284cb871866"
+SRCREV = "8b931e51f46acffd61096553ae89dfb3ee30d398"
 
 PV = "2010.9+${PR}+git${SRCREV}"
 
-- 
1.6.4.2



