Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E7F036FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:28:43 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p187so60875238wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O8ch6WR8hpA2TzZyX86BsIxGdBNIdkONZKhldAADPZA=;
	b=WxmFswYJRs31EUgWc9nq8CAVVi0QG6VSM75f5piShj42IK92qWr7y79XWiMRkGrMaI
	I/MmqUC7pP8pSloPa/21jpmV0xg7gQRazSpbm2CHvNU2oaKQKM8tTdyYTQRO3PVJ2tA9
	79nO4Du7zOA8CZqkRm428OHqNvVHI6QhCm98ElZ6zOCAl4Ai22u6NRgF2p8rrQRLgDLN
	ncdT09mdhCu8pNbSbchrjZilwaBAdhvg1Lr9xfH/+SdRtJUHVwkGMWqUsN9/1SrrbtaY
	pnjnp1t71ehIDzm1Ey0lI5w7yNtDIQghkxuiQ/ddOMlP7MSn3ZzkakxeySed/FgqixZs
	chBg==
X-Received: by 10.28.14.78 with SMTP id 75mr2667813wmo.84.1450438124069;
	Fri, 18 Dec 2015 03:28:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q7sm14426584wjz.12.2015.12.18.03.28.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 03:28:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 12:31:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151218113115.GD2563@jama>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 0/4] mpg123 cleanups + update
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
X-List-Received-Date: Fri, 18 Dec 2015 11:28:44 -0000
X-Groupsio-MsgNum: 59092
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline

--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 07:21:52PM -0800, Andre McCurdy wrote:
> Andre McCurdy (4):
>   mpg123: recipe formatting cleanup, no functional changes
>   mpg123: limit ARM_INSTRUCTION_SET =3D "arm" over-ride to armv4/armv5
>   mpg123: drop unnecessary dependency on tslib
>   mpg123: update 1.21.0 -> 1.22.4

Can you please fix:
mpg123-1.22.4: ELF binary
'/tmp/work/i586-oe-linux/mpg123/1.22.4-r0/packages-split/mpg123/usr/lib/lib=
mpg123.so.0.41.2'
has relocations in .text [textrel]

>=20
>  .../mpg123/{mpg123_1.21.0.bb =3D> mpg123_1.22.4.bb}  | 47 ++++++++++++--=
--------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>  rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.21.0.bb =3D> =
mpg123_1.22.4.bb} (86%)
>=20
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

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZz7oIACgkQN1Ujt2V2gBzK+gCfW4ICex4UNefvXcihgIpn9lOZ
5B4An0wfyzUAk+OmkdqnSvxnA6eVJgsp
=u7i9
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
