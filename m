Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NgAcS-0002st-FE
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 06:32:43 +0100
Received: (qmail 5439 invoked by uid 813007); 13 Feb 2010 05:30:06 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Feb 2010 05:30:06 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Feb 2010 06:29:53 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1265986283-28972-3-git-send-email-marcin@juszkiewicz.com.pl>
	<19c1b8a91002121212lfc08525uc615f845de7160e8@mail.gmail.com>
In-Reply-To: <19c1b8a91002121212lfc08525uc615f845de7160e8@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201002130629.54588.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] util-linux-ng: provide libblkid/libuuid/fsck
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
X-List-Received-Date: Sat, 13 Feb 2010 05:32:43 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 12 lutego 2010 o 21:12:24 Khem Raj napisa=C5=82(a):
> > +PR =3D "${INC_PR}.4"
>=20
> may be you should start with 0 instead of 4 since its a new recipe.

Will make it on push.
=20
> > +
> > +SRC_URI +=3D "file://uclibc-compile.patch;patch=3D1\
> > +           file://util-linux-ng-replace-siginterrupt.patch;patch=3D1 \
> > +           "
> > +
> > +EXTRA_OECONF +=3D " --enable-libuuid --enable-libblkid \
> > +               --enable-fsck"
>=20
> in this recipe fsck is enabled but 2.16 disables it will that create
> packaging problems for 2.16 now due to changes in util-linux-ng.inc ?

This patchset is more idea then ready to push stuff. I want to solve proble=
m=20
on blkid/uuid libraries and fsck was just one extra thing. Probably would n=
eed=20
to add some rreplaces/rconflicts stuff.

Today I am leaving for few days - be back on Thursday.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




