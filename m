Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1ROl14-0006Au-F1
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 07:55:10 +0100
Received: (qmail invoked by alias); 11 Nov 2011 06:48:52 -0000
Received: from p5B0A2B0A.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.43.10]
	by mail.gmx.net (mp021) with SMTP; 11 Nov 2011 07:48:52 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19plXRXQ1xpTfVA9elyDPZPzVzTuV8rjsHknbYw4S
	Lrnkyng/Yp2J78
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 07:53:50 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1320929044-13077-1-git-send-email-koen@dominion.thruhere.net>
	<A8FB2C52-B689-46AF-9D24-D1EEBA2B19CF@dominion.thruhere.net>
	<201111101956.09638.schnitzeltony@gmx.de>
In-Reply-To: <201111101956.09638.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201111110753.50771.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: xfce4-dev-tools (was [OE-core] [PATCH] hicolor-icon-theme 0.12: add BBCLASSEXTEND=native for xfce tools)
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
X-List-Received-Date: Fri, 11 Nov 2011 06:55:10 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, November 10, 2011 07:56:09 PM Andreas M=FCller wrote:
> On Thursday, November 10, 2011 02:38:33 PM you wrote:
> > Op 10 nov. 2011, om 14:20 heeft Richard Purdie het volgende geschreven:
> > > On Thu, 2011-11-10 at 13:44 +0100, Koen Kooi wrote:
> > >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > >> ---
> > >> .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 ++
> > >> 1 files changed, 2 insertions(+), 0 deletions(-)
> > >>=20
> > >> diff --git
> > >> a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> > >> b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> > >> index 759c9d8..aeb89c9 100644
> > >> --- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.=
bb
> > >> +++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.=
bb
> > >> @@ -5,6 +5,8 @@ BUGTRACKER =3D "https://bugs.freedesktop.org/"
> > >> LICENSE =3D "GPLv2"
> > >> LIC_FILES_CHKSUM =3D
> > >> "file://COPYING;md5=3Df08a446809913fc9b3c718f0eaea0426"
> > >>=20
> > >> +BBCLASSEXTEND =3D "native"
> > >> +
> > >> SECTION =3D "unknown"
> > >> inherit gnome allarch
> > >=20
> > > This is interesting dilemma since this is an allarch recipe. What iss=
ue
> > > were you seeing to need this? Could we add the allarch sysroot
> > > directory to PATH to resolve this instead? We could add a PROVIDES
> > > "hicolor-icon-theme-native" too...
> >=20
> > XFCE needs some native tools to run, one of which has hicolor-icon-theme
> > in its depends. Without this patch you can't build xfce. Andreas might
> > know more about this.
>=20
> Up to this mail I did not notice any problem but the bad guy seems
> xfce4-dev- tools: Few xfce recipes depend on that and it contains only:
>=20
> - m4 autoconf extensions
> - two shell scripts (don't know what they are for...)
After test build fails for xfce-git recipes I know what the scripts are for=
:=20
some extension, the shipped autogen scripts insist on. So the native suppor=
t for=20
xfce4-dev-tools was not that bad I think. I will break the dependency to =20
hicolor- icon-theme and have a test build with that...
>=20
> By inheriting xfce, it inherits gtk-icon-cache which seems to depend on
> hicolor- icon-theme.
>=20
> I don't remember what exactly my idea was, when adding native support on
> that.
>=20
> Will make a change, build test it on fresh build dir and send a patch on
> meta-oe mailing list.
>=20
> Apart from bad practice on xfce4-dev-tools: I wouldn't have expected
> trouble when a native recipe depends on an allarch one.
>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


