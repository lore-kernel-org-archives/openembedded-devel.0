Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 29691601A9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 12:53:21 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2968136eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WGii41Bfakgx8XAscDHsYRUuVa9ytBmBF25ursaWiQM=;
	b=XeEQIKStz8532dMbCSu0Y2ynPeerDPe2EDPo2oEGsw+LW/xIqRFj5OgxZEsU22V1Dy
	3Lg+wrKLL7gVt3lIdY/AIIAi7mzE1nvP4RABz4q1tytXxVWn7vh7qwkKyJW+Equ3EBQm
	MwnOGbc5LiCPE9+DdN6kqdFC4gZUHeZ5qNSULwc6YcvTtvOQtLfRf8vGDkXqfRHwJu8g
	OXes5ksSaw1cwzp+5Ac3TAJqV78xg/8wETk3J8kZSSBY12aXOaJplsEWxxn3ZGqaG938
	ncxb5BUlIYYP3eYRn2Y0Ewerr3BRHrXRyUaOpHs94GpxideI8fdnzqSd1UAfXtuWv3Nd
	q+BQ==
X-Received: by 10.15.36.6 with SMTP id h6mr38389326eev.54.1397998402299;
	Sun, 20 Apr 2014 05:53:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm94398844eel.27.2014.04.20.05.53.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 05:53:21 -0700 (PDT)
Date: Sun, 20 Apr 2014 14:53:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420125326.GJ2486@jama>
References: <1397330049-20282-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1397330049-20282-1-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] ipsec-tools: Update patch status
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
X-List-Received-Date: Sun, 20 Apr 2014 12:53:24 -0000
X-Groupsio-MsgNum: 49343
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0w7jVmmX7yCvRA1u"
Content-Disposition: inline

--0w7jVmmX7yCvRA1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2014 at 08:14:08PM +0100, Paul Barker wrote:
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  .../ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch        |=
 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Merged, thanks!
>=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002=
-Don-t-link-against-libfl.patch b/meta-networking/recipes-support/ipsec-too=
ls/ipsec-tools/0002-Don-t-link-against-libfl.patch
> index 674331d..13e9d73 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-=
link-against-libfl.patch
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-=
link-against-libfl.patch
> @@ -9,7 +9,8 @@ need to link against libfl and so no longer get errors ab=
out undefined
>  references to yylex.
> =20
>  Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> -Upstream-status: Pending
> +Upstream-status: Submitted 2014-03-11
> +    see http://sourceforge.net/p/ipsec-tools/mailman/ipsec-tools-devel/t=
hread/CANyK_8ewmxGA3vBVJW6s1APXPmxPR%2BDFWZ61EL8pCt288aKQ6w%40mail.gmail.co=
m/#msg32088797
>  ---
>   src/libipsec/Makefile.am | 1 -
>   src/racoon/Makefile.am   | 2 +-
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0w7jVmmX7yCvRA1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTw0YACgkQN1Ujt2V2gBwKFwCeKShdjxCZD15CgvhtvAIWqsUh
IvUAn1TMSphwqmmvyodnWgm2CAtXXqlm
=gXjN
-----END PGP SIGNATURE-----

--0w7jVmmX7yCvRA1u--
