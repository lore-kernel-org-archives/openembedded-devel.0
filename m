Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 087CF6C23A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:08:14 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c17so2505677qkg.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k55Am3yb2HzlsAqBftF2FDFqu+jvzEhld5Q+i0Q8LPc=;
	b=ODIO8fW7Ly0bEMDvSQmVB16xUWY0cFMBcuO/KtHKBPpMebZMo5Q8pez/FszY8b/6B5
	a7z4qId4DprpF2wz18SOpw8mTVXg1eN5zZWRk3pLCOX1ZNDlPsyWNzSTdfkeRY3CQu0H
	fsy8ojOwTXf2hF2qsX1scWQDKKVjVoc3l+XwNT2gG567IRNk/WEX84Ye8buGsHkC0OdP
	1O25FIi8+E18Gxyd0LzgWjclb1GeXbQrhKvcV93uDxLQIj6NiIdL+ZJ+1vJljzsh/EJx
	y733Gi4VhmL9ImhMXzSZ9FKAOX1nHwNcBPI3WEA0GLqdnc8GB4Djn/pdrnus4naN54NM
	YJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k55Am3yb2HzlsAqBftF2FDFqu+jvzEhld5Q+i0Q8LPc=;
	b=Vt+IuXTjurYDhQZ4TkC2SsXVoOXbOjliznADI3ZVvrE1EGmYKdO4oiU/emCv8b0zVa
	xS3foMCaTvU/qoc7HviH/R4v1/RoTkxhsibg7ftjJHuGzOF7Jfw43NPzeL5stryeUIt4
	r6N5JaEtj6ul/ffBggm24PnqE9oQp/vXZiMjdtgDMFbh2RHSz0NIdsGkZhtBwNzKxWET
	Y2oEij0zX/1iCzMSS6ibwSmGMrHM2b+hJQ4sjhVShYVti4DMxJNM7O1m6BDVxAL1l06c
	+35ayOLlj8DHu/zMJgYTgnZzJzXbr337sz0h0HHsFa0j+AgqPfOcI9BYa0GtKxhUgSKW
	jE7A==
X-Gm-Message-State: APjAAAUq2CDA7P6aLOQ/7J0kh3Ux+4iV8wO4bS/JEuO9eQX0j6nHlocS
	Vg/7P1yh2xa/UZQaVg6ID5K2dyBEWScEwa0pvO61w6/g
X-Google-Smtp-Source: APXvYqyv/+nQkr4H1KpbwSROiK1W3waoljI771PL6NEef9djrOnuVWoyB4sLX48dPxUT9DC83xWZOxqoHCQKVy0sg0A=
X-Received: by 2002:a37:de05:: with SMTP id h5mr24072688qkj.474.1576429695651; 
	Sun, 15 Dec 2019 09:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sq=oFvgEtCbSOtpgLsZZow669uqadeXmf4x3ydrPBVODg@mail.gmail.com>
	<CALbNGRQwTv_GmgwjB_J7vrfQPgTsU+aGE=E8KrzfDYs9-2T-vw@mail.gmail.com>
In-Reply-To: <CALbNGRQwTv_GmgwjB_J7vrfQPgTsU+aGE=E8KrzfDYs9-2T-vw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 09:08:04 -0800
Message-ID: <CAMKF1soZmy20ojdv4_zmaThH4dsW8X5qin_A=XHH4VjVoazbJA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Sun, 15 Dec 2019 17:08:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 4:45 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Sun, Dec 15, 2019 at 8:58 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Dec 5, 2019 at 4:09 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> wrote:
> > >
> > > Once passed Khem's autobuilder there are the following desktop sessio=
n
> > > available (yes tested - they work for me)
> > >
> > > * gnome-x11
> > > * gnome-wayland
> > > * gnome-classic (gnome2 experience: gnome-shell based)
> > > * gnome-flashback (gnome2 experience: gnome-flashback/metacity based =
/
> no
> > >   graphics acceleration required)
> > >
> > > currently there the following known issues:
> > >
> > > * GDM does not display background image - have no idea if this is a b=
ug
> > > * Acivities does not display application icons for png
> > >
> > > Ahh and all this was tested with gdm and alternate / non gnome
> display-manager
> > > sddm because gdm does not match my needs as desktop environment
> collector.
> > >
> >
> > can you share your image recipe ? perhaps we should have a reference
> > image anyway in meta-gnome.
> As you might know I use meta-mortsgna. There are 'gnome' images with
> gdm [1] and so called 'allgui' images with sddm containing all
> sessions supported currently: gnome / kde-plasma / liri / lumina /
> lxqt / weston / xfce [2].


This is nice collection of images


>
> Since they include other images from within meta-mortsgna and
> lightweight (=3Dmissing important) is not target of mortsgna, transfer
> is not straight forward . See if I can put something together. Maybe
> something like core-image-minimal-xfce + some wayland bits would do.


Right that would be cool

>
>
> [1]
> https://github.com/schnitzeltony/meta-mortsgna/tree/master/recipes-image/=
gnome
> [2]
> https://github.com/schnitzeltony/meta-mortsgna/tree/master/recipes-image/=
allgui
> [3]
> http://cgit.openembedded.org/meta-openembedded/tree/meta-xfce/recipes-cor=
e/images/core-image-minimal-xfce.bb
>
> Andreas
>

