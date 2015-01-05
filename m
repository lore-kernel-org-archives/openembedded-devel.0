Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC3872011
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:35:53 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id q59so7668065wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2hs9pV96PYYv4OnPakUEHN7VSbnMhu/uQ8NkHPhCpHs=;
	b=S8+J0EOi+QbQYz9lmgKDhb4AIalfrdt9xmcf9ElRGMfr6OXOijmIlIwLwH0KP57mdW
	nSyMSFD1ap+6fKf+ZX09oZluupPkCRA8GtYk3tHO13H/nnawfh3PGVTBbXLtZ+4wLf9Y
	jf/olxbS0MpI526hxZaQjtF7bLftamu2WsLHXXeUySdNM4rJCsAPDc9/MOatU+V71U06
	CdpUlyPLw6+KHprchXqhGFAfNAt/uMMx/Q4Qa3C1TIISyiHxTGDstuacZ1fc0bmYShhs
	/W95IWVYkzPHZB8YUFQz0RCrQGKWUH4RvZx3Tc5OJ3B1VveCJpG6AMpO13OPUJkQslJW
	4FhA==
X-Received: by 10.180.20.242 with SMTP id q18mr24911021wie.80.1420461352372;
	Mon, 05 Jan 2015 04:35:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	js5sm9754424wid.11.2015.01.05.04.35.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 04:35:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 13:35:52 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105123552.GK2484@jama>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
	<a0ff960271975254d1c2760e4af4d83996a6b388.1420455602.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <a0ff960271975254d1c2760e4af4d83996a6b388.1420455602.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 03/10] ddrescue: update to 1.19
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
X-List-Received-Date: Mon, 05 Jan 2015 12:35:55 -0000
X-Groupsio-MsgNum: 53652
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p7S+EREVcBHk3zUG"
Content-Disposition: inline

--p7S+EREVcBHk3zUG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 11:00:47AM +0000, Paul Eggleton wrote:
> * License changed to GPLv2+
> * Upstream now only releases .lz files for new releases

Is .lz working correctly now with current bitbake+oe-core (it didn't
last time I've re-tried)? Shouldn't we wait for base.bbclass change to
be merged as you mention above do_unpack?

Duplicates http://patchwork.openembedded.org/patch/82165/
can you send incremental patch on top of this if needed?

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../ddrescue/{ddrescue_1.16.bb =3D> ddrescue_1.19.bb}       | 15 +++++++=
++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.16.bb =3D> ddrescue=
_1.19.bb} (54%)
>=20
> diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb b/meta-oe=
/recipes-extended/ddrescue/ddrescue_1.19.bb
> similarity index 54%
> rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
> rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
> index a36c250..dc485b3 100644
> --- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
> +++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
> @@ -4,14 +4,17 @@ DESCRIPTION =3D "GNU ddrescue is a data recovery tool. =
It copies data \
>      trying hard to rescue data in case of read errors."
>  HOMEPAGE =3D "http://www.gnu.org/software/ddrescue/ddrescue.html"
>  SECTION =3D "console"
> -LICENSE =3D "GPLv3+"
> +LICENSE =3D "GPLv2+"
> =20
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949 \
> -                    file://main_common.cc;beginline=3D5;endline=3D16;md5=
=3Db5a59150a33658cc1ffc31b1a4ffb9f2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D76d6e300ffd8fb9d18bd9b136a9bb=
a13 \
> +                    file://main_common.cc;beginline=3D5;endline=3D16;md5=
=3D3ec288b2676528cd2b069364e313016f"
> =20
> -SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "57b67407e882c6418531d48a2f20d16b"
> -SRC_URI[sha256sum] =3D "76b3f2e5fb0306d24f2632c3e168cccb73dc0a348e3a7089=
cd9230748ff23de6"
> +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
> +SRC_URI[md5sum] =3D "ed6b5b82d74cbd925db2b829350e74b1"
> +SRC_URI[sha256sum] =3D "ed8d0c9d9aac80a9110e9cb0d0a91a7390d3bf9f816b67a6=
2ca4eb140f4747b8"
> +
> +# This isn't already added by base.bbclass
> +do_unpack[depends] +=3D "lzip-native:do_populate_sysroot"
> =20
>  inherit autotools
> =20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p7S+EREVcBHk3zUG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqhSgACgkQN1Ujt2V2gBwBagCeKuSi0EmtsEI9VvmZK6CJzxvq
Y7IAnA8xXj8xmwz9PPMlrN82hMz/UUoS
=eWPK
-----END PGP SIGNATURE-----

--p7S+EREVcBHk3zUG--
