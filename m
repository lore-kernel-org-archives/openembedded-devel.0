Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NKuII-0000bR-Rd
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 14:52:02 +0100
Received: (qmail 24259 invoked by uid 813007); 16 Dec 2009 13:50:13 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Dec 2009 13:50:13 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Dec 2009 14:50:08 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32; KDE/4.3.2; x86_64; ; )
References: <200912021919.06663.marcin@juszkiewicz.com.pl>
	<4B283AD7.9020501@tait.co.nz>
In-Reply-To: <4B283AD7.9020501@tait.co.nz>
MIME-Version: 1.0
Message-Id: <200912161450.09037.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SVN fetcher fix for SRCREV=AUTOREV situations
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
X-List-Received-Date: Wed, 16 Dec 2009 13:52:02 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 16 grudnia 2009 o 02:41:43 Douglas Royds napisa=C5=82(a):
> Marcin Juszkiewicz wrote:
> > $ svn co -r 7916
> > svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common=
@7
> >916 svn: URL
> > 'svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.commo=
n'
> > doesn't exist
> >
> > But:
> >
> > $ svn co -r 7916
> > svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common
> >
> > works fine.
=20
> The R1.4 branch didn't exist in r7916 -=20

14:47 hrw@home:~$ LC_ALL=3DC svn info=20
svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common
Path: com.buglabs.bug.audio.common
URL: svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common
Repository Root: svn://svn.buglabs.net
Repository UUID: 35ad6e01-222d-0410-b96a-b41bba574936
Revision: 10697
Node Kind: directory
Last Changed Author: kgilmer
Last Changed Rev: 7916
Last Changed Date: 2009-01-12 17:15:17 +0100 (Mon, 12 Jan 2009)

And Bitbake uses "Last Changed Rev" field for AUTOREV.=20

> that branch was created in r8660.

That branch was created by using "svn move" so it has history of previous=20
branch. And /bug/trunk/ is other branch of same code - they have common=20
ancestor.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




