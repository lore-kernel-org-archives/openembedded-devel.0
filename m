Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CEFC3DA47
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 01:00:46 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.2460.1720486845557915587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 18:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R+7zKh+z;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5c670e5469aso1005580eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 18:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720486845; x=1721091645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URHjHzyXpBisRou24ZolhRCD0ABISXs1OsDgo8cxRqs=;
        b=R+7zKh+zCMCutosxeV+R1IuPXiC7/1Lz6S84hTh1Pgszv8UWObIQ49ZLtclolSeL4U
         mJT2wgb2nBgqTGjvDMjZWBkBEpt3I16NeyfDs1toFXnrqxzr6+I8lAicTFtTJfr7R7wj
         j0EtR0/HfkK56nKc1uOv5DsmIiafweD5FSZAMDi4Z+u9pGnX7B+qYKfZFGy1pM2oYN9a
         08HmvdCCD2R9Cjlndgq75Nifk7E2Jg/sj26KMiCqUjwxn11vfDMh1EZ3gkDuQDun5KbU
         nJQyBmiA3tD5BgCxvFYr1vPsoSowcbA2c4/5owAPFXr9xdiK8sFhNt/YsXCwHFQ3pJWJ
         AHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720486845; x=1721091645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URHjHzyXpBisRou24ZolhRCD0ABISXs1OsDgo8cxRqs=;
        b=PDTq1wQW+Nqu0OD6KMh6Zy7hd1Gzwp+MfFyyL3ZYZOEDkq/jEBj7JDzwspQNFv3RR9
         KOM7mmYMPxxygt5MAy1cPHozGnh8EGMxdGvGY7O3RMAq4/Ju/B9VZAZ0UkMY75SaXK7r
         AUWom2IX1jf9zE1rlvLLM1mVQQ7Ne9DEv6qHPmPipd6vAudnJd6Yb3zwPkgY6i/bmN+Y
         LDg+XF1FmSKYDFEZiWmstI2xlL2nXlr6MsYPx86Tq7CDYumFCAG2hOcnr6FNzw/QIbjb
         fDV3anDz4rF/GOJxb8BLkDBbN9YyCZt3zysUKQ3kHN/haZs+ACTRF3FP9I5wUEF0LLoG
         3NoA==
X-Gm-Message-State: AOJu0Yx1BCAPeRLblIvAZFJeP/raeOWmhcVM/jkVipWe4eaUd6yf7KjK
	vyZ8iL8BIPDzRiu19AsA+YWpJjan6mxVQvtXOsXh+209abfEd74sCF2T1qdqvcE7KxI4eOHXGDe
	Zhj/oox1jT/3nZeDJ+sUQT6OCNm4=
X-Google-Smtp-Source: AGHT+IHGD0GOB5UbxUsjOVY52DLlomQqJma58biLQwP32OqWCmq1bPh7zawrorHVxGt60qJKnm7nkk9+Qpbj/ZbhFsI=
X-Received: by 2002:a05:6871:5821:b0:254:bc92:9b97 with SMTP id
 586e51a60fabf-25eaec4047cmr834370fac.57.1720486844773; Mon, 08 Jul 2024
 18:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240709004123.1330033-1-jpuhlman@mvista.com>
In-Reply-To: <20240709004123.1330033-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jul 2024 18:00:18 -0700
Message-ID: <CAMKF1srskTrmMq84r=Cb60yZnBkbDu_hL7eWc8CnHVqF1Vvcuw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] net-snmp: Set ps flag value since
 it checks the host
To: jpuhlman@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 01:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111272

On Mon, Jul 8, 2024 at 5:41=E2=80=AFPM Jeremy Puhlman via
lists.openembedded.org <jpuhlman=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> The value the configure script uses is picked up
> from the host machine ps, and there are cases when
> the flag selection can be different. Which would
> break reproducablity between builds on different
> machines.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> index 75b3d9e8c..989ec5413 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> @@ -73,6 +73,7 @@ CACHED_CONFIGUREVARS =3D " \
>      lt_cv_shlibpath_overrides_runpath=3Dyes \
>      ac_cv_path_UNAMEPROG=3D${base_bindir}/uname \
>      ac_cv_path_PSPROG=3D${base_bindir}/ps \
> +    ac_cv_ps_flags=3D"-e" \

While this change seems ok, I wonder if then we also need to ensure
that procps provided ps utility is rdepend'ed upon too.

>      ac_cv_file__etc_printcap=3Dno \
>      NETSNMP_CONFIGURE_OPTIONS=3D \
>  "
> --
> 2.35.7
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111270): https://lists.openembedded.org/g/openembedde=
d-devel/message/111270
> Mute This Topic: https://lists.openembedded.org/mt/107114904/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

