Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9690BEB64DC
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 09:56:15 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.6617.1687254968198996623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 02:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=egegIqRx;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-77ac2eb07a3so165735239f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687254967; x=1689846967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6/q3aw0trjmULyvTb+n0qSyxurTk4tCcVRNrG4Bc3Y=;
        b=egegIqRxe6cIQ/EaLz8Oy6eWMPfXxlYZmGlbbkroeWSjuJ6hktuwy7e8n6UDWdTxuf
         5wef1yI/SOb6tbqUBn23nJxgEuK+at74F2Vyt1wRQ3otVlMIGH8rtuc/OiQU9PF3hTsy
         KQQpkWQEbpYy5PDOpJ+zhRFLaJN5uzTPi3g0xLiEAK+cFXfRrMTeA47sFkHQtvrcTVmf
         NoneM41N+nXlSbEDcrJH4ExAlo9OhscIOKKJ6i/zBBfkYW2ANBsgCsDPhosBD2L4JDBP
         3LKQK5p5n1+z+k/1p/X44V6ECAZZguR8DO4frDK3XbvtVyGP7kdLNPueqZVEgaZipZ0j
         53Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687254967; x=1689846967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6/q3aw0trjmULyvTb+n0qSyxurTk4tCcVRNrG4Bc3Y=;
        b=LjNmnESD5HQkEHEVUJTep64XJktL8xUweEbK8rn+uQdeqPetH51hW7KZKbO41UTxge
         R6NxkPJSiCAhhLb7eW8mtKW7GMriq4deBio8hfLTTx01zOxXNDl6PELH+kWTGgyABkoA
         MtgTGQdSnHx9ROIXa4yxYG/z+bjDiZjaJM4xz/vm8WhKwXI0M/YHm7wfbRsZ9dU2Opq6
         EU0TmI+p5YA3fHnpG21EanJcWbx7MPQ8GsUXi55dK9dkGt1ogEGSzhcbjSapZXsVijGY
         ypyQgRRymoEsfAma2MPQ+054vLdVjy9YCLS2zDihENM0IFYf9mK20VguoXFuLm3oDVMO
         YL7Q==
X-Gm-Message-State: AC+VfDxMVpgIlRQYhaNqcHi6Z4f8pyFOU8RUEHC0JlmC2UNiy5cM0rkk
	9jHiQQdE3VdVlC1eMEdlrePS0/yIJjehi4p4PbwByWiOPxA=
X-Google-Smtp-Source: ACHHUZ6gUUqBx91LgebfGF+0VJUGLLMwopHKbDyl4OyUaI8DxaEaIk78l+UmfKRQcqW8ignonKDUw4Ta6lSE0teItmg=
X-Received: by 2002:a6b:6107:0:b0:77e:52:a52a with SMTP id v7-20020a6b6107000000b0077e0052a52amr8681479iob.17.1687254967299;
 Tue, 20 Jun 2023 02:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com> <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
In-Reply-To: <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Jun 2023 10:55:55 +0100
Message-ID: <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 09:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103451

On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmail=
.com> wrote:
>
> I am trying to add a v3.x mbedtls recipe to master branch, and without

Sorry, was reading the thread out of order and missed that you were
trying to add an Mbed TLS 3 recipe!

> this patch, mdns does not build. I could not find an obvious way to
> submit upstream patches to mdns from a quick search, otherwise I would
> gladly do it.
>

Several folk have tried sending them to dts@apple.com (seemingly
without success), there's also a couple of attempted PRs on github
(again seemingly going nowhere). Winding back about 20 years, I tried
to get a bunch of portability fixes into the Quicktime Streaming
Server without success - the model appears to very much be open
source, not open contribution.

> While I am with you on trying to reduce technical debt within yocto
> layers, this one is very small and rather harmless, so I hope we can
> make a sacrifice for the greater good. :)
>

I'm guessing we'll need to scope an Mbed TLS 3 recipe as being
explicitly mbedtls3_...? So sticking with 2.x doesn't feel like a
terrible option, but I agree its not ideal.

My concern isn't really with the one liner now, its the how hard does
it become to do the upgrades down the road - if we suddenly can't
upgrade because upstream's stuck on 2.x and there's something
incompatible with 3.x what do we do?

> Cheers,
> Beni
>
>
> On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail=
.com> wrote:
> >
> > Keeping up with Apple given they take nothing is frankly a right pain, =
adding things which are nice to have rather than just broken seems like we'=
re just adding to the problem. Last time I resynchronized this it took me d=
ays, unless there's a really good reason to do this, or there's a way to ge=
t it upstreamed I'd rather we didn't.
> >
> >
> > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gmail.com> wr=
ote:
> >>
> >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> >> ---
> >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++++++++++++++++=
+
> >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> >>  2 files changed, 34 insertions(+)
> >>  create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0009-r=
emove-unneeded-headers.patch
> >>
> >> diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-u=
nneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-re=
move-unneeded-headers.patch
> >> new file mode 100644
> >> index 000000000..74d387368
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded=
-headers.patch
> >> @@ -0,0 +1,33 @@
> >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00 200=
1
> >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> >> +Subject: [PATCH] remove unneeded headers
> >> +
> >> +From a quick look, these seem to not be needed and having them
> >> +breaks the build with mbedtls 3.x. Without them it builds fine
> >> +on both 2.x and 3.x versions.
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> >> +---
> >> + mDNSPosix/mbedtls.c | 2 --
> >> + 1 file changed, 2 deletions(-)
> >> +
> >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> >> +index a73681b..ab8f8c7 100644
> >> +--- a/mDNSPosix/mbedtls.c
> >> ++++ b/mDNSPosix/mbedtls.c
> >> +@@ -38,10 +38,8 @@
> >> + #include <mbedtls/sha256.h>
> >> + #include <mbedtls/base64.h>
> >> +
> >> +-#include <mbedtls/certs.h>
> >> + #include <mbedtls/x509.h>
> >> + #include <mbedtls/ssl.h>
> >> +-#include <mbedtls/config.h>
> >> +
> >> + // Posix TLS server context
> >> + struct TLSContext_struct {
> >> +--
> >> +2.34.1
> >> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb=
 b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> >> index 612d343c8..46f1b70cb 100644
> >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-distribution=
s/mDNSResponder;protocol=3Dhttps
> >>             file://0006-Handle-noisy-netlink-sockets.patch \
> >>             file://0007-Mark-deleted-interfaces-as-being-changed.patch=
 \
> >>             file://0008-Handle-errors-from-socket-calls.patch \
> >> +           file://0009-remove-unneeded-headers.patch \
> >>             file://mdns.service \
> >>             "
> >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> >> --
> >> 2.25.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#103440): https://lists.openembedded.org/g/openembe=
dded-devel/message/103440
> >> Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [alex.kiernan@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>



--=20
Alex Kiernan

