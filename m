Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A40C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:03:05 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.8380.1751011382032196431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 01:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=igL+K2Gk;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e40e3f316so16394947b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 01:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751011381; x=1751616181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc4FbJggcMHpgABxcRpxVoJ3Jmqq/C2MyGVSTcYrufo=;
        b=igL+K2GkIiWiT2Fui5YbwCKwakVs5ga/PZi67NMXP38L49/KprYGksDQw5V7YM4aS7
         qsMYhUAxxoGVcgB/84s4fMSdqW7LoTIHLsxctE2sZaIuza8QjLz0iN2b9Xh9yCvuVfPY
         qBQZ+FxdnKHwOiqdlAE63omUj4Pb8v5l6Zypk/OwSmY5Ea0QHVcX91dyaaRsoqcvJUMH
         OUpPuaPzrIMy6EYKD9kNaIdxcLQ85VDJpsBJauIzTkxVcZL9jW1Spyjez8KIBbqVTpUi
         J+0QR6bWKd7AHYFe16PNnScU1FjunQMXQvaARvty49wqc1UPTDASZVJO30RfpV9PH0Jb
         quZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011381; x=1751616181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hc4FbJggcMHpgABxcRpxVoJ3Jmqq/C2MyGVSTcYrufo=;
        b=PQxHSCJoRdR01d6el1X/i71/halYG8r/03Bb03tM0il574ZrH5QhYcpuqIpRdZlWH2
         5Ngn2zKWvoyS8mVRm7fGkPNT5CVD4446Ysj40JAdJ7Ap9MSo4xAkOHACJ4rytD/DW+I0
         5hyVw2quEyxQJTVEaq6/rqN7cn+9MoSwKt05rD0gDRIAceMAB7u4ociVPhaqJzX5yIjc
         loM9KfzNaVuvVTff0M6FZ8tUbmW0fxe8ncoclAz4fwgvoSGQrP5jgAT0WatJyKqoVTyF
         KcDThfv21yWqnQ4RK6vcfC9xj2S76A6ypTIpGbL5FpIZMdFHHtLbmWKoeoTXN0ChuxP0
         R4ZQ==
X-Gm-Message-State: AOJu0Yyi5pTHHTfPP5meudtWX/iewdIEG9x7BLckK+kyHPreCkbkUX4O
	GlkXeyzbUxtHrK4/hEFYQQlxJtsfXuDCWBesz5OiPugZooxbqMDdM9GsRkECJBDWmuJyujBkugy
	wZeVv0sJZLKLgK/3jeH7pgFmmnuWYc+DG7lCQ
X-Gm-Gg: ASbGncueBzrqNT+5wKrKyAgjNMm4YmeUjqycAvyDotaHxT7Yjr6COjJVRMjC5vmzik5
	t0Jcv3Bwur5jzynS/xysGUmYNytDzlmakOgkkYG190G2wNXoAfP3rZ0i+Vh8Bg/nmu8gXRXOG8l
	nJzzD9p2lSY1/TjvDnoCIij9EEMcd/+P+EmppmGi/fwQ==
X-Google-Smtp-Source: AGHT+IFEmBm+rm8VyVfSkawR7IbZVLGJWihImlnlSiMlSCPc6TzWDQQ8K6qcgDTVW/uiuFO5WRp8swW21LCGfzyAILc=
X-Received: by 2002:a05:690c:c99:b0:710:e8a8:771d with SMTP id
 00721157ae682-71517191792mr34509197b3.24.1751011381058; Fri, 27 Jun 2025
 01:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250627045423.2805574-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250627045423.2805574-1-guocai.he.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jun 2025 01:02:35 -0700
X-Gm-Features: Ac12FXw7GRuYVW6DnX8FND69hmcQ3Ug3yUxHzUPERKdzwTQfsNOoH3cppvz6tZI
Message-ID: <CAMKF1sq8dZW1qNQuqLvFZKK0ZQs7Nq5=LGXbx-xo=sikLcAWZA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 1/1] thrift: correct the SRC_URI
To: guocai.he.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 08:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118140

Which branch is it meant for ?

On Thu, Jun 26, 2025 at 9:56=E2=80=AFPM guocai he via lists.openembedded.or=
g
<guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Guocai He <guocai.he.cn@windriver.com>
>
> The old SRC_URI is not available.
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-=
oe/recipes-connectivity/thrift/thrift_0.20.0.bb
> index c908eab7b3..14b98e6717 100644
> --- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc40a383cb3f747=
e0c7abbf1482f194f0 \
>
>  DEPENDS =3D "thrift-native boost flex-native bison-native openssl zlib"
>
> -SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
> +SRC_URI =3D "https://archive.apache.org/dist/${BPN}/${PV}/${BP}.tar.gz \
>             file://0001-DefineInstallationPaths.cmake-Define-libdir-in-te=
rms.patch \
>             file://0001-thrift-pr2755.patch \
>  "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118131): https://lists.openembedded.org/g/openembedde=
d-devel/message/118131
> Mute This Topic: https://lists.openembedded.org/mt/113856467/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

