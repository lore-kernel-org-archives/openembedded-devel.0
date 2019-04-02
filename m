Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 286367CB12
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 02:29:04 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a71so7019481qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 19:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gm/5lSDFn1z3n+v95yFi9BzvrT9gJP/iSPUsEqUjprc=;
	b=FWvJKh9JwO4OjxHQbGEgsqnIyh+roAQjzxzm1ztT2SSRSeqRvoBSTp9DWQNPWeHWW1
	1l4qaPriOI5xjbvQB1FxR6TvZ2ad/t1ZY/JLzvHcK4+PZkeWUdZ6q3RoFqYLXBpsvsUd
	yZJQHKPs0NhHnvLZYBWAc/bZ7Ev8pBuFmL4KXzdiWG2c5CsY+neFok9vvL3gGGxPrqQO
	XM+XgPwu/f61Db7Wgim/SShCv4LasADINRHR0ce7kjw9eGNd8UtT1u13SaxVpBL0rK0N
	rhciG6ENa+EpFPE++3D8wJfaIW8SIZYFAkVYZFv/EZWHFaIpfLfk69UC6DtKwx6+KkER
	EFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gm/5lSDFn1z3n+v95yFi9BzvrT9gJP/iSPUsEqUjprc=;
	b=VaFxAoYdYxbSQ5ELinnNWOZyZlfYVvRBHuAT9XQn1JEVqYduV0KXBxmH5pJBWuTSEb
	fW7bwocOooAGhTFRe9/bTRnhlLIx7omoi1fW76rTWgRdHyPH/PG/OKDcvk5wSVX+Zps4
	qTmIeAn0/dyuYxkRh2Yxo+HM2V2fTGDY/UlLoyaNI6oJsVfZm55kJTjW4zIsJ7ITllDv
	Iy7gjK7U9leZHDNo3dOIsOBP5M7/uEgqvbnIpXQVPBq4HOAodj1SP9RjaQ2Mut2to65V
	uJPYGYXZX8rotSJTuNX0+PKRlCdQZGSEQ86q4gZvc1qZAQxg/tuDTIIohZ1+35M+BsV0
	1ttA==
X-Gm-Message-State: APjAAAX2cnbvGEl0xidKYo+sAdFBl+MIDKLuUxbnJScaWr/0vDiKP8p9
	Nw3vO6DWb/8WhVM1WnFmHlkv2LXm/LDrhToZb2Z0TlhZl1I=
X-Google-Smtp-Source: APXvYqwt4/tEqAtogja851pWLFAeNFN3DxVC7+F0d4UqDZfXuWoMvhVLfY2FOxoP+c8mTzJFeULHmcfaOImZMu/mONk=
X-Received: by 2002:a37:9fc4:: with SMTP id
	i187mr53672457qke.141.1554172144827; 
	Mon, 01 Apr 2019 19:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190330165630.4403-1-Randy.MacLeod@windriver.com>
	<d0946b9c-81d5-b30a-7b24-92e4673f7303@windriver.com>
In-Reply-To: <d0946b9c-81d5-b30a-7b24-92e4673f7303@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Apr 2019 19:28:38 -0700
Message-ID: <CAMKF1spUTKn98ay_nOw55i86qHHfvB=NQYs4B0HOibe-jVQXSw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Tue, 02 Apr 2019 02:29:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 30, 2019 at 12:56 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 3/30/19 12:56 PM, Randy MacLeod wrote:
> > The previous SRC_URI did not work for the new version and
> > when looking at the site, users are required to navigate
> > through a click-through license agreement. Also use git
> > repo rather than the .zip archive since the github checksum
> > can change from time to time.
> >

https://errors.yoctoproject.org/Errors/Details/235000/


> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ---
> >   .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >   rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb} (77%)
> >
> > diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> > similarity index 77%
> > rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> > rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> > index 0a0a6075d..29e094783 100644
> > --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> > +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> > @@ -12,9 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >   PROVIDES += "cyassl"
> >   RPROVIDES_${PN} = "cyassl"
> >
> > -SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
> > -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
> > -SRC_URI[sha256sum] = "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
> > +SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
> > +SRCREV = "e87433e2b6682aa7162fcb4aafefb08e2fbd932b"
> >
> Oops, I forgot:
> +S = "${WORKDIR}/git"
>
> v3 sent already.
> ../Randy
> >   inherit autotools
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

