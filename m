Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5BFC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 07:11:11 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.2757.1744182669897838346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 00:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5UXdzB2;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549b116321aso7318715e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744182668; x=1744787468; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBPeAitymfUxRUaBVb5NPNfXKQ5xOq73yNrvm3Xj+zY=;
        b=F5UXdzB2GASGrxs0T9qzmLYmXjK2KoYDroqkaDL6bYdfOT6E2HCDMQUVDgX4QcY4dX
         WCczm+hgmRNTNjtNH7/F6EG+Sd/TRp4guhCdAmP5w/ZQfWdHMJfWVxnHww3smZK37xbG
         nPmp49LKKJ7NHCHr+WP86yoeOYiN2gThGsHDoJ3NVSuGZl90Wcwz0cPxOTev5Z2MJg/F
         Bc9+xWtsiqKcpoPOGDPpW1hrjd6bL1jAfa4mtrIQIyadVmk1zhZNEaMfIzUXCxX+QVXe
         13viesOweWCtTHgT/Nv3Dux8olzLxZ4PbnK1Vvnzi+UA412vXpEuOmB+KIvpon9LWNsI
         x2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182668; x=1744787468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBPeAitymfUxRUaBVb5NPNfXKQ5xOq73yNrvm3Xj+zY=;
        b=HnQkMui45RJPurUocae9bbQnDTNC/iMuatcRTq3ciw2KPbS0a8BsB3Wq34PmtQy9gM
         ILUaLuRIrCakp/e7ripam8GBd5hJug+d8MisV+jUw00PxC8yVlZlmptn2WGUvQJW5eZo
         IUDno0w2U7PRRcq8cvyCIL6bGbrJw9wZ5xYxhQpcAcFXOsBPpb5VjBV5CgTSd2ZgwK5z
         slH2b0GGdSvwQrM0ydPGkPO/A7jgzRwLobKmKA4iZGGI/2eLML9eZb3RSBBEYwEb4X33
         sPXzbLiGEpFzGyez1UxtbZOXBCRldud0TBxpcBA3J+0E+xXrMoULm2uuBE4I2XWTixMk
         8Lsw==
X-Forwarded-Encrypted: i=1; AJvYcCUfffHs/B33L/Kbck3iO9h4YDpKzK4ND4jKexWoaacUuEXXzePrZ9pklBdJT5QmJqzPSZxZQJYhnZY7MTYgrWB2fhc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxboQuCiWXSnxnb8thSHA7jUmhTk5zXVWkYyuaiBRWndptlIGUR
	P/wYboA6XWndovs3WUSsNRIP0ZLqAXGlDnhHJNuaFC8fLxAdadbMSfGeaKUcSZN9j27mpeKyTiu
	UHbgzdJm2mAKVc+W+Ptd3MP9QHPQ=
X-Gm-Gg: ASbGncs7MSD8UYKiNLlvxQdMboe7Fx0l1X+hw7QLfW789/PYBe68fuGErZUCxrYL1Bm
	on2OUvnLJNhQxrfDBYJmaoc5nct9sKCoEKKLJmflAc+36n7/9rALN72sxfxMJDWbY4R03wKT6pK
	AjyQ+dA+K8+s1Mth6nm4b8b5T/pFZf+DMduVg=
X-Google-Smtp-Source: AGHT+IGw8C7Wi2PpZXFpGgW2PKGX96AICwGY7wBsVMmsBVSOo3AfPlkhhvmNyV8qesJfAQHCFqPD4Xx9ppf8Fj4odrI=
X-Received: by 2002:a05:6512:1392:b0:545:2871:7cd5 with SMTP id
 2adb3069b0e04-54c444e0f3emr396911e87.15.1744182667887; Wed, 09 Apr 2025
 00:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250401221249.2506503-1-yoann.congal@smile.fr>
 <CA+chaQc1_KMuC7LXyZymUEmPOTYMmOK67XqVfY7uPCFCmj8rww@mail.gmail.com>
 <CAMSfU+6Egmdumnc5JxOoRDR_tM2nMphkbG8gNBqarhHZSG3k9g@mail.gmail.com>
 <CAMKF1soyfmqbvo918uaTaAqPaMtv=EFtZXgXkiyRc4vAyTdQbg@mail.gmail.com> <CAMSfU+5LAe4EXgjrBj8+UYgY-C9+kqXBSUvuXEN+Zqhq4=nrSg@mail.gmail.com>
In-Reply-To: <CAMSfU+5LAe4EXgjrBj8+UYgY-C9+kqXBSUvuXEN+Zqhq4=nrSg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Apr 2025 09:10:55 +0200
X-Gm-Features: ATxdqUG3xhCdWI2-UMVHexYYMTJcz1ubIQo1kLmb_EGdRow-pT4-Q99aqp-BzMs
Message-ID: <CA+chaQdfebEjz7UepPr33ZOUcj7D7VBTjxQ1c3v-_oEUOAQ_hQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmatrix: Fix host-based non-reproducibility
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 07:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116726

On Wed, Apr 9, 2025 at 8:56=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> Le mer. 9 avr. 2025 =C3=A0 03:42, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :
> >
> > On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Yoann Congal via lists.openembed=
ded.org
> > <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
> > >
> > > Le mar. 8 avr. 2025 =C3=A0 18:19, Martin Jansa <martin.jansa@gmail.co=
m> a =C3=A9crit :
> > > >
> > > > This seems to cause:
> > > >
> > > > ERROR: QA Issue: lib32-cmatrix: Files/directories were installed bu=
t
> > > > not shipped in any package:
> > > >   /usr/lib
> > > >   /usr/lib/X11
> > > >   /usr/lib/X11/fonts
> > > >   /usr/lib/X11/fonts/misc
> > > >   /usr/lib/X11/fonts/misc/mtx.pcf
> > > > Please set FILES such that these items are packaged. Alternatively =
if
> > > > they are unneeded, avoid installing them or delete them within
> > > > do_install.
> > > > lib32-cmatrix: 5 installed and not shipped files. [installed-vs-shi=
pped]
> >
> > These files look arch independent, We can think of putting them into
> > separate output packages and install them into ${datadir} and mark them=
 allarch
> > ideally. But I think that might require spinning it into two recipes. O=
therwise
> > using nonarch_libdir during install should work I guess.
>
> Those files are fonts for X and the console. I've looked at other
> recipes writing such fonts and they seem to use subdirs of $libdir.
> I've tried to find an automated way for cmatrix to find the correct
> path to install its fonts but I did not find any obvious.
>
> I like the nonarch_libdir idea: My plan:
> * change the patch to set the path to a marker @BASE_PATH@ or something
> * in do_configure:prepend(), sed the correct path (nonarch_libdir) into t=
he file
> * Update FILES:${PN} to include the font files
>
> Sounds good?

Sounds good to me.

FWIW: I don't use cmatrix it was just a new build failure shown in
world builds now when the files got installed (before they probably
weren't because there was no /usr/lib/X11 directory in our docker
images used for OE builds).

looking at
meta-openembedded $ git grep fonts | grep FILES

I guess using ${datadir}/fonts might be even easier option with
-set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
+set(X_FONTS_DIRS "share/fonts/misc")
in your .patch as datadir will be the same with and without multilib.

Cheers,

