Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6E75A6CD4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 22:31:45 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so736337eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2013 15:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0C7xGIZjXwtZr2rE7eUkmgar10cJGMVUnhZa0cKQpw4=;
	b=SUn/vZ+lQqOf5VHhBZ5mFQB6WbE2qMWXNP4JR2N90OiJvnKEqgkvUZXcWKWWIBUQLX
	txlUyX9W0dcvMqYzITvNZ/9tgDJ/+F8MJmWcW/UQgGkJSRXxZ39+2MT1hXtDfLZNRaik
	8SS/p4O783M1xgP8lt1mYGadr5SKE3oHntr7XreJMOc/2SCrmBQzmSzuPopJYVr1o6tk
	A/F7kPoF3Dt4Yg5MqVYEnL8eGsQxA9ep3hoFKjeZzAXCyw53EovfLAs9Toh8CT1i/3vs
	u4/3R5/1/yX1DEIi1UFv8aMkcly9SMgW0fgezZOdHkbs9gIAlEGgl/OomfBfFeaA/DBh
	QhTg==
X-Received: by 10.14.180.73 with SMTP id i49mr6946109eem.55.1381357906292;
	Wed, 09 Oct 2013 15:31:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm93669592eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 15:31:45 -0700 (PDT)
Date: Thu, 10 Oct 2013 00:31:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131009223156.GG2872@jama>
References: <CAP71WjwXX1MmRUzBa56oc6TENBNK18uA=pBUCNHDdT1+ZLViAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjwXX1MmRUzBa56oc6TENBNK18uA=pBUCNHDdT1+ZLViAg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5] fontconfig
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
X-List-Received-Date: Wed, 09 Oct 2013 22:31:46 -0000
X-Groupsio-MsgNum: 46590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline

--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2013 at 10:50:03PM +0200, Nicolas Dechesne wrote:
> hi,
>=20
> is there any specific reason why fontconfig is enabled by default in
> meta-qt5/master (5.1) while it was disabled by default in
> meta-qt5/dylan (5.0). It was explicitely disabled in dylan with this
> patch:
>=20
> http://patchwork.openembedded.org/patch/52343/

Probably my mistake when I was adding PACKAGECONFIGs to qtbase, I have
very weak feeling it was somehow related to fontconfig being
autodetected even when it wasn't explicitly enabled or some weird
freetype-fontconfig dependency, but because I haven't documented it in
commit message or by comment in qtbase.inc I'm willing to try if
disabling it by default breaks something.

The worst thing would be that people will have to manually update their
=2Ebbappends if they depend on fontconfig enabled in qtbase now.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJV2VwACgkQN1Ujt2V2gByOfgCfWxE7TesYEQOm3cvwNtLZRILp
eakAn2ttO4oHeuA0n/tTf/qX0HuU+reH
=+HEs
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--
