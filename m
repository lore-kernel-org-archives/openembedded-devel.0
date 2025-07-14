Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0637FC83F22
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 15:14:13 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.80513.1752506043227237253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 08:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QShjZMLU;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32f1df5b089so38172311fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 08:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506041; x=1753110841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+aJM4iwXcMIXTIBHkN688+HGm/bkYnPnAHS3rUOsWs=;
        b=QShjZMLUkDNzHUVmc2FK+oOUudJd6/akQVa64wRlQSBjyu1pfy9Ftqa03AQmgPdhbd
         JmboqMtu+KI+0BK9ID8cysVukOQUDT3vc/2s5NVutrz5Hu3cTYaxhLeXDstZu3ANU4fB
         Ju2xOAj7+xmGvBEoQR+XWmPGogk1HkuuO9SicDWF/lWbCrs1YivmeDnb06FIei1YF7wa
         lYof3fwbv6BlI+cHSgOY4VT5UHU70zaj07rwZSBVZYgYgsD9p0cWXWE7WgX29Ed12Xud
         BQKnCeoW55O6bbLe3mloCQ5fPyB7N35iSvNHvb6lCEuKw5S9X09G0ensGpf4Tow4EOBh
         C53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506041; x=1753110841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+aJM4iwXcMIXTIBHkN688+HGm/bkYnPnAHS3rUOsWs=;
        b=r0DjPyx0hChIPWPRh/iJtqtdtOyJ4WeSJ2PBbIuEPVdX7aJdudcSXcJP39CZeR4Dd1
         Rkq/3ffyC0tCayTY151+wo2uHrHnM8GgAfdSOB9sRVZ6xhxC6fCkgcx635bJNe3PEWgY
         PYPgpnWnpjx7kN+kVFXEX9eCvMs2Isvi758t9P87wMZ5khgM1IsGU3WEKdNLmdejO2sR
         NSODg6moak8XXtjLz8/4+x7GRUWoi0X5oQz6VGqYNXNIUzCVjKy9rCzlsxFM/7oyJYL7
         4f2Xn8M+DM8ShcRdGFtE/viDVGvbiiXH6YL24PrzVY2QU13mfZMmP0flyjWhSW9KPzNa
         ud9w==
X-Gm-Message-State: AOJu0YyAh7xM8a1Stes+wERpiYELPxzhCdTiZg4Q5Vn+c4dg2pEHpKxp
	zzdASrImM2gfWF8CNPJmf2q5zlVqxlu1Aw7gaddbmNpfV0FUbNn6T4AuWqKJ5hdkRzWBHfykrI+
	AIADxW70eV4GjGX04KRJJt3u19LZegrM=
X-Gm-Gg: ASbGncuDzeExUTX6oU4iK1Oe7o+vpvgLtGNHCQEmQe0fAHuhGSNOGi1oaMNzZnsEbfa
	a2LoKMtr8mTJ5LRJhV54RrM1i84Qon+Hf3iHgopiXVet3k8reYKzE1pfYMdd9gXD1arhG5gC3HC
	ct/uwHEwIuRSbznABGXu6OeHjmVYvPxxbMUhKd7tQO7kE8QG+qkcMy5jdbxuBCVnMoBcGJ3gKxK
	AOQJO1GKA==
X-Google-Smtp-Source: AGHT+IFafODl7HG8+kIKl5HKeHZnqhPTiD1j0pWtAW/h5bPLPW2IawhRgR/ek50re4vkVLcxxRgjEo4Aic4y1kq1N+g=
X-Received: by 2002:a2e:be92:0:b0:32a:888e:b30f with SMTP id
 38308e7fff4ca-330532d0456mr44936581fa.6.1752506040975; Mon, 14 Jul 2025
 08:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250714134657.1620685-1-martin.jansa@gmail.com>
 <aHULieE55wXsyrSf@nuoska> <CA+chaQc7a9wXuCnF0mrdFbkE_tY+M+1Z44D2qNJzy4VN990ViA@mail.gmail.com>
 <aHUUxW_rau2wEQFN@nuoska> <CA+chaQe+bS4PpQcEbX+-kWBviL4tk7_FYKdKfjLmd+oGCYA53A@mail.gmail.com>
In-Reply-To: <CA+chaQe+bS4PpQcEbX+-kWBviL4tk7_FYKdKfjLmd+oGCYA53A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Jul 2025 17:13:47 +0200
X-Gm-Features: Ac12FXyJBxPl33aKs0sxnJWvXKde2PIz-8yDWlS-M1xYGe55kvDo8CNMfZFCxH0
Message-ID: <CA+chaQd8ev4zisd8msCbuLN3_hnYY=RNrCHKVV7vQbd2=TYPNA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] fwupd: set vendor_ids_dir
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 15:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118542

On Mon, Jul 14, 2025 at 5:12=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Mon, Jul 14, 2025 at 4:31=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro=
.org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 14, 2025 at 04:00:03PM +0200, Martin Jansa wrote:
> > > On Mon, Jul 14, 2025 at 3:52=E2=80=AFPM Mikko Rapeli <mikko.rapeli@li=
naro.org> wrote:
> > > > On Mon, Jul 14, 2025 at 03:46:57PM +0200, martin.jansa@gmail.com wr=
ote:
> > > > > From: Martin Jansa <martin.jansa@gmail.com>
> > > > >
> > > > > * it's in RSS as fwupd/2.0.12/recipe-sysroot/usr/share/hwdata/usb=
.ids but
> > > > >   meson is searching the paths on host with:
> > > > >
> > > > >   # look for usb.ids in both of the Debian and Fedora locations,
> > > > >   # and fall back to the system datadir in case we're building in=
 a venv or prefix
> > > > >   vendor_ids_dir =3D get_option('vendor_ids_dir')
> > > > >   if vendor_ids_dir =3D=3D ''
> > > > >     vendor_ids_dir =3D join_paths(datadir, 'misc')
> > > > >     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
> > > > >       vendor_ids_dir =3D join_paths(datadir, 'hwdata')
> > > >
> > > > Isn't this the same as ${datadir}/hwdata ?
> > >
> > > It is the same value, but on my host, I don't have
> > > /usr/share/hwdata/usb.ids so meson doesn't detect any existing
> > > vendor_ids_dir value and fails.
> > >
> > > With this change it accepts passed vendor_ids_dir value without
> > > testing it's existence (neither on host nor in RSS).
> >
> > Previous version of fwupd update patches did not include "hwdata"
> > as build dependency so recipe sysroot did not have usb.ids file
>
> and previous version wasn't failing like this, it started to fail only
> after the upgrade as
> https://github.com/fwupd/fwupd/commit/61a863de8dd429be8c393ec267d63db78de=
71b76#diff-30d8f6be6320feeacf686be94f48c70869b52630e01ea625f0f15adc0d57c3e4
> was introduced in version 2.
>
> The hwdata dependency added in v2 might not be needed, I guess it
> should be runtime dependency for libfwupdplugin not build time.
>
> > but now it should have. Then meson.bbclass is setting datadir
> > so I'm wondering if there is a bug in meson.bbclass or in these fwupd
> > side scripts that they only check the host paths on not the
> > recipe sysroot ones? Is fwupd not using the correct variables?
>
> Yes it checks the paths on host not in RSS as said in commit message.
>
> > Should the fwupd meson config actually check if the file is in
> > join_paths(sys_root, datadir, 'hwdata')?
>
> Something like this might work, but not sure where you expect sys_root
> to be defined. I see it added as a property by meson.bbclass, but
> doing just this causes:
> ERROR: Unknown variable "sys_root".

And if you change the meson.build like this then you would need to set
FWUPD_DATADIR_VENDOR_IDS without the sys_root prefix, because in
runtime it will be just ${datadir}/hwdata again.

