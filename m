Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47F966025F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 11:29:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r7so2922701wrr.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9sN8xz4tlvNoqkElH6tv6cEeHfCX4H6SjSp6G2isNKo=;
	b=LRnSb58WY1vLb//e65QTAOyEHoiojAFht7wUPtRBIEF6tl2Fca8ozEqpnyKcZmIEgu
	d5r2JrfxpyNVUy+/hgxiTc0rMZok1zRaE+XOyzQGQfDZ4aKK0FTDLiwAIsK1A+UnZoFc
	p1ms9vdnt+91hg0AbzdrcfyXJjJ68DNpJ+wl+9KVGFaQ5p9OoqX4F3SfwNkXK3ajrZP2
	BxxdUeZ25bDvqaFcsEgdJPLLXk5DuNj12mAjlcfckqrbUIZ5sqlfmX7MmMMPWGIgQ7Uv
	aM1x4XwHN2E5L4gvlx8nuotVEyzm8IoGk4BX+kK50at7rJayoHaTVMk2Z6eDyhrI3Gu0
	I0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9sN8xz4tlvNoqkElH6tv6cEeHfCX4H6SjSp6G2isNKo=;
	b=lGzlP2jsR6m36ehYKOJmEgLJco82nH6QRXQ0C3DG93IyX2Co332Yrxz416OgvZmLK1
	WDr3TAf8e3wkvHCvTa/LTjhDOqMpt4w7lxhNoG6BtRTzK3HF7o0PLkP1nj7RIkJpIMjQ
	cjsHx7OnD+PvPEAsUIIQJczYd+s+mtt06JUAoYMj1qz9K9Ph+3u3KSY9CxjoBNJpohg/
	V5C5NgINkZCUGsFNCdYSGve0lM2ZYmwMwIKgNLOl8POy3VKbKQNvkWmkm2fb0lYZJb1T
	QZrEkWEPW1zzG6WjdZXzTGifvSjjAXBsC5hRTe2tgisz4CYCAkEHvPWuNt6tkk01el6P
	kluQ==
X-Gm-Message-State: APjAAAV4zKVhrheVoMPPYMT+u3sNSBcnxBgIBM9E0O4fdqw8kgT2SGir
	2roTOGGD4P0StvzZwFP9NA3Nb8W1
X-Google-Smtp-Source: APXvYqwmNCzIloACLSY6vle5Ll5Hq/c8ot/7TVLWcaHkUCKhej2dGph/SdlNXqenBv9aClpUJbnsRQ==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr30088263wru.85.1558006159926; 
	Thu, 16 May 2019 04:29:19 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x5sm5641285wrt.72.2019.05.16.04.29.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 04:29:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 May 2019 13:29:20 +0200
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190516112920.GA1400@jama>
References: <20190516070624.27975-1-Martin.Jansa@gmail.com>
	<20190516072441.GA7938@localhost>
MIME-Version: 1.0
In-Reply-To: <20190516072441.GA7938@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] gtkwave: add distro_features_check
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
X-List-Received-Date: Thu, 16 May 2019 11:29:19 -0000
X-Groupsio-MsgNum: 77575
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 10:24:41AM +0300, Adrian Bunk wrote:
> On Thu, May 16, 2019 at 07:06:22AM +0000, Martin Jansa wrote:
> > * fixes:
> > ERROR: Nothing PROVIDES 'gtk+' (but /OE/build/luneos-warrior/webos-port=
s/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPE=
NDS on or otherwise requires it)
> > gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable prov=
iders.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gt=
kwave', 'gtk+']
> >=20
> > and
> >=20
> > ERROR: Nothing PROVIDES 'tk' (but /OE/build/luneos-warrior/webos-ports/=
meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPEND=
S on or otherwise requires it)
> > tk was skipped: missing required distro feature 'x11' (not in DISTRO_FE=
ATURES)
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable prov=
iders.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gt=
kwave', 'tk']
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-=
oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > index 60df6f773b..b9aae0f6c8 100644
> > --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > @@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
> >  DEPENDS =3D "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf g=
lib-2.0"
> >  RDEPENDS_${PN} =3D "tk-lib"
> > =20
> > +# depends on gtk+ which has this restriction
> > +inherit distro_features_check
> > +ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
> >...
>=20
> Shouldn't this be x11 (without the directfb alternative)
> due to tk?

Makes sense, will send v2, thanks.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXN1JjwAKCRA3VSO3ZXaA
HDmZAJ9QHB19EgQYi5H3jHHkYQ4fflp3zACgjVdrIeurPsFiSezsRh7Pl3xKH/I=
=FsjW
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
