Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 584176BB41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 13:16:52 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so3686573eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=62LulbCfWsh/rgC1zUGnT8DMwuiEgmZaGvGqlGR01i8=;
	b=YslHHz2WHGQ6FnWBUkjYGXvR8sf15MoA+LN82/nJgA6wzDVU+46rP7FfHrvKoOdeYX
	Z/fFwxElqndYFASaJMtCzaawJTUkZs/Ne+/PH4CMgK5dvae8T6ZZl4Rs9gbSZUL7fFiC
	p0Z/xHdmONpXl5PhJzHgF/IbwMCfFjk4KI8hwrXA5P1ycXaUpKExSK14+h3dpJtMW1Wa
	9EfHse5cTCgjuK8Txh2RDCFxpxVvWXjSBZ8yTT+JHlXawS/avvM0j9szPb7vLssfS+Ye
	Iu8WYq1c0KOX0c2amUfmcMEXqsYv/PSN2ZdIBD2QhPikckEP50WTzwND9uwFvAAydvKg
	CBzA==
X-Received: by 10.14.122.3 with SMTP id s3mr338103eeh.111.1394543813307;
	Tue, 11 Mar 2014 06:16:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm57444864een.7.2014.03.11.06.16.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 06:16:51 -0700 (PDT)
Date: Tue, 11 Mar 2014 14:17:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311131704.GM26981@jama>
References: <1394542497-23181-1-git-send-email-sgh@sgh.dk>
MIME-Version: 1.0
In-Reply-To: <1394542497-23181-1-git-send-email-sgh@sgh.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: =?iso-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
Subject: Re: [meta-qt5][PATCH] qmake5_base: Add QT_DIR_NAME to "Headers"
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
X-List-Received-Date: Tue, 11 Mar 2014 13:16:57 -0000
X-Groupsio-MsgNum: 48587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="63wdK++BfKwBXp+k"
Content-Disposition: inline

--63wdK++BfKwBXp+k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2014 at 01:54:57PM +0100, S=F8ren Holm wrote:
> Without this we get Headers =3D "/usr/include" which is not meaningfull
> since is is searched by defaukt. What we realy want is "/usr/local${QT_DI=
R_NAME}"
> which is my default "qt5" giving "/usr/include/qt5".

Please see discussion about this patch which is already applied:
https://github.com/meta-qt5/meta-qt5/commit/2bd5fba34dd350807ac07828cd883d5=
b6c7ec631

>=20
> Signed-off-by: S=F8ren Holm <sgh@sgh.dk>
> ---
>  classes/qmake5_base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 2db0fa3..24c1483 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -56,7 +56,7 @@ do_generate_qt_config_file() {
>      cat > ${QT_CONF_PATH} <<EOF
>  [Paths]
>  Prefix =3D ${OE_QMAKE_PATH_PREFIX}
> -Headers =3D ${OE_QMAKE_PATH_HEADERS}
> +Headers =3D ${OE_QMAKE_PATH_HEADERS}/${QT_DIR_NAME}
>  Libraries =3D ${OE_QMAKE_PATH_LIBS}
>  ArchData =3D ${OE_QMAKE_PATH_ARCHDATA}
>  Data =3D ${OE_QMAKE_PATH_DATA}
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--63wdK++BfKwBXp+k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfDNAACgkQN1Ujt2V2gByyDwCfeIU58rNROdTYWUamvHnESMkM
dkEAnAvKU1+dZSauuG2O22G6bvL6vo1d
=6ak0
-----END PGP SIGNATURE-----

--63wdK++BfKwBXp+k--
