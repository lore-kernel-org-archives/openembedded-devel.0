Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FD2C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 13:58:23 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.15121.1717682301384478759
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 06:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DdjaejZs;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-24cbb884377so517819fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717682300; x=1718287100; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yA4ZarHhmxa0DV9WyR6/xe+DrzUbOS8T3HztnTGBb+o=;
        b=DdjaejZsu5ysPmUmnt2d/3GwX8hAyGj3C66lye95YJxbb1axof/nY/9tIFD1aMemqn
         kIKVYUhWAt7N/QEl8Txf8k+3hF9odPC2SjWextDrbDkTSxLTZ8d1msoWsAQqJPs43bbl
         WOmCdsCSglLyY2v6qQcGo852Ok4O1Zf3tW9wVn/9DwHhZsaXLuVnDRhmjnRLZbWbHwD7
         FNOkAPCYWAMxU5actjagvmQoZ/1aqueL0Wjcre9ArU3oKLkJYgyJao39yh1GvIgrM+DN
         VJnYo5m9wdJEMBOruA+5DlxXcdmmlnGeqy+chB/g57EcY3hkc8j9A0vRRoxx+/QNJNTF
         wHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682300; x=1718287100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yA4ZarHhmxa0DV9WyR6/xe+DrzUbOS8T3HztnTGBb+o=;
        b=uxpDL0TuMySjyDIlcr/XA/+ABZjAXbvAFvSMVeg19w51C/RtSHVYh0rFRF3472QPgr
         xTRhfahWTLBg8nTX7jcPm4T04/u4k54SZDTPmrMXpIu938BxYo1sbS/GtzrErDRUhly4
         xc1FFUX6YV1Kkjs5LAsAu/tR0rMpAn796phA0Ey4qq9V7AJkxaRL6ElW/0h5NDnK7fjv
         FGj/QpAdBlycLrE4xSOBXbcgCD+BoYLO7V+eDUCECDRydvflKzIAxww+KNHAadf7Uw4B
         lYqleJp6/ogoUDy/LmaPtQ/9fW+pMmXRUNN4ASp4H1CKIwFk1UejlQit61oTo+M3zY99
         6PZg==
X-Gm-Message-State: AOJu0YwFzV4YOyotjY81a2EWaYcvcVcLtFgRYe63hi/OoNAov9LUA4+W
	4H/aa5s4GouTd9UKOsTEqohQ7ioq59A9LAkOIeHkL/gBN87QYLSwaA+aQsTespUQ8xSiZ5yR5cr
	oFWWoADKD2x1dnM+MYO1oeHV4nsIvZQ==
X-Google-Smtp-Source: AGHT+IE3U3ENfbBNSEAXnQ3vNFcha/dsNqNRGwZFDKWs4Ynhf5NlBOc9YXz4QbWbz4cO87O4TRCfvgz03hf7N2EFnaI=
X-Received: by 2002:a05:6870:5e14:b0:24c:b878:b515 with SMTP id
 586e51a60fabf-2512208d4edmr6320811fac.49.1717682299842; Thu, 06 Jun 2024
 06:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240606101332.1564737-1-wentao.zhang@windriver.com>
In-Reply-To: <20240606101332.1564737-1-wentao.zhang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jun 2024 06:57:53 -0700
Message-ID: <CAMKF1sqeiG0ZkGx=q_NnTcOYyyLQrzJaGR3GGb6cezmFzpaXWA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] meta-oe/conf/layer.conf: remove
 libbpf from NON_MULTILIB_RECIPES for x86 and x86-64
To: wentao.zhang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 13:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110746

This is needed on master as well. Is there a reason why it should not
be done on master ?
 I have taken it for master testing, once it shows up in master then
send a backport.

On Thu, Jun 6, 2024 at 3:13=E2=80=AFAM Wentao Zhang via lists.openembedded.=
org
<wentao.zhang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> libbpf supports x86_64 and i.86, remove libbpf from NON_MULTILIB_RECIPES
> for x86 and x86-64
>
> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> ---
>  meta-oe/conf/layer.conf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 77855dc65..a254990ec 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -115,3 +115,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
>  DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image =3D " ${PTESTTESTSUITE}"
>
>  NON_MULTILIB_RECIPES:append =3D " crash pahole libbpf"
> +
> +NON_MULTILIB_RECIPES:remove:x86 =3D "libbpf"
> +NON_MULTILIB_RECIPES:remove:x86-64 =3D "libbpf"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110745): https://lists.openembedded.org/g/openembedde=
d-devel/message/110745
> Mute This Topic: https://lists.openembedded.org/mt/106520257/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

