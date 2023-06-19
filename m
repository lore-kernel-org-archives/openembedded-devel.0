Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0419FEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 19:38:26 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.16947.1687203498702885887
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 12:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IUxta9lH;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-25695bb6461so3335156a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687203498; x=1689795498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UreEsRawKKxVNqrOZlg5T3Li96RbUDXhKYKw1A8foS0=;
        b=IUxta9lHSPvqJVvnzhYGPQS9q5WRTFk7Cpan1k7UpSO/n8HOcP2catIlcQtfEYVcWm
         dEfyN1596Zkl4Dz/+TSEtuWYOU9YIWcsw7e7FPgpoQqWf/JG33AbA85JsSKMh/sFQpW1
         A5S6P7aW+kgNElSX4fqBw25JnJLbhE+rmW4PbFUlzsrGvbXdYYQN4Htpiy4mdijcn7pT
         bvp23WVz9l7XzBMRlZiDa4uUME7ZucoAD5KKkUh8d2smYztnHTWkgmwOUvEd7ynHFSp0
         SKNW9K+ynqeqmhjTCSiJFHNnoop9/eFziZYShywoJ8niyeRUb7CtCTko1bCwqEZ4Gsvg
         E7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687203498; x=1689795498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UreEsRawKKxVNqrOZlg5T3Li96RbUDXhKYKw1A8foS0=;
        b=VxyUxCcxD3CvzdgZHWZThT82z/gT/3tIzG/60DAzfls/nGv1YOqLCNIfD8CC+0vmke
         aidNNmQHkuXZXqfCyMOzJMuVQy43rYOf/GLOyVKY1Suq3Y05F6w+tMFa0RUgjZbQgEzs
         RbsP0mcS3zC2NWEj+EYy9HjvIgbzQCOViwoP81tiQzCQ06D/m50S+zJClcn05BkwDFA5
         O7k2TP83m1oBcARRFvWDtJ1OeDmeAXbHDHLgNE4MgW1OW50rZa6ZXO1HGwbHkwjJsszL
         G20aUAEqv1mdXkwUWssTXqhdts/mbmVGlKGgcrrkZKztdFFvqLzrwR40Gx9GZ9ewJD+D
         4tpg==
X-Gm-Message-State: AC+VfDxcxSI81ljTEdk0tyb3xvk+VQdWRMetiNYZkSi8I4ENLNX+1hjF
	KxugUc/2EXQL3O6O/757XyjaeS2yYunChAnPn9g=
X-Google-Smtp-Source: ACHHUZ5yKDVkQHdb2yo7y/Ss3FQkN9pISmL7p6h651DcGjEJnjJdV7qirxKe/emLm98rxpaQUdKcj8Thum7Gzr9zHGc=
X-Received: by 2002:a17:90a:6286:b0:25e:b5d4:a156 with SMTP id
 d6-20020a17090a628600b0025eb5d4a156mr13961772pjj.2.1687203498034; Mon, 19 Jun
 2023 12:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com> <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
In-Reply-To: <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Mon, 19 Jun 2023 22:38:06 +0300
Message-ID: <CABQJdOE_4Pww8X_+j+PjFmzMiTm3cn8LEcH6OSebEqxh2=8gaQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 19:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103445

I am trying to add a v3.x mbedtls recipe to master branch, and without
this patch, mdns does not build. I could not find an obvious way to
submit upstream patches to mdns from a quick search, otherwise I would
gladly do it.

While I am with you on trying to reduce technical debt within yocto
layers, this one is very small and rather harmless, so I hope we can
make a sacrifice for the greater good. :)

Cheers,
Beni


On Mon, Jun 19, 2023 at 10:14=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> Keeping up with Apple given they take nothing is frankly a right pain, ad=
ding things which are nice to have rather than just broken seems like we're=
 just adding to the problem. Last time I resynchronized this it took me day=
s, unless there's a really good reason to do this, or there's a way to get =
it upstreamed I'd rather we didn't.
>
>
> On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gmail.com> wrot=
e:
>>
>> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>> ---
>>  .../mdns/0009-remove-unneeded-headers.patch   | 33 +++++++++++++++++++
>>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0009-rem=
ove-unneeded-headers.patch
>>
>> diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unn=
eeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remo=
ve-unneeded-headers.patch
>> new file mode 100644
>> index 000000000..74d387368
>> --- /dev/null
>> +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-h=
eaders.patch
>> @@ -0,0 +1,33 @@
>> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00 2001
>> +From: Beniamin Sandu <beniaminsandu@gmail.com>
>> +Date: Thu, 15 Jun 2023 17:02:58 +0000
>> +Subject: [PATCH] remove unneeded headers
>> +
>> +From a quick look, these seem to not be needed and having them
>> +breaks the build with mbedtls 3.x. Without them it builds fine
>> +on both 2.x and 3.x versions.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>> +---
>> + mDNSPosix/mbedtls.c | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
>> +index a73681b..ab8f8c7 100644
>> +--- a/mDNSPosix/mbedtls.c
>> ++++ b/mDNSPosix/mbedtls.c
>> +@@ -38,10 +38,8 @@
>> + #include <mbedtls/sha256.h>
>> + #include <mbedtls/base64.h>
>> +
>> +-#include <mbedtls/certs.h>
>> + #include <mbedtls/x509.h>
>> + #include <mbedtls/ssl.h>
>> +-#include <mbedtls/config.h>
>> +
>> + // Posix TLS server context
>> + struct TLSContext_struct {
>> +--
>> +2.34.1
>> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb b=
/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
>> index 612d343c8..46f1b70cb 100644
>> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
>> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
>> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/apple-oss-distributions/=
mDNSResponder;protocol=3Dhttps
>>             file://0006-Handle-noisy-netlink-sockets.patch \
>>             file://0007-Mark-deleted-interfaces-as-being-changed.patch \
>>             file://0008-Handle-errors-from-socket-calls.patch \
>> +           file://0009-remove-unneeded-headers.patch \
>>             file://mdns.service \
>>             "
>>  SRCREV =3D "8769ab51605e465425d33d757f602ce5905ca639"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103440): https://lists.openembedded.org/g/openembedd=
ed-devel/message/103440
>> Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
alex.kiernan@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

