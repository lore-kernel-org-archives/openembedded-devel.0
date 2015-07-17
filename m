Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3997565CBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:15:53 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZG6Qa-0002nd-JO from Joe_MacDonald@mentor.com ;
	Fri, 17 Jul 2015 07:15:52 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 17 Jul 2015 07:15:52 -0700
Received: by burninator (Postfix, from userid 1000)	id 932CB580AB6; Fri, 17
	Jul 2015 10:15:26 -0400 (EDT)
Date: Fri, 17 Jul 2015 10:15:26 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20150717141526.GA3901@mentor.com>
References: <20150716185219.GD4432@mentor.com>
	<1437101120-1624-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1437101120-1624-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] opensaf: Add PACKAGECONFIG for openhpi
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
X-List-Received-Date: Fri, 17 Jul 2015 14:15:57 -0000
X-Groupsio-MsgNum: 56283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Li,

[[oe] [meta-networking][PATCH] opensaf: Add PACKAGECONFIG for openhpi] On 1=
5.07.17 (Fri 10:45) Li xin wrote:

> opensaf support for the HPI, So provide a PACKAGECONFIG option for openhpi
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/m=
eta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> index 3d0175e..6ad8a3d 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> @@ -36,6 +36,8 @@ USERADD_PARAM_${PN} =3D  "-r -g opensaf -d ${datadir}/o=
pensaf/ -s ${sbindir}/nolog
>  SYSTEMD_SERVICE_${PN} +=3D "opensafd.service plmcboot.service plmcd.serv=
ice"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'openhpi', 'ope=
nhpi', '', d)}"

AFAIK this won't actually add openhpi to DEPENDS properly unless you are
explicitly defining a DISTRO_FEATURE for it.  But it will cause a bunch
of stuff to be rebuilt since PACKAGECONFIG is getting updated and
signatures will be invalidated.  Not a big deal, but still not quite
what you're hoping to accomplish, I think.

I was just testing a few other things on my current patch queue and have
a patch for this already, so I'm going to drop this patch for now.

Just for future reference, too, @base_contains is on the way out, you
should use @bb.utils.contains instead.

-J.

> +PACKAGECONFIG[openhpi] =3D "--with-hpi-interface=3DB03 --enable-ais-plm,=
,openhpi"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd-daemon"
> =20
>  do_configure_prepend () {
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVqQ3zAAoJEEn8ffcsOfaWVdAH/2l8xghm3pgckVmjLLlZsaq8
ARZjQ0yz3BT3h1bCkfyqs4Zhb/ABVDnr9VyeS7tMburD7Ovk2WfmnzqGjCDcFA16
QB559QkNrqElFma38hUd8VfVonVJUVoBkcQ76/nBvP8wmc0nj7jEEj+fPDJOqyI4
1kej+ohKmiKs5kQjVxzSoz549tPsO+d1w2QQ3ibJL0htPdzbremLb/oPH3vnm8Cm
DfdFndo0geckCLVV6Uf7Rs3g6ljKSYxVfjCzF9qe4DRpVPVJ8EpG3eioMWCSY7tv
mRtM9aEBFVeR9vyqy5RUb5uO04pOlpu7stIIyityWO3356kVCxPURUyXY9XgE0w=
=dToO
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
