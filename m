Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8C16FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 15:38:26 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtps (TLSv1:AES128-SHA:128)
	id 1cOndy-00017t-NW from Joe_MacDonald@mentor.com ;
	Wed, 04 Jan 2017 07:38:26 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Jan 2017 07:37:46 -0800
Received: by burninator (Postfix, from userid 1000)	id 8AB01580AAC; Wed,  4
	Jan 2017 10:37:45 -0500 (EST)
Date: Wed, 4 Jan 2017 10:37:45 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170104153745.GB28577@mentor.com>
References: <1482309754-1281-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<FB7117A4-E946-4B3B-B6ED-0657F79BF136@gmail.com>
MIME-Version: 1.0
In-Reply-To: <FB7117A4-E946-4B3B-B6ED-0657F79BF136@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] opensaf: 5.0.0 -> 5.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2017 15:38:29 -0000
X-Groupsio-MsgNum: 64618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline

--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] [PATCH] opensaf: 5.0.0 -> 5.1.0] On 16.12.21 (W=
ed 21:53) Khem Raj wrote:

>=20
> > On Dec 21, 2016, at 12:42 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> =
wrote:
> >=20
> > 1)Upgrade opensaf from 5.0.0 to 5.1.0.
> > 2)Modify meta_oe_security_flags.inc to fix error:
> >  /
> >  | collect2: error: ld returned 1 exit status
> >  | Makefile:542: recipe for target 'librda.la' failed
> >  | make[6]: *** [librda.la] Error 1
> >  \
> >=20
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > ---
> > .../recipes-daemons/opensaf/{opensaf_5.0.0.bb =3D> opensaf_5.1.0.bb}   =
 | 4 ++--
> > meta-oe/conf/distro/include/meta_oe_security_flags.inc                |=
 1 +
> > 2 files changed, 3 insertions(+), 2 deletions(-)
> > rename meta-networking/recipes-daemons/opensaf/{opensaf_5.0.0.bb =3D> o=
pensaf_5.1.0.bb} (94%)
> >=20
> > diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b=
/meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
> > similarity index 94%
> > rename from meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
> > rename to meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
> > index 6ceb225..be903a0 100644
> > --- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
> > +++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
> > @@ -21,8 +21,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/releases/${=
BPN}-${PV}.tar.gz \
> >            file://0001-plmcd-error-fix.patch \
> >            "
> >=20
> > -SRC_URI[md5sum] =3D "94cd1a4c0406e6a45bb04c003f8690e7"
> > -SRC_URI[sha256sum] =3D "4b4188a0f3d0ed1ed0e3d77de27c45e2c96b437401de08=
e7df2ed9ecd54bb999"
> > +SRC_URI[md5sum] =3D "821391311c73bc2f2dc5a7d867f732e0"
> > +SRC_URI[sha256sum] =3D "f687c883a0d50517c33cb445d9177a9e2b07f5bb077bcc=
0235ffc0fc99af5cb6"
> >=20
> > inherit autotools useradd systemd pkgconfig
> >=20
> > diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/m=
eta-oe/conf/distro/include/meta_oe_security_flags.inc
> > index 815fb16..01ee4d4 100644
> > --- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> > +++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> > @@ -25,3 +25,4 @@ SECURITY_CFLAGS_pn-libvdpau =3D "${SECURITY_NO_PIE_CF=
LAGS}"
> > #| make[1]: *** [Makefile:675: libluajit.so] Error 1
> > SECURITY_CFLAGS_pn-luajit =3D "${SECURITY_NO_PIE_CFLAGS}"
> >=20
> > +SECURITY_CFLAGS_pn-opensaf =3D "${SECURITY_NO_PIE_CFLAGS}=E2=80=9D
>=20
> I was wondering if it would make sense to move tweaking SECURITY_FLAGS
> in the recipe proper for all the exceptions that we manage in the conf
> metadata=20

Makes sense to me, having it over in meta_oe_security_flags.inc seems a
little confusing for someone who doesn't know to look there.  If there's
no objection, I'll just tweak this patch appropriately during the merge.

-J.

>=20
> > --=20
> > 2.7.4
> >=20
> >=20
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYbRbJAAoJEEn8ffcsOfaW9EIH/jT4IU/eoxDbFDurX/aN65Ps
Q0oYpk5wpxSyGqe4oVGuAgccwMIuSfxsDHofGQRsO9yNMDyK7c/DLLhGveUjdjsF
XYTdAafyJ0kNMzhiLwXW0NDw1qVSSpMu7rKkYHbE0WlCIRGZGeHSycar+JHMLYjl
IHU+nMi9gjLTq22rPjuliV68Rf5ueZLX1gMQFGJv76xQGoverZ6ozuoLkgvwimsz
9Pxppc7y3KnqU3IMwE9+6CqJOHJXCzTumBqppJwHhNxUqD0UrElCpZ2L20L6emp2
XHY01k/Jf6vRoq1XnTVl/WprzCG6RY4qaxioCGE9yUrvnP4w/6BuCep2TdFOo80=
=JXiU
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
