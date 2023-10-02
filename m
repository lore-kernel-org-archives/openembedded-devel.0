Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6E5E74918
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 19:27:57 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.91810.1696274874295747276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 12:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UevNp7DT;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1dcdfeb7e44so51184fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 12:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696274873; x=1696879673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eazc1EJGLF1oKpyw6P6/rCOle5vJbb/1DdjjHbe+Zbc=;
        b=UevNp7DTN8/AOCp/agYv7KDMz9xVLwFZzhwyjjmSgaKlCSYk31/Ax1YgF1Oez1BpM6
         jQSNaUq6wKpgJgm58IBndHN1nqmmo/swWZJBUNE2vO3ugJef4dZNAeOEPtmBHZE0AUxJ
         fx7FRcor2Zd5q+npkg2TsCS5cS/pQasaAkeHmUCsHCbEcCvatQYZklibKtPnzr2RAwt3
         lo2+CqNCcYrlwuhofkDqAPaiGhfGDEIkCCUalSBE4A+VSMK8qt+4LwZ/yGESY8ATQ5tS
         4R/oYqqjxQR16I8gXDpU+qdujKdorf2xgdDzid/jEaAJoQP60iUwtNqyN44JNX1X887j
         qSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696274873; x=1696879673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eazc1EJGLF1oKpyw6P6/rCOle5vJbb/1DdjjHbe+Zbc=;
        b=Dwksb1Zx6kL2RYTcGIJS7BsUtwvAyrKAQywQCfO/NpJbZV+8BhMiJ7g41Q7R6YckHO
         qQXy4Q+bIKgZrwbVemT2qpalaNRR7iYoSjXF8h9XgkNpzP8RXcGkP4ichVI6pCFrMDmy
         w6+SaGAlfSvkEVzoqsjudaUUjJ8qeZ43RF6NSVy19C9d6dS1oZXw9JvkWR1I1Qn2kC2x
         HkpcNhcF3nel/6N3xS+D5whCVLM68FmtUAcaSyz6R8nH84nmtpZfw7sTvHVLyFGa9eyz
         l4BxRGvN94O9cfemGCPEIfZBmlwwd1z5B92ST2+FhSLwzr2oY1Cgql1Ffaz6ECdamGka
         slWw==
X-Gm-Message-State: AOJu0Yw/FXkrFopeghkBcZykI6D82l/EwDPpOS6SJD5NV0PHSXyDast/
	g9UjLykoaY590oMRm82U5MzcVQIuf1Lm4IJcz98=
X-Google-Smtp-Source: AGHT+IEq3xSlfyI4CeGwlx+JifWbQZdnzjWCOlhqM6hwmsH16zQnBYf+Jx9CfTJnl6o2CPF3wpdVmyrrZ7FSK+F+T3Y=
X-Received: by 2002:a05:6871:408b:b0:1e1:300e:ee95 with SMTP id
 kz11-20020a056871408b00b001e1300eee95mr11704044oab.45.1696274873489; Mon, 02
 Oct 2023 12:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231002091534.963730-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20231002091534.963730-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Oct 2023 12:27:27 -0700
Message-ID: <CAMKF1so3TeHf5J_wMqZg2s8xVJiqTo3GEWzsPOMyMbF6aakKEw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon: update patch 544.patch
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 19:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105313

Gianfranco

I have staged some of your patches on master-next,  please check and
if you have anything pending, let me know

On Mon, Oct 2, 2023 at 2:15=E2=80=AFAM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/m=
eta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> index 550493351..3699b8c83 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> @@ -1,6 +1,6 @@
>  Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/54=
4]
>
> -From 5db28a4b85cf0ec3e128cfc7c9b71d12ec543695 Mon Sep 17 00:00:00 2001
> +From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001
>  From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>  Date: Thu, 28 Sep 2023 12:54:23 +0200
>  Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non am=
d64
> @@ -28,7 +28,7 @@ index d572ecf3..8608c6c4 100644
>
>  diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_han=
dler/dlt_cdh_cpuinfo.c
>  new file mode 100644
> -index 00000000..d6fc3905
> +index 00000000..03509fda
>  --- /dev/null
>  +++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
>  @@ -0,0 +1,33 @@
> @@ -62,8 +62,8 @@ index 00000000..d6fc3905
>  +{
>  +/*    struct user_regs_struct *ptr_reg =3D (struct user_regs_struct *)p=
rstatus->pr_reg;
>  +
> -+    registers->pc =3D ptr_reg->pc; /* [REG_PROC_COUNTER]; */
> -+*/
> ++    registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
> ++
>  +}
>  diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_han=
dler/dlt_cdh_crashid.c
>  index bca44e0e..8dd98d70 100644
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105301): https://lists.openembedded.org/g/openembedde=
d-devel/message/105301
> Mute This Topic: https://lists.openembedded.org/mt/101708265/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

