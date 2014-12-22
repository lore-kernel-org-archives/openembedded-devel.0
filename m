Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id AF7B97270C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 13:48:21 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so10520812wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vxt0/J2FoplS1G6DnELlRX3YBq96vZz9ute2CcURbAw=;
	b=ZhA8vMbqwv5GxJEesJ+abG6kPtPwBdr5186a2T5dqFxRk/hPLy/+bKVhwwHbGb7j7w
	L0XOAb+yrOnwxfoSyvZChdt88yqaYJZ1gROZJmu5wKNTVnuSxizR7G+Wxzc8RsGVqQ41
	ymvcGRaqf0T4nJmvsW4ZdmtvvY0+9I0LgYQ3zMN/RhNK9657tima9b9dep9it1TiowlQ
	OSTtqaILy1amgWEF4hBpjKmtHkVzN8emkh0/I0ncFYYl7D5Cjdri7PJQ1zTo9D9mn3oC
	6b5sx/0IdXMMprjQ76fFA+lXDeEe36CCLJDAax1ulRI7pS/HAhQ3iFkp5pREzrwzJAMT
	kRRQ==
X-Received: by 10.194.193.38 with SMTP id hl6mr42182378wjc.38.1419256101203;
	Mon, 22 Dec 2014 05:48:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eu8sm13361676wib.21.2014.12.22.05.48.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Dec 2014 05:48:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Dec 2014 14:48:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141222134822.GC2465@jama>
References: <BLU436-SMTP242B9187CC8DDA1D8442674D6680@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP242B9187CC8DDA1D8442674D6680@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] cyassl: add new recipe
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
X-List-Received-Date: Mon, 22 Dec 2014 13:48:23 -0000
X-Groupsio-MsgNum: 53420
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline

--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2014 at 09:55:49AM -0700, lchristina26 wrote:
> Add new version 3.3.0 recipe for CyaSSLo

This doesn't remove 3.1.0 recipe and it should.

> Signed-off-by: Leah <lchristina26@hotmail.com>
> ---
>  .../recipes-connectivity/cyassl/cyassl_3.3.0.bb        | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.=
3.0.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> new file mode 100644
> index 0000000..715cf1f
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library, version 3.3.0"

", version 3.3.0" doesn't belong in SUMMARY

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
> +SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> +
> +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> +SRC_URI[sha256sum] =3D "e51583ea1e4d64537553922d67a96360312811dffef58d4c=
05506aa98a296fe3"
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

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSYISYACgkQN1Ujt2V2gBxpjgCeLbfD+YacGMqT7S+500UAZRao
fHEAnjdIVA5JrMrvOrzKfoniCn2FzZ1W
=UvRH
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
