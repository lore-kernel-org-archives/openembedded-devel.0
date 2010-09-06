Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Osgp2-00027g-PC
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 20:53:41 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id EB0674B0028
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Sep 2010 20:52:59 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Sep 2010 20:51:52 +0200
Message-Id: <1283799112-7092-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake: lib/bb/fetch/hg: fix fetching from a mercurial repository
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
X-List-Received-Date: Mon, 06 Sep 2010 18:53:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

* without this fix, we get :
updating working directory
74 files updated, 0 files merged, 0 files removed, 0 files unresolved
abort: There is no Mercurial repository here (.hg not found)!

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Tested-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 lib/bb/fetch/hg.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
index d075638..bb156ed 100644
--- a/lib/bb/fetch/hg.py
+++ b/lib/bb/fetch/hg.py
@@ -138,6 +138,7 @@ class Hg(Fetch):
 	# Even when we clone (fetch), we still need to update as hg's clone
 	# won't checkout the specified revision if its on a branch
         updatecmd =3D self._buildhgcommand(ud, d, "update")
+        os.chdir(ud.moddir)
         bb.msg.debug(1, bb.msg.domain.Fetcher, "Running %s" % updatecmd)
         runfetchcmd(updatecmd, d)
=20
--=20
1.6.3.3



