Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 35C2A734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 13:58:32 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so16305201wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v0SpmO3wWsfNVIDb9bHS8UCbp6BGPboBqoEM0LF7JHg=;
	b=U+CccYsfqkKih5kx7Cy7JrCYDBiRDDfsft4rjl8XpTPzfSQmhSc6OkZPAcbpf7M1/g
	0zvTvTSNKWyrLIUH4I0YjIAn4dB0nlFv39mjUsSTyTuMUpYvwkvWbAJgZz2ukH9iJcGV
	EhP8sXL3NgLp11Bwzpw5I7bZTl6pADu+QH2kcr4wgJ0lwYB03/gYmRIVMJE3/t0Xv5UR
	USi0gPuT1pHHmNzOtZNwNAoeUqEr8hoTKe0/nK2C5wqMYqix34+5iO+BAXSIKJnsOSoC
	bWYN+6DIZTW/S1XiZzs/dGir5IekaJ0OOLNXbSWX14Qjinx/TuwiZeILJA/W1E8HR0VT
	Bozg==
X-Received: by 10.180.88.98 with SMTP id bf2mr4111075wib.90.1440597512592;
	Wed, 26 Aug 2015 06:58:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fq15sm4029499wjc.12.2015.08.26.06.58.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 06:58:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Aug 2015 15:58:41 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150826135841.GB2449@jama>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
	<1439279859-1815-14-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1439279859-1815-14-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 13/17] rodent-icon-theme: initial add 5.0
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
X-List-Received-Date: Wed, 26 Aug 2015 13:58:33 -0000
X-Groupsio-MsgNum: 57041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2015 at 09:57:35AM +0200, Andreas M=FCller wrote:
> note that ${SOURCEFORGE_MIRROR} in SRC_URI did not work
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb    | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-t=
heme_5.0.bb
>=20
> diff --git a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.=
0.bb b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
> new file mode 100644
> index 0000000..130e032
> --- /dev/null
> +++ b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "Rodent-icon-theme (was xfce4-icon-theme) is a svg icon them=
e"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
> +
> +inherit allarch autotools gtk-icon-cache
> +
> +SRC_URI =3D "http://sourceforge.net/projects/xffm/files/${BPN}/${BPN}-${=
PV}.tar.gz"
> +SRC_URI[md5sum] =3D "4b097d344a160d6497c6498985c8df15"
> +SRC_URI[sha256sum] =3D "6ed00d16faa1f55b3bb7b13862de1d7f5cfd978b93e42487=
ded21595d0dbe208"
> +
> +FILES_${PN} +=3D "${datadir}/icons"

Can we remove xfce4-icon-theme recipe?

They conflict with each other in sysroot:
http://errors.yoctoproject.org/Errors/Details/14749/

> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXdxhAACgkQN1Ujt2V2gBxR5ACfYoLc3QT0pNErJpdcMmvDRzSa
CSMAn1GbggwLESTosRBx/L2WMDRrNlzA
=v5yU
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
