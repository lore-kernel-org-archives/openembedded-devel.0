Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC7F6B7A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 14:17:22 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so3739452eei.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YZJQXQPZ/DAZiYq0D2HM+WQvKXUyFI3AVfqNMFgHOA4=;
	b=u2nzW/TIBDeYr6v7oWAguOS5e0tadabez5vsPqjPVErEMtUJzeTSdjz23DZ7VQ/i5v
	jzS+JtLWR5f7rkONIcTwSFz+DM9sfQgk6sr7QOd0eatSOWKNb2WdlggJkBdcc++GSoy7
	IklJ/sP2Popn/p0CNK7XI+fhN9JxgiATqHzf4f6OCgixcga1QrMfSC9QFZa9XQDIXoEo
	1KK11g49tsu0GVB5ti+UA3xmPrHnQcZhixwz/ERdnzdnBZRP/AdwIJVrY/zfQWhrXtML
	0TRlbjrx3HgN5mOT4/UQIPj8anfPqgRse96GV2/kYVfJsD26GgVSBF+l0pphE4c3kPi9
	g1aQ==
X-Received: by 10.15.63.73 with SMTP id l49mr15925557eex.27.1394547443613;
	Tue, 11 Mar 2014 07:17:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i47sm58000719eeg.6.2014.03.11.07.17.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 07:17:22 -0700 (PDT)
Date: Tue, 11 Mar 2014 15:17:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311141735.GC2137@jama>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<1394227575-27897-6-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1394227575-27897-6-git-send-email-lauren.post@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 6/7] vlan: Create 1.9 version
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
X-List-Received-Date: Tue, 11 Mar 2014 14:17:23 -0000
X-Groupsio-MsgNum: 48593
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline

--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2014 at 03:26:14PM -0600, Lauren Post wrote:
> VLAN provides vconfig utility
>=20
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> ---
>  .../recipes-connectivity/vlan/vlan_1.9.bb          |   25 ++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta=
-networking/recipes-connectivity/vlan/vlan_1.9.bb
> new file mode 100644
> index 0000000..a9711ed
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "VLAN provides vconfig utility"

DESCRIPTION -> SUMMARY

> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://vconfig.c;md5=3D293ef69c4e88434d37a5ee577a5=
288cb"
> +
> +SRC_URI =3D "http://vlan.sourcearchive.com/downloads/1.9-3ubuntu9/vlan_1=
=2E9.orig.tar.gz"

vlan -> ${BPN}
1.9 -> ${PV}

> +
> +SRC_URI[md5sum] =3D "5f0c6060b33956fb16e11a15467dd394"
> +SRC_URI[sha256sum] =3D "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d=
9aeb4868842b4cca"
> +
> +S =3D "${WORKDIR}/vlan"

vlan -> ${BPN}

> +
> +# comment out MakeInclude in Makefile which sets build environment
> +do_configure_append () {
> +    sed -i 's/^ include/#^include/' ${S}/Makefile
> +}
> +
> +# ignore strip to avoid yocto errors in stripping
> +do_compile () {
> +    oe_runmake PLATFORM=3DARM 'STRIP=3Decho' all
> +}
> +
> +do_install () {
> +     install -d ${D}/${exec_prefix}/bin
> +     cp ${S}/vconfig ${D}/${exec_prefix}/bin

5 spaces -> 4 spaces

I'll modify above comments when cherry-picking to master-next.

> +}
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfGv8ACgkQN1Ujt2V2gBze9ACfbr9ekKy7Fn1LQjsMH+6yqQLh
QVIAniUzMxG94EA9Y7K0k4h8CcNAfCIp
=p6oK
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
