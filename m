Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE7E7D297
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 01:38:17 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id w20so4964609qka.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 18:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gamXW4ieN7tEMMs83QTGi2xIr6HX0xfnwWfxy245aPU=;
	b=uM3EoaNgveXCnhV+b9SSA10xnFV59ZohiUrbDBbwVsE2AIq0GbnaPWYAsppd9d0y3m
	r9hyyb90qVS5/Wu4SMp2Qw6oNs8sgGPr4ME1EYl3ZgbFn5VCH9g22J5uVymrZu7t/FZ4
	UQ9kF+oFuLqPemhrIFnLUZ/wcG4ItVRZ7Sgj/AvckOCqUXEHQa/8K41cEbumYriEQGGx
	j/oatThELfWWxqhB5vLrPSrRi0LzT+xL7jepq9cSLsTQ6ozLcKhNybHSwspmeoFkz6H/
	6++pjoJWDoIPkNs1GXYIMHUobWQg/icUmhYrJRvACYrbJEe0oneQsjDQLugHahEW27Fp
	FTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gamXW4ieN7tEMMs83QTGi2xIr6HX0xfnwWfxy245aPU=;
	b=Q4DHkoM1dfh7gG4zdsXiVBXZ7fOrKim978CQ9Yfw4/1Bk2r97ngb32drGQa7SbDII6
	iyJ5jkcO/1xEzecBI2oozsh1fLn4LdIIaawOd5tIWK5Ii2WbUUMJqjWqrN58q/Qtx5It
	sVkJxgdO6BTL/pvgWcG5VvjfBygXz5dHC9cvnOXiXJ/h8eLXteGPwSu17I/RjXHXezm0
	GQeowRfATp+16ARdq8SCqh+sO9UKGdAGu+zU5ByxzezGD8ON7MCfV/yg/OvrjQ9PYsK9
	BW8ZzhVby+tzS5fyTX9waxd/t+baBG8PZ38esXsLS7GMYWAbk/n4Lj2qHgE4iOR4EGJN
	xBwA==
X-Gm-Message-State: APjAAAU10Voe6XussrlzSKZesxWY1zEJVFK15wwrGhUGdNaX7RT+b0pw
	LEkb6oqXuSz4n3EomfmBljYm2yT7MlC1Oa7tuRDVHw==
X-Google-Smtp-Source: APXvYqze5VElmRAM3dQnb0g3HTeWcza7UIYmYQdNGHW8jkK6fU0bl9RDrc45u4KWBiFykxHaW8z4UO5/FL+B8O1WJx4=
X-Received: by 2002:a37:a208:: with SMTP id l8mr13372339qke.210.1554514698282; 
	Fri, 05 Apr 2019 18:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190406004827.14047-1-Randy.MacLeod@windriver.com>
	<74cc7853-e1ca-3b81-1424-1923853525f5@windriver.com>
In-Reply-To: <74cc7853-e1ca-3b81-1424-1923853525f5@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 18:38:07 -0700
Message-ID: <CAMKF1soJjqncOMuv9Ew3bNNAXVi3cZ+Pw7hCbAjjA1qCxN9VsQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3-retransmit] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Sat, 06 Apr 2019 01:38:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 6:05 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Khem,
>
> I know you had a compile problem with this patch last time but
> I've checked it again and even 'called a friend' to do
> a sanity check and the simple patch works for both of us.
>
> I don't see what the problem could be so hopefully it'll
> just work this time.


My builds on Oe servers takes more than 24 hours so I was still on v2 and
v3 build is still in progress

>
>
> ../Randy
>
> On 4/5/19 8:48 PM, Randy MacLeod wrote:
> > The previous SRC_URI did not work for the new version and
> > when looking at the site, users are required to navigate
> > through a click-through license agreement. Also use git
> > repo rather than the .zip archive since the github checksum
> > can change from time to time.
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ---
> >   .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}        | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >   rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb
> => wolfssl_3.15.8.bb} (77%)
> >
> > diff --git a/meta-networking/recipes-connectivity/wolfssl/
> wolfssl_3.15.7.bb b/meta-networking/recipes-connectivity/wolfssl/
> wolfssl_3.15.8.bb
> > similarity index 77%
> > rename from meta-networking/recipes-connectivity/wolfssl/
> wolfssl_3.15.7.bb
> > rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> > index 0a0a6075d..d4b969104 100644
> > --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> > +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> > @@ -12,9 +12,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >   PROVIDES += "cyassl"
> >   RPROVIDES_${PN} = "cyassl"
> >
> > -SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
> > -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
> > -SRC_URI[sha256sum] =
> "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
> > +SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
> > +SRCREV = "e87433e2b6682aa7162fcb4aafefb08e2fbd932b"
> > +S = "${WORKDIR}/git"
> >
> >   inherit autotools
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

