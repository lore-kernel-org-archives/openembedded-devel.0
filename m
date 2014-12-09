Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9211060557
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:39:04 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so431049wgh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+y/KK5+x9GwO7c/wJAz2S8nNraR+nGTSirk5RxTrmPc=;
	b=vl5vbX1sQysVlD3vDEqXH0TtO0ns0KRGUSomP+4zp7LMFQB7GxOkfyA0kER0rS9/6f
	FuG9QFs3CQgF+wDIiy+81HLqJ6SnB802YU/VZ5KyI0/Vk7+X1Kydojf+tl3dh9MRlbYp
	SMwzRF8JQtrQn4mushoHLuUsd76j66opBjHGRZT/+jgA/KLrfJBUTgnn4uFBl6HAqbS3
	9he7tQGR6ndSlQLbXbrLkANAw+VHXdfEj284whgj0I1nT+HIuKBL4SqAJ8dWVqaMGko3
	jiR8MtYj+bSFKtVniezHhMTM1NLXfb28sftFW6169PZn+TPAOE8sF/SF4MWqHVkO07se
	csZA==
X-Received: by 10.194.2.141 with SMTP id 13mr3751488wju.9.1418121544770;
	Tue, 09 Dec 2014 02:39:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	et4sm1188974wjd.15.2014.12.09.02.39.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:39:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:39:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209103904.GJ2470@jama>
References: <20141202210216.GG12784@mentor.com>
	<1417586849-4678-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417586849-4678-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v2] ncftp : add new recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 10:39:06 -0000
X-Groupsio-MsgNum: 53237
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6iqOn7HZPWKXx18"
Content-Disposition: inline

--d6iqOn7HZPWKXx18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 02:07:29PM +0800, Li xin wrote:
> ncftp is a sophisticated console ftp client.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../recipes-daemons/ncftp/ncftp_3.2.5.bb           | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
>=20
> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-=
networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> new file mode 100644
> index 0000000..fb9eb94
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A sophisticated console ftp client"
> +HOMEPAGE =3D "http://ncftp.com/"
> +SECTION =3D "console/network"
> +PRIORITY =3D "optional"

Koen already asked to drop this.

> +LICENSE =3D "ClArtistic"
> +LIC_FILES_CHKSUM =3D "file://ncftp/cmds.c;beginline=3D3;endline=3D4;md5=
=3D9de76faeaedc4f908082e3f8142715f4"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${PN}/${PN}_${PV}.orig.tar.gz"
> +SRC_URI[md5sum] =3D "685e45f60ac11c89442c572c28af4228"
> +SRC_URI[sha256sum] =3D "ac111b71112382853b2835c42ebe7bd59acb7f85dd00d44b=
2c19fbd074a436c4"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +DEPENDS =3D "ncurses"
> +
> +do_configure() {
> +   oe_runconf

4 spaces for indentation.

> +}
> +do_install () {
> +    install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir}
> +    oe_runmake 'prefix=3D${D}${prefix}' 'BINDIR=3D${D}${bindir}' \
> +        'SYSCONFDIR=3D${D}${sysconfdir}' 'mandir=3D${D}${mandir}' \
> +        install
> +}
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d6iqOn7HZPWKXx18
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSG0UgACgkQN1Ujt2V2gBy6TACeMgAHta1It7JUzmIYGqJxsik7
aJ4AoLBttV399H1FUiPx402q4/Kx084r
=Dana
-----END PGP SIGNATURE-----

--d6iqOn7HZPWKXx18--
