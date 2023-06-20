Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D1FEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 18:12:24 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.1460.1687284738551488276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 11:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=L5d2HYbh;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1a98a7fde3fso4731818fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687284738; x=1689876738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+v6OWbMjyOJ9CBykKC6MqKsa4st27PZpQvfM5jL0h78=;
        b=L5d2HYbheaspZhKsrVXPaTDh8XZhfneLPUJ9A6kqiMdRDHJ+FFtAGfRB0BSvHKm46b
         TVLjOgdzsZ07hEtZm7qbkb9OdK6jaL2qzGJAWsIktz/yZCdX4grA9fMEnrybtBLWtegn
         Usn0kjDoEVcSn1S7+QPeUV4Lsab8wmkIMq9YjMrv4mjC00MDEF8E6Lu20brr4ix0toJO
         4YHp3XO95BLaMNkHvmnIL0mSv9uQ/I7JwfCDCHFmVDa0US6ggTEtKFpgQC5CV4B4YuJ4
         XS/kbV9yYD4bzeFhT+Svc957HX3lY/G7Ga4MIpT7YxZtd1POFu4pfHvtWK8xlz726TJD
         bQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687284738; x=1689876738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v6OWbMjyOJ9CBykKC6MqKsa4st27PZpQvfM5jL0h78=;
        b=FKmxQZMP3hkHRdlAICHUuNdetHGhJ9G4OZphTKkgb0uLdBUkOG9AQiXOwFck2DywT6
         YGFCl2Xrgn3HxH4SwPCpP6ytP7llPbo3Iabe/d4BuvAuvkl2YKyIHgWdO61oimEnfb+E
         RZnMBHpyr4gpUCKu08py3vo2lXPQnLxo1H8FGYlBy3eqYLTIG7LCHXc5bfSjk4b0SzMv
         RKsAjI3l6oP7u/5uM1VwI5Nhr19gB9xan0bqE+Pa4vghwqJ+K51g2XzmfGZmw+pG8Loh
         Qe9Qubn+rj0HDPmn8lepWDvKiHFVCL9Uq+2HXRkK0b/UAKqSSyJfLp2Lex0ylxlC32pT
         mPrw==
X-Gm-Message-State: AC+VfDwPYyAihsjfBo6C/VLEOQQpWPSUWodcGMLq1kP+yX7nDaZOuP4/
	R/lg1qqiriktc0f5nT2az2L+w5v/D3OHT2miiQ+aQe+m
X-Google-Smtp-Source: ACHHUZ45mpbpjYrd4ZaYpw1YaqKsEMVpcv3hJqUVGIIgsLic4AU/mCm63Nt8tcGEtNckKB0NK247/z2aSev0h1XmLA0=
X-Received: by 2002:a05:6870:3845:b0:1a9:9847:b485 with SMTP id
 z5-20020a056870384500b001a99847b485mr9125919oal.2.1687284737679; Tue, 20 Jun
 2023 11:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
 <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
 <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com>
 <176A5C62B6CFBD15.4070@lists.openembedded.org> <CAO5Uq5TMWYSJbSLOciykBcMGV+vz72mpGi=dXECm_VN2GpuBgg@mail.gmail.com>
 <CABQJdOGpQ5LS9MneXahSkYyfBJZSyHEZvUczi6DqDJFTgxFY5w@mail.gmail.com>
 <CABQJdOGC2edPg50oOW6QhwiTxvH=Lxp97k8zoEBRVz5Y1ta-vA@mail.gmail.com> <CAO5Uq5QKfwvB8h30xuSjnAceH6JV8qvy6hSec-4nJf_+zam6Tw@mail.gmail.com>
In-Reply-To: <CAO5Uq5QKfwvB8h30xuSjnAceH6JV8qvy6hSec-4nJf_+zam6Tw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jun 2023 11:11:51 -0700
Message-ID: <CAMKF1srqf+ki60OodaHYe0=ZF9+-ntE7R04yQ9DLujAGzcMneg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Beniamin Sandu <beniaminsandu@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 18:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103467

On Tue, Jun 20, 2023 at 9:43=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> On Tue, Jun 20, 2023 at 5:38=E2=80=AFPM Beniamin Sandu <beniaminsandu@gma=
il.com> wrote:
> >
> > On Tue, Jun 20, 2023 at 4:12=E2=80=AFPM Beniamin Sandu <beniaminsandu@g=
mail.com> wrote:
> > >
> > > On Tue, Jun 20, 2023 at 3:42=E2=80=AFPM Alex Kiernan <alex.kiernan@gm=
ail.com> wrote:
> > > >
> > > > On Tue, Jun 20, 2023 at 1:03=E2=80=AFPM Alex Kiernan via
> > > > lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded=
.org>
> > > > wrote:
> > > > >
> > > > > On Tue, Jun 20, 2023 at 11:53=E2=80=AFAM Beniamin Sandu <beniamin=
sandu@gmail.com> wrote:
> > > > > >
> > > > > > On Tue, Jun 20, 2023 at 12:56=E2=80=AFPM Alex Kiernan <alex.kie=
rnan@gmail.com> wrote:
> > > > > > >
> > > > > > > On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <benia=
minsandu@gmail.com> wrote:
> > > > > > > >
> > > > > > > > I am trying to add a v3.x mbedtls recipe to master branch, =
and without
> > > > > > >
> > > > > > > Sorry, was reading the thread out of order and missed that yo=
u were
> > > > > > > trying to add an Mbed TLS 3 recipe!
> > > > > > >
> > > > > > > > this patch, mdns does not build. I could not find an obviou=
s way to
> > > > > > > > submit upstream patches to mdns from a quick search, otherw=
ise I would
> > > > > > > > gladly do it.
> > > > > > > >
> > > > > > >
> > > > > > > Several folk have tried sending them to dts@apple.com (seemin=
gly
> > > > > > > without success), there's also a couple of attempted PRs on g=
ithub
> > > > > > > (again seemingly going nowhere). Winding back about 20 years,=
 I tried
> > > > > > > to get a bunch of portability fixes into the Quicktime Stream=
ing
> > > > > > > Server without success - the model appears to very much be op=
en
> > > > > > > source, not open contribution.
> > > > > > >
> > > > > > > > While I am with you on trying to reduce technical debt with=
in yocto
> > > > > > > > layers, this one is very small and rather harmless, so I ho=
pe we can
> > > > > > > > make a sacrifice for the greater good. :)
> > > > > > > >
> > > > > > >
> > > > > > > I'm guessing we'll need to scope an Mbed TLS 3 recipe as bein=
g
> > > > > > > explicitly mbedtls3_...? So sticking with 2.x doesn't feel li=
ke a
> > > > > > > terrible option, but I agree its not ideal.
> > > > > >
> > > > > > This also sounds like a fairly decent option, having a separate
> > > > > > mbedtls3 package might make it easier in general, although I am=
 not
> > > > > > aware of how used the current v2 version actually is.
> > > > > >
> > > > >
> > > > > Looks like we're out of date (there's a 2.28.3), but it's still
> > > > > supported for now... "Mbed TLS 2.28 is a long-time support branch=
. It
> > > > > will be supported with bug-fixes and security fixes until end of
> > > > > 2024."
> > > > >
> > > >
> > > > Will send an update for 2.28.3, but constrain `devtool upgrade` to
> > > > things on the 2.x branch
> > > >
> > > > One thought on 3.x - if mdns is the only failure maybe rename the
> > > > current recipe to mbedtls2_% and add 3.x as mbedtls_% and then fix =
up
> > > > the mdns recipe to consume mbedtls2?
> > > >
> > >
> > > Personally I would say it is not worth to do it, just because of this
> > > one package. Plus, it's building fine with both versions by including
> > > this small patch, but maybe Khem Raj can chime in with an opinion
> > > here.

yeah, I agree. Its better to maintain one version if we can.

> > >
> >
> > While looking through some stuff, I discovered some variable I had no
> > idea exists, called DEFAULT_PREFERENCE:
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-DEFAULT_PR=
EFERENCE
> >
> > Seems it could be a very simple way to make mbedtls v2 be the
> > "default" version unless specified by user through PREFERRED_PROVIDER?
> >
>
> It works, but if you have two recipes with conflicting requirements
> (which I do for some other things), it doesn't really help...
>
> Probably I'm leaning towards just upgrading to 3.x and taking the
> mDNSResponder patch, I just worry about where Apple go...
>
> > > > > > >
> > > > > > > My concern isn't really with the one liner now, its the how h=
ard does
> > > > > > > it become to do the upgrades down the road - if we suddenly c=
an't
> > > > > > > upgrade because upstream's stuck on 2.x and there's something
> > > > > > > incompatible with 3.x what do we do?
> > > > > > >
> > > > > > > > Cheers,
> > > > > > > > Beni
> > > > > > > >
> > > > > > > >
> > > > > > > > On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex=
.kiernan@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Keeping up with Apple given they take nothing is frankly =
a right pain, adding things which are nice to have rather than just broken =
seems like we're just adding to the problem. Last time I resynchronized thi=
s it took me days, unless there's a really good reason to do this, or there=
's a way to get it upstreamed I'd rather we didn't.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu=
@gmail.com> wrote:
> > > > > > > > >>
> > > > > > > > >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > > >> ---
> > > > > > > > >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++=
+++++++++++++++
> > > > > > > > >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> > > > > > > > >>  2 files changed, 34 insertions(+)
> > > > > > > > >>  create mode 100644 meta-networking/recipes-protocols/md=
ns/mdns/0009-remove-unneeded-headers.patch
> > > > > > > > >>
> > > > > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns=
/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdn=
s/mdns/0009-remove-unneeded-headers.patch
> > > > > > > > >> new file mode 100644
> > > > > > > > >> index 000000000..74d387368
> > > > > > > > >> --- /dev/null
> > > > > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-r=
emove-unneeded-headers.patch
> > > > > > > > >> @@ -0,0 +1,33 @@
> > > > > > > > >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 1=
7 00:00:00 2001
> > > > > > > > >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > > >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> > > > > > > > >> +Subject: [PATCH] remove unneeded headers
> > > > > > > > >> +
> > > > > > > > >> +From a quick look, these seem to not be needed and havi=
ng them
> > > > > > > > >> +breaks the build with mbedtls 3.x. Without them it buil=
ds fine
> > > > > > > > >> +on both 2.x and 3.x versions.
> > > > > > > > >> +
> > > > > > > > >> +Upstream-Status: Pending
> > > > > > > > >> +
> > > > > > > > >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > > >> +---
> > > > > > > > >> + mDNSPosix/mbedtls.c | 2 --
> > > > > > > > >> + 1 file changed, 2 deletions(-)
> > > > > > > > >> +
> > > > > > > > >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > > > > > > > >> +index a73681b..ab8f8c7 100644
> > > > > > > > >> +--- a/mDNSPosix/mbedtls.c
> > > > > > > > >> ++++ b/mDNSPosix/mbedtls.c
> > > > > > > > >> +@@ -38,10 +38,8 @@
> > > > > > > > >> + #include <mbedtls/sha256.h>
> > > > > > > > >> + #include <mbedtls/base64.h>
> > > > > > > > >> +
> > > > > > > > >> +-#include <mbedtls/certs.h>
> > > > > > > > >> + #include <mbedtls/x509.h>
> > > > > > > > >> + #include <mbedtls/ssl.h>
> > > > > > > > >> +-#include <mbedtls/config.h>
> > > > > > > > >> +
> > > > > > > > >> + // Posix TLS server context
> > > > > > > > >> + struct TLSContext_struct {
> > > > > > > > >> +--
> > > > > > > > >> +2.34.1
> > > > > > > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns=
_1790.80.10.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > > > > > > >> index 612d343c8..46f1b70cb 100644
> > > > > > > > >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.8=
0.10.bb
> > > > > > > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.8=
0.10.bb
> > > > > > > > >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-os=
s-distributions/mDNSResponder;protocol=3Dhttps
> > > > > > > > >>             file://0006-Handle-noisy-netlink-sockets.pat=
ch \
> > > > > > > > >>             file://0007-Mark-deleted-interfaces-as-being=
-changed.patch \
> > > > > > > > >>             file://0008-Handle-errors-from-socket-calls.=
patch \
> > > > > > > > >> +           file://0009-remove-unneeded-headers.patch \
> > > > > > > > >>             file://mdns.service \
> > > > > > > > >>             "
> > > > > > > > >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> > > > > > > > >> --
> > > > > > > > >> 2.25.1
> > > > > > > > >>
> > > > > > > > >>
> > > > > > > > >>
> > > > > > > > >>
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Alex Kiernan
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Alex Kiernan
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Alex Kiernan
>
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103462): https://lists.openembedded.org/g/openembedde=
d-devel/message/103462
> Mute This Topic: https://lists.openembedded.org/mt/99629056/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

