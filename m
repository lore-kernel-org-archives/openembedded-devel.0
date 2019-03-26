Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBD1E7D10B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 16:16:12 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s81so7933167qke.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s1xyGYkLP3bExKVRHRuPYQqGo1ONb7z5dP1tjOnsrjo=;
	b=j8RAHM/RcbdBmjTBsZIAA5zZawtlo+kqUppg2kyspuphU2LxnIaKMd3qYxh77fH+q1
	npIBKGiNe5rHWA8GqdYv9Ot1p7G8ZSOiUt+j0Lhp4RdgU02CDj4un47f+8I9sua88j/w
	61X8mSesSk35rVAPGaXc9F9fnepjuKqmnMfrEhrZ2tF1La2bN1nh2HUfBq3Lta7btJMo
	lr+mdXw0RbGSumlNQwnHkUnJasPX2nY95zdqe9os0OncJybiUHS5A3iAxhuYDCF8Qe5k
	Of8yjUXzNgh6S2VvGbd6UVDD7m5/OMtMjqLjFrUy6xysqxX64CHNINBxaGRol4BxMJab
	W/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s1xyGYkLP3bExKVRHRuPYQqGo1ONb7z5dP1tjOnsrjo=;
	b=jI5lWgGO7U4hGvRGDxL9/JmeaUcwmbJlZXoWW5nkisiH/aRZHiDJ3MByUAqLAUbsRr
	WOdi6WeVyuzWYhSln322eZTmsd7F9N3mdPgNvNgRa5d1xyOeLuBHYJeQr0TkB7aTx6Ns
	Ptei7JMmCXS9ZwMUcLE+aEC3OZQDTvbHfaEfkaTGiURLaaxNDqW9jBC5Bx1qqMnawEDg
	x+tjHG/RdtyMf+RBEdmNJdM6IaeEimUI3ofxc0UWIuY6vv2vXQ82L0ka9llz/k4GyNuO
	tIGmx8t5LflJKS4KATQA+n78jNDqDNUDngDjXC7Rf6TNOgmJ/dqHkSV26lRXMtmJ4lSO
	ZzOw==
X-Gm-Message-State: APjAAAXGeYslm4yf+7P9INFluPCmSO/rQD/X9oFpwUuX1hJTsS5Gsqfi
	3ELgOAbdeTr8hDBxZkwykpFAvI90CbD1qSUNSHA=
X-Google-Smtp-Source: APXvYqz9jf5sK99QiR1bmP7w0jnCmJjeJV6IT1LN2tfKi2kt9oQLmCeZuyJPVteOMQQ/omIr0Zf84YWxKWORg+2YYLM=
X-Received: by 2002:a37:99c7:: with SMTP id b190mr20977445qke.2.1553616973607; 
	Tue, 26 Mar 2019 09:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
	<20190322102129.5067-9-schnitzeltony@gmail.com>
	<CAMKF1sqtdp5Fqw+wjUfz33VBeaJUwuT430r+AYdQhn0=Cd9FYA@mail.gmail.com>
	<20190326125724.GA2428@localhost>
In-Reply-To: <20190326125724.GA2428@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Mar 2019 09:15:45 -0700
Message-ID: <CAMKF1srG8EMoUMk0cSFRjyHky-A5pS+GBtNKvqSLQ3_eONpnvw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 09/11] networkmanager: upgrade 1.14.4 -> 1.16.0
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
X-List-Received-Date: Tue, 26 Mar 2019 16:16:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 5:57 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sun, Mar 24, 2019 at 09:28:14AM -0700, Khem Raj wrote:
> > On Fri, Mar 22, 2019 at 3:23 AM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > * license.html was checked: it is still GPLv2. Could not find what ch=
anged the
> > >   checksum. Maybe it was generated with a different version of gtk-do=
c.
> > > * Build tested with just gnutls in PACKAGECONFIG to test nss alternat=
ive (and
> > >   setting no crypto won't work)
> > > * Build tested with all entries except gnutls/qt4-x11-free (yes they =
still
> > >   support it!) in PACKAGECONFIG
> > > * By far the most time was spent on musl patch adjustment. They apply=
 cleanly
> > >   but musl build was not tested due to limited resources.
> > > * Fix build for non systemd by making SYSTEMD_SERVICE conditional
> >
> >
> > https://errors.yoctoproject.org/Errors/Details/234221/
> >
> > ../NetworkManager-1.16.0/shared/systemd/src/basic/util.h:75:18: error:
> > unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
> >...
>
> NM seems to now ship systemd sources for using them as a library.
>
> OE carries 21 (sic) patches to systemd that are
>   Upstream-Status: Inappropriate [musl specific]
>
> This specific error seems to be fixed by one of them.
>

Yes, thanks for info,

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

