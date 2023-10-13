Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200DFCDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:02:11 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.40929.1697209320973133462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 08:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aEfcB14v;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dcf357deedso1187878fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697209320; x=1697814120; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wr5pOcrY668+/4hE8B9hLcTlLdgdmJx4E0sitJY1mWI=;
        b=aEfcB14vctdU//PEorTCa6TAfOMPsV1LSQTV/WFWvR+KoUVVP4pCflonE5xlVyCCXY
         wm6A0C7XDcSQwv58dTkKnho6a2w9jGd8unM/JjBI54ZXfM/H/gOHQ8Sxj4XP0IcmN69V
         LYYr+gzfCF2Q5nlCoYvSg5RA8ydwG/T6H3VtcpZDJtKflP+aFBkJNSGRmum/A9oLsJKQ
         dsuWuUN9id4vkrWGu9+uyLcWSJyJkTvIK419N6IN1H1TLf5MTvE/b8+00/Y+XmJxiNq+
         8zAIkeLUaoJSB8S4V2P3K+WIlQfo6Z+SzoqSrA+00JAgiS4kx1Kv8ejHPpApbTwQotV+
         J4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697209320; x=1697814120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wr5pOcrY668+/4hE8B9hLcTlLdgdmJx4E0sitJY1mWI=;
        b=hR7AcvvLWofzv8eQrz2x4fZuKbO1IlnBIB6ng7AjF+OBsYrvnCc5QUws+5m2lW1N2H
         0xNAV5h/M7MnX1xLODSTFdzBbpeCzTSDzjpjF/eeIY8sRJhQEsyFiflsn9BPyfbYAXPs
         5TPIeRagcH9p8ZuubeDVzFoHhP+JVJ9A9koApR6eXOYhWdSq+iP0rGmxrL827L9YNFDv
         YNgeG8DuM8Zjy8oucdyntcW0tFKIW9ijwg6d8e9nlwb9sCk8dNY6Mi1UmOKrfrwPujdq
         TNmk/VPA/v+8DFUAWNhvs2r5u5B+DzhXvmJ9d8I7g4mfBtPcj9/uyKIjh/H6GaoMfijd
         Qedw==
X-Gm-Message-State: AOJu0YxNvWOc4O8nKXAVVJ1uF1AsmLQG/gEY+AN9ti1tWHIFZ4u15Sg8
	Ge/Ssw9ODrR2Jc9nbcp2Row6cBdXg+ze2VcJcaY=
X-Google-Smtp-Source: AGHT+IH9MpDexG6PE+D+Rzr6diNEjA/s0A+NxsjPAk3ZG1mwmRLrpfIr+eVmEYA/Vck0hGsQaO1UeWfp13/igshSWuk=
X-Received: by 2002:a05:6870:be89:b0:1e9:9aa5:997b with SMTP id
 nx9-20020a056870be8900b001e99aa5997bmr7521968oab.20.1697209320171; Fri, 13
 Oct 2023 08:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231013141854.2949506-1-fabien.thomas@smile.fr>
In-Reply-To: <20231013141854.2949506-1-fabien.thomas@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 08:01:34 -0700
Message-ID: <CAMKF1sqZQuoGZLeZYPScfvLjAZz1vUc=vn1X+QrDUx11WnTuTA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] layer.conf : Add meta-python dependency
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 15:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105475

On Fri, Oct 13, 2023 at 7:25=E2=80=AFAM Fabien Thomas <fabien.thomas@smile.=
fr> wrote:
>
> If feature ad-dc is enable, recipe samba depends on python3-dnspython
> which is in meta-python.

I would suggest that we instead disable ac-dc packageconfig in samba
by default if this is
the only dependency. It might also make sense to review
python3-dnspython and move
it to core if other packages are needing it.

>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-networking/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
.conf
> index 2343179a6..2a541e98b 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -14,7 +14,7 @@ BBFILE_PRIORITY_networking-layer =3D "5"
>  LAYERVERSION_networking-layer =3D "1"
>
>  LAYERDEPENDS_networking-layer =3D "core"
> -LAYERDEPENDS_networking-layer +=3D "openembedded-layer"
> +LAYERDEPENDS_networking-layer +=3D "openembedded-layer meta-python"
>
>  LAYERSERIES_COMPAT_networking-layer =3D "nanbield"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105473): https://lists.openembedded.org/g/openembedde=
d-devel/message/105473
> Mute This Topic: https://lists.openembedded.org/mt/101940810/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

