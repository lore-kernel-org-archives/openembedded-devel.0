Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8C2EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 09:46:25 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.6511.1687254383907996945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 02:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fFrYt032;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3422b2554e1so17450165ab.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687254383; x=1689846383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM2eSo2oAVSMB7hGKqxSrK2rQhM/GSOAZhEqq+FyKJU=;
        b=fFrYt032OApKc/GOGqhNrvetmZeZIXqjGh2t9RwsgLNbTM8oCHilrokwTQyUI7WkaN
         caQlT9shmS+dA2Dh0vhhZOe/4ztLyPprHCGp2W6BgmsZ+R2PMjMcAQUMft/utGaweVfA
         Wv62QbQrHV4J9McKUbOOfG0tNvyQEQaMLMkYriYlq9tpCDLjcaWxyng+C2qZSf5bXwEY
         lmZnCI/Wv2+ureomcRR+InJ2QqnKvSRzteoUqTizyDFWJEvFC8M/29jnh8ZBAU0/earv
         vvhXKc7JGuUJyrbYAbfNi0TUR0HP1pY2mcDy4qwoWSSH+BxP0GlRsR/kBaIv4zTxtVpa
         KCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687254383; x=1689846383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM2eSo2oAVSMB7hGKqxSrK2rQhM/GSOAZhEqq+FyKJU=;
        b=XXUarn1awhQXrk2du+Ufw+wNEYRbEczfUG2PGRC/OlpuiDmgkwqYnIWVVT6O5uMFAC
         IOxVU7iahmp1FRxN5hIY3U0/A2gCRVAckE8rii/wo8HSSr69hDRWDfcHCgtVGRn/otY7
         jM2NmVUYO70r94OhBiEuBqfwmYOfm3HY+OR3VZ/aPXJ7B2ln5mwF1QHVPNzmQeQ3ssBK
         5oA8+9nTANj83O6U/BsHqpVLEMxArled6UKF+haqVrV3v2ay+u+WAATd9SobCZ2lr1+b
         siz4k9Uk5SfwR9ALKIA7zC+qWuBss4t1CVCu+Xu7bcs5VjD6M/3L8+ByB13us0WP9J7q
         4gjg==
X-Gm-Message-State: AC+VfDxfAHEGfIYfKGmKzwG80APwoW0/NTZj8M3rwbHVNo7G8mLuZ/8j
	O8CWx0yRB+C4SIchR355nl/4j/OESwDJ8dO5I1A=
X-Google-Smtp-Source: ACHHUZ5dXien34fOLkUwl6wAxUENHdgMecvQqzuju0xp5xMabAb/GmgXLAQwcbCcDlCGUrykUhV5n7AyVSu86sxxpO4=
X-Received: by 2002:a92:d947:0:b0:341:d3c3:c263 with SMTP id
 l7-20020a92d947000000b00341d3c3c263mr7495926ilq.23.1687254382836; Tue, 20 Jun
 2023 02:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com> <CAMKF1sqb07CYybr=CuMiVTGMoM=sBfKxGcyGRYuCLVa9KTdKqw@mail.gmail.com>
In-Reply-To: <CAMKF1sqb07CYybr=CuMiVTGMoM=sBfKxGcyGRYuCLVa9KTdKqw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Jun 2023 10:46:11 +0100
Message-ID: <CAO5Uq5SSdqyk8KQerW6MnfEDve3s2Knweso7kzMU8FcvEEPiOQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Khem Raj <raj.khem@gmail.com>
Cc: Beniamin Sandu <beniaminsandu@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 09:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103449

On Tue, Jun 20, 2023 at 1:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Jun 19, 2023 at 12:14=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail=
.com> wrote:
> >
> > Keeping up with Apple given they take nothing is frankly a right pain, =
adding things which are nice to have rather than just broken seems like we'=
re just adding to the problem. Last time I resynchronized this it took me d=
ays, unless there's a really good reason to do this, or there's a way to ge=
t it upstreamed I'd rather we didn't.
> >
>
> a different question would be, does upstream mdns stick to mbedTLS 2.x
> or is there support for mbedTLS 3.x expected/supported.
>

It's completely closed development, so (personally) I've no idea. The
release of code drops generally seems to follow a MacOS release, which
would suggest there's likely to be one fairly soon once 13.5 ships, so
we might have more of an idea in the next few weeks.

On mbedTLS 3, I don't obviously see that we have a recipe anywhere?

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
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103444): https://lists.openembedded.org/g/openembed=
ded-devel/message/103444
> > Mute This Topic: https://lists.openembedded.org/mt/99629056/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

