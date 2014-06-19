Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB3670239
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 11:57:00 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so2704311wiv.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b85k8sGPABj0HpE9eotVoMkTb38QkLRuPm1jaYTDIxM=;
	b=KjqHjaHAcfLLBZ1jEB2DZI708srTiFIFuHDeskwIhEHdlq02DZvU81us+IYmFUAwb3
	r/rxoXwBWZpBQRYYok5+AI2DB/0AAssunQFtGPLe4Jl6ULzPy2GJqVAE+vlrT6pKfcuS
	1yIlTpgph5pmmmus2mALgZGiURENODirkvQpF4lQvfNYnThBafDlg55/g7w6vKRDkRjB
	cmjmdmsqvCZmPUAqoAcC4PXJ7PCezhsaqq2GZGRF+A7alvBS7PkaNh+P/tqucSyU/czM
	F4yu/vl6nSM/F1lR/vwqCrfxtPG7kdk7pn2aNTRcqwDbF4G2ccB7xCTWwgjFHHE/wyj+
	q85g==
X-Received: by 10.180.90.233 with SMTP id bz9mr6001042wib.42.1403179021299;
	Thu, 19 Jun 2014 04:57:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ev9sm10908942wic.24.2014.06.19.04.57.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 04:57:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 13:57:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140619115701.GP2117@jama>
References: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Thu, 19 Jun 2014 11:57:04 -0000
X-Groupsio-MsgNum: 50448
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FRaepaAnLTQkJ4tS"
Content-Disposition: inline

--FRaepaAnLTQkJ4tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 07:52:51AM -0400, Cliff Brake wrote:
> The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731e2a=
cf:
>=20
>   python-efl: add dependency on python-dbus and lua to always build
> edje and elementary bindings (2014-05-12 10:08:28 +0200)
>=20
> are available in the git repository at:
>=20
>   https://github.com/cbrake/meta-openembedded.git daisy-to-merge
>=20
> for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb9:
>=20
>   live555: fix fetch problem (2014-06-18 13:42:35 -0400)

Thank you!

Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

Waiting for ACK from listed maintainers, then I'll merge it.

> ----------------------------------------------------------------
> Cliff Brake (1):
>       update maintainer info in README's for daisy
>=20
> Steffen Sledz (1):
>       live555: fix fetch problem
>=20
>  meta-efl/README                                | 16 ++++++++++++----
>  meta-filesystems/README                        | 15 +++++++++++----
>  meta-gnome/README                              | 16 ++++++++++++----
>  meta-gpe/README                                | 16 ++++++++++++----
>  meta-initramfs/README                          | 12 +++++++++---
>  meta-multimedia/README                         | 15 +++++++++++----
>  meta-networking/MAINTAINERS                    | 11 +++++++++--
>  meta-networking/README                         |  2 +-
>  meta-oe/README                                 | 14 +++++++++++---
>  meta-oe/recipes-multimedia/live555/live555.inc |  4 ++--
>  meta-perl/README                               | 13 ++++++++++---
>  meta-ruby/README                               | 17 +++++++++++++----
>  meta-systemd/README                            | 16 ++++++++++++----
>  meta-webserver/README                          | 13 ++++++++++---
>  meta-xfce/README                               | 16 ++++++++++++----
>  toolchain-layer/README                         | 14 +++++++++++---
>  16 files changed, 158 insertions(+), 52 deletions(-)
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FRaepaAnLTQkJ4tS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOi0A0ACgkQN1Ujt2V2gByJAwCbB7STE3qDSy0a5bO+xhURTXdB
UVsAoJ3/ecPUuCg52nKrZsyrzTpIkU9A
=npSU
-----END PGP SIGNATURE-----

--FRaepaAnLTQkJ4tS--
