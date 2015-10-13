Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC6E607A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:08:25 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so57399359wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bVDEF0Qf94XiMRIWGBAUvMn4g2p0nTkHRcDnX6x+bE8=;
	b=WUDTPiBGfGvdO8c+x70TYzYBYLMHn9I74KaFr4j/PJTcfGDn+rnRK1N8hGoKEypFJa
	ilWrUknyZGsxFYbn+9wBEyTFsnQQZVD4wA6JB7rfqpxqoeZVV+1WfKwBZKwurJEuBwCy
	zGdShO5xKD1JbbrMBC3iVOO5Ko5HPps+df2sFuoTwbaAxsLymzt/VARFhITDODqG2sLk
	hNWbJd88CdwZMfn3hdX1WmEnJppcxZ4iDH5BGMje2VzA4JZtaJnmuMQ3j9kTp0IV/qno
	U7NOgppuVfKrBbTPZKl0K4lGkZoyonCnMeCXXexnJ2D6VRbweOSPDpY8LUv/6MxaCmpL
	PyzQ==
X-Received: by 10.180.35.199 with SMTP id k7mr22572995wij.13.1444741702749;
	Tue, 13 Oct 2015 06:08:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bu19sm3577696wjb.45.2015.10.13.06.08.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 06:08:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2015 15:08:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151013130825.GE2396@jama>
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
	<1444373887-24315-1-git-send-email-adrian.ratiu@ni.com>
	<20151013105339.GC2396@jama> <561CFBB4.4000404@ni.com>
MIME-Version: 1.0
In-Reply-To: <561CFBB4.4000404@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH v2] meta-oe: recipes-graphics: add libvncserver recipe
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
X-List-Received-Date: Tue, 13 Oct 2015 13:08:30 -0000
X-Groupsio-MsgNum: 57795
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline

--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 03:40:20PM +0300, Ioan-Adrian Ratiu wrote:
> On 13.10.2015 13:53, Martin Jansa wrote:
> > On Fri, Oct 09, 2015 at 09:58:07AM +0300, Ioan-Adrian Ratiu wrote:
> >> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >> ---
> >>   .../libvncserver/libvncserver_0.9.10.bb               | 19 +++++++++=
++++++++++
> >>   1 file changed, 19 insertions(+)
> >>   create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserve=
r_0.9.10.bb
> >>
> >> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10=
=2Ebb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> >> new file mode 100644
> >> index 0000000..afa303c
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> >> @@ -0,0 +1,19 @@
> >> +DESCRIPTION =3D "library for easy implementation of a RDP/VNC server"

Use SUMMARY for such short description.

> >> +HOMEPAGE =3D "https://libvnc.github.io"
> >> +SECTION =3D "libs"
> >> +PRIORITY =3D "optional"

Drop PRIORITY, we don't use it anywhere.

> >> +LICENSE =3D "GPLv2"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26c6900a926b62=
aada5f"
> >> +
> >> +DEPENDS +=3D "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> >> +RDEPENDS_${PN} +=3D "libpng gtk+ libgcrypt"
> >> +
> >> +RCONFLICTS_${PN} =3D "x11vnc"
> >
> > This isn't enough to resolve conflicts with x11vnc in sysroot, this only
> > prevent installing both packages in the same image.
> >
> >> +
> >> +inherit autotools pkgconfig
> >> +
> >> +SRC_URI  =3D "git://github.com/LibVNC/libvncserver.git;tag=3DLibVNCSe=
rver-0.9.10"
> >
> > Set SRCREV matching with this tag, otherwise bitbake will always use git
> > ls-remote to convert tag name to git SHA, which won't work for builds
> > from premirror (possibly without access to network)
> >
>=20
> This is easy to fix, however the above x11vnc conflict is not and I have=
=20
> to check with upstream developers which might take awhile.
>=20
> Is it ok to blacklist libvncserver in patch v3 in order to not break=20
> x11vnc until this is solved?

I don't want to introduce more blacklisted recipes in meta-oe, so this
won't be merged until it's resolved.

> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +EXTRA_OEMAKE_append=3D" SUBDIRS=3D'libvncserver' "
> >> --
> >> 2.1.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYdAkgACgkQN1Ujt2V2gBzykwCfd/WxfUQqmzr2XMVI9je6siTJ
SVwAoLBcoMEcAKND7uw5MER1j4HDrGkz
=hesS
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
