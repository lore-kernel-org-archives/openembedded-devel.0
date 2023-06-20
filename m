Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88A3EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 13:13:06 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.9992.1687266779796008459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 06:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=e1OqvIvr;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-25eb3db3004so2049988a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687266779; x=1689858779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBzCHpA+1HArZ3IKrdXr0cyZAjA7hy0wuUs6fdWCbB8=;
        b=e1OqvIvriCrpqwVavKLuWURiZ/pOuPtd/wCFA5mwmOKvtzRWdm2ClbmmFepWc/ZSUo
         R48a7ingZ0BXcONEi94ucxKW6tPx+VtRwK8I0GUqMB7ojsLs1va6Y7j2UzD7PXCidyO8
         /mNrUze+O4wKfzmIqTVKJCi7rg4PBAUI5NUApdy3Xmuv9mwB8ruUmElQi+4Sxs4Fm8vM
         FoNv0bHV7P5hvd01jhW1QLYe3iqhpkVOUEmWTFdeWQ4cV8/Rviju0fsIryShV6U2xV85
         jaGPqkJ+AS12spZrxE4KEml/FpH5KuO3v+1U+1TKhqJ6iG9Opz3vtICXKhUng9phIgaD
         c/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687266779; x=1689858779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBzCHpA+1HArZ3IKrdXr0cyZAjA7hy0wuUs6fdWCbB8=;
        b=KdOZAN5b44hvSZJu6x0MhauDWtlffwBVB4C1+hPwptjsIscN/TM43JEwAvW32uiF++
         ZPDv6Nz3KxrycjwFQaKtHINmEEFGnyZrUPPoRRorDHU/F49xkN8OI3BzohovaFBWyKeM
         D2H1Z0TEs9Qjf+6I9r9ZRfdDpZSXgoKib3sMKHAmjoluz8+EkGWM/NY04uwGGjPAfATx
         ul3/e4Z7iDJfZUY2Dxv0b4rm7TK8PBi6gXy0vYDEx7h2YSLvz8A2Jpp/VaXQptHnQ/Rb
         RJXhc+9qX1QQ25ZyocKomVEvv1FovJ2h94THxFHYnumHxBxhkq6PDN01+lHomv3MGxBz
         NeEQ==
X-Gm-Message-State: AC+VfDz3JK/3GpEEXGxNvWmrRwsirG3NnMxa656yTWTW2tkYxVhp3hDE
	6rYDqARwbXJeeQb7/OwyYI5zvUOyG3+uy/uPkZI=
X-Google-Smtp-Source: ACHHUZ69rgAAzXkjCWJfRTWF2i6hbCh1drDPTsKgyCnwaE97zFklHRm3DCfjKAYyWXohvR520+kFuxw5aBLiDQwiiQM=
X-Received: by 2002:a17:90a:ce04:b0:25b:fcbb:62ba with SMTP id
 f4-20020a17090ace0400b0025bfcbb62bamr7312241pju.45.1687266778941; Tue, 20 Jun
 2023 06:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
 <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
 <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com>
 <176A5C62B6CFBD15.4070@lists.openembedded.org> <CAO5Uq5TMWYSJbSLOciykBcMGV+vz72mpGi=dXECm_VN2GpuBgg@mail.gmail.com>
In-Reply-To: <CAO5Uq5TMWYSJbSLOciykBcMGV+vz72mpGi=dXECm_VN2GpuBgg@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Tue, 20 Jun 2023 16:12:47 +0300
Message-ID: <CABQJdOGpQ5LS9MneXahSkYyfBJZSyHEZvUczi6DqDJFTgxFY5w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 13:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103457

On Tue, Jun 20, 2023 at 3:42=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> On Tue, Jun 20, 2023 at 1:03=E2=80=AFPM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Tue, Jun 20, 2023 at 11:53=E2=80=AFAM Beniamin Sandu <beniaminsandu@=
gmail.com> wrote:
> > >
> > > On Tue, Jun 20, 2023 at 12:56=E2=80=AFPM Alex Kiernan <alex.kiernan@g=
mail.com> wrote:
> > > >
> > > > On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <beniaminsan=
du@gmail.com> wrote:
> > > > >
> > > > > I am trying to add a v3.x mbedtls recipe to master branch, and wi=
thout
> > > >
> > > > Sorry, was reading the thread out of order and missed that you were
> > > > trying to add an Mbed TLS 3 recipe!
> > > >
> > > > > this patch, mdns does not build. I could not find an obvious way =
to
> > > > > submit upstream patches to mdns from a quick search, otherwise I =
would
> > > > > gladly do it.
> > > > >
> > > >
> > > > Several folk have tried sending them to dts@apple.com (seemingly
> > > > without success), there's also a couple of attempted PRs on github
> > > > (again seemingly going nowhere). Winding back about 20 years, I tri=
ed
> > > > to get a bunch of portability fixes into the Quicktime Streaming
> > > > Server without success - the model appears to very much be open
> > > > source, not open contribution.
> > > >
> > > > > While I am with you on trying to reduce technical debt within yoc=
to
> > > > > layers, this one is very small and rather harmless, so I hope we =
can
> > > > > make a sacrifice for the greater good. :)
> > > > >
> > > >
> > > > I'm guessing we'll need to scope an Mbed TLS 3 recipe as being
> > > > explicitly mbedtls3_...? So sticking with 2.x doesn't feel like a
> > > > terrible option, but I agree its not ideal.
> > >
> > > This also sounds like a fairly decent option, having a separate
> > > mbedtls3 package might make it easier in general, although I am not
> > > aware of how used the current v2 version actually is.
> > >
> >
> > Looks like we're out of date (there's a 2.28.3), but it's still
> > supported for now... "Mbed TLS 2.28 is a long-time support branch. It
> > will be supported with bug-fixes and security fixes until end of
> > 2024."
> >
>
> Will send an update for 2.28.3, but constrain `devtool upgrade` to
> things on the 2.x branch
>
> One thought on 3.x - if mdns is the only failure maybe rename the
> current recipe to mbedtls2_% and add 3.x as mbedtls_% and then fix up
> the mdns recipe to consume mbedtls2?
>

Personally I would say it is not worth to do it, just because of this
one package. Plus, it's building fine with both versions by including
this small patch, but maybe Khem Raj can chime in with an opinion
here.

> > > >
> > > > My concern isn't really with the one liner now, its the how hard do=
es
> > > > it become to do the upgrades down the road - if we suddenly can't
> > > > upgrade because upstream's stuck on 2.x and there's something
> > > > incompatible with 3.x what do we do?
> > > >
> > > > > Cheers,
> > > > > Beni
> > > > >
> > > > >
> > > > > On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.kiern=
an@gmail.com> wrote:
> > > > > >
> > > > > > Keeping up with Apple given they take nothing is frankly a righ=
t pain, adding things which are nice to have rather than just broken seems =
like we're just adding to the problem. Last time I resynchronized this it t=
ook me days, unless there's a really good reason to do this, or there's a w=
ay to get it upstreamed I'd rather we didn't.
> > > > > >
> > > > > >
> > > > > > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gmail=
.com> wrote:
> > > > > >>
> > > > > >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > >> ---
> > > > > >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++++++++=
+++++++++
> > > > > >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> > > > > >>  2 files changed, 34 insertions(+)
> > > > > >>  create mode 100644 meta-networking/recipes-protocols/mdns/mdn=
s/0009-remove-unneeded-headers.patch
> > > > > >>
> > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-=
remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns=
/0009-remove-unneeded-headers.patch
> > > > > >> new file mode 100644
> > > > > >> index 000000000..74d387368
> > > > > >> --- /dev/null
> > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-=
unneeded-headers.patch
> > > > > >> @@ -0,0 +1,33 @@
> > > > > >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:0=
0:00 2001
> > > > > >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> > > > > >> +Subject: [PATCH] remove unneeded headers
> > > > > >> +
> > > > > >> +From a quick look, these seem to not be needed and having the=
m
> > > > > >> +breaks the build with mbedtls 3.x. Without them it builds fin=
e
> > > > > >> +on both 2.x and 3.x versions.
> > > > > >> +
> > > > > >> +Upstream-Status: Pending
> > > > > >> +
> > > > > >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > >> +---
> > > > > >> + mDNSPosix/mbedtls.c | 2 --
> > > > > >> + 1 file changed, 2 deletions(-)
> > > > > >> +
> > > > > >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > > > > >> +index a73681b..ab8f8c7 100644
> > > > > >> +--- a/mDNSPosix/mbedtls.c
> > > > > >> ++++ b/mDNSPosix/mbedtls.c
> > > > > >> +@@ -38,10 +38,8 @@
> > > > > >> + #include <mbedtls/sha256.h>
> > > > > >> + #include <mbedtls/base64.h>
> > > > > >> +
> > > > > >> +-#include <mbedtls/certs.h>
> > > > > >> + #include <mbedtls/x509.h>
> > > > > >> + #include <mbedtls/ssl.h>
> > > > > >> +-#include <mbedtls/config.h>
> > > > > >> +
> > > > > >> + // Posix TLS server context
> > > > > >> + struct TLSContext_struct {
> > > > > >> +--
> > > > > >> +2.34.1
> > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.=
80.10.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > > > >> index 612d343c8..46f1b70cb 100644
> > > > > >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.b=
b
> > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.b=
b
> > > > > >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-dist=
ributions/mDNSResponder;protocol=3Dhttps
> > > > > >>             file://0006-Handle-noisy-netlink-sockets.patch \
> > > > > >>             file://0007-Mark-deleted-interfaces-as-being-chang=
ed.patch \
> > > > > >>             file://0008-Handle-errors-from-socket-calls.patch =
\
> > > > > >> +           file://0009-remove-unneeded-headers.patch \
> > > > > >>             file://mdns.service \
> > > > > >>             "
> > > > > >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> > > > > >> --
> > > > > >> 2.25.1
> > > > > >>
> > > > > >>
> > > > > >>
> > > > > >>
> > > >
> > > >
> > > >
> > > > --
> > > > Alex Kiernan
> >
> >
> >
> > --
> > Alex Kiernan
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103455): https://lists.openembedded.org/g/openembed=
ded-devel/message/103455
> > Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[alex.kiernan@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alex Kiernan

