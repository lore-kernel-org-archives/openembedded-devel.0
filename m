Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38350EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 12:03:16 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.8451.1687262589194154864
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 05:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cWgpeA2c;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-77e2a18ae50so192639139f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 05:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687262588; x=1689854588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbK2IQEBjbjueoRy2+9NFhM4xyV5Tvgnh5/Dbq+AYa8=;
        b=cWgpeA2cn1VMSkaoTH5xRTqZD7yaYhnuDai6s+6UzbAg+gWg9GdIYcoF7LNVadmn4o
         iMtemYOMCD+byq3uUTwuW7T+Q1SHsULNKSuo4OQ0arbkfygZq0IhArUkOXJPn0Nbt5lR
         NIkI83HN01fIq6ZIiqatMurIFyC/IEZJs8DLd/Kbj4Yo6OLyxmMSjrv48w1AVIgKjkov
         gKu5HDDkbPOK2EviSwt9eCkppRN6QUn+WvD7GK605OzFSJ79NLihDClmqN3IUkTB1fXv
         C4j+k1bnQixy4+u+P7MQAEun/jxiFPlwEPS3JBpXz25jrZx8SWvxeUszaUHqdQhSWPhm
         +PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687262588; x=1689854588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbK2IQEBjbjueoRy2+9NFhM4xyV5Tvgnh5/Dbq+AYa8=;
        b=QPMa/b9Pm4eMq0GgKP92CTlJdiEfPXKy3jA7hNo5SmDKLw0AciT8Ks9ZRQmRfHVm3i
         Qj5Gjv1qDZG9WFZGmWkjPjAwNBQsu2rUICxJlrv+UlL0JAcTgRtI1IAPA5X7D/97lEb4
         oldSxZo9rHMC4xrYolDx+f45wLVgAodiuQJ5H6ibceRhcMliceVJkEiFZ+PVZkgOI4xL
         j6hirunzc8dX1L4YIKPrRpSBWcMFIeRYVilHTQ4LDk40FGdrrArZAcJ8JZGFlLZp/iNR
         wga986hxkVzEPhEKbu5xcXTW7n3Mzv0+oV85uAo9buwYqzDOwI54Oc1X+fnwC5yhS13X
         FokA==
X-Gm-Message-State: AC+VfDwx9QC968Gj/rwhgQ2SA9kn2FSP5S/wuemY1tFhGR1ZNNwVcOyk
	ihLIWtNRrBopRl+FdivATRnk2azVIcbO4cfwSf+cQLal9zM=
X-Google-Smtp-Source: ACHHUZ76RbpE3o8FaYx5kOX5kqA6XlxitJEzKwlrCyio1os+dWvExcXcqaGa5EX1tzeFW5K0oLx3Romu60vupDl5VkU=
X-Received: by 2002:a5e:8516:0:b0:774:8786:1b59 with SMTP id
 i22-20020a5e8516000000b0077487861b59mr11149817ioj.11.1687262587228; Tue, 20
 Jun 2023 05:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
 <CAO5Uq5QVdbRjTVv1USjLBwh3jtT_G6MBTVeSEOX9LjDrUnx6VQ@mail.gmail.com> <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com>
In-Reply-To: <CABQJdOGJOzDrv0dg2zNSN16E3R6zAVrPD1XNs5Kc444kehQctg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Jun 2023 13:02:54 +0100
Message-ID: <CAO5Uq5QycuhEYSjJ+vfnJttHNPKZ_w3AK+kXs27=utY06ownrA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 12:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103455

On Tue, Jun 20, 2023 at 11:53=E2=80=AFAM Beniamin Sandu <beniaminsandu@gmai=
l.com> wrote:
>
> On Tue, Jun 20, 2023 at 12:56=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail=
.com> wrote:
> >
> > On Mon, Jun 19, 2023 at 8:38=E2=80=AFPM Beniamin Sandu <beniaminsandu@g=
mail.com> wrote:
> > >
> > > I am trying to add a v3.x mbedtls recipe to master branch, and withou=
t
> >
> > Sorry, was reading the thread out of order and missed that you were
> > trying to add an Mbed TLS 3 recipe!
> >
> > > this patch, mdns does not build. I could not find an obvious way to
> > > submit upstream patches to mdns from a quick search, otherwise I woul=
d
> > > gladly do it.
> > >
> >
> > Several folk have tried sending them to dts@apple.com (seemingly
> > without success), there's also a couple of attempted PRs on github
> > (again seemingly going nowhere). Winding back about 20 years, I tried
> > to get a bunch of portability fixes into the Quicktime Streaming
> > Server without success - the model appears to very much be open
> > source, not open contribution.
> >
> > > While I am with you on trying to reduce technical debt within yocto
> > > layers, this one is very small and rather harmless, so I hope we can
> > > make a sacrifice for the greater good. :)
> > >
> >
> > I'm guessing we'll need to scope an Mbed TLS 3 recipe as being
> > explicitly mbedtls3_...? So sticking with 2.x doesn't feel like a
> > terrible option, but I agree its not ideal.
>
> This also sounds like a fairly decent option, having a separate
> mbedtls3 package might make it easier in general, although I am not
> aware of how used the current v2 version actually is.
>

Looks like we're out of date (there's a 2.28.3), but it's still
supported for now... "Mbed TLS 2.28 is a long-time support branch. It
will be supported with bug-fixes and security fixes until end of
2024."

> >
> > My concern isn't really with the one liner now, its the how hard does
> > it become to do the upgrades down the road - if we suddenly can't
> > upgrade because upstream's stuck on 2.x and there's something
> > incompatible with 3.x what do we do?
> >
> > > Cheers,
> > > Beni
> > >
> > >
> > > On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.kiernan@g=
mail.com> wrote:
> > > >
> > > > Keeping up with Apple given they take nothing is frankly a right pa=
in, adding things which are nice to have rather than just broken seems like=
 we're just adding to the problem. Last time I resynchronized this it took =
me days, unless there's a really good reason to do this, or there's a way t=
o get it upstreamed I'd rather we didn't.
> > > >
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
> > > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >> Links: You receive all messages sent to this group.
> > > >> View/Reply Online (#103440): https://lists.openembedded.org/g/open=
embedded-devel/message/103440
> > > >> Mute This Topic: https://lists.openembedded.org/mt/99629056/361809=
7
> > > >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/u=
nsub [alex.kiernan@gmail.com]
> > > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >>
> >
> >
> >
> > --
> > Alex Kiernan



--=20
Alex Kiernan

