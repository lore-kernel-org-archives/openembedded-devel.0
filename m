Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2852C83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 15:12:52 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.80472.1752505962598403932
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 08:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9dXpmLT;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32f3ef6178bso37995201fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 08:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752505961; x=1753110761; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIfmDlgE5IGClmz2inyFz8xwYIFHLj0clmYZtRlGSzE=;
        b=C9dXpmLTFU8yseTjNcEFNByvMQL5/I6MA6r+oCME2rI50tdRewVvQaMLD3UPZcLbZh
         qWAYKH2W/SAGxAQYRyJIQ6cSq6xmmItQSO2lTGrPzfvb23HSOACLWY/s/L1CNOB0csjc
         90Xk3dQmv9T3aIDjjiYbNJwnPPCXOxiuSYsA6qc9KFYsBn/SUQeC7HZgd1LdcGxlbn0Y
         mwGFPZcio3aPdGUhM7r1reMrql+EmU+Z39uBfZCBN5hZgLODH9TiTROrt/JuYJvh8rk5
         wKr9ikRjkmpkvwoZFYHr0J511b1x9SfkoWNDvk31BaKvOCoFwC/bZf/CnZBBC+gnxARh
         r5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505961; x=1753110761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIfmDlgE5IGClmz2inyFz8xwYIFHLj0clmYZtRlGSzE=;
        b=ccNILY4Xjwq/wjFNAbE7xMBYH6VXsW3A0JvEwpHep0qgfKWrZvksn7eN+G1fA7D9Vx
         EdmuoGQSA53KiycjKiJrr3/I6XV/ko/HsP0kBsk1nXyVMrs3EODcn/j1XfuU7ReXmr8A
         Z4Y8YzVmMrkkUWomFsWw1vM+tzMtaRnwJ/ejPbbcRD7G1BIUgoB+TIv3HfMAbttjfhcs
         Wys8ND2z8QAq1JxAMYYKllfWrennwX5HBc6OoV1lwwMRuO4UubA6v2igdpK+yvIXllgi
         9UtaG3a5h5P1/WVTAAosvpoGU/uE4CkQnXNHwLUdbCy4/PRbLgJOtA7X7llExn6LBEmS
         1BMA==
X-Gm-Message-State: AOJu0YzRle456/FE/f9O70PMTT8gfi1LYWbYVsRJu00v0mV8NNnp2WGU
	t2RYr6vYaBqR+SeGt52I6Nh/sGjCiI9uNYObnficNWPMgVFOijcdux0Y+mS6xb9MYoz9Dm2tmTp
	YwkvoNaMYAgtGc/UmsrJ28bIQEI7JeqY=
X-Gm-Gg: ASbGnctK8nnhg5rgrSf+sHDZQnGoz2kgaKlwGNyKthAnBH79595GgzGLdlK9wXoc6JV
	YyNgGn1INITVBLzqysrrKc9ffNd2soNlL4BgbJ6lfg1b5CFOMPTu5+di0mpZ73rfs1KJJjhCrhB
	KbcqIGmeW7XaLEiAsJJ4yA3ae/nvi7t8sWESuyYFrdjdLmPYc6p1zqqe9I9TTqtPhZjFBUfejYw
	XA/1JM1wA==
X-Google-Smtp-Source: AGHT+IHY/eNUU2DHwpZ/FPioLKWkJkZENb4kH/7N74RxsX9LjlB2LQUB/7Kt1f4BT11k4+QYv4rokJwosRnHHIl0tAc=
X-Received: by 2002:a2e:a781:0:b0:32b:533a:f4d6 with SMTP id
 38308e7fff4ca-330536292f7mr40957481fa.34.1752505960338; Mon, 14 Jul 2025
 08:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250714134657.1620685-1-martin.jansa@gmail.com>
 <aHULieE55wXsyrSf@nuoska> <CA+chaQc7a9wXuCnF0mrdFbkE_tY+M+1Z44D2qNJzy4VN990ViA@mail.gmail.com>
 <aHUUxW_rau2wEQFN@nuoska>
In-Reply-To: <aHUUxW_rau2wEQFN@nuoska>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Jul 2025 17:12:27 +0200
X-Gm-Features: Ac12FXx1YQW9srA-9uLB6gAGSLeNRDDsNuaUMxV5zkmidFRye5wq9rSN7jZXB-M
Message-ID: <CA+chaQe+bS4PpQcEbX+-kWBviL4tk7_FYKdKfjLmd+oGCYA53A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] fwupd: set vendor_ids_dir
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 15:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118541

On Mon, Jul 14, 2025 at 4:31=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Mon, Jul 14, 2025 at 04:00:03PM +0200, Martin Jansa wrote:
> > On Mon, Jul 14, 2025 at 3:52=E2=80=AFPM Mikko Rapeli <mikko.rapeli@lina=
ro.org> wrote:
> > > On Mon, Jul 14, 2025 at 03:46:57PM +0200, martin.jansa@gmail.com wrot=
e:
> > > > From: Martin Jansa <martin.jansa@gmail.com>
> > > >
> > > > * it's in RSS as fwupd/2.0.12/recipe-sysroot/usr/share/hwdata/usb.i=
ds but
> > > >   meson is searching the paths on host with:
> > > >
> > > >   # look for usb.ids in both of the Debian and Fedora locations,
> > > >   # and fall back to the system datadir in case we're building in a=
 venv or prefix
> > > >   vendor_ids_dir =3D get_option('vendor_ids_dir')
> > > >   if vendor_ids_dir =3D=3D ''
> > > >     vendor_ids_dir =3D join_paths(datadir, 'misc')
> > > >     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
> > > >       vendor_ids_dir =3D join_paths(datadir, 'hwdata')
> > >
> > > Isn't this the same as ${datadir}/hwdata ?
> >
> > It is the same value, but on my host, I don't have
> > /usr/share/hwdata/usb.ids so meson doesn't detect any existing
> > vendor_ids_dir value and fails.
> >
> > With this change it accepts passed vendor_ids_dir value without
> > testing it's existence (neither on host nor in RSS).
>
> Previous version of fwupd update patches did not include "hwdata"
> as build dependency so recipe sysroot did not have usb.ids file

and previous version wasn't failing like this, it started to fail only
after the upgrade as
https://github.com/fwupd/fwupd/commit/61a863de8dd429be8c393ec267d63db78de71=
b76#diff-30d8f6be6320feeacf686be94f48c70869b52630e01ea625f0f15adc0d57c3e4
was introduced in version 2.

The hwdata dependency added in v2 might not be needed, I guess it
should be runtime dependency for libfwupdplugin not build time.

> but now it should have. Then meson.bbclass is setting datadir
> so I'm wondering if there is a bug in meson.bbclass or in these fwupd
> side scripts that they only check the host paths on not the
> recipe sysroot ones? Is fwupd not using the correct variables?

Yes it checks the paths on host not in RSS as said in commit message.

> Should the fwupd meson config actually check if the file is in
> join_paths(sys_root, datadir, 'hwdata')?

Something like this might work, but not sure where you expect sys_root
to be defined. I see it added as a property by meson.bbclass, but
doing just this causes:
ERROR: Unknown variable "sys_root".

