Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F380EB64D9
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 00:51:53 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.275.1687222305455197961
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 17:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dc/F82ZO;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b46e61638eso1797691a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 17:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687222304; x=1689814304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZHIGu6Xhd3HUxzKrFMuqSnDF7PD+FK+R5Ns3QfoD+A=;
        b=dc/F82ZOX3ol/guvi7CHROk9XjUFuFrnf9i5jeT8nwiTanUjus0JzfVhp3i1jsr/zJ
         XFyjX8cw6dZUnOr3O+E4t+GFhi8tpup+m1TLSNP905WJ5SZVwBI4dwr9E9emIYvAcGL9
         NqZkQ3NOM6+gf/9yUa5HyBGSLnKzaNj6m6cbnHDVWTlAv/uUlaUmnQZ/JxNsd2CrwHFb
         rdak6o7GBSVL+u2ofzdGrX3AiaSSsZuPwFwD4iv64PUxbzD5tQDyxMd67Pv+GkeLadN5
         u+YpCVY0aBKrQ2MKvQwGJVMkHM9kYBRbdp4tewEAISZ2sN83NVK6s+BjbCX1/PuhOOM1
         alrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222304; x=1689814304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZHIGu6Xhd3HUxzKrFMuqSnDF7PD+FK+R5Ns3QfoD+A=;
        b=PZ3kMrJjGTDSg6JcNN0TfhuaKnGwdKvSDHmO7P70KMkPa4HFYAsev5c6Y24Q1QBh++
         TIxQgv5GHDwClSlvSfQdU1MPW8m7W+2R4k+hi8MwThT3vuuCvoH4XGoJi+MbcatVjkzv
         XrKCoOipvIebzGZC1sNKDBTBA2hvIlpFn141puI17MvFmt8tLuY8yEjgzcEpQPO1KwfX
         gcsFqVMUK5AeHgic3yab96nSCcrwDDN+nKxujt4ZX2XF0P96oNsAHascb5T0zisJovc6
         3nrWlue2vgsxwwUrd7w2LYfgjjE8GlwFkrC3rkePONB8x7Y/t5MltyRWG1L5haOO4yfM
         BRMQ==
X-Gm-Message-State: AC+VfDzOJsummXHee1nECKqICNuTQZLdS91/VdVPFKpLj7U4J6qt0gVx
	AIpL6wpa637UMtyJ88Pe7kEgqvGCzAczRRTJlE8=
X-Google-Smtp-Source: ACHHUZ5WSqmm9M9HiMlS8Sa8rdX2SfrZ6Qc6AHFuWpl9cAz+r74xOX8L4wEI+nsNBW22BlzgLg+RxB898ZralBlehYY=
X-Received: by 2002:a05:6870:732:b0:1a9:601a:1cfc with SMTP id
 ea50-20020a056870073200b001a9601a1cfcmr2135055oab.52.1687222304479; Mon, 19
 Jun 2023 17:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com> <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
In-Reply-To: <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jun 2023 17:51:18 -0700
Message-ID: <CAMKF1sqb07CYybr=CuMiVTGMoM=sBfKxGcyGRYuCLVa9KTdKqw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Beniamin Sandu <beniaminsandu@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 00:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103446

On Mon, Jun 19, 2023 at 12:14=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> Keeping up with Apple given they take nothing is frankly a right pain, ad=
ding things which are nice to have rather than just broken seems like we're=
 just adding to the problem. Last time I resynchronized this it took me day=
s, unless there's a really good reason to do this, or there's a way to get =
it upstreamed I'd rather we didn't.
>

a different question would be, does upstream mdns stick to mbedTLS 2.x
or is there support for mbedTLS 3.x expected/supported.

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
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103444): https://lists.openembedded.org/g/openembedde=
d-devel/message/103444
> Mute This Topic: https://lists.openembedded.org/mt/99629056/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

