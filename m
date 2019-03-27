Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0D56C104
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 12:24:33 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id w18so25078053itj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1enBI2VpVTqYbinSowfynT1DlD0Mij1r+7EEVXVa4e8=;
	b=Wykz6OM/8KyzMdnvq5HY+gRkw/gFo+ehgrcIMdoFtzDC5dWsDARnivXDJU7J3xy41z
	dOmvksrPfGH49GYRWUuCECe+BHsYhAMoN40j7xzSdApxOJ+E9nF60yCJ2KzeCeFeNWVb
	zEAnPTebyAtIrkMqHrHyxr15ptX8e43CAED5VzZVlnBf7xCEGJmVd+Fq4x8CozPHHGuj
	OgYfOb8oJ+cfEN7N6SxJkfrElW5kEoyKiOcDkSBjz+kETl+FWu663j3ADVTcr1lM5WQ/
	tBhByX+3ulBj9oOFLjdi4F0Ypc2jYYlpq9ECt87Yz58NdGo6/VC/FZ8w8erVj96SIb2g
	1Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1enBI2VpVTqYbinSowfynT1DlD0Mij1r+7EEVXVa4e8=;
	b=pCpo1PW8mPwgKzhGHEMUYSN9XCW6lQIQM0S+tOj/+gkWNuUvARrdGw1rjadoccJD31
	SfmT5SVB7RrtKa4wdjHAoJTFqcsyab4L/pawJZdDyYEID9XdIpzCPyproclULmc8B1wa
	LUswMFi0mtNjDyZ0/ol4Bba+3tyietXZhBsvknOlHMkopGwANtyvKwNDpiHePI2rlZ32
	5OuRUVeCnnMiaWLkcBovMlyfhgCkkdvodvpHoQIXuAr3so917VQFpEaZ/kd5x+9x1r3G
	njnWgg3gC0K/fs2TIcBTWr1pSorOjnw3SkIFxhFdkzlP9CtAM09fvvxYTioRUVkkB0Eg
	C1Ug==
X-Gm-Message-State: APjAAAXRAkPfvfQ7XMh/mTxtfgWeBOLEEOtc/i1qSTs0Uxj0hY3jLpgz
	zjaF5o87plhkKvBDg+mZqD/e5zmOhcX7QKM60Us=
X-Google-Smtp-Source: APXvYqz1hsj5P9kfe1svss4IbI/lRnObZxQCqLH9+OxLW7CBWOpBfvv4BZqGju6tN08rASOVFb87uVs9vhlP1PoFfm8=
X-Received: by 2002:a02:23c7:: with SMTP id u190mr26805111jau.81.1553689475058;
	Wed, 27 Mar 2019 05:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
	<20190322102129.5067-9-schnitzeltony@gmail.com>
	<CAMKF1sqtdp5Fqw+wjUfz33VBeaJUwuT430r+AYdQhn0=Cd9FYA@mail.gmail.com>
	<20190326125724.GA2428@localhost>
	<CAMKF1srG8EMoUMk0cSFRjyHky-A5pS+GBtNKvqSLQ3_eONpnvw@mail.gmail.com>
In-Reply-To: <CAMKF1srG8EMoUMk0cSFRjyHky-A5pS+GBtNKvqSLQ3_eONpnvw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 27 Mar 2019 13:24:19 +0100
Message-ID: <CALbNGRQbK_neQv7n84HQXSB6SjR_CSrJck471eL1Hx_2RRPHig@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Wed, 27 Mar 2019 12:24:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 5:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Mar 26, 2019 at 5:57 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Sun, Mar 24, 2019 at 09:28:14AM -0700, Khem Raj wrote:
> > > On Fri, Mar 22, 2019 at 3:23 AM Andreas M=C3=BCller <schnitzeltony@gm=
ail.com> wrote:
> > > >
> > > > * license.html was checked: it is still GPLv2. Could not find what =
changed the
> > > >   checksum. Maybe it was generated with a different version of gtk-=
doc.
> > > > * Build tested with just gnutls in PACKAGECONFIG to test nss altern=
ative (and
> > > >   setting no crypto won't work)
> > > > * Build tested with all entries except gnutls/qt4-x11-free (yes the=
y still
> > > >   support it!) in PACKAGECONFIG
> > > > * By far the most time was spent on musl patch adjustment. They app=
ly cleanly
> > > >   but musl build was not tested due to limited resources.
> > > > * Fix build for non systemd by making SYSTEMD_SERVICE conditional
> > >
> > >
> > > https://errors.yoctoproject.org/Errors/Details/234221/
> > >
> > > ../NetworkManager-1.16.0/shared/systemd/src/basic/util.h:75:18: error=
:
> > > unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
> > >...
> >
> > NM seems to now ship systemd sources for using them as a library.
> >
> > OE carries 21 (sic) patches to systemd that are
> >   Upstream-Status: Inappropriate [musl specific]
> >
> > This specific error seems to be fixed by one of them.
> >
>
> Yes, thanks for info,
>
Maybe some source of inspiration is found in void-linux [1] - they
build for musl either.

[1] https://github.com/void-linux/void-packages/tree/master/srcpkgs/Network=
Manager/patches

Andreas

