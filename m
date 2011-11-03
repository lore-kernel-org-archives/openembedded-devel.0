Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RM57O-00022M-BU
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 22:46:40 +0100
Received: (qmail invoked by alias); 03 Nov 2011 21:40:29 -0000
Received: from p5B0A14EB.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.20.235]
	by mail.gmx.net (mp002) with SMTP; 03 Nov 2011 22:40:29 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/D3tg+UPzDTjR1h0N9u8vERsiosIfbzdJx/pbOvI
	P7XyrUwGpySpuU
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Nov 2011 22:45:16 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <20111101085901.447CF1032F@opal>
	<20111102233254.GJ9949@jama.jama.net>
	<201111030152.49177.schnitzeltony@gmx.de>
In-Reply-To: <201111030152.49177.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201111032245.17175.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] Martin Jansa : midori: fix build with dirty vala
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
X-List-Received-Date: Thu, 03 Nov 2011 21:46:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, November 03, 2011 01:52:48 AM Andreas M=FCller wrote:
> On Thursday, November 03, 2011 12:32:54 AM Martin Jansa wrote:
> > > Hm - I am afraid since this update midori never finishes configuring
> > > here. I waited for approximately 2 hours and stopped the process. The
> > > log file is attached ( a fresh retry creates similar log ). I comment=
ed
> > > out the whole
> >=20
> > Have you tried to revert it to see that it's not caused ie by glib
> > changes or something? Because my vala detection change is already
> > finished before it writes this stuff and the tar in waf is compared with
> > hardcoded checksum, so it also could not change just by this monster
> > blob.
>=20
> When sending previous mail I had two runs with and without your patch whi=
ch
> gave me a clear picture. Now I have had some further rebuilds - seems
> sometimes it builds sometimes not! It's a bit late - tomorrow I would like
> to check further builds to see if I get a hang too with your patch
> reverted.
I created a simple script rebuilding midori again and again. I tested it wi=
th=20
your patch reverted -> I cannot tell when, but when I came back had also ha=
ng on=20
configure. So your patch is out of suspicion. For now my strategy will be l=
iving=20
with it.
>=20
> > Could you also check if there is something interesting in ps aux or
> > strace when it's "hanging"? On all 3 boxes I have tried this it always
> > worked as expected.
> >=20
> > > | do_configure_prepend()
> > >=20
> > > function, ran
> > >=20
> > > | bitbake -ccleanall midori
> > >=20
> > > and
> > >=20
> > > | bitbake midori
> > >=20
> > > without further issues in few minutes.
> > >=20
> > > Maybe we should rethink this monster blob commit intended to fix a
> > > corner case...
> >=20
> > Yes pity that this corner case is our only vala-native and I was hopping
> > that newer midori with newer waf-1.6 will be released soon and this
> > won't be needed anymore..
What I still do not unterstand: Since configure detetced vala correct with =
patch=20
reverted I ran

~/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/valac --version

I got

Vala 0.12.1

Why am I not dirty?

Andreas


