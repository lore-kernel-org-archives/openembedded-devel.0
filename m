Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id AFC2A7F9A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 01:30:30 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id s18so3215527qvr.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 17:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=COd+NOWVHKIXq4iVTF3c7W78JmuYjmLKqjTn/EBKUtU=;
	b=tjfU/jUgj+YXTmyyB/yg6Np7FnMAv/eozfY5HRDXLHlyH9ZyX4HLY7t00JMuf4AZPJ
	v5mqn0hoJN+YoA3zV351lp/YkPGpHRDndI4FYOjm7PhKVYQ06xAT2CockhhUIfyOG64H
	ByCaVCRbmD65fc2uaSdbJrxO5cqtKM7NSmZ2RgwZ6uAXgLpn7SsSaL0MM370Bpckphmb
	6fYJkNZj2SW06d82VZeekHbR5j1gikGx11RDkZihlJHKxskxCGOf8TrBArfZSCRvhRlq
	lTGP1u5EqSA0dyZ+LWBDV2vA9Qo5gNWla1/xVikd5p6QcOmy/gJwc5VWsrisbTeFFeOI
	1hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=COd+NOWVHKIXq4iVTF3c7W78JmuYjmLKqjTn/EBKUtU=;
	b=i9wxZSbug08n2TRYuXE4b+e0etJGgeUCG/v9N99PAI2dNzglv+sNh+zyZIbroq/OVw
	DfRp8n+L1GijqESRlUt892b2a5TS2K8m2BtaqelMq4PTMIWqKnTDG/gwJaae6lszfzHU
	WVmxbpTPbC66vsM0xooxJ2qFB6UWRbociwVnNI3GfDjx1n/FH5rKoiBWeMUOb69vbvlH
	MW3KoYpTvSl6B8FiZ8L1ym7ItjOab512/al7PyP/Bfp+GBhzqpbhdmcAz4GFRpSZTwoO
	IxupJV/i54z1sk6ccSJedABj/ga4FNa6TA7U9e4QQUyYKYHn7QE8i04ne1rLCmRLekTB
	anxQ==
X-Gm-Message-State: APjAAAU8S/P7CqKL3+pqAanYu4d5rOZRxk5zfOSGh7bLkdEQJ/F6O4X2
	SO2kUxn4LnqsPbP2j+rHlV31C/GaS7dXUwF07dU=
X-Google-Smtp-Source: APXvYqyPuH5tqna7rJ8L1oMBGqu8b3FE8Hza08dbsX1DdWxOPXNRvdfqnkKejWxeAlCvDY5kHMnKOy6HbR+2Hf6KAYU=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr11229606qvy.109.1573781431066; 
	Thu, 14 Nov 2019 17:30:31 -0800 (PST)
MIME-Version: 1.0
References: <1573618477-12608-1-git-send-email-denis@denix.org>
	<20191115005941.GD4735@denix.org>
In-Reply-To: <20191115005941.GD4735@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 17:30:04 -0800
Message-ID: <CAMKF1sqfMPsCFHLybpmusEXMc1mBoe_C5Vjo184y3U2LNcJAxA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] mbedtls: upgrade 2.16.2 -> 2.16.3
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
X-List-Received-Date: Fri, 15 Nov 2019 01:30:31 -0000
Content-Type: text/plain; charset="UTF-8"

adding Armin

On Thu, Nov 14, 2019 at 5:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Can we also get this backported to zeus? Otherwise armv5te machines are broken.
>
> Denys
>
>
> On Tue, Nov 12, 2019 at 11:14:37PM -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > * Mbed TLS 2.16.3 is a maintenance release of the Mbed TLS 2.16 branch, and
> >   provides bug fixes and minor enhancements.
> >
> > https://github.com/ARMmbed/mbedtls/releases/tag/mbedtls-2.16.3
> >
> > Most importantly, this fixes breakage on ARMv5TE platforms:
> >
> > * Fix the build on ARMv5TE in ARM mode to not use assembly instructions that
> >   are only available in Thumb mode.
> >
> > https://github.com/ARMmbed/mbedtls/pull/2169
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../mbedtls/{mbedtls_2.16.2.bb => mbedtls_2.16.3.bb}                  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.2.bb => mbedtls_2.16.3.bb} (92%)
> >
> > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.3.bb
> > similarity index 92%
> > rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb
> > rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.3.bb
> > index b0bd942..79d0dbe 100644
> > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb
> > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.3.bb
> > @@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
> >  SECTION = "libs"
> >
> >  SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
> > -SRC_URI[md5sum] = "37cdec398ae9ebdd4640df74af893c95"
> > -SRC_URI[sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
> > +SRC_URI[md5sum] = "90ce7c7a001d2514410280706b3ab1a7"
> > +SRC_URI[sha256sum] = "ec1bee6d82090ed6ea2690784ea4b294ab576a65d428da9fe8750f932d2da661"
> >
> >  inherit cmake
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

