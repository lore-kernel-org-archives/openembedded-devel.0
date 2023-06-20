Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860A8EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 16:38:48 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.804.1687279122439528881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 09:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NfIkFkm6;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: beniaminsandu@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-55e1bb2ab1aso3124302eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687279122; x=1689871122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LP6gwF/1m/rJSWD/MP5MJN1ISwpRM7OFuOM6YDcyCkA=;
        b=NfIkFkm6jZ7u7mWVX0EHPDN0wPAFiIwSjCGGQKyyDNcX1cTZE1htoLlyJ16h5s9Mtd
         9mHC3Yo4hNKqEyUa36VWh2vGO+6IM3cSRvToMMffESFULv11rv3+RboQaS9qhpJPhex1
         xPbw6rtKVq8eP1S/wAZICx+oDPbUUlLuiAFqTEpw73Y4zsxJrfzMcpn15kSrZfyc1Gsk
         TDxKI9+Ja1j4osbCTVIR3OUnNeb0sU61tPlaw8Efiv7Bk2hcmROCryNTbr5DSYxwfytb
         5Hjz4G4YCSBzRaLqVyd49BE8P2n45+yDk93W616Cy4I6yDRDPwliymROHItgTQo672Mp
         Yvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687279122; x=1689871122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LP6gwF/1m/rJSWD/MP5MJN1ISwpRM7OFuOM6YDcyCkA=;
        b=ZssZaxwj+SgcIRmDdoyLCpfqdvN2Sg/pVrfSRL4ijgcbj211tABR9H1VEh8KyizTPm
         HTKQexqo5znVssD6prbEii3czQJTxOqkUKcScGmLTzdocJuxfuf65UGfNxiuuX+Y0SQj
         Nx0pTHfmPdHCMEjB/rd+4g5SSXO0sKcn9+akR2Cg3dxagz6avvAzk7VW/WlYe9HkJmt5
         pvO+9xN5xLNDJy0o/p2KXNsa1MgAZQltSIGVYt9EZ4aZPdx26uS5LC/cHFzazqyPQUjb
         xhBBs8E3EGRYKYppL1Vc6v5NGnfZBOOz9U8YXHeR7P1dLWyC1RM9VXMl2VW9EBltkn+0
         RYbg==
X-Gm-Message-State: AC+VfDzyj/kuFGzGfrWKpDkAN+XcBedwdI5XsS1yw/TZfw80u0x/chSi
	ea5ozosP7USFmcrObo7qTvAQjAeZ4Qs516TCYeI=
X-Google-Smtp-Source: ACHHUZ5rSy5s17OJwvagsp+scgZGfEP5bqJfq/BEn0Wa3UvPKzXzBQL9dSA1+/puCzQsG0u/+vNniqPYOSci9q9Dfts=
X-Received: by 2002:a05:6808:211e:b0:396:40c4:a2ef with SMTP id
 r30-20020a056808211e00b0039640c4a2efmr4886601oiw.11.1687279121528; Tue, 20
 Jun 2023 09:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
 <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
 <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com>
 <176A5C62B6CFBD15.4070@lists.openembedded.org> <CAO5Uq5TMWYSJbSLOciykBcMGV+vz72mpGi=dXECm_VN2GpuBgg@mail.gmail.com>
 <CABQJdOGpQ5LS9MneXahSkYyfBJZSyHEZvUczi6DqDJFTgxFY5w@mail.gmail.com>
In-Reply-To: <CABQJdOGpQ5LS9MneXahSkYyfBJZSyHEZvUczi6DqDJFTgxFY5w@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Tue, 20 Jun 2023 19:38:30 +0300
Message-ID: <CABQJdOGC2edPg50oOW6QhwiTxvH=Lxp97k8zoEBRVz5Y1ta-vA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 16:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103460

On Tue, Jun 20, 2023 at 4:12=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmail=
.com> wrote:
>
> On Tue, Jun 20, 2023 at 3:42=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
> >
> > On Tue, Jun 20, 2023 at 1:03=E2=80=AFPM Alex Kiernan via
> > lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> > >
> > > On Tue, Jun 20, 2023 at 11:53=E2=80=AFAM Beniamin Sandu <beniaminsand=
u@gmail.com> wrote:
> > > >
> > > > On Tue, Jun 20, 2023 at 12:56=E2=80=AFPM Alex Kiernan <alex.kiernan=
@gmail.com> wrote:
> > > > >
> > > > > On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <beniamins=
andu@gmail.com> wrote:
> > > > > >
> > > > > > I am trying to add a v3.x mbedtls recipe to master branch, and =
without
> > > > >
> > > > > Sorry, was reading the thread out of order and missed that you we=
re
> > > > > trying to add an Mbed TLS 3 recipe!
> > > > >
> > > > > > this patch, mdns does not build. I could not find an obvious wa=
y to
> > > > > > submit upstream patches to mdns from a quick search, otherwise =
I would
> > > > > > gladly do it.
> > > > > >
> > > > >
> > > > > Several folk have tried sending them to dts@apple.com (seemingly
> > > > > without success), there's also a couple of attempted PRs on githu=
b
> > > > > (again seemingly going nowhere). Winding back about 20 years, I t=
ried
> > > > > to get a bunch of portability fixes into the Quicktime Streaming
> > > > > Server without success - the model appears to very much be open
> > > > > source, not open contribution.
> > > > >
> > > > > > While I am with you on trying to reduce technical debt within y=
octo
> > > > > > layers, this one is very small and rather harmless, so I hope w=
e can
> > > > > > make a sacrifice for the greater good. :)
> > > > > >
> > > > >
> > > > > I'm guessing we'll need to scope an Mbed TLS 3 recipe as being
> > > > > explicitly mbedtls3_...? So sticking with 2.x doesn't feel like a
> > > > > terrible option, but I agree its not ideal.
> > > >
> > > > This also sounds like a fairly decent option, having a separate
> > > > mbedtls3 package might make it easier in general, although I am not
> > > > aware of how used the current v2 version actually is.
> > > >
> > >
> > > Looks like we're out of date (there's a 2.28.3), but it's still
> > > supported for now... "Mbed TLS 2.28 is a long-time support branch. It
> > > will be supported with bug-fixes and security fixes until end of
> > > 2024."
> > >
> >
> > Will send an update for 2.28.3, but constrain `devtool upgrade` to
> > things on the 2.x branch
> >
> > One thought on 3.x - if mdns is the only failure maybe rename the
> > current recipe to mbedtls2_% and add 3.x as mbedtls_% and then fix up
> > the mdns recipe to consume mbedtls2?
> >
>
> Personally I would say it is not worth to do it, just because of this
> one package. Plus, it's building fine with both versions by including
> this small patch, but maybe Khem Raj can chime in with an opinion
> here.
>

While looking through some stuff, I discovered some variable I had no
idea exists, called DEFAULT_PREFERENCE:
https://docs.yoctoproject.org/ref-manual/variables.html#term-DEFAULT_PREFER=
ENCE

Seems it could be a very simple way to make mbedtls v2 be the
"default" version unless specified by user through PREFERRED_PROVIDER?

> > > > >
> > > > > My concern isn't really with the one liner now, its the how hard =
does
> > > > > it become to do the upgrades down the road - if we suddenly can't
> > > > > upgrade because upstream's stuck on 2.x and there's something
> > > > > incompatible with 3.x what do we do?
> > > > >
> > > > > > Cheers,
> > > > > > Beni
> > > > > >
> > > > > >
> > > > > > On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.kie=
rnan@gmail.com> wrote:
> > > > > > >
> > > > > > > Keeping up with Apple given they take nothing is frankly a ri=
ght pain, adding things which are nice to have rather than just broken seem=
s like we're just adding to the problem. Last time I resynchronized this it=
 took me days, unless there's a really good reason to do this, or there's a=
 way to get it upstreamed I'd rather we didn't.
> > > > > > >
> > > > > > >
> > > > > > > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gma=
il.com> wrote:
> > > > > > >>
> > > > > > >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > >> ---
> > > > > > >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++++++=
+++++++++++
> > > > > > >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> > > > > > >>  2 files changed, 34 insertions(+)
> > > > > > >>  create mode 100644 meta-networking/recipes-protocols/mdns/m=
dns/0009-remove-unneeded-headers.patch
> > > > > > >>
> > > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns/000=
9-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/md=
ns/0009-remove-unneeded-headers.patch
> > > > > > >> new file mode 100644
> > > > > > >> index 000000000..74d387368
> > > > > > >> --- /dev/null
> > > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remov=
e-unneeded-headers.patch
> > > > > > >> @@ -0,0 +1,33 @@
> > > > > > >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00=
:00:00 2001
> > > > > > >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> > > > > > >> +Subject: [PATCH] remove unneeded headers
> > > > > > >> +
> > > > > > >> +From a quick look, these seem to not be needed and having t=
hem
> > > > > > >> +breaks the build with mbedtls 3.x. Without them it builds f=
ine
> > > > > > >> +on both 2.x and 3.x versions.
> > > > > > >> +
> > > > > > >> +Upstream-Status: Pending
> > > > > > >> +
> > > > > > >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > >> +---
> > > > > > >> + mDNSPosix/mbedtls.c | 2 --
> > > > > > >> + 1 file changed, 2 deletions(-)
> > > > > > >> +
> > > > > > >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > > > > > >> +index a73681b..ab8f8c7 100644
> > > > > > >> +--- a/mDNSPosix/mbedtls.c
> > > > > > >> ++++ b/mDNSPosix/mbedtls.c
> > > > > > >> +@@ -38,10 +38,8 @@
> > > > > > >> + #include <mbedtls/sha256.h>
> > > > > > >> + #include <mbedtls/base64.h>
> > > > > > >> +
> > > > > > >> +-#include <mbedtls/certs.h>
> > > > > > >> + #include <mbedtls/x509.h>
> > > > > > >> + #include <mbedtls/ssl.h>
> > > > > > >> +-#include <mbedtls/config.h>
> > > > > > >> +
> > > > > > >> + // Posix TLS server context
> > > > > > >> + struct TLSContext_struct {
> > > > > > >> +--
> > > > > > >> +2.34.1
> > > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns_179=
0.80.10.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > > > > >> index 612d343c8..46f1b70cb 100644
> > > > > > >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10=
.bb
> > > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10=
.bb
> > > > > > >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-di=
stributions/mDNSResponder;protocol=3Dhttps
> > > > > > >>             file://0006-Handle-noisy-netlink-sockets.patch \
> > > > > > >>             file://0007-Mark-deleted-interfaces-as-being-cha=
nged.patch \
> > > > > > >>             file://0008-Handle-errors-from-socket-calls.patc=
h \
> > > > > > >> +           file://0009-remove-unneeded-headers.patch \
> > > > > > >>             file://mdns.service \
> > > > > > >>             "
> > > > > > >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> > > > > > >> --
> > > > > > >> 2.25.1
> > > > > > >>
> > > > > > >>
> > > > > > >>
> > > > > > >>
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Alex Kiernan
> > >
> > >
> > >
> > > --
> > > Alex Kiernan
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#103455): https://lists.openembedded.org/g/openemb=
edded-devel/message/103455
> > > Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [alex.kiernan@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Alex Kiernan

