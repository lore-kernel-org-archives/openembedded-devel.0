Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB1C65D53
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 17:56:10 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h3so777723igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QAIunuyj8A4AkmjyZRDBUZJXXs1AeP2En7GQF3Ugcqs=;
	b=E0vCFB4vLtUNQwf1+d9kX99BA/WoGRo90jugwBkfQP2pK8egAtrrKDYsgjypDj7P4l
	XXQLnY5qCW1akYSwFp2c7Nbk6lF0spiEG+tp22D6aThCu3EBpbdUcVGtUFsddMHBMKEr
	xHUUeO7gbPFv62nK/EgTdYED4E66D+kTGax9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=QAIunuyj8A4AkmjyZRDBUZJXXs1AeP2En7GQF3Ugcqs=;
	b=DxohB9erCme9YrRAsFEnp08oHJqMkuxbai0FuWk9I5REnWrti/uluT1Xpuj+CqBm6Z
	8FEhtgqYzq52QMQMU7XwKcxUmzfVlwSIy+7huaZmVP/sXl2p/L+TqaCn/5LxV5yOWAd/
	y3Y/V0kIj32MWiTnq+5L6zIjaSaYyBnXcpVyas9p8KZeLBhlKCfxpzRX+Pg5q5V1hLaw
	hWyN+9dCCU/Ot9zII1s4Zzkq+BybdDP4Hc6+oO2wnf8z/+wR3bKcMglU1Ej0fJBMw9+L
	sttTmcuNt9C0VwthCpkLmz/BZ71QU6v3eDl2nlE8plGgZfD4yFt2Rw5/eXnM439woP0y
	gR/Q==
X-Gm-Message-State: ALoCoQlotURBdSWOc+WGGiJ4+TQEous/0K6oMj46/zj8wPI6e+uFsUovv9rziscqPvMxT2ZpruW3
MIME-Version: 1.0
X-Received: by 10.43.66.71 with SMTP id xp7mr6668120icb.32.1405101372198; Fri,
	11 Jul 2014 10:56:12 -0700 (PDT)
Received: by 10.50.225.73 with HTTP; Fri, 11 Jul 2014 10:56:12 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407111233360.5222@localhost>
References: <alpine.LFD.2.11.1407111233360.5222@localhost>
Date: Fri, 11 Jul 2014 10:56:12 -0700
Message-ID: <CA+gsK-qzcd3fa=N1pUw3z46mP8DjP0V7sW3k8z79id2o3AtLsw@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: the awkwardness of using core-image.bbclass
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
X-List-Received-Date: Fri, 11 Jul 2014 17:56:17 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,



>   some observations/questions on core-image.bbclass, and whether it
> can be used more understandably. this is being written from the
> perspective of someone who has had the occasional student ask, "why
> was it done *that* way?"
>
>   so here's the important part of core-image.bbclass:
>
> CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \
>     \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     '
>
> CORE_IMAGE_EXTRA_INSTALL ?= ""
>
> IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>
> inherit image
>
>   whose job is obviously to define the final contents in IMAGE_INSTALL
> to be handed off to image.bbclass. so far, so good. but notice first
> that while IMAGE_INSTALL and CORE_IMAGE_EXTRA_INSTALL are weakly
> assigned, CORE_IMAGE_BASE_INSTALL is *not*, which -- if one is
> perusing that file -- strongly suggests that if you're inheriting
> from this class file, you really should use that value. but it doesn't
> work that way.
>
> Consider CORE_IMAGE_BASE_INSTALL as a default value for IMAGE_INSTALL.
It's internal to the core-image class only. Hence, it makes sense for it to
be directly assigned. It is not meant to be used by any other classes or
recipes. With the default value the most simple recipe you can write to use
the core-image class is:

myimage.bb:
   inherit core-image

which will produce an image that boots to the console and include hardware
support if so defined by machine and distro features.

IMAGE_INSTALL and CORE_IMAGE_EXTRA_INSTALL are meant to be overwritten by
image recipes and configuration files.



>   first, here's (the relevant parts of) core-image-base.bb:
>
> IMAGE_FEATURES += "splash"
> inherit core-image
>
>   that's perfect -- define an additional feature, then pull in
> core-image to take care of the rest. perfectly understandable.
>
>   core-image-minimal.bb is *not* so clean:
>
> IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}
> ${CORE_IMAGE_EXTRA_INSTALL}"
> inherit core-image
>
>   i consider this recipe file potentially confusing since, although it
> inherits core-image, it effectively stomps on the settings in there,
> and just rams an overriding value into IMAGE_INSTALL. in short, rather
> than "inheriting" cleanly from core-image and extending or enhancing
> the recipe, core-image-mimimal simply kicks IMAGE_INSTALL out of the
> way and sets its own final value.
>
> While it may add some confusing it actually illustrates that you can use
the core-image class in two different ways. You can rely on the default
values for IMAGE_INSTALL and add to it in your recipe:

myimage.bb
   IMAGE_INSTALL += "mtd-utils"
   IMAGE_FEATURES += "splash"

I would use IMAGE_FEATURES over IMAGE_INSTALL whenever an image feature
already provides what I am looking for.

The other way is that you can use core-image and not rely on the default
values but set IMAGE_INSTALL directly which is what core-image-minimal.bb
does. Could you write core-image-minimal.bb differently so that it uses the
default values from the core-image class? Sure.



>   a final issue is, if you define a new core-image variation and
> simply want to add some extra packages to it, what's the proper way to
> do that? at first glance, i might have just created a new .bb file and
> assigned some extra package names to CORE_IMAGE_EXTRA_INSTALL,
> wouldn't that work? but the ref manual states quite clearly that you
> are supposed to use that variable *only* in your local.conf file? any
> reason for that?
>

Yes, CORE_IMAGE_EXTRA_INSTALL fulfills a similar role in conf/local.conf as
EXTRA_IMAGE_FEATURES: you can safely assign to them in conf/local.conf
without worrying that you are overwriting preassigned values from an image
recipe.


>
>   as i read it, the accepted way is to use:
>
> IMAGE_INSTALL += "mtd-utils"
>
> but is there some reason one can't use CORE_IMAGE_EXTRA_INSTALL from
> within a recipe file? it seems like that would make recipe files
> easier to read.
>

I have the same recommendation as the manual has. If you want to have clean
image recipes use in your image recipes:

IMAGE_INSTALL += "...."
IMAGE_FEATURES += "...."

if you want to rely on the default values, or

IMAGE_INSTALL = "...."
IMAGE_FEATURES = "...."

if you do not want to be at the mercy of the default values.

And in conf/local.conf use

EXTRA_IMAGE_FEATURES = "...."
CORE_IMAGE_EXTRA_INSTALL = "...."

to add to it.

:rjs

