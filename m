Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Ph1rF-0007c4-0Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 16:28:01 +0100
Received: (qmail 4098 invoked by uid 2404007); 23 Jan 2011 15:27:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 23 Jan 2011 15:27:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jan 2011 16:27:39 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.37-12-generic; KDE/4.5.95; x86_64; ; )
References: <201101221206.32796.pieterg@gmx.com>
	<AANLkTing4dVzfMn6p4rcx0uxefyX=uYmv=ER3v+ykzW7@mail.gmail.com>
In-Reply-To: <AANLkTing4dVzfMn6p4rcx0uxefyX=uYmv=ER3v+ykzW7@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201101231627.44759.marcin@juszkiewicz.com.pl>
Subject: Re: e2fsprogs util-linux-ng dependency
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
X-List-Received-Date: Sun, 23 Jan 2011 15:28:01 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 22 stycznia 2011 o 18:06:58 Khem Raj napisa=C5=82(a):
> On Sat, Jan 22, 2011 at 3:06 AM, pieterg <pieterg@gmx.com> wrote:
> > in
> > http://git.openembedded.org/cgit.cgi/openembedded/commit/recipes/e2fspro
> > gs?h=3Dorg.openembedded.dev&id=3Def73bcd899aaf182fb596e5912c20f966e0e69=
51 a
> > util-linux-ng RDEPENDS was added to e2fsprogs.

http://git.openembedded.org/cgit.cgi/openembedded/commit/?h=3Dorg.openembed=
ded.dev&id=3Dec5081ee5b0449b02a0d051ac32e6fae31838dee

was next part of that change. And there were few around it.

> > But I'm wondering whether it was not intended to just RDEPEND on
> > util-linux-ng-blkid, so we can avoid dragging in a large number of
> > unrelated utils?
>=20
> hmmm good point. I think it should just rdep for things which its
> missing or needs to run its own provided programs at runtime

It was done that way to keep upgrade path for packages. Before my changes m=
any=20
binaries were from e2fsprogs package and now got moved to util-linux-ng one=
 or=20
subpackages of it. Feel free to do any adaptations which will improve=20
situation - anything will be better then it was before my patchset was push=
ed.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


