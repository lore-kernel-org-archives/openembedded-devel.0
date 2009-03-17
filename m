Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1LjR0B-0005bk-HX
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 05:34:12 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 6C26346753
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 17:33:22 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id 5C3F446752for 
	<openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2009 17:33:19 
	+1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KGM00001TMH6J00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Tue,17 Mar 2009 17:33:19 +1300 (NZDT)
Received: from [172.25.116.23] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KGM00G66VBHWB50@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Tue,17 Mar 2009 17:33:18 
	+1300 (NZDT)
Date: Tue, 17 Mar 2009 17:33:14 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
To: openembedded-devel@lists.openembedded.org
Message-id: <49BF280A.7090705@tait.co.nz>
MIME-version: 1.0
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
X-imss-version: 2.053
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_40,HTML_MESSAGE,
	RDNS_NONE,UNPARSEABLE_RELAY autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Git SRC_TARBALL_STASH filename
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
X-List-Received-Date: Tue, 17 Mar 2009 04:34:12 -0000
Content-Type: text/plain; format=flowed; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT

Working behind a firewall that doesn't allow Git access (except over 
http). I've set SRC_TARBALL_STASH so that we only have to download the 
appropriate source tarball (manually) once.

While building mtd-utils, BitBake is trying to fetch from the tarball stash:

    http://.../git_git.infradead.org.mtd-utils.git.tar.gz

Instead of:

    http://.../git_git.infradead.org.mtd-utils.git_ea429635388f7bb53f62c41ec3d5ccf5fa207370.tar.gz

The following patch appears to do the job, but I'm not confident this is 
the right fix. I notice that all the other fetchers use ud.localfile, 
which already has the correct filename.

Index: lib/bb/fetch/git.py
===================================================================
--- lib/bb/fetch/git.py    (revision 16639)
+++ lib/bb/fetch/git.py    (working copy)
@@ -73,7 +73,7 @@
 
         gitsrcname = '%s%s' % (ud.host, ud.path.replace('/', '.'))
 
-        repofilename = 'git_%s.tar.gz' % (gitsrcname)
+        repofilename = 'git_%s_%s.tar.gz' % (gitsrcname, ud.tag)
         repofile = os.path.join(data.getVar("DL_DIR", d, 1), repofilename)
         repodir = os.path.join(data.expand('${GITDIR}', d), gitsrcname)


Suggestions?
Douglas.






=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================


