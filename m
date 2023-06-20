Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8943EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 09:58:15 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.6735.1687255086427317425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 02:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KEbcIbH9;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-77e24ace5a8so204713239f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687255085; x=1689847085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8lWjvVgnsFhGwrbBJBWE1iPupJ15f9GNtChd/sFzOY=;
        b=KEbcIbH9Pa4Mb98htRjgedWAlt0cjiN1OSVGMC0dJk1oPS8XMyCo+6YZovaBm0RKCG
         dBe/5QX2RwBR6w9mJnRk657YBhGFV8JxCf/Pfzn+ty4idETSxpGAyN1A+u3G2q/uiSYJ
         ckFlVI+8JDih6zIYlSNockuBqkkq/AZ9aYwYM3zQGYS+88r7qqPnAqo8R2trd0OC73tM
         Z3KP9s/U2WxJctXAkmFUikGM5wVQpnM2ZuUu3swqtf0bikXk7m74A1l/oAH9L2xbgj0A
         HV6XM0yYv/CTTE7bhSBj6/0Zy2W0iGGD8W1DjFEMstNd8yLSO540usdPLZ2HAzvRF47k
         9/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687255085; x=1689847085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8lWjvVgnsFhGwrbBJBWE1iPupJ15f9GNtChd/sFzOY=;
        b=AHFXxnCyjpTbTLHzsTtpuRxZM8dV+LBJn0R7sV0aabTGW+rdeQs3A2Kv3LlXmjbi3O
         9Y+3gefuyXV9I2KqN8Q4SB5dJBJNBRm7Zq1nOZL6cbgFKsHix+6dCOvQro4QHzmKij1a
         SxqwJqYyDl1QaH7nCJRupdLBuLDRJ423TaHgsIp5BgAs7OaSpa3l/IwP1/eeMWQ1uRj5
         LMJ0pPJ8ff1rIgipmTcV/m2hpS13Bzokef6YqGz8UjMiiSM3kbfsTsaUHMRiB70clqjf
         f6G95T5VvwAZE1XU+Wcvo+wAIXAwLXEj2qTrOz8iRQCu5Lk/CqOvW/UF6ZwG4Se25gnC
         zE/g==
X-Gm-Message-State: AC+VfDwjYYmjfToKrh1HWNToZe0IlRWrrSS8qLBj0+xle6Giw3N1cxo+
	OLYnVMKUz6T7JiGX/mxgHHAMPz56KyMJb27fwm0DrOa6
X-Google-Smtp-Source: ACHHUZ7kc/MoEjqd8+M02yC2zBEePr6v3LDrjXMfw6266w8Fyj6FS+eJ0XLPU4shIQFZili+J60buAFn1ZGM0sPG/O0=
X-Received: by 2002:a5e:a70c:0:b0:77e:4234:4 with SMTP id b12-20020a5ea70c000000b0077e42340004mr5595619iod.19.1687255085604;
 Tue, 20 Jun 2023 02:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CAMKF1sqb07CYybr=CuMiVTGMoM=sBfKxGcyGRYuCLVa9KTdKqw@mail.gmail.com>
 <CAO5Uq5SSdqyk8KQerW6MnfEDve3s2Knweso7kzMU8FcvEEPiOQ@mail.gmail.com> <CABQJdOGNvtKohGcD_geny3+aJ12SqwiK3vjLpjB=o6c_uqjzYw@mail.gmail.com>
In-Reply-To: <CABQJdOGNvtKohGcD_geny3+aJ12SqwiK3vjLpjB=o6c_uqjzYw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Jun 2023 10:57:54 +0100
Message-ID: <CAO5Uq5THj-5d7=_7G6-yahHkauOGEfAz37OfwTqP7UMrsJzBUw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 09:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103452

On Tue, Jun 20, 2023 at 10:55=E2=80=AFAM Beniamin Sandu <beniaminsandu@gmai=
l.com> wrote:
>
> There is one on master-next, it is currently going through the CI runs
> (I think): https://git.openembedded.org/meta-openembedded/commit/?h=3Dmas=
ter-next&id=3D9cb5f5c6e91612674eb02f79437abbd51ad7b38f.
> I have tested this one on my side with a couple of different machines
> on both poky with glibc and yoe with musl, seems fine so far. Mbedtls
> v2 will still be available, so the end user can build with that if
> preferred.
>
> On a different note, seems the oe patches got added to a PR on github
> for mdns: https://github.com/apple-oss-distributions/mDNSResponder/pull/2=
,
> and someone accepted this last week. Not sure if it's going to do
> anything, but maybe there is some hope of having them in a future
> release, even if it's very opaque by nature.
>

I suspect that's just a lack of process embedded in the repo, so
anyone can review/approve...

> On Tue, Jun 20, 2023 at 12:46=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail=
.com> wrote:
> >
> > On Tue, Jun 20, 2023 at 1:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > On Mon, Jun 19, 2023 at 12:14=E2=80=AFPM Alex Kiernan <alex.kiernan@g=
mail.com> wrote:
> > > >
> > > > Keeping up with Apple given they take nothing is frankly a right pa=
in, adding things which are nice to have rather than just broken seems like=
 we're just adding to the problem. Last time I resynchronized this it took =
me days, unless there's a really good reason to do this, or there's a way t=
o get it upstreamed I'd rather we didn't.
> > > >
> > >
> > > a different question would be, does upstream mdns stick to mbedTLS 2.=
x
> > > or is there support for mbedTLS 3.x expected/supported.
> > >
> >
> > It's completely closed development, so (personally) I've no idea. The
> > release of code drops generally seems to follow a MacOS release, which
> > would suggest there's likely to be one fairly soon once 13.5 ships, so
> > we might have more of an idea in the next few weeks.
> >
> > On mbedTLS 3, I don't obviously see that we have a recipe anywhere?
> >
> > > >
> > > > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gmail.com=
> wrote:
> > > >>
> > > >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > >> ---
> > > >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++++++++++++=
+++++
> > > >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> > > >>  2 files changed, 34 insertions(+)
> > > >>  create mode 100644 meta-networking/recipes-protocols/mdns/mdns/00=
09-remove-unneeded-headers.patch
> > > >>
> > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remo=
ve-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/000=
9-remove-unneeded-headers.patch
> > > >> new file mode 100644
> > > >> index 000000000..74d387368
> > > >> --- /dev/null
> > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unne=
eded-headers.patch
> > > >> @@ -0,0 +1,33 @@
> > > >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00=
 2001
> > > >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> > > >> +Subject: [PATCH] remove unneeded headers
> > > >> +
> > > >> +From a quick look, these seem to not be needed and having them
> > > >> +breaks the build with mbedtls 3.x. Without them it builds fine
> > > >> +on both 2.x and 3.x versions.
> > > >> +
> > > >> +Upstream-Status: Pending
> > > >> +
> > > >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > >> +---
> > > >> + mDNSPosix/mbedtls.c | 2 --
> > > >> + 1 file changed, 2 deletions(-)
> > > >> +
> > > >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > > >> +index a73681b..ab8f8c7 100644
> > > >> +--- a/mDNSPosix/mbedtls.c
> > > >> ++++ b/mDNSPosix/mbedtls.c
> > > >> +@@ -38,10 +38,8 @@
> > > >> + #include <mbedtls/sha256.h>
> > > >> + #include <mbedtls/base64.h>
> > > >> +
> > > >> +-#include <mbedtls/certs.h>
> > > >> + #include <mbedtls/x509.h>
> > > >> + #include <mbedtls/ssl.h>
> > > >> +-#include <mbedtls/config.h>
> > > >> +
> > > >> + // Posix TLS server context
> > > >> + struct TLSContext_struct {
> > > >> +--
> > > >> +2.34.1
> > > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.1=
0.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > >> index 612d343c8..46f1b70cb 100644
> > > >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > > >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-distribu=
tions/mDNSResponder;protocol=3Dhttps
> > > >>             file://0006-Handle-noisy-netlink-sockets.patch \
> > > >>             file://0007-Mark-deleted-interfaces-as-being-changed.p=
atch \
> > > >>             file://0008-Handle-errors-from-socket-calls.patch \
> > > >> +           file://0009-remove-unneeded-headers.patch \
> > > >>             file://mdns.service \
> > > >>             "
> > > >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> > > >> --
> > > >> 2.25.1
> > > >>
> > > >>
> > > >>
> > > >>
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#103444): https://lists.openembedded.org/g/opene=
mbedded-devel/message/103444
> > > > Mute This Topic: https://lists.openembedded.org/mt/99629056/1997914
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> >
> >
> >
> > --
> > Alex Kiernan



--=20
Alex Kiernan

