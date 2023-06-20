Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B867EEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 10:18:06 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.6911.1687256278359886677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 03:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gW5Oytxm;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: beniaminsandu@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-39e9d1bf835so2901137b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687256277; x=1689848277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bO0R2YKdkx+isYr8cO5+GuEr8Pdgqh3Z0eCSo5wGjs=;
        b=gW5OytxmPo0S2owuDCZH730e9OvJT42NJXjyH58J4eij9EcPmDRxHRLcl/xigeGhJO
         rg4u9q+DfRT5fK4zilL2AYyehT68Uvq9LWRiBh/KDvkZplRi/fcUYMTKC1F5yOSDdgic
         S7sB3tq6M0kdkUGAd9Ez38ghbfxxVjJsmBr4A+7sMcxTWvzXvl64IIzSgYQMXGk+/Xoe
         2ekr8FtfBICX/OBih5P+YwxnMiTgFeRgMENMYAiecu/l4sMB/uv81jRmqBYTeGLbJDkC
         c/ewcXxxC3d3FOaaqq36aKYCdJwxFvVwPH55sDUeBCGLffNj+rB4s0cvmYB3GIXpVe6Z
         eXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687256277; x=1689848277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bO0R2YKdkx+isYr8cO5+GuEr8Pdgqh3Z0eCSo5wGjs=;
        b=ImoN0aluyzDw0z1C58fg7xjZXENmGJSKolTEKJLN4xuD9nCO4QUJmobjZtDk529tzF
         pYHoNpIMyDZnaK+Sh6q7YRYiEqw+7QpkxXTbFopzTWK0GCLpxGatj9PjRy9YUkXZ4TaU
         t3fXQfMk/ZD2H3gyKp5K4iVRenDPp2fEgWZ+y+O5VIMu4E7GQ/4NYbpeJsmfiWHwMVw8
         1uoCdXyIIxuknh56YbO/itWNgcOg26vBjGigOjX4vn1HlYLwxxnyABhPQIrJ4fI+HT3S
         yWxsEqZBLI8HKgoDhFzYBayPysKjnS8JNO/Qkrs16hRp/qBh9b/TxJKm4rHqSgnxz+9V
         2iVg==
X-Gm-Message-State: AC+VfDyo8ZPtt3JibM+6At5TTpqtgEEu79UjLlhd3v+w/xuOkefVAKni
	VlL7AXZildEnxsCAb9qKb+Bpl1dD46C8V99jIhY=
X-Google-Smtp-Source: ACHHUZ55MjACV5sJKUBRpkdOdG8Mo4f+li7zZnI4Xx+fW+oQ/65aJnctDnMxPl6suE5JhS0tXpaSsMIdfXGl4k66Cew=
X-Received: by 2002:a05:6808:200e:b0:39a:ab69:778e with SMTP id
 q14-20020a056808200e00b0039aab69778emr11729425oiw.23.1687256277496; Tue, 20
 Jun 2023 03:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
 <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
 <CAMKF1sqb07CYybr=CuMiVTGMoM=sBfKxGcyGRYuCLVa9KTdKqw@mail.gmail.com>
 <CAO5Uq5SSdqyk8KQerW6MnfEDve3s2Knweso7kzMU8FcvEEPiOQ@mail.gmail.com>
 <CABQJdOGNvtKohGcD_geny3+aJ12SqwiK3vjLpjB=o6c_uqjzYw@mail.gmail.com> <CAO5Uq5THj-5d7=_7G6-yahHkauOGEfAz37OfwTqP7UMrsJzBUw@mail.gmail.com>
In-Reply-To: <CAO5Uq5THj-5d7=_7G6-yahHkauOGEfAz37OfwTqP7UMrsJzBUw@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Tue, 20 Jun 2023 13:17:46 +0300
Message-ID: <CABQJdOHgxafLoUe8iZsUJnyCZjSeJvDc05xF-OmWUe1L3-fOkw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 10:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103453

On Tue, Jun 20, 2023 at 12:58=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> On Tue, Jun 20, 2023 at 10:55=E2=80=AFAM Beniamin Sandu <beniaminsandu@gm=
ail.com> wrote:
> >
> > There is one on master-next, it is currently going through the CI runs
> > (I think): https://git.openembedded.org/meta-openembedded/commit/?h=3Dm=
aster-next&id=3D9cb5f5c6e91612674eb02f79437abbd51ad7b38f.
> > I have tested this one on my side with a couple of different machines
> > on both poky with glibc and yoe with musl, seems fine so far. Mbedtls
> > v2 will still be available, so the end user can build with that if
> > preferred.
> >
> > On a different note, seems the oe patches got added to a PR on github
> > for mdns: https://github.com/apple-oss-distributions/mDNSResponder/pull=
/2,
> > and someone accepted this last week. Not sure if it's going to do
> > anything, but maybe there is some hope of having them in a future
> > release, even if it's very opaque by nature.
> >
>
> I suspect that's just a lack of process embedded in the repo, so
> anyone can review/approve...
>
I tend to agree, seems there is no real process on GH at the moment.

I think we are fine right now, both versions are still available and
one can choose between them when building, if the version turns out to
be a requirement.
Some issues might arise with other packages in the future if we drop
v2 completely, but I guess we deal with them as they come, as it's
hard to predict every impact that this could have.

> > On Tue, Jun 20, 2023 at 12:46=E2=80=AFPM Alex Kiernan <alex.kiernan@gma=
il.com> wrote:
> > >
> > > On Tue, Jun 20, 2023 at 1:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com>=
 wrote:
> > > >
> > > > On Mon, Jun 19, 2023 at 12:14=E2=80=AFPM Alex Kiernan <alex.kiernan=
@gmail.com> wrote:
> > > > >
> > > > > Keeping up with Apple given they take nothing is frankly a right =
pain, adding things which are nice to have rather than just broken seems li=
ke we're just adding to the problem. Last time I resynchronized this it too=
k me days, unless there's a really good reason to do this, or there's a way=
 to get it upstreamed I'd rather we didn't.
> > > > >
> > > >
> > > > a different question would be, does upstream mdns stick to mbedTLS =
2.x
> > > > or is there support for mbedTLS 3.x expected/supported.
> > > >
> > >
> > > It's completely closed development, so (personally) I've no idea. The
> > > release of code drops generally seems to follow a MacOS release, whic=
h
> > > would suggest there's likely to be one fairly soon once 13.5 ships, s=
o
> > > we might have more of an idea in the next few weeks.
> > >
> > > On mbedTLS 3, I don't obviously see that we have a recipe anywhere?
> > >
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
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#103444): https://lists.openembedded.org/g/ope=
nembedded-devel/message/103444
> > > > > Mute This Topic: https://lists.openembedded.org/mt/99629056/19979=
14
> > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/=
unsub [raj.khem@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
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

