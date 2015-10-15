Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id B79CA77128
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 19:48:37 +0000 (UTC)
Received: by lfaz124 with SMTP id z124so45043907lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 12:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2+gPi5wj/QZvtnpgQ9ebK2ca2/wj05+P8hqrvsKnGUE=;
	b=DBmQ0kV7OTWtHG0P1Psqh4qWDhX0sADQPwlNKbCV2EiE53bk5LME68w/HmY13QvquX
	+igm1XRPau2tbvutPxpiHL+Iqjaz/GtJBoXNV4rkXS8LARYsR5Er/uMPtTepXdRSTfVs
	DrPv6Hi608n62vMixLE4Nq5l/V2VfLIeIMLPzQdAW8sBtNVU5c55AS1myY+jY8kw1ob2
	QLzsfEQnUlo2/ptQEX6OZU9olQ5ssyFDX7zp6bMUO1dq2yu8w3TPOhynpRXJVqXWWVro
	i91p/LrWo4V6Za/woi3fmxsfEZhGmUGCDu8kREZe+WpFv9LNUJw8Z1AoRHbqo0kylvK1
	8wIg==
X-Received: by 10.194.114.199 with SMTP id ji7mr12139113wjb.19.1444938517042; 
	Thu, 15 Oct 2015 12:48:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wx10sm18266671wjb.40.2015.10.15.12.48.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 12:48:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2015 21:48:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151015194858.GF2588@jama>
References: <1444933287-26444-1-git-send-email-anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1444933287-26444-1-git-send-email-anders@chargestorm.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-qt5][PATCH] qtbase: fix QA warning of host uid leakage
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
X-List-Received-Date: Thu, 15 Oct 2015 19:48:41 -0000
X-Groupsio-MsgNum: 57858
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
Content-Disposition: inline

--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 08:21:27PM +0200, Anders Darander wrote:
> Two files in /usr/lib, were own by the uid of the build process.
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 39d02a9..99ac208 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -232,6 +232,8 @@ do_install_append() {
>          chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
>      fi
>      cp -a ${B}/lib/libqt* ${D}${libdir}

Can we use install instead of cp to resolve this issue instead of chmod?

> +    chown root:root ${D}${libdir}/libqtpcre.prl
> +    chown root:root ${D}${libdir}/libqtpcre.a
>      # Remove example.pro file as it is useless
>      rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
> =20
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYgAyoACgkQN1Ujt2V2gBwNhgCcDMYHLhjDVilvxP26G/1MhJ6s
lnkAnRVwHfh9dWdTbqII4Sm2jC3tUaSB
=8C5O
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--
