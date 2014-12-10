Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B4DCC72593
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 12:03:08 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so4910072wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ovf7IC8w2OWTw5h3bPlT05AAnTuEbZGarllgFoMh7eI=;
	b=Bf15jNui6vbpIOdQ1+TI1FuN9QFwWUEa/Iwz/fn5fIgiNYiuDAyqhFP+iZz8GbTasw
	ysPvYrbyGplG0iJM+9UEqXQvev8t2+Uhg2ZWKgA5RrjQz86htLMTfo7jxeck0iJdB+MU
	49DZI4VxLP8pWAQz8TPu+i06SYr6+mtbHRB9ZeeTVNED1OJtm8yXigToThA6A3D3/Kba
	Gkd4E6RMY2Ohn1VDiBAHHP5LJN1kO3odLqepn3vlb7ypuVAYu92y0624jw7KKv8zJKbd
	dCyow43ELCeMhVLl5goIinrOS3phVyDwddZsXJnwiBgj7gGU4GHmJRlNvxS1FFYQ0tx1
	tibw==
X-Received: by 10.194.189.240 with SMTP id gl16mr5756245wjc.119.1418212986975; 
	Wed, 10 Dec 2014 04:03:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n3sm17668271wiw.5.2014.12.10.04.03.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 04:03:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Dec 2014 13:03:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141210120309.GB2473@jama>
References: <1418212081-32563-1-git-send-email-folkus@gmail.com>
	<1418212081-32563-2-git-send-email-folkus@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1418212081-32563-2-git-send-email-folkus@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][dizzy][PATCH] qtsystems: Change branch from stable to 5.3
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
X-List-Received-Date: Wed, 10 Dec 2014 12:03:18 -0000
X-Groupsio-MsgNum: 53263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline

--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 12:48:01PM +0100, S=C5=82awomir Paszko wrote:
> From: Diego Sueiro <diego.sueiro@gmail.com>
>=20
> Stable branch was removed on mainline and now 5.3
> is used.

This was merged in dizzy few weeks ago:
CommitDate: Fri Nov 14 08:50:22 2014 -0200
and it's even in daisy branch since yesterday:
CommitDate: Tue Dec 9 09:08:55 2014 -0200

> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes-qt/qt5/qtsystems_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_g=
it.bb
> index 45f6b0e..ac2fc86 100644
> --- a/recipes-qt/qt5/qtsystems_git.bb
> +++ b/recipes-qt/qt5/qtsystems_git.bb
> @@ -1,7 +1,7 @@
>  require qt5-git.inc
>  require ${PN}.inc
> =20
> -QT_MODULE_BRANCH =3D "stable"
> +QT_MODULE_BRANCH =3D "5.3"
> =20
>  # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-be=
ta1
>  # qt5-git PV is only to indicate that this recipe is compatible with qt5=
 5.2.1
> --=20
> 2.2.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSINn0ACgkQN1Ujt2V2gBzYfwCdH+doWJfBbxVxeHtzzaS6/bMT
OD0AnRKWYgEnkF/eSABpxLZJ3gZLopdo
=HqKk
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
