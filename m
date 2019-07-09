Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8078B7EC57
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 19:23:49 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so36160854ioo.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 12:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P4BOZv9A0dDGieQps7nt15t1tSxGSOWkQIeBNtocgP0=;
	b=Ykp0IwmkTntfoEKsNxT+/lKSVD40GQBMgZUghIeaoIqgDoNEVQNv6S1g1O2fyGh3tk
	j9JZoABR90rcJ3gpzxqyYjhprcDD5swxXHuzLkVoTNC8bh/1hrZ8VmETfyEZHYZvafo3
	362vyjHHIElRVS5MK4ShJCQP4hLnvNnnit9bjfDwEBVRn78wXYQyeLGkl/swMwLv8oZ2
	jhh5ccRGqHHwg7YtVR8tI6ldLmoas9VkHIYJNdlddD4uGZpic+IMzemeVQwcfbcJOdKc
	O3TRlMVXizOloWMHTEmFzFE//vWEn0+K+X3ULuYkqTeD9uWpMo1WOX1Eued3IahFjaXt
	vEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P4BOZv9A0dDGieQps7nt15t1tSxGSOWkQIeBNtocgP0=;
	b=P0FL6cTlQxBt48tdpigdWfQDEAWTm3dVxIhbYBN8PE7HeEem7TNaZ2ai5DpWHGdoOk
	Lz0ToyCa/xutHNBKwk2jATDrRHC1HNt6YCDcK69MZFcXQUkvPXqG3SvQ8SmCDACUU8AU
	EyfKd2qh19dfCojwdTFCWPFfv9n6IaCqjUGwahOzE1BqceoSGV4fNkk2rOM+FDkz8uAD
	jZ6v/5AOevfqj+2MrBPwCFFq+NDvjhZxiWS4+OyEOprGSor9QAS9X4JR11ANOVi5TLV9
	VFW9nSRhmrgyXRl+J0VDYydm2qY71BnLljLecYs3eyfDzkP5dp7lcK0V1f5vrXVv1afE
	A2Lw==
X-Gm-Message-State: APjAAAVNTnQlV1CUgDWvfAQAh35oY4ys4b9DPjojgfXAX20Sj8+ztMUq
	LjvANUri0gvgSao1vgyzIKqzkYw/q72jo6cl+ak=
X-Google-Smtp-Source: APXvYqy7hv6vBM0rU16RUl1YOXS/Op+BR/LC6x/GEmX6Ilj4VgPm2ptaghoOKXI+AWSA97rUKoUH/4S6o6H+JKuivcM=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr26544176iod.220.1562700230298;
	Tue, 09 Jul 2019 12:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190709172623.26073-1-bunk@stusta.de>
	<CAMKF1sp_S44k9HRapQiOLps3ZCbR6c6xPsjW3vOdhniU5nZ6DA@mail.gmail.com>
	<20190709191754.GB19705@localhost>
In-Reply-To: <20190709191754.GB19705@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 12:23:35 -0700
Message-ID: <CAMKF1sox4uZoZK1zv9dE_NO1ySyLJkK7Lp8raKsrLcACHczMHQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gpsd: Don't build without optimization
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
X-List-Received-Date: Tue, 09 Jul 2019 19:23:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 12:17 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Jul 09, 2019 at 11:54:19AM -0700, Khem Raj wrote:
> > On Tue, Jul 9, 2019 at 10:26 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > The upstream build system adds -O0 when debug is enabled.
> > >
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > ---
> > >  meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > > index 6716f402a..43bf25a93 100644
> > > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > > @@ -36,8 +36,8 @@ PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
> > >  EXTRA_OESCONS = " \
> > >      sysroot=${STAGING_DIR_TARGET} \
> > >      libQgpsmm='false' \
> > > -    debug='true' \
> > > -    strip='false' \
> > > +    debug='false' \
> > > +    nostrip='true' \
> >
> > I think this change is improvement over what we have, however it will
> > be nicer if it was knobbed with
> > DEBUG_BUILD flag, then we can get proper debug info when doing a debug
> > build as user will expect.
> >...
>
> Sorry for being terse in the description.
>
> For gpsd "debug" means adding -g here, and this is already additionally
> inserted through the normal OE CFLAGS.

I see, then the patch subject and commit msg should be updated, thanks

>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

