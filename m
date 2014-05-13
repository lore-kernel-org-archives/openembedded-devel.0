Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f44.google.com (unknown [209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3725E660B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 06:56:32 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr17so2714275lab.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 23:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kOYZkMKrvf+D+HQIq5vhyh5EgLO0GSuO+Ia/L1OBoVo=;
	b=nOx4/KyqpysENkW9rwzYBrFW8fTLj6RG9QzHewWDpABmxVjemHrSm/DMq6d9bNV/Fv
	vSl4D2HnWvH8o2/4K+0KTurXq0hhDH8VDJdnd5x3uN+nwt7U4hdqfDTln+mhkHWUz0WA
	DHbs4D9n6Veqz/vhcvRYtHcGdxvstSigkPaf8nW8EmnYUGRCiHpCLwJde0Zthl6aEa1Z
	QGMO28grf/sXcSEopZHEimDZEL8pavp0JWPt4DegMyIBKd47czCPG0FZ/1LZHKP1mqwZ
	ywsqgYlwvEOqnPu+xUXUWtU0L9jVoaWR6DkG76wkCT0KbWoYx3qvZkT38scnHy/jGfEX
	ze2g==
X-Received: by 10.152.42.194 with SMTP id q2mr1901456lal.39.1399964192802;
	Mon, 12 May 2014 23:56:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wm10sm16052250lbb.29.2014.05.12.23.56.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 23:56:31 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 May 2014 08:57:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140513065700.GI22774@jama>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
	<1399887698-19336-4-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 May 2014 06:56:35 -0000
X-Groupsio-MsgNum: 49885
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline

--kswDJesP0akhmDn8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 02:17:07AM +0200, Andreas M=FCller wrote:
> On Mon, May 12, 2014 at 11:41 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > buildhistory diff:
> > --- a/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/=
qtwayland-dev/latest
> > +++ b/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/=
qtwayland-dev/latest
> > @@ -4,6 +4,6 @@ PKGV =3D 5.2.1+git0+f9ebbd6c61
> >  RPROVIDES =3D
> >  RDEPENDS =3D qtwayland
> >  RRECOMMENDS =3D eglibc-dev libgcc-dev libstdc++-dev libxkbcommon-dev q=
tbase-dev qtdeclarative-dev wayland-dev xproto-dev zlib-dev
> > -PKGSIZE =3D 295533
> > +PKGSIZE =3D 537651
> >  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /us=
r/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*=
=2Eo /usr/lib/qtwayland/*.la /lib/*.la
> > -FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/=
qwlclientbufferintegration_p.h /usr/include/qt5/QtCompositor/5.3.0/QtCompos=
itor/private/qwlclientbufferintegrat
> > +FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/=
qwayland-server-hardware-integration.h /usr/include/qt5/QtCompositor/5.3.0/=
QtCompositor/private/qwayland-server
> >
> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > ---
> >  recipes-qt/qt5/qtwayland_git.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland=
_git.bb
> > index ebdda82..8da8249 100644
> > --- a/recipes-qt/qt5/qtwayland_git.bb
> > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > @@ -9,3 +9,8 @@ SRCREV =3D "f9ebbd6c618488f9b671f5504528ced3350754fb"
> >  SRC_URI +=3D " \
> >      file://0001-examples.pro-include-server-buffer-only-when-buildin.p=
atch \
> >  "
> > +
> > +do_install_append() {
> > +       # do install files created by qtwaylandscanner
> > +       install ${B}/include/QtCompositor/5.2.1/QtCompositor/private/{q=
wayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtComposito=
r/5.2.1/QtCompositor/private
> Aargh: Wrong directory did test with /usr/include and expected
> includedir =3D /usr/include -> V2 will follow

fwiw: 2/3 and 3/3 were using tabs in do_install, I've fixed it when
cherry-picking to master-next

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNxwjwACgkQN1Ujt2V2gBxcigCgtifcfum5BPS0xiri0cvkKo79
B1AAoIungIAqup0vPw0ZHvzVEFmoYDNt
=RA92
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
