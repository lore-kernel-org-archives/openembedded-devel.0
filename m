Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDD9789E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 16:01:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id n7so14776040wrn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 08:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B6ht1OtQ0G5RLm5cyDKx1F6HQ6GxXpkAeAe7V93XxEA=;
	b=jI8k0+ErUuHwAoVhkZimmtSncznBBtH74zZZm/qdDioJqcRRVdIwJHqC/02X13dboO
	Q5VcmQcI/7IGguZGAab0cBvmC2Lm3SCBYTevxvCgjWDo8ASf/qgRMGBeNiXk4XWNA1S0
	U22AHo3rTKZ5hQsi1ukK3z8c5cUQOasBG+V/SPjcCDkjg10TDUJkEcLzTnuI5ROAEpdd
	7ikWPVQKsNpYllJref/YXhccKpheOWw4zfV5jvyPvtdbMzZbOmA5PjvoQ5vK8e9XKEIc
	Yed5nw7aaQgXx2wERE4WE4RzpBypm+QHFOE3LNKK9G90Z21I3yRG45f6FdcweRMxWjvW
	Wdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B6ht1OtQ0G5RLm5cyDKx1F6HQ6GxXpkAeAe7V93XxEA=;
	b=V6JcAvaduj6EU2vaNW20SF0PS/VbaHg9L/yDvT/AOpmIo1bNulB3WHBGnG8AjFzlYu
	7Zxvv+3M3LPyhHSU0YpBhoeviQvAnvxHSiZ6KTOeZhHcO3PihjatnGD68qNnK533uUdc
	sRRb8nBj0cUIfrMY3XsI0nUxLjt1WKJMKyrTDnAWefim8Kjq6qCBLqiVYAH6FYpJdXCC
	G3AyK7KqTef7ShctuepWmGyEYXTpFFDpUvhG3nvlSRGH4niRsJiYo7SsH60yfI+mCrWg
	1dtiuwuqXJB538TpJ5p1ZKM4l5peAfETpTF9i9KktNHei4bUibcvdHcFqzHY7J0mXQ2H
	Se8A==
X-Gm-Message-State: APf1xPAR4a0vKwx3V894TAMdfdXgfXk8PqWPaWpLzWx3h5hdx9schq9b
	Q1mszXVChX6YIxYtMrlXdC5+Wws/O2cUnRoVuwr0lg==
X-Google-Smtp-Source: AG47ELsN+NULBvwSuHw++aTUGa49XqPEZterZlGCG4uHRL+/XEwuy6YFoP9JbPu9fIkQf3x+Xh2vINzDx4Wz1mXPl/E=
X-Received: by 10.223.143.101 with SMTP id p92mr9999350wrb.241.1520179277511; 
	Sun, 04 Mar 2018 08:01:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 08:01:16 -0800 (PST)
In-Reply-To: <277b760d-e7b1-833b-c671-26fc1cc50942@gmail.com>
References: <20180301103813.8027-1-Martin.Jansa@gmail.com>
	<277b760d-e7b1-833b-c671-26fc1cc50942@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 17:01:16 +0100
Message-ID: <CA+chaQf=xVt-5uNHFVU9zPyRug9-h59yAfKLS_W_ZtXmYyEdEQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xrdp, xorgxrdp: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Sun, 04 Mar 2018 16:01:17 -0000
Content-Type: text/plain; charset="UTF-8"

It does apply cleanly in master, but it depends on:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-February/116994.html
which is still missing in master-next.

On Sun, Mar 4, 2018 at 4:02 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 03/01/2018 02:38 AM, Martin Jansa wrote:
> > * libpam dependency was added to xrdp in
> >   http://git.openembedded.org/meta-openembedded/commit/?id=
> cc32ca8030c02a2b1b22f6b43e1894dc5f00e14e
>
> Please rebase
>
> - armin
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 2 +-
> >  meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb          | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> > index 9355379840..558a1982f5 100644
> > --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> > +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> > @@ -8,7 +8,7 @@ inherit autotools pkgconfig
> >  DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
> >
> >  inherit distro_features_check
> > -REQUIRED_DISTRO_FEATURES = "x11"
> > +REQUIRED_DISTRO_FEATURES = "x11 pam"
> >
> >  SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git"
> >
> > diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> > index 88e309a59f..671a251962 100644
> > --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> > +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> > @@ -8,7 +8,7 @@ inherit distro_features_check autotools pkgconfig
> useradd systemd
> >
> >  DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam
> nasm-native fuse"
> >
> > -REQUIRED_DISTRO_FEATURES = "x11"
> > +REQUIRED_DISTRO_FEATURES = "x11 pam"
> >
> >  SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
> >             file://xrdp.sysconfig \
>
>

