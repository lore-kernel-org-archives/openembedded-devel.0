Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 512B760B05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 22:11:49 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so10615196wes.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JlU0CwWSCWh7O97IbzNGAJ00AzH3NiyDMGcXonTJFyo=;
	b=DOAjQ1rrtn4vV+LVI46xKOpAjiVrSMsWZ26Eub5iIYhSr0kgbEAxKaCy3FOF3T5Tol
	8lX2ykaDpKIcozaTKkbtneWGpSTEnPlIaEKhbCo71JbzvLmKlzCTUQXszVefx012HCNE
	gTKbMUJqtMIR9mvRugAaGoe4R4dlb7z5NjbTuvDf3puIRi66N3IDTSUfThxosPpACvXF
	4Z3uYz7yHXdq8IUDW36t67Ykjpzm446JLpb1cJetMJhq/DX9hH02NC1CVpFhIh4nvHr3
	dKtCvRMknYhtIrwYRRgwQWh/huXpIiv6qMzD+sdH/4y0ur0lPMLUEAybVm27Y7lY5/td
	Djkw==
X-Received: by 10.194.222.5 with SMTP id qi5mr520475wjc.62.1407881509935;
	Tue, 12 Aug 2014 15:11:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eb4sm60736137wic.16.2014.08.12.15.11.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 15:11:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 00:12:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140812221225.GT14848@jama>
References: <BLU436-SMTP223AFD3FCC0CB7D577EB9D6D6EA0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP223AFD3FCC0CB7D577EB9D6D6EA0@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] Submitting cyassl recipe for consideration in being added to meta-oe/meta-networking/recipes-connectivity. Cyassl is a lightweight, embedded SSL/TLS library. For more information: www.wolfssl.com. The cyassl recipe is a fully functional bb file tested with the YoctoProject.
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
X-List-Received-Date: Tue, 12 Aug 2014 22:11:57 -0000
X-Groupsio-MsgNum: 51643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dB5ng4uWTPOeqhQS"
Content-Disposition: inline

--dB5ng4uWTPOeqhQS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 01:42:39PM -0600, lchristina26 wrote:
> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> ---
>  .../recipes-connectivity/cyassl/cyassl_3.1.0.bb     | 21 +++++++++++++++=
++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.=
1.0.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> new file mode 100644
> index 0000000..441d321
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "CyaSSL Embedded SSL Library"
> +DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
> +               optimized for embedded and RTOS environments. It can be \
> +               Up to 20 times smaller than OpenSSL while still supportin=
g \
> +               a full TLS 1.2 client and server."
> +HOMEPAGE =3D "http://www.yassl.com/yaSSL/Products-cyassl.html"
> +BUGTRACKER =3D "http://github.com/cyassl/cyassl/issues"
> +SECTION =3D "libs/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "http://www.yassl.com/cyassl-${PV}.zip"

cyassl-${PV} -> ${BP}

> +
> +
> +SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> +SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2ad=
c16d2507b5d0b03e"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"

This is default value, drop S assignment

> +
> +inherit autotools
> +
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dB5ng4uWTPOeqhQS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPqkUkACgkQN1Ujt2V2gBzEIQCgsgZpd3kWro18hsHYP4x/3yBQ
5HwAnjaoo19MsrKHI1ChHZgqhQfKT9T4
=rizv
-----END PGP SIGNATURE-----

--dB5ng4uWTPOeqhQS--
