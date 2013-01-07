Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsIgl-00077W-5y
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 20:48:51 +0100
Received: by mail-pb0-f52.google.com with SMTP id ro2so10859824pbb.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BitBvRtHS4Pbs0oRxJ5baqKH2xGPAOD+pdPq7QpDHW0=;
	b=xzGLl0ZUwDFSsMhtjtMyv5LMz0cGYwCS71jbjy8rsZW+0Akd3xCs4gknda0Z/yfoSZ
	GRfY9LZa4PiJMCofAe1bcnhT/nYgno+5hP+bmLqn1Bn1BHTdpEGdoWeiXhnT0C2LCP/9
	nIkrco6+Ey2APklQkYBkNZsKnn4g3fgLwVRS4lJgxpU93Q2VqDc8VAShyTZZFZWrp7+N
	e4152+FFb6kfxQRbKNE3+lyPuydlmnqw5Zpewhx9CI+DVKZnwOcxokOt11aisGFisiw/
	7kMaZqGB5WauA/kgpyfqr2KLdg3VPfia649mK3uhBnaoqJm9mxu/P4gGqY7tKfrqSdJK
	AXsg==
X-Received: by 10.68.238.39 with SMTP id vh7mr14971873pbc.6.1357587220724;
	Mon, 07 Jan 2013 11:33:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s5sm39203589pay.31.2013.01.07.11.33.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 11:33:39 -0800 (PST)
Date: Mon, 7 Jan 2013 20:33:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130107193340.GH3285@jama>
References: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 1/3] scripts/firefox-gen-l10n-recipes: Update copyright to 2013
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 19:48:51 -0000
X-Groupsio-MsgNum: 42568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l06SQqiZYCi8rTKz"
Content-Disposition: inline

--l06SQqiZYCi8rTKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2013 at 08:12:57PM -0200, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

I've build tested all 3 on jenkins and looks good to me:

Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  scripts/firefox-gen-l10n-recipes |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/scripts/firefox-gen-l10n-recipes b/scripts/firefox-gen-l10n-=
recipes
> index 65126a2..c1378df 100755
> --- a/scripts/firefox-gen-l10n-recipes
> +++ b/scripts/firefox-gen-l10n-recipes
> @@ -21,7 +21,7 @@ for f in $TMPDIR/*.xpi; do
>  	lang_code=3D$(echo $f | sed "s,$TMPDIR/\([^\.]*\).xpi,\1,g" | tr '[A-Z]=
' '[a-z]')
> =20
>  cat > firefox-l10n-${lang_code}_$1.bb <<EOF
> -# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserv=
ed
> +# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserv=
ed
>  # Released under the MIT license (see packages/COPYING)
> =20
>  require firefox-l10n.inc
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l06SQqiZYCi8rTKz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDrIxQACgkQN1Ujt2V2gBwtPQCggkVy8DbCykkvrCSF3DARzozS
CqoAn1L3ZS/5lGL8m3HzxVUorgeGbixI
=Ppr+
-----END PGP SIGNATURE-----

--l06SQqiZYCi8rTKz--
