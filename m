Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f171.google.com (unknown [209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5150D60D0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:41:59 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lc6so29492vcb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VnDiOJ6L3g19hwAxiSiVzZRi+JOBmWZv20y/tjpSECk=;
	b=YKWVZQ/89DnsLAwMumZZ0PvZEOs4XXnkMBJ/oSu+L7l7RfG4fEKG6ZZ5gmL4a7ok9K
	8PrMARlQA8dY7jKt860Zt5/V10NAjMTBYT1pELidexEnRiSK6Btjd2paFaLRPJy4L8fH
	UgC7mQzPAUUqdgO3DoEOOg5hmHGZ4CYZLm0rDAjL4rq+xephDn5vswBMg4xjhWUeXbco
	uBiAZixrnbZCUffJlgMehDdBi8WpMkCOCz6UXkC+Cwckg5JHpdZNlHuexjPpldz02sbo
	3SgksBxhyYOBaEC7aRH0r7UGMrGasRVUlDvHsZDbJ7HqIow/slwYaUeIkmNYf9ctKFOl
	hsGQ==
X-Received: by 10.58.18.198 with SMTP id y6mr6244760ved.31.1399970520414;
	Tue, 13 May 2014 01:42:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id 6sm27479774vdy.1.2014.05.13.01.41.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 01:41:59 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 May 2014 10:42:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140513084225.GL22774@jama>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
	<1399887698-19336-4-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
	<20140513065700.GI22774@jama>
MIME-Version: 1.0
In-Reply-To: <20140513065700.GI22774@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [RFC][meta-qt5 3/3] qtwayland: install created private headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 May 2014 08:42:00 -0000
X-Groupsio-MsgNum: 49893
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Content-Disposition: inline

--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 08:57:00AM +0200, Martin Jansa wrote:
> On Tue, May 13, 2014 at 02:17:07AM +0200, Andreas M=FCller wrote:
> > On Mon, May 12, 2014 at 11:41 AM, Andreas M=FCller
> > <schnitzeltony@googlemail.com> wrote:
> > > buildhistory diff:
> > > --- a/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwaylan=
d/qtwayland-dev/latest
> > > +++ b/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwaylan=
d/qtwayland-dev/latest
> > > @@ -4,6 +4,6 @@ PKGV =3D 5.2.1+git0+f9ebbd6c61
> > >  RPROVIDES =3D
> > >  RDEPENDS =3D qtwayland
> > >  RRECOMMENDS =3D eglibc-dev libgcc-dev libstdc++-dev libxkbcommon-dev=
 qtbase-dev qtdeclarative-dev wayland-dev xproto-dev zlib-dev
> > > -PKGSIZE =3D 295533
> > > +PKGSIZE =3D 537651
> > >  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /=
usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib=
/*.o /usr/lib/qtwayland/*.la /lib/*.la
> > > -FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/privat=
e/qwlclientbufferintegration_p.h /usr/include/qt5/QtCompositor/5.3.0/QtComp=
ositor/private/qwlclientbufferintegrat
> > > +FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/privat=
e/qwayland-server-hardware-integration.h /usr/include/qt5/QtCompositor/5.3.=
0/QtCompositor/private/qwayland-server
> > >
> > > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > > ---
> > >  recipes-qt/qt5/qtwayland_git.bb | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayla=
nd_git.bb
> > > index ebdda82..8da8249 100644
> > > --- a/recipes-qt/qt5/qtwayland_git.bb
> > > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > > @@ -9,3 +9,8 @@ SRCREV =3D "f9ebbd6c618488f9b671f5504528ced3350754fb"
> > >  SRC_URI +=3D " \
> > >      file://0001-examples.pro-include-server-buffer-only-when-buildin=
=2Epatch \
> > >  "
> > > +
> > > +do_install_append() {
> > > +       # do install files created by qtwaylandscanner
> > > +       install ${B}/include/QtCompositor/5.2.1/QtCompositor/private/=
{qwayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtComposi=
tor/5.2.1/QtCompositor/private
> > Aargh: Wrong directory did test with /usr/include and expected
> > includedir =3D /usr/include -> V2 will follow
>=20
> fwiw: 2/3 and 3/3 were using tabs in do_install, I've fixed it when
> cherry-picking to master-next

Fails in world builds with dash:

| install: cannot stat
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/qtwayland/5.2.1+gitAUTOINC+f9ebbd6c61-r0/build/include/QtComposi=
tor/5.2.1/QtCompositor/private/{qwayland-server-*,*protocol*}.h':
No such file or directory

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNx2vEACgkQN1Ujt2V2gByNfACfVnmQi/LDHgqsEXCR4Ns/hBTg
KAYAoKVLm4GOK5PaHqEHZ6mh2iqzIMxv
=LgNL
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--
