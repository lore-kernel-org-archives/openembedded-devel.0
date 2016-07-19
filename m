Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADDF2606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 11:00:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so2420628wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OKgP/ZXuYsDLlpGrDGs0VXKqbQRpZ2mf7p0AT3o3Qsc=;
	b=C7M+ZcyuLMXJ7EBGTxQFcQ9p0QMltpxsrvKj1k6mhdhbRb5lqwb+JToFn3yPb71zNj
	NN7S1yWBSCMGTY19ljeE7lzUWqxNuNXjjd8cIinf/oxU6O10e1lqC/OEAIMgkW5mYb3H
	cv+HXOfI614NmXpvy9K7iHk/Nm+NYLe02kF3SRmp16usXOPU136xNfoyZzt/TxSJPWKK
	4ONmzJtLXag6scIxezgDD7qEK8heVWy8Yn+w4Nie90nQhz8SsyqQpTG7sGdla0hF3c+i
	/+UfkfEbWrP/6gKUfSsSwI6ODsJB515GEWWNBQnZ4xVxt0cuqcZSO9gN0xy6eqYO+qsK
	ZiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OKgP/ZXuYsDLlpGrDGs0VXKqbQRpZ2mf7p0AT3o3Qsc=;
	b=hH8woi8CsWm2Lg+FYZm0aN7CHskg7p2ShQMqNbXR04KQ0dRp5QmSchJ98zKZRPUB8Z
	Vu6JMcQ6rB4YFcbee5bDwFOqr/UF+lMyap/vYqxSH+ITxUvYm9w1UzTladAQlekiNOcO
	fdPLSSltAemIPoKmz1KEhAamDOd97gx35PhIymtS2gIlDJF/SclKl7gdvyaVFmtY18tN
	qOp6REG3375PVXODfX84zXBokE6t4wIBOKqEM4TOvvQVVUYjngeLb1NkyXlLrYD5/qbZ
	niNGL4x13vZ5/83fLwFEUvk7BiGrbMhm/VQMi9sjaP07RiLWtxrBvyZPiL2k50OvRsEu
	WwRg==
X-Gm-Message-State: ALyK8tITygDhwxrdXFE4b81AiTmVuOsgikvp9T90J2FVhVrWft6axojgR2V6n2vblERRpA==
X-Received: by 10.28.139.144 with SMTP id n138mr3441272wmd.71.1468926038983;
	Tue, 19 Jul 2016 04:00:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	b186sm12202960wmg.23.2016.07.19.04.00.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Jul 2016 04:00:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Jul 2016 13:00:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160719110042.lqungonwdgywullf@jama>
References: <1468307717-13359-1-git-send-email-xiao.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1468307717-13359-1-git-send-email-xiao.zhang@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [recipes-extended][PATCH] pax: strip off file name's trailing slash
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
X-List-Received-Date: Tue, 19 Jul 2016 11:00:40 -0000
X-Groupsio-MsgNum: 62250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qt7bkkyjp6ty3xly"
Content-Disposition: inline

--qt7bkkyjp6ty3xly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2016 at 03:15:17PM +0800, Zhang Xiao wrote:
> When extracting packaes, the trailing slash of the file name
> has no means but may cause some issue on system call lstat.
> Remove it.
>=20
> Upstream-Status: Pending
>=20
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>  .../pax-strip-off-file-name-s-trailing-slash.patch | 48 ++++++++++++++++=
++++++
>  meta/recipes-extended/pax/pax_3.4.bb               |  4 +-

Wrong ML and wrong subject tag.

>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/pax/pax/pax-strip-off-file-name=
-s-trailing-slash.patch
>=20
> diff --git a/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trai=
ling-slash.patch b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-=
trailing-slash.patch
> new file mode 100644
> index 0000000..a602b30
> --- /dev/null
> +++ b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trailing-sl=
ash.patch
> @@ -0,0 +1,48 @@
> +From aa8ba118869b75a2a9cd681b2f0362d9d8f1c7ec Mon Sep 17 00:00:00 2001
> +From: Zhang Xiao <xiao.zhang@windriver.com>
> +Date: Tue, 12 Jul 2016 11:34:45 +0800
> +Subject: [PATCH] pax: strip off file name's trailing slash
> +
> +When extracting packaes, the trailing slash of the file name
> +has no means but may cause some issue on system call lstat.
> +Remove it.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> +---
> + src/pat_rep.c | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/pat_rep.c b/src/pat_rep.c
> +index b9a4636..4cbf6bf 100644
> +--- a/src/pat_rep.c
> ++++ b/src/pat_rep.c
> +@@ -605,7 +605,7 @@ int
> + mod_name(ARCHD *arcn)
> + {
> + 	int res =3D 0;
> +-
> ++	char *pt;
> + 	/*
> + 	 * Strip off leading '/' if appropriate.
> + 	 * Currently, this option is only set for the tar format.
> +@@ -639,6 +639,15 @@ mod_name(ARCHD *arcn)
> + 	}
> +=20
> + 	/*
> ++	 * strip off trailing slash.
> ++	 */
> ++	pt =3D &(arcn->name[strlen(arcn->name) - 1]);
> ++	if (*pt =3D=3D '/') {
> ++		 *pt =3D '\0';
> ++		arcn->nlen =3D strlen(arcn->name);
> ++	}
> ++
> ++	/*
> + 	 * IMPORTANT: We have a problem. what do we do with symlinks?
> + 	 * Modifying a hard link name makes sense, as we know the file it
> + 	 * points at should have been seen already in the archive (and if it
> +--=20
> +1.8.5.2.233.g932f7e4
> +
> diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended=
/pax/pax_3.4.bb
> index 9d1abfb..7ce43ce 100644
> --- a/meta/recipes-extended/pax/pax_3.4.bb
> +++ b/meta/recipes-extended/pax/pax_3.4.bb
> @@ -16,7 +16,9 @@ DEPENDS_append_libc-musl =3D " fts "
> =20
>  SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.bz=
2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
>  	file://fix_for_compile_with_gcc-4.6.0.patch \
> -	file://pax-3.4_fix_for_x32.patch"
> +	file://pax-3.4_fix_for_x32.patch \
> +	file://pax-strip-off-file-name-s-trailing-slash.patch \
> +"
> =20
>  SRC_URI_append_libc-musl =3D " file://0001-Fix-build-with-musl.patch \
>                               file://0001-use-strtoll-instead-of-strtoq.p=
atch \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qt7bkkyjp6ty3xly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleOBt4ACgkQN1Ujt2V2gByOIwCfTdjII7a8+b65v2lyvz5J+fNU
WJQAoLGAyJqt7UtpjujsjE0yqtjjbiwB
=+HQ1
-----END PGP SIGNATURE-----

--qt7bkkyjp6ty3xly--
