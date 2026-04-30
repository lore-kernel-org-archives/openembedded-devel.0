Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B136CD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 07:37:48 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14995.1777534658319724564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 00:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TnkIqBAm;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38c620f1699so4808981fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 00:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777534656; cv=none;
        d=google.com; s=arc-20240605;
        b=MBiC8ewT/PqN2Qxh2otD1a2IE7duhXmn00LMwC+XqiTF8HNh/OTO6/gbT+wNzXNfbU
         p/hetk5ECxCcYAPDHFlA03lSW6tLZGiCluP9qKPmUaEWMd9ndQAPG5QXyyeBMi17m1hh
         CEv1Bi7OQYQQh8jlL1OqFRPBgGLGLJC6hbtMwiMNgDogfBcNQbUbNuF7AyiQNlDAcGe8
         +C4WhLW3fW6jzlcOAJlwOa3eHFmINI3b7tneso7mIzvxa7/73HTgBpX76i2KqDZwRLOv
         WuxgGGUebttTN3SWVKg5mHVkze2RTJNeO8l3dOj6zngdT1UxxRH0LJsdK4IL9qfnU6Zu
         a9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qzJ2g2ftq/dxsnHK7wc0HQyDiesLr4Bf5CUG028bkc=;
        fh=BLs6GIu5u21QUVnjtFy9czncamd7towvJBpqhQ6BmG0=;
        b=jrll4hSoBY6KiZ2JU61+3fQQpzx4JwADKebuheKF/JVI4Q6QNmRVo65QstWHW97lpb
         SPbaV6gfSrlaSsBQr51j4cTf3Ohxv+65AsTZki1tlkK1e4aOumjlZwtuIcvxxQOcQMAA
         D4y+IVHqlqlawAt7M4fJVPMpqUMVnBXIw604rt/la1Tnw1z/sPUVqRasDh73b89Dd4c4
         3lLW0HUVuBQpEcqHSwROx9bh4HbK89fRw6Zd5thvXN1QlMzpn7tNMnXcWheowE+ZYvFy
         w12qUWj7lR5YEvSvGzUplVp/nHobhU/+1muLTnW8oj0FIM130fOTpmMDYIl045xEMJLv
         qIvQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777534656; x=1778139456; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qzJ2g2ftq/dxsnHK7wc0HQyDiesLr4Bf5CUG028bkc=;
        b=TnkIqBAmxCgX6FT2N8iQxd/lHXXVwDlwr4E6tZ1u0Ux+2GYM5b2sI3h8WVjgYShves
         a3GlAJSWpve3ppGPbUd+njH2CRAjpbPS7gbbZl/Ed+mijoVa3LtRqI27j2YJ8M+Cqr/i
         sbKbmqQYBVzkM71ywldTqtjeEEXaO5zYMIptC1z3N3l0XMjo6x+EV7kKz9hv1YiTmggk
         URsCHxnIzp7uC63doywgowoIMqcAelvkc9kL+M9R25eK0RUJC4rOjzCpoQ7Kp7Bf7llp
         asCKsxvjrnCpxHQM5FNkTCv00EDxrP4UTCw0b+IBj3vgH7xXGzeV4dNKMcWS0Ag66UOV
         yJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534656; x=1778139456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6qzJ2g2ftq/dxsnHK7wc0HQyDiesLr4Bf5CUG028bkc=;
        b=k7enCNnciqeeuoOCQ85M9GBWllnFirp5nDQalP0yma2MoAuHgJBBZkMEYg3dWnM9kR
         ViNEqfEGjjdPS91UeG3frJHzeiGtOEaYoN+CZ66UalIGR9gpb5nzZJ/XS4WyoL22ohbR
         O55lZeKM0yI9GujfOAbNpL+Kopr41qB/xntv+/O2vHR6RZaXymbN7IfIqsZBQUKlpnMY
         phVouH7GzksgF42wlLvjNbL8FXet2r5/wSq/UUoFl0NbWS2GsNyGQZeepe96J3azCWlZ
         SmkQR7mzSkmkIg6+WIflNQpDX3AQImS8y7Wv7WH1X367+XA5IE2Gad6+5Vxf4L8Us4KF
         g/Jw==
X-Forwarded-Encrypted: i=1; AFNElJ+MK2mGlXFiBks7TTq/1QymBkIoTNujnSnDSleR448frZ6aJn7Iq7Gd7NLOcp6JQU0v6DDl0tpzBcHS4kfXFL/njac=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxeZZ0Yy7z+nIb0GZuM+M14N2sLZb4hUyqUVmaZhvouF+rPc40K
	SZKhPRLAaJXyOn4l3SHBwH2U5UsRAiRWRTzv0wIRT7HWSXnaGf+r6X1fbhM8XLOR964xvcL+RJ3
	I9skpEsOFoq9MABV+VtLxv1xIOQ0XyIQ=
X-Gm-Gg: AeBDieum3PbdAMGoknABtcaf2menWlbYlx89MxZWrnvkYrRUwCiaA5hn8h7HiOqJ4EC
	AYPBc6yUbbog8s1RskbPaLOg9CfzFk+r9R9h2vvLoP9GJ//XXby9pW+09G0SiR6DvcmTD109R3Y
	zALu3IPBUEu3YHWeDmFQ0U4Db8RKCZkwJ64GXroF+HlRoISE3AR/InH1caKVDQ08LHF0r5J2gOw
	7HzbGEMbSG2HcjRvOuqKJw+qxcCfkBN/sA8YULWQMpzIPT9Kdq3rJqoDEVmqSJ9S9ZIE5NJCQRY
	MPsCF+Nyeb7j++pvJFfVK/4KwP8=
X-Received: by 2002:a05:651c:41d5:b0:38e:27f6:41e2 with SMTP id
 38308e7fff4ca-3934e1ff1e6mr7161051fa.18.1777534656168; Thu, 30 Apr 2026
 00:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260424064603.728430-1-skandigraun@gmail.com>
 <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com>
 <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
 <18A9E5089EA766DA.2188217@lists.openembedded.org> <CAO5Uq5TarogKhyRTSZeYaZmSPPhJb0k2bKCJhSG3hev-Wf9m-g@mail.gmail.com>
 <7380b427-4e88-4eaa-906d-6274080ff715@gmail.com> <18AA71BEBB6753BD.2323083@lists.openembedded.org>
In-Reply-To: <18AA71BEBB6753BD.2323083@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 30 Apr 2026 08:37:24 +0100
X-Gm-Features: AVHnY4Kz_lmvenaApHGnZsN4Dhh2PLb4npf6bywkKAW60A5OuOhjbaeLyuwlpks
Message-ID: <CAO5Uq5Q_L=V_G9GPzec-9Nu1iD0zgRAGCxg8gO9V0qXfzkbqow@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: alex.kiernan@gmail.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, raj.khem@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 07:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126669

On Tue, Apr 28, 2026 at 7:34=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, Apr 27, 2026 at 3:08=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
> >
> > On 4/27/26 11:09, Alex Kiernan wrote:
> > > On Sun, Apr 26, 2026 at 12:35=E2=80=AFPM Alex Kiernan via
> > > lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.o=
rg>
> > > wrote:
> > >>
> > >> Just dropping mbedtls/ecp.h looks like it might be sufficient for md=
ns
> > >> (untested because of the mbedtls build failure around qemuwrapper):
> > >>
> > >> diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > >> index 6726ef9b9145..c2e47ba232a5 100644
> > >> --- a/mDNSPosix/mbedtls.c
> > >> +++ b/mDNSPosix/mbedtls.c
> > >> @@ -31,7 +31,6 @@
> > >>
> > >>  #include <mbedtls/error.h>
> > >>  #include <mbedtls/pk.h>
> > >> -#include <mbedtls/ecp.h>
> > >>  #include <mbedtls/ecdsa.h>
> > >>  #include <mbedtls/entropy.h>
> > >>  #include <mbedtls/ctr_drbg.h>
> > >>
> > >
> > > Scratch that... the changes needed are much more than simple header r=
emoval.
> > >
> >
> >
> > Good to know, thanks - but I think this also means that it won't get
> > into Wrynose unfortunately. Doing big changes on multiple recipes is
> > just too unstable for a stable branch, I guess.
> >
>
> Given how much of the legacy API they've removed/the transition to
> PSA, I wonder if we're at the point of needing mbedtls3 as a separate
> recipe - for mDNSResponder we're at Apple's mercy to upgrade it to
> something that works with mbedtls4, or we'll just carry patches
> forever.

Actually it looks like the changes might be trivial... will wait for
the mbedtls4 recipe to land so I can check.

--=20
Alex Kiernan

