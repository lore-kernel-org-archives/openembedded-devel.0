Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QGZ6Z-0005TB-UM
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 18:02:45 +0200
Received: (qmail invoked by alias); 01 May 2011 16:00:07 -0000
Received: from p579634A8.dip.t-dialin.net (EHLO localhost.localdomain)
	[87.150.52.168]
	by mail.gmx.net (mp032) with SMTP; 01 May 2011 18:00:07 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+Ek+QSUkqEgxXcwbgJBFXWlI8hP2vaevQrIbNONd
	swEsMvaHCadyNZ
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 1 May 2011 18:00:42 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.35.12-90.fc14.x86_64; KDE/4.6.2; x86_64; ;
	)
References: <1304166728-3002-1-git-send-email-schnitzeltony@gmx.de>
	<1304192489.3928.8.camel@mattotaupa>
In-Reply-To: <1304192489.3928.8.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201105011800.42931.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] libgpsbt: add dbus-glib to DEPENDS
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
X-List-Received-Date: Sun, 01 May 2011 16:02:45 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, April 30, 2011 09:41:29 PM Paul Menzel wrote:
> Dear Andreas,
>=20
> Am Samstag, den 30.04.2011, 14:32 +0200 schrieb Andreas Mueller:
> > During performance tests with BB_NUMBER_THREADS > 10
> > libgpsbt failed with
> >=20
> > | /home/Superandy/tmp/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angs=
tr
> > | om-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> > | cannot find -ldbus-glib-1 collect2: ld returned 1 exit status
> > | make[1]: *** [libgpsbt.la] Error 1
> > | make[1]: Leaving directory
> > | `/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueabi/libgpsbt-0.1-r
> > | 2/libgpsbt-0.1' make: *** [all] Error 2
> > | + die 'oe_runmake failed'
> > | + oefatal 'oe_runmake failed'
> > | + echo FATAL: 'oe_runmake failed'
> > | FATAL: oe_runmake failed
> > | + exit 1
> >=20
> > ...
> > ERROR:
> > '/home/Superandy/data/OpenEmbedded/gumstix-oe/recipes/maemo4/libgpsbt_0.
> > 1.bb' failed
>=20
> Why is the task compile even executed for your system? Using
> `minimal-uclibc` already task configure detects the missing dependency.
I don't know and I do not have the full logs anymore. Maybe it was related =
to a=20
high value of BB_NUMBER_THREADS. I made tests with BB_NUMBER_THREADS =3D 64.
>=20
>         [=E2=80=A6]
>=20
>         | checking for GLIB... yes
>         | checking for DBUS... configure: error: Package requirements (
>         | dbus-glib-1 >=3D 0.23 ) were not met:
>         |=20
>         | No package 'dbus-glib-1' found
>         |=20
>         | Consider adjusting the PKG_CONFIG_PATH environment variable if
>         | you installed software in a non-standard prefix.
>         |=20
>         | Alternatively, you may set the environment variables DBUS_CFLAGS
>         | and DBUS_LIBS to avoid the need to call pkg-config.
>         | See the pkg-config man page for more details.
>=20
>         NOTE: package libgpsbt-0.1-r2: task do_configure: Failed
>=20
> > Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
>=20
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> > ---
> >=20
> >  recipes/maemo4/libgpsbt_0.1.bb |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/recipes/maemo4/libgpsbt_0.1.bb
> > b/recipes/maemo4/libgpsbt_0.1.bb index c6c6ea6..d199379 100644
> > --- a/recipes/maemo4/libgpsbt_0.1.bb
> > +++ b/recipes/maemo4/libgpsbt_0.1.bb
> > @@ -1,8 +1,8 @@
> >=20
> >  LICENSE =3D "nokia"
> >=20
> > -PR =3D "r2"
> > +PR =3D "r3"
>=20
> Is that needed?
You are right I think it's not needed. In case there any harm I can resend.
>=20
> > -DEPENDS =3D "libgpsmgr dbus"
> > +DEPENDS =3D "libgpsmgr dbus dbus-glib"
> >=20
> >  # This is proprietary software in Chinook, so we have to stay with the
> >  last released # free version.
>=20
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
>=20
> Thanks,
>=20
> Paul


