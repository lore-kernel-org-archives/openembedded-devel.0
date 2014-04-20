Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF2E65D34
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:23:42 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2882946eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8WXvJ8O29byDw3u0OFcPwnI7ABDJ9HXa6N9k9W91gvw=;
	b=0+gQkrwUkVCZ5YTROMOAKQUoUePow9HNEZ0fRIix33m2hLiBHL3NLU+QKRFv1IaDvm
	YWy7HP9EmnLNdhO9yvDbG4jXZroiTNpL2shILB1F34Psmu0AZz5xaO+60yvb1c3RoJvQ
	qs6XzjeAMc9TsoBxR4YKmwcgRF7B/d/9Q0PMt6XB7CFqDirkE0nM66bhEAEkDLQhJB7b
	FuB3RhZbLJs1dUFrRhAuQ2EBpsZLTRD5TyhTVKj5KM9wAOCfEp8+n5+c4xKC8zpURNVa
	/cmKoaj+BFl1Dg9rGeIXehbaLEcRF/i+eqRSdk4D+ramOWNIwScMMX396KB6pwNGCF4P
	yuxg==
X-Received: by 10.14.45.6 with SMTP id o6mr37893744eeb.24.1397993023853;
	Sun, 20 Apr 2014 04:23:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm93790967eeg.8.2014.04.20.04.23.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:23:42 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:23:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420112347.GS2486@jama>
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
X-List-Received-Date: Sun, 20 Apr 2014 11:23:45 -0000
X-Groupsio-MsgNum: 49326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rePSHXHJe0GetUdz"
Content-Disposition: inline

--rePSHXHJe0GetUdz
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

--rePSHXHJe0GetUdz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrkMACgkQN1Ujt2V2gBz+kQCfUraiRO7O2SDF2SdObzfuMQ6w
N7gAn2NCLL4krevB3ITvpNUe0fklUvgO
=p+Ny
-----END PGP SIGNATURE-----

--rePSHXHJe0GetUdz--
