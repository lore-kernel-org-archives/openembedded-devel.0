Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NFtoS-0004nR-GR
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 19:20:31 +0100
Received: (qmail 16114 invoked by uid 813007); 2 Dec 2009 18:18:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Dec 2009 18:18:53 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Dec 2009 19:19:05 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
MIME-Version: 1.0
Message-Id: <200912021919.06663.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: SVN fetcher fix for SRCREV=AUTOREV situations
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
X-List-Received-Date: Wed, 02 Dec 2009 18:20:31 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

I know that for most people here using SRCREV="${AUTOREV}" sounds bad but
there are situations where it is needed. We, at BugLabs, use it for all
our Java stuff which is run on our device.

We got hit by svn fetcher as it uses "svn co -r REV svn://url@REV" syntax
which fails on AUTOREV... Nevermind which Subversion we use (1.4.6, 1.6.6)
we got same situation:

$ svn co -r 7916 svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common@7916
svn: URL 'svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common' doesn't exist

But:

$ svn co -r 7916 svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common

works fine.

I looked at svn fetcher and prepared this change which fixes situation for me:

diff --git a/bitbake/lib/bb/fetch/svn.py b/bitbake/lib/bb/fetch/svn.py
index aead162..f5dabdb 100644
--- a/bitbake/lib/bb/fetch/svn.py
+++ b/bitbake/lib/bb/fetch/svn.py
@@ -117,7 +117,9 @@ class Svn(Fetch):
             suffix = ""
             if ud.revision:
                 options.append("-r %s" % ud.revision)
-                suffix = "@%s" % (ud.revision)
+                url = "%s://%s/%s/" % (proto, svnroot, ud.module)
+                if ud.revision != self._latest_revision(url, ud, d):
+                    suffix = "@%s" % (ud.revision)
             elif ud.date:
                 options.append("-r {%s}" % ud.date)

What it does? It adds extra "svn info" run to get latest revision
(think AUTOREV) and if it is not the same as wanted revision (think 
SRCREV) then it use "@REV" syntax. I do not feel that it is good way to
solve problem so want to know what other people think about it.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




