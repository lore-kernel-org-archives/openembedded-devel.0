Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id CA41477C4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 14:21:51 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id h125so9729730lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cMeXPf9MrOBI3j1g9EM6aOvgU/zV7LDVHBwPVSan/B8=;
	b=swPRQ9dxwpwHwjI35UUkF+LFbPNfCt5y4R6VU1fcMzXy429r/x4e1CDYrsphdGiY2z
	vhazCrsizHBstHXN8k/WwwJOMsorFgDGoO08JFnyCNbq9A0TJQaX3Jwn5e/mQ/cpiC3L
	9PX3SMxyY/WlnlXRFL09BFVR87zh8xtVgJ5I4xpFbXp/FoZFw3hPzSs5GSG3C0w831TK
	GrZBdlou6Tb5F2waJ+7gbB6nv6YgwF//NRZSJvRq5GI9E2mAyTHGhWQlvTwuKuZUjn34
	dchRfzofnPr1myayY0SWbiYnj+FudUV/hfokE8B9eLfYkoTokCHTW5QKIZiOPWFBpAPJ
	kW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cMeXPf9MrOBI3j1g9EM6aOvgU/zV7LDVHBwPVSan/B8=;
	b=QC6XtRNOY/aMVrbf3W+RQdyvXHqAEGwcbIBQVySSyzuxnuk5Af0x6gsJZT3bX7XMc7
	16bNEfeTxe3yFEnwcmuc6MNmf1MjzqaTRo92R9VjsdOd2e0TMAm5CNCXcVOZ+bWd/712
	8jOWiihY7CZqSE/NMqRqDs0GgykycTqB9+xfci3j/LrokNk+QDxHKQ5LGZeNIQI4U5rW
	oDWDoPY24Ocfo1dxpFbUbSach3KJJDUjRqFZIsZz7p27OwO/mzcrqQjRd6brBxYbV9wn
	yG0qNZlG3B+2ObrM4APbHzzbpOv1sC4wLe1ujobLSdZDxtrC8JTK4YRD9ruKUfKk1nyn
	kwbw==
X-Gm-Message-State: AFeK/H3h+ngm/WCw2qvB+ERgU4KoIHP2MoINSUGxbeEXvyOcm0cyaMvFW01uEYCnZ9Yi7g==
X-Received: by 10.28.73.197 with SMTP id w188mr1663547wma.46.1490797311981;
	Wed, 29 Mar 2017 07:21:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k32sm9583969wre.18.2017.03.29.07.21.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Mar 2017 07:21:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Mar 2017 16:21:50 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170329142150.GD3298@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-4-raj.khem@gmail.com>
	<20170329110515.GC3298@jama>
	<CAMKF1sqMeBHPwBdv3CxsDcLEXTiw-stRdJLq0qV+U0sV+fTVsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqMeBHPwBdv3CxsDcLEXTiw-stRdJLq0qV+U0sV+fTVsQ@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 04/14] gpm: Update to use git src uri
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
X-List-Received-Date: Wed, 29 Mar 2017 14:21:52 -0000
X-Groupsio-MsgNum: 65967
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline

--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 07:06:44AM -0700, Khem Raj wrote:
> >> +do_install_append () {
> >> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
> >> +        install -d ${D}${systemd_system_unitdir}
> >> +        sed 's:@bindir@:${bindir}:' < ${WORKDIR}/gpm.service.in >${D}=
${systemd_system_unitdir}/gpm.service
> >
> > Did you forgot to add gpm.service.in in SRC_URI?
>=20
> I sent a V2 for this patch with another series i sent later. So you can d=
rop it.
> see
>=20
> https://patchwork.openembedded.org/patch/138243/

I think this is the one I was testing and I still don't see
gpm.service.in in SRC_URI, so it doesn't get unpacked in WORKDIR and the
sed call fails.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNvC/QAKCRA3VSO3ZXaA
HDRFAKCkYaU3bbpYXHV5mr0be6KoUFU2ngCgkFUGhPXWJ28ODYMcVvFe5dC6Chk=
=JSx6
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
