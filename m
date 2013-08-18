Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 89E606010E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 19:43:20 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so1883883eaj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0nLC5TK0JVgaWzN7PXF0mGXocqnpjrmndGz4ZOXrYR0=;
	b=U0NV72DmShOP/W7EYZE2M6vD85vWl78zzo8JsAlSV0BYlPdzRhkJ50OfyrbC+ZhX6Y
	B90xxn0PcEYosW6P2GojjXxOczmuvXxec3RLxYSvN4AohX1uNsi4Tk6lqpcXi8AKG8be
	qqvGTAuJ27PyAOQeuNYMseWPUh+RV/G7T5+Jx+gixRK204Tm8yAlxqV937J5pFEQ/44L
	46mBYw4kdq9L74eE5xwi2jX+t6uoIsj+4LRjP/uL9isbDIMTPku02u4t+vBQ5WPMSJm6
	mtw93n08aN6XMF8qZsRkpFnRtA962+nHLTr3gtUCLe6BWl3XUWLTIx5wrbFiWwiD+8p3
	UfaQ==
X-Received: by 10.15.48.67 with SMTP id g43mr7565440eew.17.1376854999736;
	Sun, 18 Aug 2013 12:43:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm1052040eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 18 Aug 2013 12:43:19 -0700 (PDT)
Date: Sun, 18 Aug 2013 21:44:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130818194422.GB3573@jama>
References: <1376854084-8959-1-git-send-email-cheepeero@gmx.net>
MIME-Version: 1.0
In-Reply-To: <1376854084-8959-1-git-send-email-cheepeero@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libmicrohttpd: bump to version 0.9.27
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
X-List-Received-Date: Sun, 18 Aug 2013 19:43:20 -0000
X-Groupsio-MsgNum: 45771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2013 at 10:28:04PM +0300, Ciprian Ciubotariu wrote:
> ---
>  .../libmicrohttpd/libmicrohttpd_0.9.27.bb                | 16 ++++++++++=
++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libmicrohttpd/libmicroht=
tpd_0.9.27.bb

Is there some reason to keep older version?

>=20
> diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9=
=2E27.bb b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.=
bb
> new file mode 100644
> index 0000000..802ae40
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "GNU libmicrohttpd is a small C library that is supposed=
 to make it easy to run an HTTP server as part of another application."
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9331186f4f80db7da0e724bdd6554=
ee5"
> +
> +DEPENDS =3D "libgcrypt curl"
> +
> +SRC_URI =3D "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${P=
V}.tar.gz"
> +SRC_URI[md5sum] =3D "a10496b7f1b495aaf6897584da52f51b"
> +SRC_URI[sha256sum] =3D "d532edf64c3a9da472114c2d10fc94606e3b31f21b883ec2=
e796ab8478f7e9cb"
> +
> +
> +inherit autotools lib_package
> +
> +do_compile_append() {
> +	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
> +}
> --=20
> 1.8.1.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIRJBYACgkQN1Ujt2V2gBxitQCfeB3PUlSRPDXAz0f3EeJq9Rjj
qkcAn2KXb+8G6x7p3Cxb9GDhcvN4ZV42
=OhJb
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
