Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLkOn-0003pZ-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 00:39:13 +0100
Received: by faas16 with SMTP id s16so1071211faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Nov 2011 16:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T/xIk37NrK5EklBMJ3Yf5mIfyEKrj4IyV/egcXfus1E=;
	b=qQ7g9ydx1ickNdYOSEtMYyPSRoBesQ0ZAOvcfj4ZtUOO2mxGHVOZF/6sd2gIPEhVpK
	8Zl1ThpFQH6cIs6ATgAYKnsZNOAcnll/qsrqbmEEFTCr5iTM+csm0h5Ixm06Yj3+bdY8
	X6ASfsLb4Jy6UxHDgNs6wpMtJOo40nqr7hRNk=
Received: by 10.223.30.149 with SMTP id u21mr11892677fac.18.1320276782103;
	Wed, 02 Nov 2011 16:33:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f4sm59694faj.1.2011.11.02.16.33.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 16:33:00 -0700 (PDT)
Date: Thu, 3 Nov 2011 00:32:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111102233254.GJ9949@jama.jama.net>
References: <20111101085901.447CF1032F@opal>
	<201111022252.15928.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201111022252.15928.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Wed, 02 Nov 2011 23:39:13 -0000
X-Groupsio-MsgNum: 35184
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline

--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2011 at 10:52:15PM +0100, Andreas M=FCller wrote:
> On Tuesday, November 01, 2011 09:59:01 AM git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: bcfc89236b7a96eb00999492351fb9cafc0cbf84
> > URL:  =20
> > http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3Db=
cfc89236b
> > 7a96eb00999492351fb9cafc0cbf84
> >=20
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Wed Oct 19 13:47:03 2011 +0200
> >=20
> > midori: fix build with dirty vala
> >=20
> > * there is only one line added to default waf file
> >   in unpack_wafdir() just before last chdir and return
> >   because those files are downloaded and cannot be patched in normal way
> >   os.system("sed -i
> > \"s/version=3Doutput.split/version=3Doutput.replace('-dirty','').split/=
g\"
> > wafadmin/Tools/vala.py")
> >=20
> > * It fails to parse version like this
> >   /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/valac --version
> >   Vala 0.12.1-dirty
> >   reporting 0.0.0 instead which breaks configure
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >=20
> > ---
> >=20
> >  .../recipes-connectivity/midori/midori-0.4.1/waf   |  Bin 0 -> 92569 b=
ytes
> >  .../recipes-connectivity/midori/midori_0.4.1.bb    |    8 ++++++++
> >  2 files changed, 8 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf
> > b/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf new file mode
> > 100755
> > index 0000000..b74a2d8
> > Binary files /dev/null and
> > b/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf differ diff --git
> > a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> > b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb index
> > 2805b92..860ed21 100644
> > --- a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> > +++ b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> > @@ -1,7 +1,15 @@
> >  require midori.inc
> >=20
> > +PR =3D "r1"
> > +
> >  SRC_URI =3D
> > "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=
=3Dmid
> > ori \ +           file://waf \
> >            "
> > +
> > +do_configure_prepend() {
> > +  cp -f ${WORKDIR}/waf ${S}/
> > +}
> > +
> >  SRC_URI[midori.md5sum] =3D "33dde203cd71ae2b1d2adcc7f5739f65"
> >  SRC_URI[midori.sha256sum] =3D
> > "b3c77ddb6f562a0ea3d2e6fbb756ca0dc158ad8410f4b60f8e5998c2f7305f07"
> >=20
> >=20
> Hm - I am afraid since this update midori never finishes configuring here=
=2E I=20
> waited for approximately 2 hours and stopped the process. The log file is=
=20
> attached ( a fresh retry creates similar log ). I commented out the whole=
=20

Have you tried to revert it to see that it's not caused ie by glib
changes or something? Because my vala detection change is already finished=
=20
before it writes this stuff and the tar in waf is compared with
hardcoded checksum, so it also could not change just by this monster
blob.

Could you also check if there is something interesting in ps aux or
strace when it's "hanging"? On all 3 boxes I have tried this it always
worked as expected.

> | do_configure_prepend()=20
>=20
> function, ran
>=20
> | bitbake -ccleanall midori
>=20
> and
>=20
> | bitbake midori
>=20
> without further issues in few minutes.=20
>=20
> Maybe we should rethink this monster blob commit intended to fix a corner=
 case...

Yes pity that this corner case is our only vala-native and I was hopping
that newer midori with newer waf-1.6 will be released soon and this
won't be needed anymore..

Cheers,

> Andreas

> + cd /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueab=
i/midori-0.4.1-r1/midori-0.4.1
> + do_configure
> + cp -f /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnu=
eabi/midori-0.4.1-r1/waf /home/Superandy/tmp/oe-core-eglibc/work/armv7a-ang=
strom-linux-gnueabi/midori-0.4.1-r1/midori-0.4.1/
> + sed -i -e 's:, shell=3DFalse::g' -e s:/usr/X11R6/include::g -e s:/usr/X=
11R6/lib::g wscript
> + ./configure --prefix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/sbin -=
-libexecdir=3D/usr/libexec --datadir=3D/usr/share --sysconfdir=3D/etc --sha=
redstatedir=3D/com --localstatedir=3D/var --libdir=3D/usr/lib --includedir=
=3D/usr/include --infodir=3D/usr/share/info --mandir=3D/usr/share/man --dis=
able-hildon
> Checking for Python			:  =1B[92m/home/Superandy/tmp/oe-core-eglibc/sysroo=
ts/x86_64-linux/usr/bin/python2=1B[0m
> Checking for WAF			:  =1B[92m/home/Superandy/tmp/oe-core-eglibc/work/armv=
7a-angstrom-linux-gnueabi/midori-0.4.1-r1/midori-0.4.1/waf=1B[0m
> calling waf configure with parameters
> Checking for program gcc or cc           : ccache arm-angstrom-linux-gnue=
abi-gcc  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -ljavascriptcoregtk-1.0  -mthumb-interwork -mno-thumb --=
sysroot=3D/home/Superandy/tmp/oe-core-eglibc/sysroots/overo=20
> Checking for program ar                  : arm-angstrom-linux-gnueabi-ar=
=20
> Checking for program ranlib              : arm-angstrom-linux-gnueabi-ran=
lib=20
> Checking for gcc                         : ok =20
> Checking for program valac               : /home/Superandy/tmp/oe-core-eg=
libc/sysroots/x86_64-linux/usr/bin/valac=20
> Checking for gobject-2.0                 : yes=20
> Checking for gthread-2.0                 : yes=20
> Checking for program version valac >=3D 0.1.6 : ok 0.12.1=20
> Checking for program glib-genmarshal        : /home/Superandy/tmp/oe-core=
-eglibc/sysroots/x86_64-linux/usr/bin/glib-genmarshal=20
> Checking for program glib-mkenums           : /home/Superandy/tmp/oe-core=
-eglibc/sysroots/x86_64-linux/usr/bin/glib-mkenums=20

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6x0yYACgkQN1Ujt2V2gBzMWQCfUQQ49s9WtodQnXaqn9prDurR
WJkAoLlOux0uJ5nrUetXqjJ1F/OXQO1D
=wrio
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--
