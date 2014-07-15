Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id A95D8704FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:07:07 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so6030874wes.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hLZ9Tf71TCacQPqW1Qv5eAcBS6gBFT6OKGzVIked+Ko=;
	b=j4TrgL6QiM07oEHgdvajSvl+uiXC5DySsL2MwqiU4Zy9Vhzfp9qkN+nOShnbXuMKOG
	fxKVfDyl0LxliyklVEGj1HVlxss1Ta4fs4aGQs6HGRUfZ7loAsjrPaBTVBMG82/s9fRj
	XHh2n2dN1o7/Y3wKQbRhqTTrjHa5XEsryNuET1E/3n7kCu+wQNCZihUKwQVCATu4XT6z
	Ed2U2bYf4A6bhD81LXzvbAen6wZ9E5O5hqEaq7ovwVQWAfctGGj/foprBzzRdhc+H/2N
	569aiHgIx8CT2wHSScs7HSU5pctOVSW0CmSKJs6ZTcDu6dtyyKfPb+8TUoZzn6VvO4pL
	POBQ==
X-Received: by 10.194.59.49 with SMTP id w17mr5243394wjq.135.1405447629011;
	Tue, 15 Jul 2014 11:07:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g8sm10779188wib.18.2014.07.15.11.07.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 11:07:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Jul 2014 20:07:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140715180718.GO2433@jama>
References: <1405447315-798-1-git-send-email-stephanoc@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405447315-798-1-git-send-email-stephanoc@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Stephano Cetola <scetola@reachtech.com>
Subject: Re: [meta-oe][PATCH] stop trying to remove folders that do not exist
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
X-List-Received-Date: Tue, 15 Jul 2014 18:07:12 -0000
X-Groupsio-MsgNum: 50970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAnxKwVhzStH6fSc"
Content-Disposition: inline

--eAnxKwVhzStH6fSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 11:01:55AM -0700, Stephano Cetola wrote:
> From: Stephano Cetola <scetola@reachtech.com>
>=20
> The directory ${D}/${TMPDIR} does not exist. This patch removes code
> that was calling rm and rmdir on that location.

this doesn't match with the diff

>=20
> Signed-off-by: Stephano Cetola <scetola@reachtech.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc |    6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index b1bf79c..000316b 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -90,6 +90,12 @@ do_install_append_pn-php() {
>      sed -i 's:=3D/var:=3D${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
>      install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.=
d/php-fpm
>      TMP=3D`dirname ${D}/${TMPDIR}`
> +    bbwarn "D"
> +    bbwarn ${D}
> +    bbwarn "TMPDIR"
> +    bbwarn ${TMPDIR}
> +    bbwarn "TMP"
> +    bbwarn ${TMP}
>      while test ${TMP} !=3D ${D}; do
>          rmdir ${TMP}
>          TMP=3D`dirname ${TMP}`;
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eAnxKwVhzStH6fSc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPFbdYACgkQN1Ujt2V2gByQuwCgsMlGepYSHhVNUhPY7zISrAHn
DuAAoINfzcON8ubJI5CGmf5F5GCl8Wrj
=jGJv
-----END PGP SIGNATURE-----

--eAnxKwVhzStH6fSc--
