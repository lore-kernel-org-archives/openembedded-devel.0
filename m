Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 167187F4B8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 19:20:38 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id w6so7606179lfl.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WC8U2ut4ECtlwUoe3z4Xmp9/glznEmfb1SPyyL1Ymhg=;
	b=bOXfxq+0bgODnNkEVgvglAr6DzHQ9iWBvZ6WU+vnK53S/uIX88MoH9bAlxK5dS2Xiy
	GLiOUfSMAturIqdVyPGtuhCQaPaVEFHoEg9+sDJ3mVVnS2BhJZjftQyYlwQVnEWykZB0
	YUw1lkB5zF8AhtNp0mfnCcHZgKJVDOg5dBrrOJbwFCzCOy0ubT0wHhzX6S7Stbca2y/x
	ArikEjoadUN7u8uMIDNGfdGLs0VUaou3naVO6dpCgk7sfPoDCy765tIovhbeB4I+CVJH
	ezh5lWNucA+OACs6g0EtRUKJFfO2QvE5l04DGXdQJxKex1HH40AwzObrgIpdMXDKmplB
	PSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WC8U2ut4ECtlwUoe3z4Xmp9/glznEmfb1SPyyL1Ymhg=;
	b=Tsmqyas/UghXPqumlXpOI17O8SUcQglo/8I7SEdnyvr9mcv1bUu3pvDadrlDnquMpo
	x+et9MKFoAu0URJ3brjgjFz8W3HheoAOe62S490yWFo1yHm9J8P6/1xEx5F+//xshCP/
	v0UICy8BjLsPN0nUsr6BJJvTal8Ilo1kQty3UJ3R8X5LgiQPxJiGDl/6AgJJvNuGGHAN
	R7O/fOJY/L0RMy+91IVlqMqJ8PWPStNv2KQTC5MbdSsDjP12w/skna2LXPYAplpiKxhO
	Ucu9nzJgMCzPIVKtaL0EXsXJd0L096smRQC4Tb3NFHcn3XrSl8MCaiQEx9aiA0Ymh7nU
	0mBA==
X-Gm-Message-State: APjAAAWxzyVOKBQtwFQLB9oWyWIN5cauYV552rW4if9tLkk5StNcUIVP
	RxIx182JKl4T7HnL4/jGUVNcOjSB3N+WhU853YA=
X-Google-Smtp-Source: APXvYqwU5XQZJ+yIEBasJkt9pVUVn8H/XnIkmCZgoXoVT0t7hPGGiTwdklj2SlZP8EeJnt1icHMf0d3HYZAnsUQLU6w=
X-Received: by 2002:a19:6504:: with SMTP id z4mr10450928lfb.123.1567884039456; 
	Sat, 07 Sep 2019 12:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190906163242.4770-1-raj.khem@gmail.com>
	<20190906163242.4770-2-raj.khem@gmail.com>
	<CAHMutraN95VB7aMUsTi53sxOQ-hcMrdnw0Ji1uee6RTA=TDFpw@mail.gmail.com>
	<CAMKF1srrukts0Esh_6QCKZyMo7-_xuKiowD7wMXiN_bVjjHy9w@mail.gmail.com>
In-Reply-To: <CAMKF1srrukts0Esh_6QCKZyMo7-_xuKiowD7wMXiN_bVjjHy9w@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Date: Sat, 7 Sep 2019 12:20:28 -0700
Message-ID: <CAHMutrYywjg4hi3Hpsf4gnkmiE4B5s1Kkeuf3nyYUDtsz6tHNQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] remmina: Link with libexecinfo explicitly on musl
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
X-List-Received-Date: Sat, 07 Sep 2019 19:20:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 7, 2019, 9:25 AM Khem Raj <raj.khem@gmail.com> wrote:

> another issue on arm
>
> ERROR: Nothing PROVIDES 'spice' (but
> /mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/remmina/
> remmina_1.3.6.bb
> DEPENDS on
> or otherwise requires it)
> spice was skipped: incompatible with host arm-yoe-linux-gnueabi (not
> in COMPATIBLE_HOST)
>
> I think you need to mold arch support for it as per deps
>

I'll take a look later tonight, thanks.

Alejandro


> On Fri, Sep 6, 2019 at 9:35 AM Alejandro Enedino Hernandez Samaniego
> <aehs29@gmail.com> wrote:
> >
> > Hey Khem,
> >
> > Thanks for this, I hadn't fixed it because I have no access to my laptop
> for now, looks good to me though.
> >
> > Alejandro
> >
> > On Fri, Sep 6, 2019, 9:32 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Cc: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> >> ---
> >>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> >> index a14a2592cd..a86deccc8f 100644
> >> --- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> >> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> >> @@ -5,6 +5,9 @@ LICENSE = "GPLv2 & openssl"
> >>  LIC_FILES_CHKSUM =
> "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f
> file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
> >>  DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui
> libsodium libssh vte json-glib libsoup-2.4 libvncserver spice
> spice-protocol libsecret"
> >>
> >> +DEPENDS_append_libc-musl = "libexecinfo"
> >> +LDFLAGS_append_libc-musl = " -lexecinfo"
> >> +
> >>  SRC_URI = "
> https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2
> \
> >>  "
> >>  SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
> >> --
> >> 2.23.0
> >>
>

