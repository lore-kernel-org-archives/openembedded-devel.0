Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E75A960F29
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:56:52 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id z2so541765wiv.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 06:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TXSQKB+Ltdtc2qVd8nK9LQhNQA613Kri8Ob5qfw2eE4=;
	b=FafT6nf6YJ9da2SroZYi6I9NkuWyuNz38U1QvHnHnqUGNWkg3SVQpokTpBfGG+u4Sd
	gOQthoRg75131X2D/WQ2J6POY+l6t1nWDBXesh/65HVtqOJ7JrxYOOXEvbSqwnm3qYWO
	k9SO/I1HtknNq1Qhy3GUsBjdwyqXZQ429JU7TlGpBJZ1rMUusVY6OBBSnX6sI2U8lmV3
	oThaUqatqw5ah13rb4Zl3DJTXjfUXveEz/ak1J/2EDB4CczEBQi4qKC4njHuyavu5MO0
	MCMRrhvqsaCc7uY6IvXpBg5n9zZeQRh/v8t7IpxXolK+IuK3OZdfAyH5zSfcQrsFJkYp
	voeg==
X-Gm-Message-State: ALoCoQl5H6Wax+doivMaglSrHqf96kYVfOM0sQEOykvXVYdRpyJmc5udoubyUoSQn1F6o4/44JIB
X-Received: by 10.180.23.99 with SMTP id l3mr2231731wif.26.1388761013588; Fri,
	03 Jan 2014 06:56:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Fri, 3 Jan 2014 06:56:33 -0800 (PST)
X-Originating-IP: [5.13.221.193]
In-Reply-To: <20140103002808.GA3707@jama>
References: <1387298509-20865-1-git-send-email-andrei@gherzan.ro>
	<1387298509-20865-2-git-send-email-andrei@gherzan.ro>
	<CAK18fxG_hv1GJegCQg=Q=S8tMtm2DkD5RmubZ_pey0CFDkcFyA@mail.gmail.com>
	<20140103002808.GA3707@jama>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 3 Jan 2014 16:56:33 +0200
Message-ID: <CAK18fxEJ1kAALVeQEFAjxrr5qdXLkz69xQC2kmU5c6c3Qmzm=w@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Alexandru Niculita <alexnick87@gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] libsdl-image: Add support for libsdl-image-native
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
X-List-Received-Date: Fri, 03 Jan 2014 14:56:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 3, 2014 at 2:28 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Jan 03, 2014 at 01:17:54AM +0200, Andrei Gherzan wrote:
> > On Tue, Dec 17, 2013 at 6:41 PM, Andrei Gherzan <andrei@gherzan.ro>
> wrote:
> >
> > > From: Alexandru Niculita <alexnick87@gmail.com>
> > >
> > > Change-Id: If4a11d3e0d7aa800081ac3361cf2662bb979dd7c
> > > Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> > > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > > ---
> > >  meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-multimedia/libsdl-image/
> > > libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/
> > > libsdl-image_1.2.12.bb
> > > index 459bf12..19dd4a4 100644
> > > --- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
> > > +++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
> > > @@ -29,3 +29,5 @@ do_configure_prepend() {
> > >      rm -f acinclude/ltsugar.m4
> > >      rm -f acinclude/ltversion.m4
> > >  }
> > > +
> > > +BBCLASSEXTEND = "native"
> > > --
> > > 1.8.1.4
> > >
> > >
> > PING?
>
> It cannot be merged without libsdl-native merged in oe-core, so until
> this is resolved:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087633.html
>
> there is no point in merging it in meta-oe (libsdl-image-native failed
> in last world build).
>
>
Indeed. Will ping oe-core for that one. Thanks.


-- 
*ag*

