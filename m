Received: from mail-pd0-f170.google.com ([209.85.192.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyOl-0007NO-PL
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:36:34 +0100
Received: by mail-pd0-f170.google.com with SMTP id 4so1516410pdd.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=okhm9xNbf818sUYYmQkm1/k2bFKe3imhDUnqajynCTA=;
	b=zzX00VWPEk1ZMyNrrMofRPNeQL5fFLkBRiXYenDx0hM+csej6Fd27lc8Xlb6yGh3eS
	Wnn6WMmshkRdkdGSvMI8ExLl9+tBIsW5PTaFKcpvegy9XGruHlWI2Xt3okm+kWmJSKU+
	5aRHKYkzkDWMVnIlP7Gngg+QumXAz/1eXLvA6WP66X+u1Bu6lit7UFg80oRXyB/Q39J/
	dKMk+RWAYq1i+LT/A77QmatqiMqryJ2tu7ODRihymkwXQf0fObqsbLQCiNE5NX86SW79
	Po/FhIdWhnPvxaMlyUhB5hKhYwAquVDP7XbqqRrZIYpcLi3thiCFdFphDgRdL7+u7PSI
	7WqQ==
X-Received: by 10.66.248.74 with SMTP id yk10mr2078861pac.156.1363943977528;
	Fri, 22 Mar 2013 02:19:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eh5sm1688239pbc.44.2013.03.22.02.19.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:19:36 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:19:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322091935.GH3219@jama>
References: <1363730433-8555-1-git-send-email-ftonello@cercacor.com>
	<20130320100503.GA3220@jama> <5149FCF2.2090907@felipetonello.com>
MIME-Version: 1.0
In-Reply-To: <5149FCF2.2090907@felipetonello.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v4] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Fri, 22 Mar 2013 09:36:44 -0000
X-Groupsio-MsgNum: 43649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGu/vTNewDGZ7tmp"
Content-Disposition: inline

--MGu/vTNewDGZ7tmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2013 at 11:16:18AM -0700, Felipe Ferreri Tonello wrote:
> Hi Martin,
>=20
> On 03/20/2013 03:05 AM, Martin Jansa wrote:
> > On Tue, Mar 19, 2013 at 03:00:33PM -0700, eu@felipetonello.com wrote:
> >> From: "Felipe F. Tonello" <ftonello@cercacor.com>
> >>
> >> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in=
 any Qt4
> >> environment.
> >>
> >> This recipe can be extended by a .bbappend to add .desktop, icon and o=
thers to
> >> the target device.
> >
> > This part of commit message can be dropped now right?
>=20
> Yes, that's fine.

Applied, thanks!

>=20
> Thanks
>=20
> Felipe
>=20
> >
> > I'll drop it before pushing it (if it builds OK on jenkins) no need for
> > v5 if nobody sends more comments.
> >
> >> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> >> ---
> >>   meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   44 +++++++++++=
++++++++++
> >>   1 file changed, 44 insertions(+)
> >>   create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
> >>
> >> diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-=
oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
> >> new file mode 100644
> >> index 0000000..59533a4
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
> >> @@ -0,0 +1,44 @@
> >> +DESCRIPTION =3D "A terminal emulator for Harmattan (Nokia N9/N950) wi=
th a custom \
> >> +virtual keyboard and usability-enhancing features such as URL grabber=
, pan \
> >> +gestures and customizable shortcut menu. Designed especially to be us=
ed with \
> >> +screen and irssi."
> >> +HOMEPAGE =3D "http://hqh.unlink.org/harmattan"
> >> +LICENSE =3D "GPLv3"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> >> +SECTION =3D "qt/app"
> >> +
> >> +PR =3D "r0"
> >> +
> >> +inherit qt4x11 pkgconfig
> >> +
> >> +SRC_URI =3D " \
> >> +  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
> >> +"
> >> +
> >> +SRC_URI[md5sum] =3D "d53b0f463c025583cd52accf95715448"
> >> +SRC_URI[sha256sum] =3D "c21a07cc411d09739bd7fa248eba2bf96427b3f032382=
a044b6674dd82d95150"
> >> +
> >> +S =3D "${WORKDIR}/${PN}"
> >> +
> >> +FILES_${PN} =3D " \
> >> +  ${bindir}/${PN} \
> >> +  ${datadir}/applications/${PN}.desktop \
> >> +  ${datadir}/pixmaps/${PN}.png \
> >> +"
> >> +
> >> +do_install() {
> >> +  install -d ${D}${bindir}
> >> +  install -m 0744 ${S}/${PN} ${D}${bindir}
> >> +
> >> +  sed -i -e '/Exec.*/d' fingerterm.desktop
> >> +  sed -i -e '/Icon.*/d' fingerterm.desktop
> >> +
> >> +  echo 'Exec=3D${bindir}/${PN}' >> fingerterm.desktop
> >> +  echo 'Icon=3D${PN}' >> fingerterm.desktop
> >> +
> >> +  install -d ${D}${datadir}/applications
> >> +  install -m 0644 ${S}/${PN}.desktop ${D}${datadir}/applications
> >> +
> >> +  install -d ${D}${datadir}/pixmaps
> >> +  install -m 0644 ${S}/${PN}.png ${D}${datadir}/pixmaps
> >> +}
> >> \ No newline at end of file
> >> --
> >> 1.7.9.5
> >>
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MGu/vTNewDGZ7tmp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIicACgkQN1Ujt2V2gByw9ACgpsDpRFBfirC9fVeCzuPE9KXf
jCIAmwVkTd0WTGXn1w9jtp3kFfycEQAz
=Mtdn
-----END PGP SIGNATURE-----

--MGu/vTNewDGZ7tmp--
