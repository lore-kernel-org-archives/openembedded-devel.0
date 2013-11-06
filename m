Return-Path: <joe@deserted.net>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id ED3116D5A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 20:42:12 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id hu16so2511479qab.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2013 12:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=0iJd8kX7fDFkABDvdFLpgJQunMSFyHyaEuN9uYm2gRI=;
	b=ltsK+/knEgQbSm8EZTXwmLOIJZvg/diJkUxmAzUq6wbnt1EIow4lQI+1mMJeWRunM1
	mQNhFOot5w/jF7o5El9M1bJXtZv7GSMo/Przm0PgwFyf1AjtlV1ZBgB4dkOQIY5a7Zff
	7dwK/+LCCGok4gya+K6PH8FPbUW2tePE3ceWI7WHu310JrtMeU1XgHR4a9FfahJwciIq
	s1PIGQZKT67PS0/WZC5w0XCcqFzzJ93yTG2oN1LW+P1M+mt+R8kpBUJfbJ51B3Na5xA8
	s9JZAVyWDABG1TN+7N+1J6z6tZrU+xe7v8csGCcpHIgo3Rm5zxyErMuC91ZMjaGfFj2s
	8w1Q==
X-Gm-Message-State: ALoCoQlhUvxzp7AAe5Wh49eJehn2XWRpoKfPEnPHxL0mhfjl7GWD7w6tITCKLjBQvau8trfkzshD
X-Received: by 10.224.98.200 with SMTP id r8mr8924984qan.26.1383770534493;
	Wed, 06 Nov 2013 12:42:14 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id h9sm1504182qaq.9.2013.11.06.12.42.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 12:42:13 -0800 (PST)
Date: Wed, 6 Nov 2013 15:42:11 -0500
From: Joe MacDonald <joe@deserted.net>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20131106204209.GE3791@deserted.net>
References: <1383544182-12671-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383544182-12671-1-git-send-email-bruce.ashfield@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/2]: meta-virtualization derived updates
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
X-List-Received-Date: Wed, 06 Nov 2013 20:42:13 -0000
X-Groupsio-MsgNum: 47028
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline

--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[meta-networking][PATCH 0/2]: meta-virtualization derived updates] On 13.1=
1.04 (Mon 00:49) Bruce Ashfield wrote:

> Joe,
>=20
> Here are a couple of changes that I've pulled out of the various layers t=
hat
> I've been testing and looking after.
>=20
> One is an uprev to dnsmasq to 2.63, and the other is a recipe from meta-v=
irtualization
> that is a better fit in meta-networking.
>=20
> I tweaked both the recipes slightly as part of updating them for submissi=
on to
> meta-networking, and documented the tweaks in the patches themselves.=20
>=20
> Anyway, have a look, and let me know what additional changes you'd like m=
ade
> to the recipes.
>=20
> Cheers,
>=20
> Bruce
>=20
>=20
> Bruce Ashfield (2):
>   dnsmasq: uprev to 2.6.3
>   netcf: move from meta-virtualization to meta-networking
>=20
>  .../recipes-support/dnsmasq/dnsmasq.inc            |  8 +++++++
>  .../recipes-support/dnsmasq/dnsmasq_2.55.bb        |  6 ------
>  .../recipes-support/dnsmasq/dnsmasq_2.63.bb        |  4 ++++
>  meta-networking/recipes-support/netcf/netcf_git.bb | 25 ++++++++++++++++=
++++++
>  4 files changed, 37 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.=
bb
>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.=
bb
>  create mode 100644 meta-networking/recipes-support/netcf/netcf_git.bb
>=20
--=20
-Joe MacDonald.
:wq

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJ6qaEACgkQwFvcllog0XzaVACfUR/VPier2wrVtWuF73EvDZ0g
KP4AnRI7GRhOk911JQXDstiSDFGvALH1
=BZY4
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--
