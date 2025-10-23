Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3EFCCD1AB
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 02:37:18 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.11324.1761187034583076528
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 19:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CbE3vMxZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-784826b775aso3172527b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 19:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761187034; x=1761791834; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U6m2ouLXuufbVT26pEhgmOdReqtI0MQoC38sR1NQyY=;
        b=CbE3vMxZugezyqmr7fbMCOSiEeHbl8I3sYmS34zSohpE3ZhQg+Atq4RSOaHR4qzX8C
         RATgKP/sE88icMGp7vU4QDlKQdjJ0VBUpTu986adO7mzDPSVPVMdORA5EhnaApkIBz2w
         Lih1ysXmBiBdGoZ9IJAUlqYrzMvnq5FhGLH+tjEcN8+r78nj3C02nA1Fues+jfoCA7xH
         eQ7XO7LKIMoilXcL9DR3OrzZbvj/gvHtdXdl9hZOpxpKEyrzKMfXeWu8XBMgM636hUZC
         IOQ8kBOEIHRMeqBcCB2IRlASFs9Sqw3kOdBqI4i9N2pGoT6XnwDbaba/s/+sFfLG8GyJ
         Xm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761187034; x=1761791834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1U6m2ouLXuufbVT26pEhgmOdReqtI0MQoC38sR1NQyY=;
        b=mf51ONQnafz2ulhreN7i+O9emNKs29pqquATbCmX6vN1jqh5XEjUa/q/uHegi4zuXx
         CVm6KIH68xpfNaIHAMXnPPZJfJR+jqtas6qzbhUEp5gwEhliu4BBenbkfpdoVbARU8nY
         +ljGd9EwPt+KBKu0xlzWwQYJdYktjXk6T1ZVqyFwEKYShHMHwSN7MYulSAR1TsRkLn/w
         BD5m5IrrsYQnsStbmDhfdXajaqdGoT6ucT1RH4isZn6DvVJvfsaDpPjmN4A+XC5KOZun
         /eJI+iToydT8Othh9z8PShSQNGfLkE5SP3w4iZ621jH/oBfc6X/cdjZGjqnMSRaBecWC
         FOlA==
X-Gm-Message-State: AOJu0YwTnvBak4m17UisN/lUO0d0qXYGC9KBpj9LmffOBEEQYcbQE7ON
	TGC8CL9qolqEyz3bgJQoXtoydWRa8yX87yNJdmpzy4t5pPqQRC76DgbDNU1s4cyqF1KWol7q7Oh
	b5phAEiqhCTDcV7j8hhZeFjcR2gQylMM=
X-Gm-Gg: ASbGncsr3WQTsZ/V861oSFwTVKqrO9ekxFoAfZ7pWjnSrvvsYjz0m4/UZx9bELjVz4Z
	3UZ11BYnPWxTMa84XKD32wZX4oe9L95qSF7s9TMjMQbiW0c7LU0CTgtNQsN8GKCcLGsvLT7O5pf
	YJnSJmor5E2Tfse2x1dBj/IlE0KB+tlBCtcrKMHZ01RdNN9B4gNkQ+uuuBpR61kDU+hocmpI5ST
	ehyGmHatj7SEpwnrKyTQH3/cw3VnqXyCHcsE1WOrn6VbvYsWcPPtc472X2EXmSs9FMip+wJepuT
	StcJ7Z3CQ3d5nbba/Tr/46CLmCHESBqcRGLFuv96HEHrKM0gVsLrziAIq0X4sbrEfIfS23esRGu
	qAk0=
X-Google-Smtp-Source: AGHT+IEZYw19Ni1Zr13Rvw+tGtUabwBqPmP4Z+CbbmbnfgMPJFzHz+X6+W6vLhTV+Ba0DFFIxdKcAR8ox7O9t96AZ3Y=
X-Received: by 2002:a05:690c:6c8f:b0:784:8994:2998 with SMTP id
 00721157ae682-78489942cf1mr133733717b3.50.1761187033619; Wed, 22 Oct 2025
 19:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251022203617.1488734-1-michael.opdenacker@rootcommit.com>
In-Reply-To: <20251022203617.1488734-1-michael.opdenacker@rootcommit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Oct 2025 19:36:47 -0700
X-Gm-Features: AS18NWDhnbOjDPkP5_PD9WLy4S6MRm02wo9GVpBnu6yQFMr9q9flJhxxn9O-YT8
Message-ID: <CAMKF1soVn_xd3Vgarutew7kvrZdv3sgXDR11Ut-JEw4rZYT3PQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iperf3: add missing "libgcc" RDEPENDS
To: michael.opdenacker@rootcommit.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 02:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120910

On Wed, Oct 22, 2025 at 1:36=E2=80=AFPM Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=3Drootcommit.com@lists.openembedded.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> This fixes an issue observed with iperf3 added to core-image-minimal.
> The executable starts fine but at the end of a test, issues this error:
>
> iperf3 -c 172.24.0.1
> Connecting to host 172.24.0.1, port 5201
> [ 5] local 172.24.0.2 port 55444 connected to 172.24.0.1 port 5201
> [ ID] Interval Transfer Bitrate Retr Cwnd
> [ 5] 0.00-1.00 sec 113 MBytes 945 Mbits/sec 0 396 KBytes
> [ 5] 1.00-2.00 sec 112 MBytes 941 Mbits/sec 0 396 KBytes
> [ 5] 2.00-3.00 sec 113 MBytes 946 Mbits/sec 0 417 KBytes
> [ 5] 3.00-4.00 sec 112 MBytes 937 Mbits/sec 1 417 KBytes
> [ 5] 4.00-5.00 sec 113 MBytes 946 Mbits/sec 0 424 KBytes
> [ 5] 5.00-6.00 sec 112 MBytes 938 Mbits/sec 0 424 KBytes
> [ 5] 6.00-7.00 sec 112 MBytes 943 Mbits/sec 0 428 KBytes
> [ 5] 7.00-8.00 sec 112 MBytes 942 Mbits/sec 0 445 KBytes
> [ 5] 8.00-9.00 sec 112 MBytes 944 Mbits/sec 0 457 KBytes
> libgcc_s.so.1 must be installed for pthread_cancel to work
> Aborted
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.18.bb
> index 91d266a2d5..a8c74c1b45 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3D=
master;protocol=3Dhttps \
>
>  SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
>
> +RDEPENDS:${PN} =3D "libgcc"

yeah patch is ok.
everytime I see a hard dependency on libgcc, I remember that we need
to make it virtual/libgcc or some such
so other toolchains ( clang ) can accommodate its version of stack
unwinder if users need to.

>
>  inherit autotools
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120900): https://lists.openembedded.org/g/openembedde=
d-devel/message/120900
> Mute This Topic: https://lists.openembedded.org/mt/115899894/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

