Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7D1C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 04:38:11 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.35403.1679459889277465012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 21:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HGWBCkp9;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id x22-20020a056830409600b0069b30fb38f7so9756143ott.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 21:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679459888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+50BDI4AP1jKsAq8g68dnwZ79N8fbpXvXBfr0XTl5ks=;
        b=HGWBCkp9Db8eoROEekhWkrwhNYQPWQtWKzzrXSJEfJrD6FZoTgCISIHQrS1UGYeqW2
         cnj9YPWp8lRJFIaNBxF8zJZkbDNuo8Hu6G/5ZpBYVf7c4aOYx/bYvH0wpUK6iA50yn4j
         QyR5byHsYJgK6jYeaEIxerd45vTioOPp0FnHsdVZYRsLCHkhj1T4njuN79mVb82A65hB
         XQKy5RntHYGL21IIe8wS3W1MsF7cZyvsr3FVOHrMin23kW1xos36Cx/V2+YGyL3Il/XQ
         CHcQIySuvu/UcNCkkAubnqR7bPTNyH1SFi/8Qorpc8v8Pyn5GMtza/Pw/s9UFMXYFRhT
         MdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679459888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+50BDI4AP1jKsAq8g68dnwZ79N8fbpXvXBfr0XTl5ks=;
        b=Rpl7VTOWUHXGtOhuD2vYSC1Gwk+IjnNwFYQXFL50xaiHjb5pNIblPvoGXHMIAvbENU
         V75DUwZXzDEvuKB3SpibWU+K9ptWiiJIUj/Bralfzpsuy1Tw7gd3XgCRwbaPnt/ZdM83
         axF+9UcCeht3kWpWSHuPIJ+L650D5rjFf21C44r5+gh0IiutK3hn2jU0uVwSc1p3MjjL
         111kyXoR48+W8+X2MT7KgI4msZVuvxMTjS/Mrvsawap2ek6EkH8gITnowvdeYkvNxiEk
         +9bcINCo5f8lcV4NVoC0sZRpKragPWJolqTHcTNbabFBWB3BUQA0gs98KGfQ/XUsotCb
         SJlQ==
X-Gm-Message-State: AO0yUKVa4g8pAsVgpoZQgrNrFz7wvn0SDDmhlNw3xEM7Tb0xz+oYAeYx
	rK2+cY3niMPAL+PhGiRBpmmbA4XpfK9rmaHDrBmvADpZknY=
X-Google-Smtp-Source: AK7set9P0ZZyF1c0DgwmzyuUHbLwiSug7+Q8ESHbujuyMeknnwDpjwzwlnkaIzkO2OTvnT+E35fpHNbMFDLGruXBgGk=
X-Received: by 2002:a05:6830:1652:b0:69f:15f4:aa8 with SMTP id
 h18-20020a056830165200b0069f15f40aa8mr455551otr.0.1679459888319; Tue, 21 Mar
 2023 21:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230321154227.2785985-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20230321154227.2785985-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Mar 2023 21:37:42 -0700
Message-ID: <CAMKF1so4mouh6y6am=wNvsZM9G2B8_i_hrMQgXx15djjadXW2g@mail.gmail.com>
Subject: Re: [oe] [PATCH] cmocka: update from 1.1.5+ to 1.1.7
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 04:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101627

fails to build on musl/aarch64 see
https://errors.yoctoproject.org/Errors/Details/698594/


On Tue, Mar 21, 2023 at 8:42=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Switch the SRC_URI branch from master to stable-1.1
>
> The 1.1.5 version was actually a bit ahead of that tag but
> the ChangeLog comment for the two releases are:
>
> Thu Feb 23 2023 Andreas Schneider <asn@cryptomilk.org>
>     * cmocka version 1.1.7
>     * Update ignore list for source tarball generation
>
> Fri Feb 16 2023 Andreas Schneider <asn@cryptomilk.org>
>     * cmocka version 1.1.6
>     * Added new assert macros to compare 2 double given an epsilon
>     * Added meson build system
>     * Added header with version to TAP13 output
>     * Fixed issues with MSVC
>     * Fixed TAP output for skipped tests
>     * Fixed issue with fail_msg
>     * CMake generated configs for find_package(cmocka)
>     * Documentation improvements
>
> CMake still seems to be the default build tool based on Install.md
> so use that rather than the shiny Meson system.
>
> One test, test_cmockery, was added so now there are 23 passing ptests.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../recipes-test/cmocka/{cmocka_1.1.5.bb =3D> cmocka_1.1.7.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-test/cmocka/{cmocka_1.1.5.bb =3D> cmocka_1.1.7.bb=
} (95%)
>
> diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipe=
s-test/cmocka/cmocka_1.1.7.bb
> similarity index 95%
> rename from meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> rename to meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> index 554d582a5..308d5ca1f 100644
> --- a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> @@ -6,9 +6,9 @@ HOMEPAGE =3D "https://cmocka.org/"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRCREV =3D "a4fc3dd7705c277e3a57432895e9852ea105dac9"
> +SRCREV =3D "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
>  PV .=3D "+git${SRCPV}"
> -SRC_URI =3D "git://git.cryptomilk.org/projects/cmocka.git;protocol=3Dhtt=
ps;branch=3Dmaster \
> +SRC_URI =3D "git://git.cryptomilk.org/projects/cmocka.git;protocol=3Dhtt=
ps;branch=3Dstable-1.1 \
>             file://run-ptest \
>            "
>
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101617): https://lists.openembedded.org/g/openembedde=
d-devel/message/101617
> Mute This Topic: https://lists.openembedded.org/mt/97757613/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

