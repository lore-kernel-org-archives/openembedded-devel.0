Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id B0F7A71A36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:37:39 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id l8so21108613wre.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MipZGlayUaogsQhh6S1gPKSEG2mz66qXhko9c2wPANU=;
	b=XAwQHo9+7AUtJwXJvhlEMwTJbFHbRRvySrvUVPYmwhfbdPK5e53wPi17yDSZmIvrQx
	yTPczVcFZ/Bds8VFa4lAuFgyDUQbQfpH+E8u3F7WS43zh0mZb/KPNOTOHEaDValjZov8
	s/vpTTf3YN3fpOXO+MTY7OkIREVwsIwQMUmv0S+w4MDMRjtPOiTwJDdXF+eoIas/XaSg
	8E5BKDTmBC6Kf3/TXAjG5i168uqao4gz+FQbEKnaOZ0uAxD4Lz5+6tGPR2BDtQ5nonWo
	liSAgNNzrzkl1cRe76OfoK8oU3zHpVxaLl682zWrR3ok6o/xTmUN6sd1ijbq/TsYQjrK
	B0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MipZGlayUaogsQhh6S1gPKSEG2mz66qXhko9c2wPANU=;
	b=JEssgtAtWbdRUmSoTEaAGk94WSTZ37M9epT7wUgJ243JFwCOFLJm7gPOrggxeKkwTj
	V7KczcXGp2CZEwxZkMSBQMiztvVBl9zlA32fwkJkAVtvYN9SeO/8IJW9lnkJ+KLZJev8
	bCM3ZHiu2AGn9XNoSsjx+Tfq4Z76E+EgeAho7Fm9u6Moh99XZorprIKoQJZh2tq2S9E8
	t3HYPCAlnGk9d/rhfcQPN1G6NQ0U+DNT9wnko4/p19GQKWMl8xM9FaaJmxXdGsVGx62D
	BqcdPl6jgTAF/PleDidx9h+HrE32EN92HEOiZtgulxv2rby6uaTxcdNoMgKatDDqWDHv
	L+5g==
X-Gm-Message-State: AJaThX7COjlLUgqqDxF1wzRe521EnVw3K3IQZYY88qA5S1C8Y1a+Fo6o
	kz0Xy/kx6zBdjdwwwY3vJtw=
X-Google-Smtp-Source: AGs4zMbCB4TZR9pU2HTcLhOjpegmNZIM5TgpXyzhCQe9mVoVzVMWePyMcm3uZ4tKrbT2Lqo7hSA2ZA==
X-Received: by 10.223.164.22 with SMTP id d22mr15215113wra.232.1510767460380; 
	Wed, 15 Nov 2017 09:37:40 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y2sm7388349wrd.3.2017.11.15.09.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Nov 2017 09:37:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Nov 2017 18:41:36 +0100
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Message-ID: <20171115174136.GA4530@jama>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Wed, 15 Nov 2017 17:37:39 -0000
X-Groupsio-MsgNum: 69633
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2017 at 06:08:49PM +0100, Raphael Kubo da Costa wrote:
> Thanks for testing!
>=20
> Martin Jansa <martin.jansa@gmail.com> writes:
> > Thanks for very good changes.
> >
> > Yesterday I've tried to build this on "bitbake world" servers and the b=
uild
> > for qemuarm64 failed with:
> [...]
> > longer log in http://errors.yoctoproject.org/Errors/Details/158898/
> [...]
> > I know what linking needs *a lot* of memory, but this server has 219GB
> > available and "only" 128GB from it can be taken by tmpfs, so there shou=
ld
> > be still plenty RAM for successful linkage.
>=20
> It had been a while since I'd last done an aarch64 build. I launched one
> here and linking failed with relocation errors. I've pushed 4e5abf8
> ("chromium: Apply -g -> -g1 workaround for aarch64 as well"), which is
> the same workaround I've been applying for other architectures, and
> everything went fine.

With the latest version from you (62.0.3202.94) I also got relocation
errors instead of the out-of-memory one, see:

http://errors.yoctoproject.org/Errors/Build/48426/

I'm trying now with g1 as you suggested.

>=20
> > Build for x86_64 (on similar server) was successful.
> >
> > Build for x86 + musl failed even before start, because there is missing
> > space in the append:
> > recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86 =3D
> > "yasm-native"
> > recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86-64=
 =3D
> > "yasm-native"
> >
> > and unlike x86_64 it doesn't have trailing space in previous DEPENDS,
> > because of:
> > recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_libc-m=
usl
> > =3D " libexecinfo"
> >
> > Causing:
> > ERROR: Nothing PROVIDES 'libexecinfoyasm-native' (but
> > /home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/
> > chromium_62.0.3202.89.bb DEPENDS on or otherwise requires it). Close
> > matches:
> >   libxinerama-native
> >   texinfo-native
> >   libyaml-native
>=20
> Thanks for fixing the yasm bit.
>=20
> As for musl: like I said in my original email and on GitHub, the musl
> build is currently broken. Carrying tons of patches in the recipe is an
> uphill battle, so unless someone takes the time to work with upstream I
> don't think it makes much sense to try to keep the build working.

OK, fair enough, maybe Khem will again chime in and fix it for musl (in
the meantime we might blacklist it for musl that people don't wait for
the build to fail).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWgx8TwAKCRA3VSO3ZXaA
HDEnAJ9lxZEFLTN3HAHxYKeFvryrbbA1VgCfaxbNa+t+5jiC/zOdyNRUC2Oq9EM=
=vOXQ
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
