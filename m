Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E076960809
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 08:44:30 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so8232957wgg.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BxBws6X/sJ7RsfCtndKAj8O1gudD2ZSymtHgd1VLvlQ=;
	b=pCRtdprZWRtU6cMRxoXtCezFbil18zn3UW0PMyV2L65WfqjXiZuuVazDcm4MagTVRV
	vDsOxsQVRZJLJ3zgzZDz01HoWv+O6Xc5rhvxxENkSiv1GrcpTjDwI2tvkrscTnhXS2r1
	FCgnsdKv5F0pqGBKLLrqHzOQuN2kVQkmkxaS1VJ32PT0J26W/d//Xh35Lg4wX9pw8uHX
	uXmDiNgc81a7izTGAwrhU4vJ9icq7UsyfIqFiCqRk49XANI5mIQzmCwIg7fK7iadRvsc
	FObrBGP1kqr8jeP1WiJwKWarvyqhwin63zkcG4gfkxIj98qwuNvPX9OA0F7KkptctFEv
	F6qw==
X-Received: by 10.194.205.129 with SMTP id lg1mr18693489wjc.97.1407746671609; 
	Mon, 11 Aug 2014 01:44:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm41177389wie.21.2014.08.11.01.44.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 01:44:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 Aug 2014 10:45:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140811084505.GT14848@jama>
References: <1407620350-7644-1-git-send-email-Martin.Jansa@gmail.com>
	<1407620350-7644-2-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKqvW9XkHB3e5f1WwjCvVgpdOMmU3WNNfW=H11CaWH3s=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqvW9XkHB3e5f1WwjCvVgpdOMmU3WNNfW=H11CaWH3s=w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-browser][PATCH 2/2] chromium-35*: use BFD when building for x86-64
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
X-List-Received-Date: Mon, 11 Aug 2014 08:44:33 -0000
X-Groupsio-MsgNum: 51579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oRfw0/ecc9PkJT67"
Content-Disposition: inline

--oRfw0/ecc9PkJT67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 09:12:50PM -0300, Otavio Salvador wrote:
> On Sat, Aug 9, 2014 at 6:39 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > * this doesn't fix it completely, but allows it a bit further and then
> >   it fails in the same spot as when building for qemux86 (or 37* version
> >   with gold)
> >
> >   sysroots/x86_64-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld.gold:
> >     warning: hidden symbol 'sqlite3_temp_directory' in obj/third_party/=
sqlite/libsqlite3.a(obj/third_party/sqlite/amalgamation/sqlite.sqlite3.o)
> >     is referenced by DSO
> >     sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
> >   sysroots/x86_64-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld.gold:
> >     error: treating warnings as errors
> >   collect2: error: ld returned 1 exit status
> >
> >   and few more symbols like this, libsoftokn3.so is provided by system
> >   nss, using system sqlite3 has some issues too:
> >   https://code.google.com/p/chromium/issues/detail?id=3D22208
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Are you going to work on this to fix it completely?

I don't use chromium anywhere, so I would prefer someone else to do it.

I just got too annoyed by it failing in every single world build for
months.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oRfw0/ecc9PkJT67
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPogpEACgkQN1Ujt2V2gBy2GgCgm7h9atKC6HkBMgw4CrJoPe/9
YFIAoJmwVq0ikD34kGT3VTHvOuEA5DSx
=V43P
-----END PGP SIGNATURE-----

--oRfw0/ecc9PkJT67--
