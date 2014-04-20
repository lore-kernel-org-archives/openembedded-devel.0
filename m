Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id F05BF65D6F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:25:28 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so2873946eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0a2nk2LghwU3nowaRzBteoTlWj1LvmiH8k5TT6DR5kE=;
	b=PoORNQeGd8mgBZ0hhieOmPhwpVbt9YiQmfso2kJXy6XJFOseeAJRlcSZ8PV6tXMOej
	zkYCwgcTNvjJxlc22LEm8bEcTrh7I2xT8BQYRLGAqSrPWanrUwAEn6QmsLyyRZyw1ESS
	nCv264Wq3h43I7LFLxUvEhAcu9Z8Jxur5M6STKny4gETIxBkqKLhoYf8kqNY9xgt9sqn
	D62sDF5gptatxzrFFu3BMA6Nh2Z8VkKfHD1m4wXGkd1/SC0254o4XC8gSrxySISs6hJY
	USB0Q4N8dMd3c7KXHgmxVq2vqkPVsO18cMbO7KQq5Fe19VhI1gAw/V8knXt4EHUVPV0v
	SV9Q==
X-Received: by 10.14.4.201 with SMTP id 49mr37637264eej.13.1397985928940;
	Sun, 20 Apr 2014 02:25:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm92984384eew.19.2014.04.20.02.25.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:25:27 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:25:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420092532.GD2486@jama>
References: <cover.1397117000.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1397117000.git.Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/2] fix mlock() on vectors vma for ARM and add explicit selinux support
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
X-List-Received-Date: Sun, 20 Apr 2014 09:25:29 -0000
X-Groupsio-MsgNum: 49311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/7F8UcOhwbEJvS7n"
Content-Disposition: inline

--/7F8UcOhwbEJvS7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 04:05:54PM +0800, Chong Lu wrote:
> The following changes since commit 477ccd867cc71f8277f2670b7be34b3b153000=
52:

Both merged, thanks!

>=20
>   klibc: restylize a bit the recipes (2014-04-06 13:36:20 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib chonglu/lvm2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dchonglu/lvm2
>=20
> Chong Lu (2):
>   lvm2: fix mlock() on vectors vma for ARM.
>   lvm2: add explicit selinux support control
>=20
>  meta-oe/recipes-support/lvm2/lvm2.inc              |  5 ++++
>  .../lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch  | 31 ++++++++++++++++=
++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vector=
s-gate_vma.patch
>=20
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/7F8UcOhwbEJvS7n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkowACgkQN1Ujt2V2gBxutwCgq1jg2aua68nswW24FXIEHiEA
Jp8AoJethGRCQYRogfu6Xv3WFhziAnyi
=j4KV
-----END PGP SIGNATURE-----

--/7F8UcOhwbEJvS7n--
