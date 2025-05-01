Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8324C369D9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 00:46:18 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.1385.1746060369850974768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 17:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWDouxQE;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6065796762fso95944eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 17:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746060369; x=1746665169; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDEMeZhYTSB21OcDbF1elthwGMhpBzCVPJm6RS6/sdI=;
        b=gWDouxQEynFL1yD/DSGogMdsfuSAj5jYqMVqmJLl1Wy9uvOgyZoXNPth0hhUfSarDF
         z7VHat3ZXEa07nqWhI07UK9D4J/bJsPXQpqltqqAaJEISKN/JRiB4o9S/DSJaJxmEDU0
         czTRSNYWeW54Ykq0ExUjKtXzEa0Qc3dgpxWIlYZy1r4MAcVYQmQuY/JeWfyHn8kfHknl
         vZUiVFqd0XxvytOeLYukY77ZThWU/XH0n3CUW36h6DzXC+16S1UZD8EmIVQoFpcMGMBY
         n67WqwjUHI2RE5ndg3ZGvQ3mzgiyIHz8OgTqMI9WGdhzBYiRuY4cfCWAzBliotdFOQ0b
         HZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746060369; x=1746665169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDEMeZhYTSB21OcDbF1elthwGMhpBzCVPJm6RS6/sdI=;
        b=OgSM+p+yZagEcKN6Ek6r/dOSFlFpCzvyqmEaurdIduU3OrB5NV9vwk0dcASPLcgLCZ
         D/xh/ci4DdM/apyyYc44+V1ngWAGsq4IgB6e5jAoXyUJI+2bDjv/IsVPKH0PGUoWhLvp
         zTRJaQmLkYyhjiXUe62jJofcWZHYO7CoyxX8GX2vaRo9XHDe+qRWMA6ThAgRTYruzRbg
         K+GuLUOtGP+MOg3MRNf9zEfwds4qDoLw3YbQWqfjyhYFKossNvChoTMGuqoZ0q+O3aLT
         XhRy3Lv+/DkJ3GgJ61rd+GJaS+jOcGbytiL9gClBq8IADLIJfxCbUZOjrmnMSd+oDyFW
         qEyw==
X-Gm-Message-State: AOJu0YyGrm1ndMY7lKYox/Pua5Jx7FCX4hZw8oyktDJaqLOKqS9BllBJ
	dg6bcM7D/LK9uIrFNMnCuflL96R+h9RH+f31tpWmJUY/ld3ExlxBqcxuWPvmHhJby7Jv1in0bM+
	nsNRlUCRao6QXytyfflI18PfQr7aqAYUK
X-Gm-Gg: ASbGncu+kfjoenBO3pXtnmNQaR14NS1CIMYJxgyWpaoQA5ulHtoTwOYugtQcuEMr/sW
	EckvAi0Lh1LEYnVCK8ma6jRscOVGMMafHw2JHhrSkv7MYuHymEZaQ0WYRDtsbcLhw5h5edVD0Ni
	u17YtUerF4uV+RmfHjVKTg
X-Google-Smtp-Source: AGHT+IGsq1Rmqu0UJT47TLSQWl7kS5gAoTfJyVRgomjsOxZrcuMQdjlQ1B/w/vRNaMb5feZ67JCAIDHQWNgmkbFu4Es=
X-Received: by 2002:a4a:edc8:0:b0:603:fada:ac53 with SMTP id
 006d021491bc7-607d561ebb3mr2815074eaf.2.1746060368972; Wed, 30 Apr 2025
 17:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250430220401.4149372-1-yoann.congal@smile.fr>
In-Reply-To: <20250430220401.4149372-1-yoann.congal@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Apr 2025 17:45:43 -0700
X-Gm-Features: ATxdqUHpm3tQ_JctCaBEyUvsCuob8tcGnfLhHbGWKXF1MANLDDn6uB9p2cEfHns
Message-ID: <CAMKF1sp1ExCvH_vOMkSNKwFa-gVCk4WqWUXDkDFqOyV19NU_qw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] reproducibility: mark ipmiutil as known non-reproducible
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 00:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117267

On Wed, Apr 30, 2025 at 3:04=E2=80=AFPM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> ipmiutil packages are not reproducilble.
>
> Relevant logs:
> - https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/s=
teps/32/logs/stdio
> - https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reprod=
ucible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducib=
leA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-de=
b-core-------reproducibleA-tmp-deploy-deb-core-----ipmiutil-dbg_-.-.--r-_am=
d--.deb
>

these links are temporary and they might disappear in some time. I am
not sure about the Yocto AB build retention policy. It will be good to
add relevant info in the commit itself along with links.

> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-oe/conf/include/non-repro-meta-oe.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/in=
clude/non-repro-meta-oe.inc
> index ba08749412..b926b45b0a 100755
> --- a/meta-oe/conf/include/non-repro-meta-oe.inc
> +++ b/meta-oe/conf/include/non-repro-meta-oe.inc
> @@ -46,6 +46,9 @@ KNOWN_NON_REPRO_META_OE =3D " \
>      hplip-src \
>      iotop \
>      iotop-dbg \
> +    ipmiutil \
> +    ipmiutil-dbg \
> +    ipmiutil-dev \
>      jpnevulator-doc \
>      jsonrpc-dev \
>      kpatch-build \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117262): https://lists.openembedded.org/g/openembedde=
d-devel/message/117262
> Mute This Topic: https://lists.openembedded.org/mt/112550095/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

