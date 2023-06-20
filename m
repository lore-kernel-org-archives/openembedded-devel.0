Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B038EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 16:43:48 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.947.1687279421501921533
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 09:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J7p68fPA;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-77e2ed26037so124212639f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687279421; x=1689871421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl19dzWFNG5ryvo/b9PoT21e5N6z53QnWAKwneokcCw=;
        b=J7p68fPAy69R41hkmNfyUp5bWSOFvslhpbCE5+w7vIMDdreKzKbUD/QRRfoj+fge9G
         vfIo6A4HtE/P2lf+gIBrhSTFHRWHsZ63LxGZFwQCPj249muo13smTXfocc947/nI+v37
         HXzfSBJ/lyk7bnKf61XSdPEknBMk7YksqKSROozxYicuYtjtqwWocPGlrQpCLkJGGF++
         KTJQTIl9QRB2StlKlj/Q32zEiHm6EhRmYNuSKXzaG71h01gNWCiEi6u2X3C1vaq2lvDq
         vN3saJx1G4U0PxZVVLCNT7+m3gKwF/a8qFf8IoSjFDx0ycYjPvMpSS+BDBDklWQ3Zrvh
         xaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687279421; x=1689871421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pl19dzWFNG5ryvo/b9PoT21e5N6z53QnWAKwneokcCw=;
        b=Gz6quEt2Rg1KWpsKnJ+gZEOp2XsB/F/KWLEj6OiCrlWRED5ihq3XzcSvhgSeq5r0qZ
         lU/Y5RcKxZxmVfK3YcjYAaTqyLaICVVDJKtFO0qVz8g47A1ndQr8SVTrZdISyZfgMPmq
         9/nA2bTLWXzl4VPcBrx+2kCXwKKpLOwVzjRMIfpNtEwkz8ECvfrde0c3uUFa43tATtHM
         bromkzokSH2h2z+8z9VmaUKTqGh9KfWQ6Av7ryhEtqgOt+G2pyYBDdzUF+EUPceRDjez
         ORmYEpsoOollDzkgTAITNccrsulBP++t6XG9Eplk+n5RhGZDiVAstIqkyPCz5YtiLsem
         YkSw==
X-Gm-Message-State: AC+VfDzL1qrk/9I7KrdN4L0VxNEp31Li78ZI1kYYoHILHXfy7eXQVPi4
	HcCqVwRnaFq49qgJCFeUcMGVe/b50v9Pbp3RpxnRctWx
X-Google-Smtp-Source: ACHHUZ5mfaqnOc3oXPK9vDJaXfxshvDCC2jzSStqN8p5h9ZHTGMZxu8mTZ4ysCv5x/FVBL7almnJ0k8TN03t8Z1+HMU=
X-Received: by 2002:a6b:6107:0:b0:77e:52:a52a with SMTP id v7-20020a6b6107000000b0077e0052a52amr9694087iob.17.1687279420514;
 Tue, 20 Jun 2023 09:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
 <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
 <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com>
 <176A5C62B6CFBD15.4070@lists.openembedded.org> <CAO5Uq5TMWYSJbSLOciykBcMGV+vz72mpGi=dXECm_VN2GpuBgg@mail.gmail.com>
 <CABQJdOGpQ5LS9MneXahSkYyfBJZSyHEZvUczi6DqDJFTgxFY5w@mail.gmail.com> <CABQJdOGC2edPg50oOW6QhwiTxvH=Lxp97k8zoEBRVz5Y1ta-vA@mail.gmail.com>
In-Reply-To: <CABQJdOGC2edPg50oOW6QhwiTxvH=Lxp97k8zoEBRVz5Y1ta-vA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Jun 2023 17:43:28 +0100
Message-ID: <CAO5Uq5QKfwvB8h30xuSjnAceH6JV8qvy6hSec-4nJf_+zam6Tw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 16:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103462

On Tue, Jun 20, 2023 at 5:38=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmail=
.com> wrote:
>
> On Tue, Jun 20, 2023 at 4:12=E2=80=AFPM Beniamin Sandu <beniaminsandu@gma=
il.com> wrote:
> >
> > On Tue, Jun 20, 2023 at 3:42=E2=80=AFPM Alex Kiernan <alex.kiernan@gmai=
l.com> wrote:
> > >
> > > On Tue, Jun 20, 2023 at 1:03=E2=80=AFPM Alex Kiernan via
> > > lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.o=
rg>
> > > wrote:
> > > >
> > > > On Tue, Jun 20, 2023 at 11:53=E2=80=AFAM Beniamin Sandu <beniaminsa=
ndu@gmail.com> wrote:
> > > > >
> > > > > On Tue, Jun 20, 2023 at 12:56=E2=80=AFPM Alex Kiernan <alex.kiern=
an@gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <beniami=
nsandu@gmail.com> wrote:
> > > > > > >
> > > > > > > I am trying to add a v3.x mbedtls recipe to master branch, an=
d without
> > > > > >
> > > > > > Sorry, was reading the thread out of order and missed that you =
were
> > > > > > trying to add an Mbed TLS 3 recipe!
> > > > > >
> > > > > > > this patch, mdns does not build. I could not find an obvious =
way to
> > > > > > > submit upstream patches to mdns from a quick search, otherwis=
e I would
> > > > > > > gladly do it.
> > > > > > >
> > > > > >
> > > > > > Several folk have tried sending them to dts@apple.com (seemingl=
y
> > > > > > without success), there's also a couple of attempted PRs on git=
hub
> > > > > > (again seemingly going nowhere). Winding back about 20 years, I=
 tried
> > > > > > to get a bunch of portability fixes into the Quicktime Streamin=
g
> > > > > > Server without success - the model appears to very much be open
> > > > > > source, not open contribution.
> > > > > >
> > > > > > > While I am with you on trying to reduce technical debt within=
 yocto
> > > > > > > layers, this one is very small and rather harmless, so I hope=
 we can
> > > > > > > make a sacrifice for the greater good. :)
> > > > > > >
> > > > > >
> > > > > > I'm guessing we'll need to scope an Mbed TLS 3 recipe as being
> > > > > > explicitly mbedtls3_...? So sticking with 2.x doesn't feel like=
 a
> > > > > > terrible option, but I agree its not ideal.
> > > > >
> > > > > This also sounds like a fairly decent option, having a separate
> > > > > mbedtls3 package might make it easier in general, although I am n=
ot
> > > > > aware of how used the current v2 version actually is.
> > > > >
> > > >
> > > > Looks like we're out of date (there's a 2.28.3), but it's still
> > > > supported for now... "Mbed TLS 2.28 is a long-time support branch. =
It
> > > > will be supported with bug-fixes and security fixes until end of
> > > > 2024."
> > > >
> > >
> > > Will send an update for 2.28.3, but constrain `devtool upgrade` to
> > > things on the 2.x branch
> > >
> > > One thought on 3.x - if mdns is the only failure maybe rename the
> > > current recipe to mbedtls2_% and add 3.x as mbedtls_% and then fix up
> > > the mdns recipe to consume mbedtls2?
> > >
> >
> > Personally I would say it is not worth to do it, just because of this
> > one package. Plus, it's building fine with both versions by including
> > this small patch, but maybe Khem Raj can chime in with an opinion
> > here.
> >
>
> While looking through some stuff, I discovered some variable I had no
> idea exists, called DEFAULT_PREFERENCE:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-DEFAULT_PREF=
ERENCE
>
> Seems it could be a very simple way to make mbedtls v2 be the
> "default" version unless specified by user through PREFERRED_PROVIDER?
>

It works, but if you have two recipes with conflicting requirements
(which I do for some other things), it doesn't really help...

Probably I'm leaning towards just upgrading to 3.x and taking the
mDNSResponder patch, I just worry about where Apple go...

> > > > > >
> > > > > > My concern isn't really with the one liner now, its the how har=
d does
> > > > > > it become to do the upgrades down the road - if we suddenly can=
't
> > > > > > upgrade because upstream's stuck on 2.x and there's something
> > > > > > incompatible with 3.x what do we do?
> > > > > >
> > > > > > > Cheers,
> > > > > > > Beni
> > > > > > >
> > > > > > >
> > > > > > > On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.k=
iernan@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Keeping up with Apple given they take nothing is frankly a =
right pain, adding things which are nice to have rather than just broken se=
ems like we're just adding to the problem. Last time I resynchronized this =
it took me days, unless there's a really good reason to do this, or there's=
 a way to get it upstreamed I'd rather we didn't.
> > > > > > > >
> > > > > > > >
> > > > > > > > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@g=
mail.com> wrote:
> > > > > > > >>
> > > > > > > >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > >> ---
> > > > > > > >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++++=
+++++++++++++
> > > > > > > >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> > > > > > > >>  2 files changed, 34 insertions(+)
> > > > > > > >>  create mode 100644 meta-networking/recipes-protocols/mdns=
/mdns/0009-remove-unneeded-headers.patch
> > > > > > > >>
> > > > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns/0=
009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/=
mdns/0009-remove-unneeded-headers.patch
> > > > > > > >> new file mode 100644
> > > > > > > >> index 000000000..74d387368
> > > > > > > >> --- /dev/null
> > > > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-rem=
ove-unneeded-headers.patch
> > > > > > > >> @@ -0,0 +1,33 @@
> > > > > > > >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 =
00:00:00 2001
> > > > > > > >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> > > > > > > >> +Subject: [PATCH] remove unneeded headers
> > > > > > > >> +
> > > > > > > >> +From a quick look, these seem to not be needed and having=
 them
> > > > > > > >> +breaks the build with mbedtls 3.x. Without them it builds=
 fine
> > > > > > > >> +on both 2.x and 3.x versions.
> > > > > > > >> +
> > > > > > > >> +Upstream-Status: Pending
> > > > > > > >> +
> > > > > > > >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > >> +---
> > > > > > > >> + mDNSPosix/mbedtls.c | 2 --
> > > > > > > >> + 1 file changed, 2 deletions(-)
> > > > > > > >> +
> > > > > > > >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > > > > > > >> +index a73681b..ab8f8c7 100644
> > > > > > > >> +--- a/mDNSPosix/mbedtls.c
> > > > > > > >> ++++ b/mDNSPosix/mbedtls.c
> > > > > > > >> +@@ -38,10 +38,8 @@
> > > > > > > >> + #include <mbedtls/sha256.h>
> > > > > > > >> + #include <mbedtls/base64.h>
> > > > > > > >> +
> > > > > > > >> +-#include <mbedtls/certs.h>
> > > > > > > >> + #include <mbedtls/x509.h>
> > > > > > > >> + #include <mbedtls/ssl.h>
> > > > > > > >> +-#include <mbedtls/config.h>
> > > > > > > >> +
> > > > > > > >> + // Posix TLS server context
> > > > > > > >> + struct TLSContext_struct {
> > > > > > > >> +--
> > > > > > > >> +2.34.1
> > > > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1=
790.80.10.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > > > > > >> index 612d343c8..46f1b70cb 100644
> > > > > > > >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.=
10.bb
> > > > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.=
10.bb
> > > > > > > >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-=
distributions/mDNSResponder;protocol=3Dhttps
> > > > > > > >>             file://0006-Handle-noisy-netlink-sockets.patch=
 \
> > > > > > > >>             file://0007-Mark-deleted-interfaces-as-being-c=
hanged.patch \
> > > > > > > >>             file://0008-Handle-errors-from-socket-calls.pa=
tch \
> > > > > > > >> +           file://0009-remove-unneeded-headers.patch \
> > > > > > > >>             file://mdns.service \
> > > > > > > >>             "
> > > > > > > >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> > > > > > > >> --
> > > > > > > >> 2.25.1
> > > > > > > >>
> > > > > > > >>
> > > > > > > >>
> > > > > > > >>
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Alex Kiernan
> > > >
> > > >
> > > >
> > > > --
> > > > Alex Kiernan
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#103455): https://lists.openembedded.org/g/opene=
mbedded-devel/message/103455
> > > > Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [alex.kiernan@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
> > >
> > > --
> > > Alex Kiernan



--=20
Alex Kiernan

