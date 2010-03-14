Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NquBj-0006wD-Se
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 21:13:32 +0100
Received: (qmail 20582 invoked by uid 813007); 14 Mar 2010 20:10:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 14 Mar 2010 20:10:27 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Mar 2010 21:09:29 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <20100310103133.14548.62608.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<4B9A02C9.3030205@ge.com> <1268423765.1625.18.camel@rex>
In-Reply-To: <1268423765.1625.18.camel@rex>
MIME-Version: 1.0
Message-Id: <201003142109.30696.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Allow spectrum fw to build behind a proxy
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
X-List-Received-Date: Sun, 14 Mar 2010 20:13:32 -0000
X-Groupsio-MsgNum: 17598
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_6JUnLn4RHyBvTLt"

--Boundary-00=_6JUnLn4RHyBvTLt
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 12 marca 2010 o 20:56:05 Richard Purdie napisa=C5=82(a):

> Ah, I remember this now. It is not a bitbake bug put a base.bbclass bug
> as something somewhere has incorrect quoting. Its been fixed in Poky but
> probably should be pushed into OE too. If you find the commit where I
> last touched the spectrum-fw driver you'll find the core class change
> too I suspect. It'd be good to get synced up on that.

Attached is that changeset. I will look at it tomorrow if someone will not=
=20
merge it before.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--Boundary-00=_6JUnLn4RHyBvTLt
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-base.bbclass-bitbake.conf-Fix-some-string-quoting-to.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-base.bbclass-bitbake.conf-Fix-some-string-quoting-to.patch"

From b8ff2b6cc3fd50420dda19eaf78943bad64aad3b Mon Sep 17 00:00:00 2001
From: Richard Purdie <rpurdie@rpsys.net>
Date: Thu, 23 Oct 2008 21:08:42 +0100
Subject: [PATCH] base.bbclass/bitbake.conf: Fix some string quoting to hand=
le more unusual URLs

---
 meta/classes/base.bbclass |    2 +-
 meta/conf/bitbake.conf    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d67579d..c6e19c1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -641,7 +641,7 @@ def oe_unpack_file(file, data, url =3D None):
 		(type, host, path, user, pswd, parm) =3D bb.decodeurl(url)
 		if 'dos' in parm:
 			cmd =3D '%s -a' % cmd
-		cmd =3D '%s %s' % (cmd, file)
+		cmd =3D "%s '%s'" % (cmd, file)
 	elif os.path.isdir(file):
 		filesdir =3D os.path.realpath(bb.data.getVar("FILESDIR", data, 1))
 		destdir =3D "."
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a7ab50b..6919649 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -476,12 +476,12 @@ FETCHCMD_bzr =3D "/usr/bin/env bzr"
 FETCHCMD_hg =3D "/usr/bin/env hg"
=20
 FETCHCOMMAND =3D "ERROR, this must be a BitBake bug"
-FETCHCOMMAND_wget =3D "/usr/bin/env wget -t 5 --passive-ftp -P ${DL_DIR} $=
{URI}"
+FETCHCOMMAND_wget =3D "/usr/bin/env wget -t 5 --passive-ftp -P ${DL_DIR} '=
${URI}'"
 FETCHCOMMAND_cvs =3D "/usr/bin/env cvs '-d${CVSROOT}' co ${CVSCOOPTS} ${CV=
SMODULE}"
 FETCHCOMMAND_svn =3D "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMOD=
ULE}"
 CHECKCOMMAND_wget =3D "/usr/bin/env wget --spider -t 5 --passive-ftp -P ${=
DL_DIR} ${URI}"
 RESUMECOMMAND =3D "ERROR, this must be a BitBake bug"
-RESUMECOMMAND_wget =3D "/usr/bin/env wget -c -t 5 --passive-ftp -P ${DL_DI=
R} ${URI}"
+RESUMECOMMAND_wget =3D "/usr/bin/env wget -c -t 5 --passive-ftp -P ${DL_DI=
R} '${URI}'"
 UPDATECOMMAND =3D "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs =3D "/usr/bin/env cvs -d${CVSROOT} update -d -P ${CVSCOO=
PTS}"
 UPDATECOMMAND_svn =3D "/usr/bin/env svn update ${SVNCOOPTS}"
--=20
1.7.0


--Boundary-00=_6JUnLn4RHyBvTLt--
