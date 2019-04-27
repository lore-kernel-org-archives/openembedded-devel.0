Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6307DC8F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 17:13:00 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id k189so3776497qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ekMmRPJ7sINfnSSkP89i/F33azZN2XozviWp5pPEa6w=;
	b=jptvNW2iUuiVrfJTDrYCxuHdZIXk7tybUxGs1gSStmSALuhZsMd2mgn7VlYUl/xZHo
	SfnEl7VTVWwBDsZDSas641clyTTVbqLQe7dPDpnWovOYgcjS4c7HZ5YY/S4V9+P7QcQI
	qUQbaT03FPcWftQXrqC6dfasKSYsIls7YJxIctMgUmChnCdl+1Fel9CiYk113yLBos6t
	1fAS5YV4u+Tj6Ur8xlDszg8dAwqRdb15rmsAt9plAJfoWYpActAPKPWjVhIESEuGTI4R
	I23kQHCktDaL4KmNiaC7LwiLY74Gq4ugq8xW8wh4Ts8nfD72fS/a1/rabSjOoAXlw7Uu
	oHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ekMmRPJ7sINfnSSkP89i/F33azZN2XozviWp5pPEa6w=;
	b=fmmGiI1QC7Z7Bi00C0L3qRcEJ1j61155Ggt3Dc/ox35KF9X+kiny31nBINTS4mH6Si
	zu1uBL2zVVmPiczHFNsWXQZLm1GTBeQBlW+4iLs9RMs/UeFpRujkqq8mA3Oi1uCDnhWh
	9iG8bLKrgkTcCulXZSzTZpGoLzAnNBPGd1dZjMsSHW9EmdIjgME5PiZcDPh89/lmlsm5
	zK+7zffF5T8/iJyK8/OiFey+SI7h54O2r/8JqYRnSG4Z5txj6yTTX37W8dxYeNmOsKYb
	eC9rCPeOgLBFC5MyslQF3VWvc4lNMJxg2pXYkZrn2c9m+ByFj5w4Tp+4W6qtAdwPDX3e
	fGSA==
X-Gm-Message-State: APjAAAXx2hSM3yBGXE+CNYpN8QRTlTBogNqlCgraBe8x3LtoSDLAfdgo
	Z1RwCif63dtzv27UxuY7/I8wFFOZy3KVZM0Z2CeDkUVO9ic=
X-Google-Smtp-Source: APXvYqyw8jXYojWfQtWoY7jgChYmFTKbDwJ6fRiHulITySnEqYUvCbyKMcTd27MxsTjudh8z8o7xcHv48KAHb/jxQ+Q=
X-Received: by 2002:a37:a849:: with SMTP id r70mr31825002qke.315.1556385180845;
	Sat, 27 Apr 2019 10:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190418153432.16745-1-beniamin.sandu@gmail.com>
	<CAMKF1sozPTkxYHg67tNEok5SDgQ35EEu=WkLmaTro4CvZea_AA@mail.gmail.com>
In-Reply-To: <CAMKF1sozPTkxYHg67tNEok5SDgQ35EEu=WkLmaTro4CvZea_AA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Apr 2019 10:12:35 -0700
Message-ID: <CAMKF1sr6Rn+epNv93hcamsoL0DSK7VWcZzYqmx0dEXZo6KJaKw@mail.gmail.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Sat, 27 Apr 2019 17:13:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 27, 2019 at 10:02 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> it fails to package the systemd files so please build with systemd in
> DISTRO_FEATURES
>
> see https://errors.yoctoproject.org/Errors/Details/238577/
>

right link to error is

https://errors.yoctoproject.org/Errors/Details/238573/

> On Thu, Apr 18, 2019 at 8:35 AM Beniamin Sandu <beniaminsandu@gmail.com> wrote:
> >
> > Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
> > ---
> >  .../recipes-support/unbound/unbound_1.9.2.bb  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.2.bb
> >
> > diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
> > new file mode 100644
> > index 000000000..9e0a24187
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
> > +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
> > +       features including enhanced security (DNSSEC) validation, Internet Protocol \
> > +       Version 6 (IPv6), and a client resolver library API as an integral part of the \
> > +       architecture"
> > +
> > +HOMEPAGE = "https://www.unbound.net/"
> > +SECTION = "net"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
> > +
> > +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
> > +SRCREV="61a28c2ee5e60132f26725583b66c1cf8214bb78"
> > +
> > +inherit autotools pkgconfig
> > +
> > +DEPENDS = "openssl libevent libtool-native bison-native expat"
> > +RDEPENDS_${PN} = "bash openssl-bin"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

