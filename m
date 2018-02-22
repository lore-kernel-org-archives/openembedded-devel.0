Return-Path: <jonas.bonn@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4B13D6093F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:53:05 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id w21so2404821plp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 22:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g53Crdtc/ZlyppsdtHPFJZKHzOC8ZSuedUtzfSAbqvI=;
	b=OWrlVMdkVF1oLaneKCvQsgYLbQ60Bb73hNf7m4xQfeWyrlXxmkzmOjSXqLq9IY/Pmt
	AzC810WSL84MMbui3sq3EGHmoBNUMmOS+bM8LoLvO29Rinsmg0by7xJAhwbqtrwMoWuy
	yqYXNmqT6v063sSTc/v8XMlpeRhN3YUyAqipd9tjLadELRYOFcY95g3qxXI4aoeYF10Q
	WktB4Pxsjidt5hb0MLAbdNeN6431WzosCx6eUDtuH/GvlXwXEc6knzZHhSK8wsAgWJ6N
	VyeJ0SYec+ARF6CN41vSSq0MPWmLzQZCiAAOzWH9sX1ogbPxGJCLIqPDA6k7vIjowidF
	u6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g53Crdtc/ZlyppsdtHPFJZKHzOC8ZSuedUtzfSAbqvI=;
	b=iEtwOQ3Q9i8M0AvyNjgqcVknCIstnUP7deFYJ2fvPHCQ2XMDKF/YcTbJfADjxg4sU7
	TD3/1WgDOaTBSrahEzaP/9B5UxD5BgZCxG3kLcuuZpC0pt5sfefs0wLQPdzgHwfF5Vys
	eupQ/1n6x+pZqT5dZ9xIc1ZffWMFrxcw39Vw/LwUj6dzyyLHd0Mu0RQoDsl9lqNEtphz
	pZ/yphtSrTgyHINKfIJrOk38nLyQBI3BS35UpHtiXFYXMdFMJCJqkLcPr7dWCGh7Xyei
	8zoPyMNipkQdMXDckjD+bRPRIz3DYVNUPa1YZmS8LAGisHFa/yKP5lXqR9jPYDy5Hhg0
	BSgg==
X-Gm-Message-State: APf1xPAHrfRU3n8FkP+kf9mvDMgaBUcNt9Nambk1DzHQQ6m0agji180K
	lj0prcBF39P2KIEhnGXt/Pbz9Ld5sqkR6BdCFgDebQ==
X-Google-Smtp-Source: AH8x227+rx6moQV95SBjU7O87Uc3kL1KteseUl7HU4r3XVMg7T+qTxZj2H1w+QNhuysIFYgYSsymYxX7JsfFgjbnra4=
X-Received: by 2002:a17:902:7148:: with SMTP id
	u8-v6mr5432378plm.91.1519282387069; 
	Wed, 21 Feb 2018 22:53:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.138 with HTTP; Wed, 21 Feb 2018 22:53:06 -0800 (PST)
In-Reply-To: <766040fa-b622-5610-4ba3-87d416c7ee4f@prevas.dk>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
	<CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
	<20180221135732.GI4311@bill-the-cat>
	<766040fa-b622-5610-4ba3-87d416c7ee4f@prevas.dk>
From: Jonas Bonn <jonas.bonn@gmail.com>
Date: Thu, 22 Feb 2018 07:53:06 +0100
Message-ID: <CACM3HyG=gT1anu6qh1jbm0+J=Tf15KNUUSN-pYLy_L1nJa7kEQ@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 22 Feb 2018 06:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 21 February 2018 at 15:09, Martin Hundeb=C3=B8ll <mnhu@prevas.dk> wrote:

> Now that the discussion branched out a bit...
>
> We would like better support for this too. Our setup uses a "manifest"
> repository with git submodules to setup the layers:
>
> > yocto/
> >       meta-poky/
> >       meta-qt5/
> >       meta-foo/
> >       meta-bar/
> >       conf/
> >            bblayers.conf
> >            local.conf
> >       .gitmodules
>
> With this setup, customers simply need to clone our yocto repo
> recursively, run `yocto/meta-poky/oe-init-build-env yocto` and then
> `bitbake image-recipe`.
>
> But this is rather inflexible, as it requires the "yocto" folder to be th=
e
> build folder to activate the config files...
>
> We looked into putting the configs in "meta-foo/conf/*.conf.sample" and
> using TEMPLATECONF, but the "oe-init-build-env" script is rather picky
> about poky being the "top" directory.
>
> I guess the oe-init-build-env script can be changed to look for
> .templateconf in any parent folder?


Putting together a deliverable setup that's easy for the customer to get
started with is a bit tricky.  Here's the approach that's worked well for
me:

/myproject
    /env        <-- script
    /build
    /meta-myproject
    /bitbake
    /oe-core
    /meta-layer1
    /meta-layer2

env, build, meta-myproject are part of the myproject repo, everything else
is a submodule.

"env" is a script containing just the following:
. ./oe-core/oe-init-build-env build/ bitbake/

meta-myproject is the "local layer" that contains project specific recipes
and appends.

The build directory contains:
build/conf/bblayers.conf.sample
build/conf/conf-notes.txt
build/conf/local.conf.sample
build/conf/templateconf.cfg

The interesting parts here are:
bblayers.conf.sample contains something like this:
BBLAYERS ?=3D " \
  ##OEROOT##/meta \
  ##OEROOT##/../meta-layer1 \
  ##OEROOT##/../meta-layer2 \
  ##OEROOT##/../meta-myproject \
  "

and templateconf.cfg contains this magic:
../build/conf

With this setup, the customer does:
git clone ..../myproject.git
git submodule --update init
./env
bitbake customer-image

The 'env' command nicely prints the contents of conf-notes which reminds
the customer of the names of the images (customer-image,
customer-dev-image, customer-special-image, etc) that are avaiable to be
built so that they don't need to search the repo for the image recipes
because they can't remember what they were called.

The only additional tweak that I recommand be made manually beyond the
above is to point build/sstate-cache to somewhere outside of the cloned
repo.  That way, the entire repo can be deleted, re-cloned, and quickly
rebuilt when people get themselves lost in the labyrinth...

Advantages of the above:
i)  oe-core is just another layer and therefore just another submodule...
no changes are made to it locally
ii)  git log on the myproject repo ties submodule updates and modifications
to the "local layer" together so it's clear why recipes were changed
iii)  since meta-mylayer is not an external layer/repo, I'm working in only
one git repo when doing updates (assuming the submodules aren't changing)

Anyway, just wanted to share that, in case it's useful for someone.

/Jonas

