Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id D17247805C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 15:45:09 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id y64so11643866ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RT4i67bXOsNI2+Kh+FPLNWhk5f4au+X8yYhk51SotIA=;
	b=loGxv5C8VJVKHsKVfr8YwnCuorN7+ucukMJgE+1hOHAup0I4K+O5zDp7heV98Z50lb
	dydG4bFOUyMSkOl+KNMSy2b1Uct7HxhwjXhMc/aM4D1m2caEXU8GK3OGAQrgGhPXNYwU
	syokaJ1OznPk8dKpa3dc84rw08Iwcb+4oPb7e5o19Zzzi04iUqYPtN1/hdm/6Havfxxn
	qzCSuj9C2yn9xKIqMmsE2HwKlCEDlHZammbNA0UgGYkcyEu8/7GfG86YIVwkdKtcveqQ
	T8AHHpVvh41YR88iLICveTknUNP2Kcvwp6ElWblHhLxdk205m/wIsJ3b8id++yz0khOE
	li+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RT4i67bXOsNI2+Kh+FPLNWhk5f4au+X8yYhk51SotIA=;
	b=Y55YfrH0lsI6Zw8lXO7IXGq486+mDC7zFIdQj5vvieGfXeHhc8TagJJqMJ5wqKEMTP
	2mshCiSTsElAOGtEN/gEfiF9ljapmXrgI/CEdFLga5pLARP16rfmlEgQOGf8TZRp822g
	758+7f1U5c5joAzpzkj067Ddy13kbFi6Nj4iGdkWwEYWlAtxL1FYa2XwrMfaUbr//VNj
	g4O5070ZtFgSKvwbtYCiQkfg+PkrZ+dkZf6HyG2YyGvmh+4MCsM2BnbLo7SmnVnN7BSZ
	c/xTbIfYiVhizqG8UzsvIZQM1rdbsxRvX57+t/ktLaxNNmxen6aDElozHYTGVzOJ9//E
	3xqg==
X-Gm-Message-State: AODbwcBxBwgaAAptHate74uJZSp9sxl0VUCX+BkHEIzcrPitgx+ApJQg
	x9pSOP+6Rv63CaNJ8adpG0GyEmwJCQ==
X-Received: by 10.129.44.196 with SMTP id s187mr28053423yws.259.1495640710733; 
	Wed, 24 May 2017 08:45:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Wed, 24 May 2017 08:45:10 -0700 (PDT)
In-Reply-To: <CAMKF1spe_4B86YGpY-SmNw6K-deJqnT5j1mDDSn7bqtiB1SpLg@mail.gmail.com>
References: <20170524153407.22969-1-dl9pf@gmx.de>
	<CAMKF1spe_4B86YGpY-SmNw6K-deJqnT5j1mDDSn7bqtiB1SpLg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 May 2017 17:45:10 +0200
Message-ID: <CA+chaQc+Lzfkx0=0r_2cwLcRT3CuFhAqgq46Kdn7wh0_moE6BA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-oe][master, morty] sg3-utils upstream SRC_URI unavailable
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
X-List-Received-Date: Wed, 24 May 2017 15:45:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why do you introduce the bbappend instead of fixing it in
./meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb ?

It should be on sources.openembedded.org (everything built in my bitbake
world should be rsynced there, will check where it got broken this time).

On Wed, May 24, 2017 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 24, 2017 at 8:34 AM,  <dl9pf@gmx.de> wrote:
> > From: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
> >
> > This patch temporarily fixes the unavailable upstream URL for sg3-utils
> > with an bbappend that redirects the SRC_URI to a mirror.
> > Checksums match.
> >
> > Signed-off-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
> > ---
> >  meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend | 2 ++
> >  1 file changed, 2 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/sg3-
> utils/sg3-utils_1.42.bbappend
> >
> > diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> > new file mode 100644
> > index 000000000..aeef696cf
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> > @@ -0,0 +1,2 @@
> > +# Upstream URL currently unavailable. Use mirror:
> > +SRC_URI =3D "https://fossies.org/linux/misc/sg3_utils-${PV}.tgz"
>
> Can we also host it on sources.openembedded.org please ?
>
> > --
> > 2.12.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

