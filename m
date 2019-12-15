Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 548B57E98A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:45:15 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t8so1788263iln.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 04:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=o7ZDp9GKqVrmld9PBbKcOZ0fcmyMgP+lpee+vG9X5Es=;
	b=XRkmJa9DtGN3nG6s5G1h3Vx903oa99SlzU1QyxdUoIxvo7Tv0MK3DgV+89WJLLlCq3
	ZiyZHZNbFM+AcUlxU73hwn1VIBNIYdqLTzcZQsUoTCv03jm4Rp4FgmQ4E9+7YYa3fqQX
	kdEeERaKl24gP6KoBGEFmRqqLxX9EPtmT38BV2ZLGCZI6vjXO2YcHEznbf/Zg3cR6GyL
	TfeX03yVgJtqI/Tr6FIAi10k0hPg5aO5EXPN8ywcyz/+C+9xlm9Xgb6AyNVHiKlDSLJN
	CFXROxfxvaf1tpsW3EnIUXDxGLpEw36yrksBmo2roXZj8aYVS2BM8V47zzzqP5pe/9Zt
	fCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=o7ZDp9GKqVrmld9PBbKcOZ0fcmyMgP+lpee+vG9X5Es=;
	b=hW4UpURwlDLPaXuar8OcX2WX9hr1emKksOw2gObeoxni5vgo0xBPurZ8tGWJYOUOQK
	GbWfMDoo6kfE2sUo9aO8YESlrNKUj0Olh6tGlWkLvSKAKM9hg7WHtJUa/7oXpQVX7g4C
	tpSPjg6ITczdo/K7ZPamAm3k0sHn7o5Jx8xroSwK2FZi+V89LRve0bt787hbA+XFCDYP
	TfZiIRTiuyo2oOmFxUYV1GgpJSfsmXLskNDzHNbZwU/17csn1rZ+/FC6VglqKAdoqVOv
	ezJqN/MMoOjXWTGpK5SZ8jUJqgLaW1R5TDhEevSgfyI6mHAF8X87m+7x8ny61SyVptp4
	oKVw==
X-Gm-Message-State: APjAAAUYTL4qF7KfYQttb78Blxho9olh4Yt//609l8qtfBokvqgsf4PB
	PqmMNQAmYMdPn6A0bjkPZFvYIlFkW/NzR50/G74=
X-Google-Smtp-Source: APXvYqxkQw4jNYLvorB1S8YVjFuGjL8X+YJMZsDiMqfUd2/1Wx4YTVEwRjBPCgik6gU9IPOwwHHYnNPwU5RXG80jwjw=
X-Received: by 2002:a92:8b82:: with SMTP id i124mr8510004ild.267.1576413916225;
	Sun, 15 Dec 2019 04:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sq=oFvgEtCbSOtpgLsZZow669uqadeXmf4x3ydrPBVODg@mail.gmail.com>
In-Reply-To: <CAMKF1sq=oFvgEtCbSOtpgLsZZow669uqadeXmf4x3ydrPBVODg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 15 Dec 2019 13:45:04 +0100
Message-ID: <CALbNGRQwTv_GmgwjB_J7vrfQPgTsU+aGE=E8KrzfDYs9-2T-vw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sun, 15 Dec 2019 12:45:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 8:58 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 5, 2019 at 4:09 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> >
> > Once passed Khem's autobuilder there are the following desktop session
> > available (yes tested - they work for me)
> >
> > * gnome-x11
> > * gnome-wayland
> > * gnome-classic (gnome2 experience: gnome-shell based)
> > * gnome-flashback (gnome2 experience: gnome-flashback/metacity based / =
no
> >   graphics acceleration required)
> >
> > currently there the following known issues:
> >
> > * GDM does not display background image - have no idea if this is a bug
> > * Acivities does not display application icons for png
> >
> > Ahh and all this was tested with gdm and alternate / non gnome display-=
manager
> > sddm because gdm does not match my needs as desktop environment collect=
or.
> >
>
> can you share your image recipe ? perhaps we should have a reference
> image anyway in meta-gnome.
As you might know I use meta-mortsgna. There are 'gnome' images with
gdm [1] and so called 'allgui' images with sddm containing all
sessions supported currently: gnome / kde-plasma / liri / lumina /
lxqt / weston / xfce [2].

Since they include other images from within meta-mortsgna and
lightweight (=3Dmissing important) is not target of mortsgna, transfer
is not straight forward . See if I can put something together. Maybe
something like core-image-minimal-xfce + some wayland bits would do.

[1] https://github.com/schnitzeltony/meta-mortsgna/tree/master/recipes-imag=
e/gnome
[2] https://github.com/schnitzeltony/meta-mortsgna/tree/master/recipes-imag=
e/allgui
[3] http://cgit.openembedded.org/meta-openembedded/tree/meta-xfce/recipes-c=
ore/images/core-image-minimal-xfce.bb

Andreas

