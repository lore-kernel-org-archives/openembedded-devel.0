Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9516171D97
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 16:22:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k15so23448221wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jun 2017 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=YEVpMD+EUXHpehNiBAwojBoP26F4HIFfRyKECJSzHEU=;
	b=c0UDeS/01H7/Su0emfRxOzcxJj4v+nYFP90eVKYPe6rKXjCFi3HMLu1csLK36PUokb
	j9XvLqLmxHKA2g3CCmcoEFIpC+he6Q1TSifLz1EYSe7z5rTWcxInbl3a3L22a+7cVsZ7
	Aqj/ofJB+bF+efTgIU6UTs6SrLfo5DuAhWZjHkD4Uhq3RE7KEJeImRGskqR27zNzMvzR
	LDr2RW8wpTEmOyQFp3ntQBqxv3V2dxn8tes0ruA363fREOz14kePxQf0CytEn4nKnAbR
	veuPcARTq76Xko63YJW2ag29UIduSSr7094PNuZet2o/EuXTexwMrREQyTM5yDT7MeYR
	WPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=YEVpMD+EUXHpehNiBAwojBoP26F4HIFfRyKECJSzHEU=;
	b=clr/VtItCe5XY2rkS9hpEOzB7+vo57PL1lc50jog9CRkAcMYIuKeA4b5Yrdbh2CAgS
	IPvwx94BtacJJOdzRktsWsNiwpYZs9pwkER8840v2S9VgcqICRk6lx/uPKhzjeHcr3Xg
	oNR2YKqAXZ8K7iB73Bn/ch0GHABVlSpp63tlAGJUHKT84URpdO0fqV7mCn4Xr5RWyWar
	EKoQ6N4ka1+6qoE7zItK70QLhk2zAu6y5aYaokfL9a5zr9hTFoary/C9NV6Q0UXIfVls
	dly+8KHEpApXN7NlQCF0ExfZ3i55UVRH/VdCgBd0Lm3dzvUCraVqs4Sq+woaFiN96f+q
	HZAw==
X-Gm-Message-State: AODbwcAGZC7Txdva/I//LX94TH+xRmPBfqUu0AmU8jPyrcdgI1KmY0Oc
	fsKviALVLb3kxvRf4f2GGaYQmmvcHQ==
X-Received: by 10.80.144.118 with SMTP id z51mr9951110edz.143.1496506949104;
	Sat, 03 Jun 2017 09:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20170603045833.8120-1-raj.khem@gmail.com>
	<20170603045833.8120-2-raj.khem@gmail.com>
	<4987dca7-1d4e-983e-acb7-6c398b9a0dda@gmail.com>
In-Reply-To: <4987dca7-1d4e-983e-acb7-6c398b9a0dda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 03 Jun 2017 16:22:17 +0000
Message-ID: <CAMKF1sr6YJv=LR=Nuiw9-EJ-hFbSBggOeKW8kAnDsZOaY1S4LQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 2/4] python-numeric: Fix build with musl
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
X-List-Received-Date: Sat, 03 Jun 2017 16:22:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 3, 2017 at 8:22 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 06/02/2017 09:58 PM, Khem Raj wrote:
> > Use gettimeofday() definition from system
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   ...-define-this-function-differently-than-it.patch | 30
> ++++++++++++++++++++++
> >   .../recipes-devtools/python/python-numeric_24.2.bb |  4 ++-
> >   2 files changed, 33 insertions(+), 1 deletion(-)
> >   create mode 100644
> meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
> >
> > diff --git
> a/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
> b/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
> > new file mode 100644
> > index 000000000..81ed744cb
> > --- /dev/null
> > +++
> b/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
> > @@ -0,0 +1,30 @@
> > +From 322e781c67d7a78fc2cfc3d377f50b825fc64abb Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 2 Jun 2017 20:21:01 -0700
> > +Subject: [PATCH] it tries to define this function differently than it is
> > + defined in sys/time.h.
> > +
> > +Use the definition from system
> missing Upstream-Status


It's Pending
I don't think we do that meticulously on meta-oe but it's a good info
nevertheless I will add it

>
>
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Packages/RNG/Src/ranf.c | 3 ---
> > + 1 file changed, 3 deletions(-)
> > +
> > +diff --git a/Packages/RNG/Src/ranf.c b/Packages/RNG/Src/ranf.c
> > +index 5ca7dc5..e669fa8 100644
> > +--- a/Packages/RNG/Src/ranf.c
> > ++++ b/Packages/RNG/Src/ranf.c
> > +@@ -149,9 +149,6 @@ void Mixranf(int *s,u32 s48[2])
> > + #else
> > +     struct timeval tv;
> > +     struct timezone tz;
> > +-#if !defined(__sgi)
> > +-    int gettimeofday(struct timeval *, struct timezone *);
> > +-#endif
> > +
> > +     (void)gettimeofday(&tv,&tz);
> > +     s48[0] = (u32)tv.tv_sec;
> > +--
> > +2.13.0
> > +
> > diff --git a/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> > index c0b04e144..c91d77c81 100644
> > --- a/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> > +++ b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> > @@ -5,7 +5,9 @@ LIC_FILES_CHKSUM =
> "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
> >
> >   PR = "ml3"
> >
> > -SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz"
> > +SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz \
> > +
>  file://0001-it-tries-to-define-this-function-differently-than-it.patch \
> > +"
> >   S = "${WORKDIR}/Numeric-${PV}"
> >
> >   inherit distutils
>
>

