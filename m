Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C574D6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:47:32 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n186so41639773wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=im28USkpxP46XJEVx3Tv4OxxPaEBJa4i83MO6IE1IRs=;
	b=N6ukoTVy6OvF47eGxYU1CC64AKHTvc6FtQ2Ys7QOTIpn77JFP6ptVFc9xo9Yjp3kiU
	9YMsUuYdxXzs1pJgsaa+pw2EWSxPgm2+HuNPA/FgPBfFFmMpKFtozP7BKNxeU35MSaAP
	tMABwVg5SDA/HoMlRpQ4aStEVKYw8umXZwW0L+u7bu17/zd/Kr0Fz+gb+C5OlfeI0b29
	poN05o2csBsXvAdAfjwOkDG3ConM1JUaVhmNuQ3V4Hik1PEXbIi1qUnKwEdqcuB1HDue
	Pw+8FA5xO+RxOFuMjQ4Eeb0cFm0WrfuRXSjdnvAj6DWhpE0q3tegD4Be0z4whGSFsLcW
	ThMA==
X-Received: by 10.28.72.136 with SMTP id v130mr6752936wma.60.1450208852590;
	Tue, 15 Dec 2015 11:47:32 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id lx4sm2806716wjb.5.2015.12.15.11.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 11:47:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Dec 2015 20:49:39 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151215194939.GE2556@jama>
References: <cover.1450208019.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <cover.1450208019.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 0/3] Add bits to save/restore URI headrevs
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
X-List-Received-Date: Tue, 15 Dec 2015 19:47:34 -0000
X-Groupsio-MsgNum: 59052
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Content-Disposition: inline

--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 12:37:44PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> This is useful to support BB_NO_NETWORK with AUTOREV, by letting someone =
ship
> dumped headrevs to the user, who then inherit this class, which ensures t=
hat
> the cached headrevs are used, and upstream is not contacted at parse time.
> BB_SRCREV_POLICY will be set to "cache" as well, if it's not already set,=
 as
> otherwise bitbake will contact upstream to update the cached values.
>=20
> This is helpful when shipping downloads to someone when there's a desire =
to
> support both BB_NO_NETWORK and AUTOREV.
>=20
> The restore_headrevs.bbclass will restore dumped headrevs at config parse=
 time
> (add to INHERIT), and the oe.headrevs python module provides a function o=
ne
> can call to dump the headrevs.

Maybe I'm missing something, but what's advantage of shipping something
with AUTOREV which is then used together with BB_NO_NETWORK?

We already have some implementation in bitbake which dumps latest
SRCREVs used by all recipes (including AUTOREV) onces so I would expect
that the release will ship this .inc files with locked revisions and if
the user of such release wants to use BB_NO_NETWORK he will also include
that .inc file with locked revisions.

Is it because it's easier of faster to dump them from the headrefs db
you already ship with release and you don't want to generate .inc from
buildhistory?

Cheers,

>=20
> The following changes since commit 62bfd1f93f8873611e818c7cc8c13a761d6295=
02:
>=20
>   wireshark: update to version 2.0.0 (2015-11-30 14:39:59 -0500)
>=20
> are available in the git repository at:
>=20
>   git://github.com/kergoth/meta-openembedded.git headrevs
>   https://github.com/kergoth/meta-openembedded/tree/headrevs
>=20
> Christopher Larson (3):
>   oe: add python namespace package
>   oe.headrevs: save and restore the bitbake URI headrevs
>   restore_headrevs.bbclass: add
>=20
>  meta-oe/classes/restore_headrevs.bbclass | 32 +++++++++++++++++++++++++++
>  meta-oe/lib/oe/__init__.py               |  2 ++
>  meta-oe/lib/oe/headrevs.py               | 38 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 72 insertions(+)
>  create mode 100644 meta-oe/classes/restore_headrevs.bbclass
>  create mode 100644 meta-oe/lib/oe/__init__.py
>  create mode 100644 meta-oe/lib/oe/headrevs.py
>=20
> --=20
> 2.2.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZwbtIACgkQN1Ujt2V2gBxejQCghZDhF0bZ34KG1vm6vu5RXcMp
MfwAoJXE+sFqUra1JwpqHcfeW4Ga+5Bj
=OL8c
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
