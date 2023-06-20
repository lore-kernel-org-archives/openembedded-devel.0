Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67FEEB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 10:53:55 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.7525.1687258428763800717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 03:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lmPwTQ1c;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: beniaminsandu@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-39ecbb4c7d3so1777647b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687258428; x=1689850428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdyc63h23I3AqLQI3CNIE2IG9dNcBZQOQ7WaRkGLLSc=;
        b=lmPwTQ1cQXuW51IMxYyGyra4DSh+ej3L6rMWB+HqMpC1EJ3IwLwasLF1Np+NWNqVBW
         TT9q5gR+GxBtJ4Il41hlFMoCusL3e5HXbF9WTwsXyfycEoUFwKOLuzCoJitEvzRvpLd1
         fCi6kshA6fIU9c8PXxC/inHx4MrsAtw8DOBDfgdhWiap6CLRN9QKAQPAP6u0AUgHiTzq
         neA5RTOV+xzrWRXrjwDxTqx+MRxKkBSaGeCkT/apthU9HnvFw2z8XAKxVv91LVelHWhL
         7Ovr5HxYNPt/aonZ0IFZ1bqzHfOH/1bAPhy1CDQLcRnB8kKYIXFwOgr/uvp7MNN6OABy
         gnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687258428; x=1689850428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdyc63h23I3AqLQI3CNIE2IG9dNcBZQOQ7WaRkGLLSc=;
        b=EosmXNzdnaYkxruzhzfqF/Shq8zFep1+Tn+iFCT7znYDxioDwQQcf9TMNUPj1jftom
         y83EOkJPQ6ZXXGmcRBqYhfAJHiAR6thASRq/KBLc9GxPc6rnQvSpzbx+8CnR6iqNeJJy
         x5n00MYHZntPAWcNnW5jw6oaCrqcAM9fGlu85Dzp5l7y2EzxD2UDgF2fQDGusOSfb+Nm
         NYDbL0xzxJfe4j0URdaVvnV2Y8s1m/RMULLrkDNrx2V8S/Pzvfg5+ufyMgtUaWQgWAEU
         T/TbgwgasX4U8wwF7xzngza7PZpOZVZmmXIgSthql9gaDw72yyQPzWB+JpNL6EuH4hXo
         y1gw==
X-Gm-Message-State: AC+VfDzx0ju+BcIOOG+9BG6csNYj5FWmC2HCR34rcV2RPQpNILiBq6NY
	9NQZ1a1zNo39mWgx+70ks7oeQiK9PmA18SSWjn4=
X-Google-Smtp-Source: ACHHUZ79hkJ3IKFUVN+knvsmj4FJRa+1/G20JkCBc+19F967cGuNTPcQ0jKVQ3+V6UOmuHnMYJ69vgwOJI4VJTPGm60=
X-Received: by 2002:a05:6808:19a4:b0:3a0:3a08:1847 with SMTP id
 bj36-20020a05680819a400b003a03a081847mr1447315oib.40.1687258427931; Tue, 20
 Jun 2023 03:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com> <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Tue, 20 Jun 2023 13:53:36 +0300
Message-ID: <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 10:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103454

On Tue, Jun 20, 2023 at 12:56=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <beniaminsandu@gma=
il.com> wrote:
> >
> > I am trying to add a v3.x mbedtls recipe to master branch, and without
>
> Sorry, was reading the thread out of order and missed that you were
> trying to add an Mbed TLS 3 recipe!
>
> > this patch, mdns does not build. I could not find an obvious way to
> > submit upstream patches to mdns from a quick search, otherwise I would
> > gladly do it.
> >
>
> Several folk have tried sending them to dts@apple.com (seemingly
> without success), there's also a couple of attempted PRs on github
> (again seemingly going nowhere). Winding back about 20 years, I tried
> to get a bunch of portability fixes into the Quicktime Streaming
> Server without success - the model appears to very much be open
> source, not open contribution.
>
> > While I am with you on trying to reduce technical debt within yocto
> > layers, this one is very small and rather harmless, so I hope we can
> > make a sacrifice for the greater good. :)
> >
>
> I'm guessing we'll need to scope an Mbed TLS 3 recipe as being
> explicitly mbedtls3_...? So sticking with 2.x doesn't feel like a
> terrible option, but I agree its not ideal.

This also sounds like a fairly decent option, having a separate
mbedtls3 package might make it easier in general, although I am not
aware of how used the current v2 version actually is.

>
> My concern isn't really with the one liner now, its the how hard does
> it become to do the upgrades down the road - if we suddenly can't
> upgrade because upstream's stuck on 2.x and there's something
> incompatible with 3.x what do we do?
>
> > Cheers,
> > Beni
> >
> >
> > On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.kiernan@gma=
il.com> wrote:
> > >
> > > Keeping up with Apple given they take nothing is frankly a right pain=
, adding things which are nice to have rather than just broken seems like w=
e're just adding to the problem. Last time I resynchronized this it took me=
 days, unless there's a really good reason to do this, or there's a way to =
get it upstreamed I'd rather we didn't.
> > >
> > >
> > > On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gmail.com> =
wrote:
> > >>
> > >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > >> ---
> > >>  .../mdns/0009-remove-unneeded-headers.patch   | 33 ++++++++++++++++=
+++
> > >>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
> > >>  2 files changed, 34 insertions(+)
> > >>  create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0009=
-remove-unneeded-headers.patch
> > >>
> > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove=
-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-=
remove-unneeded-headers.patch
> > >> new file mode 100644
> > >> index 000000000..74d387368
> > >> --- /dev/null
> > >> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneed=
ed-headers.patch
> > >> @@ -0,0 +1,33 @@
> > >> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00 2=
001
> > >> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > >> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> > >> +Subject: [PATCH] remove unneeded headers
> > >> +
> > >> +From a quick look, these seem to not be needed and having them
> > >> +breaks the build with mbedtls 3.x. Without them it builds fine
> > >> +on both 2.x and 3.x versions.
> > >> +
> > >> +Upstream-Status: Pending
> > >> +
> > >> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > >> +---
> > >> + mDNSPosix/mbedtls.c | 2 --
> > >> + 1 file changed, 2 deletions(-)
> > >> +
> > >> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > >> +index a73681b..ab8f8c7 100644
> > >> +--- a/mDNSPosix/mbedtls.c
> > >> ++++ b/mDNSPosix/mbedtls.c
> > >> +@@ -38,10 +38,8 @@
> > >> + #include <mbedtls/sha256.h>
> > >> + #include <mbedtls/base64.h>
> > >> +
> > >> +-#include <mbedtls/certs.h>
> > >> + #include <mbedtls/x509.h>
> > >> + #include <mbedtls/ssl.h>
> > >> +-#include <mbedtls/config.h>
> > >> +
> > >> + // Posix TLS server context
> > >> + struct TLSContext_struct {
> > >> +--
> > >> +2.34.1
> > >> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.=
bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > >> index 612d343c8..46f1b70cb 100644
> > >> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > >> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> > >> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-distributi=
ons/mDNSResponder;protocol=3Dhttps
> > >>             file://0006-Handle-noisy-netlink-sockets.patch \
> > >>             file://0007-Mark-deleted-interfaces-as-being-changed.pat=
ch \
> > >>             file://0008-Handle-errors-from-socket-calls.patch \
> > >> +           file://0009-remove-unneeded-headers.patch \
> > >>             file://mdns.service \
> > >>             "
> > >>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
> > >> --
> > >> 2.25.1
> > >>
> > >>
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> Links: You receive all messages sent to this group.
> > >> View/Reply Online (#103440): https://lists.openembedded.org/g/openem=
bedded-devel/message/103440
> > >> Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
> > >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [alex.kiernan@gmail.com]
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>
>
>
>
> --
> Alex Kiernan

