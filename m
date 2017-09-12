Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8D8783E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:10:28 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id i189so59681140wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0LobB3S7b0TnL7tSSO8Eqj43i56H06kk4M5y8Pslby4=;
	b=BB6LGYhVdJjB4ZyPnWySkl/oixud8aHsXjYLV3erqGtUExGIvD9XsySdpeY+0F5fOj
	z75tc5CmRV3O34s1jmVXrEg1eMiYr1Mp7AT5xVFzOcQGqU76wRmWpkP6/sLZU7APdBoo
	TZX0eziNoQD5DYMk08e/kEvM0BeQbDCVNP2Jkn79M0/JBahmTeLjTZUblwpOQmmlWLgG
	NT/5EOBGQI/a87xX9Zfd8xDj30VxRRxFj9XXD7r5FTlvpMYZZt9RAXiWd9LU8g9BjKEw
	aEp+7Pv/bVM9bSP4liUlkNyBIUjgkRKmRu4sQlwW5grqx8DGXTQDhqJfNPi6GhPkN/Wa
	vzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0LobB3S7b0TnL7tSSO8Eqj43i56H06kk4M5y8Pslby4=;
	b=Mq8aEeThfEFoWNhyjnSZKa4AGlMGuF6oknsh+QXAtc2Jsef/CVL/+GR7A/T+EgFVNQ
	9VSvyzipr71/2vzAepVu6iIvgTWhce1uf54ftNlh3v+OEZJ3T09D+1VlF/wiD2SK5Nl4
	6GNmJA5sdeDBhP9PPRtJf9lCxAO19xqZQbmIhromZRPhejhKWlo0grtxCvaTXldSJiHZ
	BHrRHdC1pPpSzQTbu+tzzCT9jTjWmQClvIaOdDG1MJQ0eSrvvOsGp5majV/C3kfzd8ZW
	GJF8IbRD4/eOPJB08FpKqN+J7a9iPxAKkL5tgxqJ4oLF2NdXY292uHPl90TTOFDS3XM9
	k6OQ==
X-Gm-Message-State: AHPjjUgIKVbxXI22Uy6+XBPDSExwxtroY5/AKYbmBDtH0selOhwNeiFA
	/J+vWSNHcW8Ziw==
X-Google-Smtp-Source: AOwi7QBPe6hd9RBkkBP5JKeRHJy9XLPnlNGZn3gCu//wQb3Kv5cJJlwBohxy3pW4YdII2vWVeuVyIw==
X-Received: by 10.28.238.218 with SMTP id j87mr126906wmi.44.1505229029705;
	Tue, 12 Sep 2017 08:10:29 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f188sm13811217wme.21.2017.09.12.08.10.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 08:10:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Sep 2017 17:12:45 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20170912151245.GC4102@jama>
References: <cover.1505143034.git.akuster808@gmail.com>
	<20170911220704.GA4102@jama>
	<92fd35f1-193c-bd01-6266-3d85a6237f77@gmail.com>
MIME-Version: 1.0
In-Reply-To: <92fd35f1-193c-bd01-6266-3d85a6237f77@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 000/126] Pyro-next pull request
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
X-List-Received-Date: Tue, 12 Sep 2017 15:10:30 -0000
X-Groupsio-MsgNum: 68719
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline

--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2017 at 07:55:14AM -0700, akuster808 wrote:
>=20
>=20
> On 09/11/2017 03:07 PM, Martin Jansa wrote:
> > On Mon, Sep 11, 2017 at 08:21:02AM -0700, Armin Kuster wrote:
> >> Please concider these changes for pyro
> >>
> >> The following changes since commit 5e82995148a2844c6f483ae5ddd1438d87e=
a9fb7:
> >>
> >>    opencv: disable broken Intel FP16 detection (2017-05-09 16:00:31 +0=
200)
> >>
> >> are available in the git repository at:
> >>
> >>    git://git.openembedded.org/meta-openembedded-contrib akuster/pyro-n=
ext
> >>    http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Daku=
ster/pyro-next
> >>
> >> Kai Kang (3):
> >>    snort: enable static daq
> > This one adds daq-native which depends on libpcap-native, but without
> > this commit in oe-core/pyro:
> > commit 12373003cc3753421321d558813b1de95667c192
> > Author: Kai Kang <kai.kang@windriver.com>
> > Date:   Wed May 24 17:33:58 2017 +0800
> >
> >      libpcap: add native package
> >
> >      Add package libpcap-native required by recipe daq-native in layer
> >      meta-networking. And daq-native is added to fix snort start error.
> >
> > it fails with:
> > ERROR: Nothing PROVIDES 'libpcap-native' (but virtual:native:meta-oe/me=
ta-networking/recipes-connectivity/daq/daq_2.0.6.bb DEPENDS on or otherwise=
 requires it). Close matches:
> I never saw this message during any of my  builds. That commit has been=
=20
> sitting my queue for over a month. How are you building this? Maybe I=20
> need to tweak my env.

Building world should probably show it as well, I was seeing it from
openembedded-core/scripts/sstate-diff-machines.sh
script which is calling
bitbake -S none world

> > Is there oe-core/pyro pull request with libpcap-native?
> nope. that support has been in before pyro released and came in as part=
=20
> of the 2.25 update. I do build with what gets queued in oe-core/pyro.
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-suppor=
t/libcap/libcap_2.25.bb?h=3Dpyro&id=3De5043dbbccd05e27d0a020215c38de2be4829=
187

This is libcap not libpcap.

OE @ ~/openembedded-core $ git checkout origin/pyro
=2E..
OE @ ~/openembedded-core $ grep native -R ./meta/recipes-connectivity/libpc=
ap
=2E/meta/recipes-connectivity/libpcap/libpcap.inc:DEPENDS =3D "flex-native =
bison-native"

OE @ ~/openembedded-core $ git checkout origin/master
Previous HEAD position was 7b3584ace9... Revert "expat: Don't use getrandom=
() in the -native case"
HEAD is now at 2ebbeb6111... staging: gracefully abort if two recipes confl=
ict in the sysroot
OE @ ~/openembedded-core $ grep native -R ./meta/recipes-connectivity/libpc=
ap
=2E/meta/recipes-connectivity/libpcap/libpcap.inc:DEPENDS =3D "flex-native =
bison-native"
=2E/meta/recipes-connectivity/libpcap/libpcap.inc:BBCLASSEXTEND =3D "native"

So it still isn't in pyro.

> > Why is this snort change needed in pyro?
> To fix the issue noted in the commit message.
> - Armin

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbf5bAAKCRA3VSO3ZXaA
HNbRAJ4+y4MUZe98bGVbJssLzer1xJLHTACgqd92WjBfM6CXmowR1tAdhiEl5PI=
=4USx
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
