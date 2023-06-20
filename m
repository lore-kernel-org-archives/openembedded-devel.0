Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695BFEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 12:42:26 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.9302.1687264945327040388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 05:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hW3rdXfS;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-77a62a84855so171508739f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687264944; x=1689856944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA3mjpbtGrPtr6HqEGD/uw+H+4Tt3EJuYJwIOgKbnxQ=;
        b=hW3rdXfSq76X47vJ/ijXY6v9/nKTlJIcUK8zyRgDm19TELPLasNwmEMLbgCXgiaSAt
         CKA42SD7lzDzhr1BOmtXqhI2orn1kde2DyoCjGyCxzeKW+NJdEfr9uMemYsxNGFUaQW8
         z2qVXCpWpemtiJoq7B1KhY32LfNXEjXLe7+FpNSYgVdOBWZx7XsCvaPHcBPFgtUT0eXj
         i1q8MIPdJTxngeIBWoRco1br2UMatUdaRDvk9FmoAP126DW3tSK3WVWLTJNHhJYSTdSh
         ek2LWSuD/aQwKYJD30ik6mhpuMhMsviOlZ+UUObZNznlnC6aE+zjK2BzfdC6AvDbsBC3
         1xNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687264944; x=1689856944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bA3mjpbtGrPtr6HqEGD/uw+H+4Tt3EJuYJwIOgKbnxQ=;
        b=HVhwO5Ua1W09qWkxO2udA9su1X0biT6wywJc3pOv72cL2SlpEpC683fobuNcmZI3N+
         U4ecxaTmf/dgAbilTeWzaqh/jm4ZgI6mhBh0DFWAxwx8z1/wJRo/dwErKVI6/oqbdKPW
         zQ9eJ8a6CIkt6VaWHUOJ797NWm3pS7TNyeikjSejxyv7kgpgJbYOGwzV1rbt9QtxKYsq
         F8w16ADAN90qYT8yJcTpNBaefMxFg2y+sGYDZL613sPmeQuuLAH0Ur9FZf9lqXoQu3VL
         +iy4abhuYhrxyv+NOmFSPbN5TGUIg/Sm+P/yPOkdNaReXHv99nmHujn0zOyDj+iujRzA
         pzmw==
X-Gm-Message-State: AC+VfDyu5HdBIcwXM/C4nP1UWvURedEnesRr+IxPtFgNq49QMuNLLvBL
	S7mvLIyEr+tqy2KT4vEm8GJjAT8xpvX+MgJpxYA=
X-Google-Smtp-Source: ACHHUZ55E6kIeC88j47NoyZHAbMucRroUsfnto0h7K1idZhsyulvdQsWX5B9zD5I+uL4MjbyUbXp4ttO3e5/dIDxhmw=
X-Received: by 2002:a6b:7b46:0:b0:77a:17d1:3b2b with SMTP id
 m6-20020a6b7b46000000b0077a17d13b2bmr8741879iop.18.1687264944466; Tue, 20 Jun
 2023 05:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
 <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
 <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com> <176A5C62B6CFBD15.4070@lists.openembedded.org>
In-Reply-To: <176A5C62B6CFBD15.4070@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Jun 2023 13:42:12 +0100
Message-ID: <CAO5Uq5TMWYSJbSLOciykBcMGV+vz72mpGi=dXECm_VN2GpuBgg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: alex.kiernan@gmail.com
Cc: Beniamin Sandu <beniaminsandu@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 12:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103456

On Tue, Jun 20, 2023 at 1:03=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Tue, Jun 20, 2023 at 11:53=E2=80=AFAM Beniamin Sandu <beniaminsandu@gm=
ail.com> wrote:
> >
> > On Tue, Jun 20, 2023 at 12:56=E2=80=AFPM Alex Kiernan <alex.kiernan@gma=
il.com> wrote:
> > >
> > > On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <beniaminsandu=
@gmail.com> wrote:
> > > >
> > > > I am trying to add a v3.x mbedtls recipe to master branch, and with=
out
> > >
> > > Sorry, was reading the thread out of order and missed that you were
> > > trying to add an Mbed TLS 3 recipe!
> > >
> > > > this patch, mdns does not build. I could not find an obvious way to
> > > > submit upstream patches to mdns from a quick search, otherwise I wo=
uld
> > > > gladly do it.
> > > >
> > >
> > > Several folk have tried sending them to dts@apple.com (seemingly
> > > without success), there's also a couple of attempted PRs on github
> > > (again seemingly going nowhere). Winding back about 20 years, I tried
> > > to get a bunch of portability fixes into the Quicktime Streaming
> > > Server without success - the model appears to very much be open
> > > source, not open contribution.
> > >
> > > > While I am with you on trying to reduce technical debt within yocto
> > > > layers, this one is very small and rather harmless, so I hope we ca=
n
> > > > make a sacrifice for the greater good. :)
> > > >
> > >
> > > I'm guessing we'll need to scope an Mbed TLS 3 recipe as being
> > > explicitly mbedtls3_...? So sticking with 2.x doesn't feel like a
> > > terrible option, but I agree its not ideal.
> >
> > This also sounds like a fairly decent option, having a separate
> > mbedtls3 package might make it easier in general, although I am not
> > aware of how used the current v2 version actually is.
> >
>
> Looks like we're out of date (there's a 2.28.3), but it's still
> supported for now... "Mbed TLS 2.28 is a long-time support branch. It
> will be supported with bug-fixes and security fixes until end of
> 2024."
>

Will send an update for 2.28.3, but constrain `devtool upgrade` to
things on the 2.x branch

One thought on 3.x - if mdns is the only failure maybe rename the
current recipe to mbedtls2_% and add 3.x as mbedtls_% and then fix up
the mdns recipe to consume mbedtls2?

> > >
> > > My concern isn't really with the one liner now, its the how hard does
> > > it become to do the upgrades down the road - if we suddenly can't
> > > upgrade because upstream's stuck on 2.x and there's something
> > > incompatible with 3.x what do we do?
> > >
> > > > Cheers,
> > > > Beni
> > > >
> > > >
> > > > On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.kiernan=
@gmail.com> wrote:
> > > > >
> > > > > Keeping up with Apple given they take nothing is frankly a right =
pain, adding things which are nice to have rather than just broken seems li=
ke we're just adding to the problem. Last time I resynchronized this it too=
k me days, unless there's a really good reason to do this, or there's a way=
 to get it upstreamed I'd rather we didn't.
> > > > >
> > > > >
> > > > > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gmail.c=
om> wrote:
> > > > >>
> > > > >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > >> ---
> > > > >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++++++++++=
+++++++
> > > > >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> > > > >>  2 files changed, 34 insertions(+)
> > > > >>  create mode 100644 meta-networking/recipes-protocols/mdns/mdns/=
0009-remove-unneeded-headers.patch
> > > > >>
> > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-re=
move-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0=
009-remove-unneeded-headers.patch
> > > > >> new file mode 100644
> > > > >> index 000000000..74d387368
> > > > >> --- /dev/null
> > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-un=
needed-headers.patch
> > > > >> @@ -0,0 +1,33 @@
> > > > >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:=
00 2001
> > > > >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> > > > >> +Subject: [PATCH] remove unneeded headers
> > > > >> +
> > > > >> +From a quick look, these seem to not be needed and having them
> > > > >> +breaks the build with mbedtls 3.x. Without them it builds fine
> > > > >> +on both 2.x and 3.x versions.
> > > > >> +
> > > > >> +Upstream-Status: Pending
> > > > >> +
> > > > >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > >> +---
> > > > >> + mDNSPosix/mbedtls.c | 2 --
> > > > >> + 1 file changed, 2 deletions(-)
> > > > >> +
> > > > >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > > > >> +index a73681b..ab8f8c7 100644
> > > > >> +--- a/mDNSPosix/mbedtls.c
> > > > >> ++++ b/mDNSPosix/mbedtls.c
> > > > >> +@@ -38,10 +38,8 @@
> > > > >> + #include <mbedtls/sha256.h>
> > > > >> + #include <mbedtls/base64.h>
> > > > >> +
> > > > >> +-#include <mbedtls/certs.h>
> > > > >> + #include <mbedtls/x509.h>
> > > > >> + #include <mbedtls/ssl.h>
> > > > >> +-#include <mbedtls/config.h>
> > > > >> +
> > > > >> + // Posix TLS server context
> > > > >> + struct TLSContext_struct {
> > > > >> +--
> > > > >> +2.34.1
> > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80=
.10.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > > >> index 612d343c8..46f1b70cb 100644
> > > > >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > > >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-distri=
butions/mDNSResponder;protocol=3Dhttps
> > > > >>             file://0006-Handle-noisy-netlink-sockets.patch \
> > > > >>             file://0007-Mark-deleted-interfaces-as-being-changed=
.patch \
> > > > >>             file://0008-Handle-errors-from-socket-calls.patch \
> > > > >> +           file://0009-remove-unneeded-headers.patch \
> > > > >>             file://mdns.service \
> > > > >>             "
> > > > >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> > > > >> --
> > > > >> 2.25.1
> > > > >>
> > > > >>
> > > > >>
> > > > >>
> > >
> > >
> > >
> > > --
> > > Alex Kiernan
>
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103455): https://lists.openembedded.org/g/openembedde=
d-devel/message/103455
> Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

