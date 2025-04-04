Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD34C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 09:05:02 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.6671.1743757499368346329
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 02:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/4YseYc;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-60288fd4169so939236eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743757498; x=1744362298; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2LGiMho9c+LNUOMyvoNxckGKkEjTbp371uvN8xiG+8=;
        b=H/4YseYcKC+zJm3D3ORShEi1ai/Tvx41HpcjWx7TwztGi3HwxLLh9XtX6S4vHWYOUz
         4gcFzmMZTKrHA0z8Yi3ughIcaLDwG40K7FFnSwB6067lbZaIfoX9W84sGJUXmmr6Zarc
         txySDNsjKl7ILkMTvJZcQIe774Eis/Mf81sQlXaa6+TZjWpiRfBbpczVRWomGnidi7WD
         8awdRpJ8C9sYvlDheNlOB43NFMXRCn8o0b16E0JOCwYOn6B+Xd5R6QGp3YTRyJCA/Lf0
         kvsRwkuFiivChua97/cXaBxROMFze73jy5rppt8W3dcDsjqd+R6Iw43hC02oBqF2bABf
         uFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757498; x=1744362298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2LGiMho9c+LNUOMyvoNxckGKkEjTbp371uvN8xiG+8=;
        b=EuCrghPVDqUEtZ/6rQOmTY/V7/gBy1Z8/1yIT7jauXgsY8uS31U7wVck3mhYgKoCYK
         RzifMyUet+ButJqWZxitwIcr7WkqEAlkEiZtn/M8+JHkKHf5aD9m44QESzCY2KZL/vuT
         hjB2Z6AUS4sO6A99gy5gHTRfdjb47EjEt+frAE7hRRVqGXLixwwPDMsrOlZ/3TXoaVFA
         T4ktNQ6fZBBPXheYS9Ud6KyHT632lyvSnnY3COvzj+sbKIDz0+uJp0l0jWcVWbuWVi7z
         28qeyeApKPRgCvaYDhppCdWswLZN3yHNGSKVhQBNhdYcZvf4OQgJ3wcmOaFtc8nFzTrv
         ayRQ==
X-Gm-Message-State: AOJu0Yxmca2CjBbZCz0maBzItqX26pwYdxo8LrBaJ5kNDokPTWX4yBWZ
	GC9MeR7G0MU2E88AgQr0GpXlCcKqJBfelZ2COA3GGYfdKqnGwqZA3a/oJ7BuiBBcm9Sn6sKJh58
	l0vfvLcuJO8QYxm/T5YbomLBkAN4=
X-Gm-Gg: ASbGnctwoe5D5e9PKrAUA4QXIMjDOUjlvjr5vV0/uRLf/mDmy/brPSm3xc8u2Zv5x/R
	UA7IZQSb07urGwv40xbiPA9JnJSRDbdVh/A7mBQNPMKtexHo4/qNjuRT9dRKpBKeFqsfp+bBVWS
	rgiN3/qT1C9ZxcE0Tvq6xTvvsZ
X-Google-Smtp-Source: AGHT+IEcrE1oWx3OPW0Be2OAiF8SxNkhRDV4gIfD8s7aMb7aTgGmVNWQVzKj1cn9VK4xvGOZRYEEl9aw6Eb3HhXV3XM=
X-Received: by 2002:a05:6808:201c:b0:3f8:b73b:682d with SMTP id
 5614622812f47-40045648e7dmr1562574b6e.32.1743757498536; Fri, 04 Apr 2025
 02:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402112901.3804235-1-niko.mauno@vaisala.com>
 <20250402112901.3804235-2-niko.mauno@vaisala.com> <f6b6ca1f-8792-4f99-84cf-bf6f82631576@gmail.com>
 <64506919-9b47-4e4b-84bb-e0877a5e9938@vaisala.com>
In-Reply-To: <64506919-9b47-4e4b-84bb-e0877a5e9938@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Apr 2025 02:04:32 -0700
X-Gm-Features: AQ5f1JoILSMHF6kwiExU6pHcoSUYuOfhD9EdAWADZo-LJKjoSbHZOA0CF2mTNU0
Message-ID: <CAMKF1so2jcMx7=ASs4css6dr-U=FbYf2PxjDMRYtq_G0By4=Fw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] sdbus-c++: Support using alternative
 runtime D-Bus
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 09:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116571

On Fri, Apr 4, 2025 at 1:21=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com> =
wrote:
>
> On 4/2/25 17:27, Khem Raj wrote:
> > On 4/2/25 4:29 AM, Niko Mauno via lists.openembedded.org wrote:
> >> In order to facilitate using e.g. dbus-broker as runtime D-Bus
> >> implementation, change the Freedesktop.org specific D-Bus runtime
> >> dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
> >> variable.
> >>
> >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> >> ---
> >>   meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-
> >> oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
> >> index 2b6bb1011a..a3e7c9ab54 100644
> >> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
> >> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
> >> @@ -46,6 +46,6 @@ do_install_ptest() {
> >>   FILES:${PN}-ptest =3D+ "${sysconfdir}/dbus-1/system.d/"
> >>   FILES:${PN}-dev +=3D "${bindir}/sdbus-c++-xml2cpp"
> >> -RDEPENDS:${PN}-ptest +=3D "dbus"
> >> +RDEPENDS:${PN}-ptest +=3D "${VIRTUAL-RUNTIME_dbus}"
> >>   # It adds -isystem which is spurious, no idea where it gets it from
> >>   CCACHE_DISABLE =3D "1"
> >>
> >
> > Thanks for these patches, as I understand they depend upon the changes
> > in flight for oe-core, so do me favor, consolidate all the patches
> > needed in meta-openembedded layer into a single series and send it
> > together and perhaps send a reminder once it gets merged into oe-core.
> >
>
> Hi Khem,
>
> the last remaining patch related to implementation of the new
> VIRTUAL-RUNTIME_dbus was integrated to poky master yesterday.
>
> The associated commits now in poky master branch are:
> https://web.git.yoctoproject.org/poky/commit/?id=3D0ecae4c6333de30802cc46=
8d699289ddc65e7aad
> ("default-providers: Add VIRTUAL-RUNTIME_dbus variable")
> https://web.git.yoctoproject.org/poky/commit/?id=3Da39bb35ddf484fd8160dc2=
eb1fabb6a92b07ecf0
> ("dbus: Allow using dbus-lib with alternative D-Bus")
> https://web.git.yoctoproject.org/poky/commit/?id=3Dc4b1070d55fa69821c5a27=
4dbbcca9e23e016aa8
> ("systemd: Support using alternative runtime D-Bus")
> https://web.git.yoctoproject.org/poky/commit/?id=3D84bf6e7e430d1c61ff400b=
817530fd54b410a85c
> ("glib: Support using alternative runtime D-Bus")
> https://web.git.yoctoproject.org/poky/commit/?id=3D9286f1e4aaa4520bc75ea7=
764c5cbbbeb6a67d4b
> ("recipes-connectivity: Drop dbus from RDEPENDS:${PN}")
> https://web.git.yoctoproject.org/poky/commit/?id=3D340d9e28e1df2e0d4a8c35=
1c8742064268f8ad87
> ("dbus-glib: Revise RDEPENDS:${PN}-tests assignment")
> https://web.git.yoctoproject.org/poky/commit/?id=3D34b7b0f86de95451f00ef1=
17459ec403770e3cad
> ("packagegroup-core-x11: Drop dbus-x11 in REDEPENDS:${PN}-utils")
> https://web.git.yoctoproject.org/poky/commit/?id=3D5dfca64b78375de279b6ce=
7c9bffcaa35db5dc17
> ("dbus-glib: depend on dbus, not dbus-x11")
>
> As you requested, I have now submitted the related meta-oe changes in a
> single v2 series:
> https://patchwork.yoctoproject.org/project/oe/list/?series=3D33314

Thank you.

>
> Please note that there are also two individual commits to different
> meta-openembedded sublayers which I submitted on 2nd April and which are
> also needed,
> one is for meta-networking:
> https://patchwork.yoctoproject.org/project/oe/patch/20250402075935.216590=
2-1-niko.mauno@vaisala.com/
> and one for meta-xfce:
> https://patchwork.yoctoproject.org/project/oe/patch/20250402075322.216218=
9-1-niko.mauno@vaisala.com/
>

Include every one needed in meta-openembedded in the pull. I will add
it after we have settled down a bit on
walnascar cur off.

> BR, Niko
>
>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#116523): https://lists.openembedded.org/g/
> >> openembedded-devel/message/116523
> >> Mute This Topic: https://lists.openembedded.org/mt/112044576/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> >> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

