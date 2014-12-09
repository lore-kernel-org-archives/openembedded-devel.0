Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 50D7B6017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:48:40 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so427552wgh.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+29GVYxn7gAW3xiG6oVGWF83fxOcSbXH4V3T1LRm+4A=;
	b=IILmDbnd3PVCE/6LrX/GOpWkRR1AurAAvXNvbswStxg10JW9H8mcUAEWa73WeHeDnC
	jE3T37LLg7BNZsnzfaG9ICW99c8m046UK8PLQS9YzJQqIg/2+62/KPQsWwzHRWnVbLhi
	1db3BTUIxC3Gh4cEUNXwRGdif6m7MwjNR9D77EVFCD9+H0aikWKH3UGjdfKSNU2ZhfFg
	NjvAhtBfmT1XbZU55jCRXm5NthsObDj+pOLrRa+rCN3Zr3r0E9UUe29/jx7fLhzbHsR/
	P/KaaUqSZ8QAJdjOizGPuhUyZLLeSGKkfMajLyFKtp1AVqG+WUV+mhmCTw84ANRvKE5R
	gaWQ==
X-Received: by 10.180.83.98 with SMTP id p2mr30784750wiy.20.1418122121234;
	Tue, 09 Dec 2014 02:48:41 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	18sm1185658wjr.46.2014.12.09.02.48.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:48:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:48:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209104841.GM2470@jama>
References: <1417672548-32155-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417672548-32155-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libp11: Add new recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 10:48:45 -0000
X-Groupsio-MsgNum: 53240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ICrdrp3pM9DyZLTK"
Content-Disposition: inline

--ICrdrp3pM9DyZLTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 01:55:48PM +0800, Qian Lei wrote:
> Libp11 is a library implementing a small layer on top of PKCS
> make using PKCS
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/libp11/libp11_0.2.8.bb | 23 ++++++++++++++++++++=
+++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libp11/libp11_0.2.8.bb
>=20
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.2.8.bb b/meta-oe/rec=
ipes-support/libp11/libp11_0.2.8.bb
> new file mode 100644
> index 0000000..cac7062
> --- /dev/null
> +++ b/meta-oe/recipes-support/libp11/libp11_0.2.8.bb
> @@ -0,0 +1,23 @@
> +inherit autotools pkgconfig

Why is inherit the first line? We usually start with
SUMMARY/DESCRIPTION.

inherits go below S
http://www.openembedded.org/wiki/Styleguide

> +
> +SUMMARY =3D "Library for using PKCS"
> +DESCRIPTION =3D "\
> +Libp11 is a library implementing a small layer on top of PKCS \
> +make using PKCS"
> +HOMEPAGE =3D "http://www.opensc-project.org/libp11"
> +SECTION =3D "Development/Libraries"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfad9b3332be894bab9bc501572864=
b29"
> +DEPENDS =3D "libtool openssl"
> +
> +SRC_URI =3D "git://github.com/OpenSC/libp11.git"
> +SRCREV =3D "7d56d89fcad6440d108bbbccfb1ebd958e7eb740"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF =3D "--disable-static"
> +
> +do_install_append () {
> +    rm -rf ${D}${libdir}/*.la
> +    rm -rf ${D}${docdir}/${BPN}
> +}
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ICrdrp3pM9DyZLTK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSG04kACgkQN1Ujt2V2gBxAhgCfbhtEmhERmQ7vS/2Rfp9jzpvu
T+0AnieoLMHDqLaRcx+JJLKXWT3N5CIL
=OTXp
-----END PGP SIGNATURE-----

--ICrdrp3pM9DyZLTK--
