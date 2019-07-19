Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2497F17F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 23:13:19 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d23so32817015qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 16:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mtf/rNbdCcF7qDzWXzwlggH0lYac8+e/cgm2NIpIib4=;
	b=UkAtxgGu1P0YV0KPhwl8NgUGu3kR8O/XgV0UnVZi1wp59bebpWCHYlAfCORMVFGzgI
	ThvzDYGzClV8AzDRxsGFzahj+y1f87SeHHikCO8zq1TQ3EPrtpIUDg89ZmNKP0OQx4Zl
	xQPJ1eH9vPwWOTf8MqAAlMaS4TDcQ1wUGJTd/7kGhL0M0iJKrvNUCkW3VA1mhAv8Ee4G
	k24q+cGjW40vk7Gsaacm2AEGzrhG0b55CzXt7OUf1ZjG5XqphBEuLODhjTfZQk7kPnEr
	1ZBnjrLa60ocULCkdKBZ1P4hFQrD1htB/U0fIP3VwRs0S4CSd17LlSSwy+CCsQm32x00
	rI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mtf/rNbdCcF7qDzWXzwlggH0lYac8+e/cgm2NIpIib4=;
	b=V7JVjW4y0CBWQSaduYsrh7gZP9J5Ewx9VNVWORNXSA+QChdByF2f3AnwlsuIrQRa+p
	sn9DiI/2Nk/WrF3qok3KPvSePVl61dlo2Y0OrMBNGObmOTtwuBkcJuQYFNFe90+aTOOu
	5+tbeFvNoZZnH70Hs7V9baEeUUlRz6zrFi10/arUg8GvAZ0/cUzlqD7k0t7XlIKWis2f
	/n2gcyHQDh5iacShUQSQCo9BiSoQJHeJpWlitaq0ojXoKBE9BxEFnvgOBQsuqkZ7cqI3
	or68EdB/orlJOglytlxHpmCwZIS9wrfhbkkup9emXfgn73X/yOEwTpuKmwivWOQ9gcAT
	HKMg==
X-Gm-Message-State: APjAAAWBftcwSyIjvnpV+3gjlL3sgDQSK/qtKqyxf0ArwW8WEHctUEjj
	ykZqCezrJHk1Frz90+KKQBXJRWvmhkTPbenT0OM=
X-Google-Smtp-Source: APXvYqw3kdxS+j41wlv7GSWw89c6WI6OiSFdXcSm4/YVQocnXIYHncvMfoqgCOf5vXWChPeS2HlkGX4DqXJg4pRiN+k=
X-Received: by 2002:aed:36e8:: with SMTP id f95mr38737227qtb.88.1563577999942; 
	Fri, 19 Jul 2019 16:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190718022356.12639-1-zangrc.fnst@cn.fujitsu.com>
	<12350e5f-3fdc-c934-61d7-0ea6ee80fe85@gmail.com>
In-Reply-To: <12350e5f-3fdc-c934-61d7-0ea6ee80fe85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Jul 2019 16:12:54 -0700
Message-ID: <CAMKF1sorF8dNyehVtg9gGZWpagJTwVuZ8ww=D3nQtELOXX9ZKg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] setxkbmap: upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Fri, 19 Jul 2019 23:13:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 18, 2019 at 5:06 PM akuster808 <akuster808@gmail.com> wrote:
>
> Zang,
>
> On 7/17/19 7:23 PM, Zang Ruochen wrote:
> > -Upgrade from setxkbmap_1.3.1.bb to setxkbmap_1.3.2.bb.
>
> We understand this is an upgrade so i don't think the above line is
> necessary as it is covered in the subject line.
>
> I find it more helpful if  a comment like "this a bug fix only" or
> includes new features.
>
> Information like that helps in stable branch backport selection.
>

https://gitlab.freedesktop.org/xorg/app/setxkbmap/-/tags
tells me that its has been 4 years since 1.3.1 was released

but changes are small, and seems fine to be backported

> thank you for taking the time to update this package.
> regards,
> Armin
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  .../xorg-app/{setxkbmap_1.3.1.bb => setxkbmap_1.3.2.bb}               | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-graphics/xorg-app/{setxkbmap_1.3.1.bb => setxkbmap_1.3.2.bb} (78%)
> >
> > diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
> > similarity index 78%
> > rename from meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
> > rename to meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
> > index 8402753..30fbd1b 100644
> > --- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
> > +++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
> > @@ -15,5 +15,5 @@ DEPENDS += "libxkbfile"
> >
> >  BBCLASSEXTEND = "native"
> >
> > -SRC_URI[md5sum] = "2c47a1b8e268df73963c4eb2316b1a89"
> > -SRC_URI[sha256sum] = "a9ddb3963f263ba13f0ea105d8c45a531832140530217cc559587bb94f02d3e1"
> > +SRC_URI[md5sum] = "93e736c98fb75856ee8227a0c49a128d"
> > +SRC_URI[sha256sum] = "8ff27486442725e50b02d7049152f51d125ecad71b7ce503cfa09d5d8ceeb9f5"
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

