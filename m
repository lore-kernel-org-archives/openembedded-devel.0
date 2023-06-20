Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98319EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 09:55:35 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.6710.1687254930332654706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 02:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oBiXupau;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: beniaminsandu@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-39ecf336d85so1857844b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687254929; x=1689846929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUpKbvBOQqg4LRZ2LTYU+9Q7YMNQq0lAUHRmgiYV8X0=;
        b=oBiXupaud3xLEP9Q823TojOktdFmodZpJMxEkoFhBZZocc4BdE863TMyAs3yCjovPN
         Wq96EXiL0jXYgMpsM/T3CeLwcry6GeAA5/BR6gVUi0n9FaGY0W8qIW8I6e1KgQ9qr83E
         uqXJ4+Ro5DB94PdTlfsVyb2fvKpFp7qTOBt4ufuWN5govLrraxkpqk8q3Ehh/WEOKjRl
         rKD9u+r3BUxeygsMpj2C1RIIeWz3wqQKEYAqtBo+bFaK4qUxZLVXTmPyQuv2SaLnq3i9
         e1P+ZvwHgGPX7ogHeTm0pxyVAOv/ePhjRrsMZr9G1nopcM5TkpPRvc8CTdz/cybM14pM
         E02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687254929; x=1689846929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUpKbvBOQqg4LRZ2LTYU+9Q7YMNQq0lAUHRmgiYV8X0=;
        b=EGVwyjZW+etSeIQlTcvYHmj8hO5FukqWgv2FdrG+ZHtga1ZuCRM1vzSqg5DbWpksev
         KDFU8MVbybPvW2Cx8iKB+CxvANd7advx6yKyRZp1yasaIj5Lm0LxLmQsC1sSM1PrWiHb
         DQpN4hB2O4xJ2dOv3bJXcx2QPV4zPiyR+vBLzWg546aV4/w8SwWbWnaKCfIpGskpg/yh
         RYXAjwNkqSepO6i6n5og543ikd6V6fLYNnAZ2+F32+AIVsMJcgCOIEvJFXNyRrBwXmLf
         g/eangPXFu4C5lqOL4D86vlxIerZvSIyxYBNejihSHGmahewGZCyaWiXm9e+sCAUirAI
         l+gA==
X-Gm-Message-State: AC+VfDwvJEyA9E4WMyWM7LKnhl7GJBR6k9vDq7dNtDg+uHlFGIqiPhwh
	hzQcFH6eE+TWpQC+mmLhT50X5C2KDzpf1SuDdWw=
X-Google-Smtp-Source: ACHHUZ6lOebRZfy9msBobtxHm7d4EtmJCi50c0FW4P5tXkR+VLEgOt0y3pCQQ2jrjAwRGlYJyqF9uxeQrjqkE7wMMCU=
X-Received: by 2002:a05:6808:1826:b0:3a0:2b02:d301 with SMTP id
 bh38-20020a056808182600b003a02b02d301mr3902013oib.54.1687254929549; Tue, 20
 Jun 2023 02:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CAMKF1sqb07CYybr=CuMiVTGMoM=sBfKxGcyGRYuCLVa9KTdKqw@mail.gmail.com> <CAO5Uq5SSdqyk8KQerW6MnfEDve3s2Knweso7kzMU8FcvEEPiOQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5SSdqyk8KQerW6MnfEDve3s2Knweso7kzMU8FcvEEPiOQ@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Tue, 20 Jun 2023 12:55:18 +0300
Message-ID: <CABQJdOGNvtKohGcD_geny3+aJ12SqwiK3vjLpjB=o6c_uqjzYw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 09:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103450

There is one on master-next, it is currently going through the CI runs
(I think): https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaste=
r-next&id=3D9cb5f5c6e91612674eb02f79437abbd51ad7b38f.
I have tested this one on my side with a couple of different machines
on both poky with glibc and yoe with musl, seems fine so far. Mbedtls
v2 will still be available, so the end user can build with that if
preferred.

On a different note, seems the oe patches got added to a PR on github
for mdns: https://github.com/apple-oss-distributions/mDNSResponder/pull/2,
and someone accepted this last week. Not sure if it's going to do
anything, but maybe there is some hope of having them in a future
release, even if it's very opaque by nature.

On Tue, Jun 20, 2023 at 12:46=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> On Tue, Jun 20, 2023 at 1:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Mon, Jun 19, 2023 at 12:14=E2=80=AFPM Alex Kiernan <alex.kiernan@gma=
il.com> wrote:
> > >
> > > Keeping up with Apple given they take nothing is frankly a right pain=
, adding things which are nice to have rather than just broken seems like w=
e're just adding to the problem. Last time I resynchronized this it took me=
 days, unless there's a really good reason to do this, or there's a way to =
get it upstreamed I'd rather we didn't.
> > >
> >
> > a different question would be, does upstream mdns stick to mbedTLS 2.x
> > or is there support for mbedTLS 3.x expected/supported.
> >
>
> It's completely closed development, so (personally) I've no idea. The
> release of code drops generally seems to follow a MacOS release, which
> would suggest there's likely to be one fairly soon once 13.5 ships, so
> we might have more of an idea in the next few weeks.
>
> On mbedTLS 3, I don't obviously see that we have a recipe anywhere?
>
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
> > >>
> > >>
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#103444): https://lists.openembedded.org/g/openemb=
edded-devel/message/103444
> > > Mute This Topic: https://lists.openembedded.org/mt/99629056/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> Alex Kiernan

