Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE69C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 14:58:13 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.24158.1684249090898331543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 07:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C4stP2IR;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1929818d7faso5134840fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684249090; x=1686841090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iwUzCzOT8VgRH43Sk17ng1/yqjS3+4fxW4sXdF2dkg=;
        b=C4stP2IRZMcnFvaLlSGqy/TxuyOVuNQyws/ruLyL4vN3shmgtziN3jQLX27Gx/6Woz
         u09MpH+pNYzQb3fWO3ELu9jrkwRy/HaRNQA7Zz9zitMaetypoaTr9UG9S6tqZj6UO+o+
         Ru+tCDWeUxsMWBepEpZMg8z1JOYqzr5ZEtWcF3eRCfk5jn5Qx5ooxI4oNEJcGSmrKc/1
         NdSThyKpFTdgzKn3usgFA4Tp2+PMqVc4HMs0SkL0YnOJNGW9XTcPVjUqj3PUzW0AWV9M
         skIvcwfwpjgjk6fUoB6CMM80yshj0RqqE0rr3G7odl+VZhfR66XsDq/3TrejJxpCLCwY
         Ba7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684249090; x=1686841090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iwUzCzOT8VgRH43Sk17ng1/yqjS3+4fxW4sXdF2dkg=;
        b=OUaEbQ2Zj58pvnXyGWWrykTLPR+zCaNdeSlaNEcTC7O35RSkircxrEcn4IhpRKiDke
         uFs6updAazc8zfkx+gnW9XNAoXdxT5zu8UIDblG4wFpPt1+TviljpZp5tFimu7KwyZWm
         6jS6fpMBVBINN+VRR33ngUwbXpkePzpoqbzywEBulmUifjo4feqkE2ysj/KCF9/QT4LD
         azqkamHY46ZHDwORpJEx+F/WKjCg7RjuD3mznNi/hrbVTsJ1luBTTJ3pGpzAFCHB/hRC
         bP9zdYh8WCUvCficYhLk/Kw61MSb7mg0tyJ59kKiNXypVAl1sdA5veEazE1lnx4YO3+P
         TEiQ==
X-Gm-Message-State: AC+VfDxkM/NykpGYSDkYqWxkGNFCpZ02gQ2t0wILeV35UGzruRa/G5tu
	y03uoBamS/b7OL/6E+pSlPlst2xDhaBXUdfDv9g=
X-Google-Smtp-Source: ACHHUZ7xmf3LXwO2IVRykJvXdXmKimnFLUj8nUjzLdmQPaB/napPwYMYGYWnjEhlvT0bYDSaxH8oo2FjS37Vg3Cfryk=
X-Received: by 2002:a05:6870:f697:b0:199:da44:a6a5 with SMTP id
 el23-20020a056870f69700b00199da44a6a5mr2865232oab.9.1684249089967; Tue, 16
 May 2023 07:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230516043458.6180-1-f_l_k@t-online.de> <20230516043458.6180-4-f_l_k@t-online.de>
 <CAMKF1soBAvB2NQQCTFMGAp3+AG-EGzzUnAumgRg0ciH1_poG=w@mail.gmail.com>
 <175F89755DC86A25.20583@lists.openembedded.org> <2NLQUR.Y193GFGMC2W51@t-online.de>
In-Reply-To: <2NLQUR.Y193GFGMC2W51@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 May 2023 07:57:44 -0700
Message-ID: <CAMKF1sovUY6aPaA6wPrKgiAuEXiz8bdG6519fJEPmoc_gztaLA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/7] evince: update 44.0 -> 44.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 14:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102631

On Mon, May 15, 2023 at 10:52=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> I think it's just a reproducibility issue because the buildpath makes it =
into the debug package
>
> Am Di, 16. Mai 2023 um 07:45:12 +0200 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> Am Mo, 15. Mai 2023 um 22:26:45 -0700 schrieb Khem Raj <raj.khem@gmail.co=
m>:
>
> do these files get compiled into binary ? if so then it might be too late=
 to edit these paths out. Perhaps they should be removed before they get co=
mpiled in.
>
>
> The buildpath doesn't get compiled into binary, I checked that.
> Probably glib-mkenum will fail, if the paths get changed before it got co=
mpiled. The buildpath is included to ev-view-type-builtins.c like this:
> /* enumerations from "ev-jobs.h" */
> #include "/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/evince=
/44.0-r0/build/../evince-44.0/libview/ev-jobs.h"
>

I wonder if ${B} should be replaced with usr/src/debug/ on the same
line at -ffile-prefix-map etc. we have to remap such
things

> And i guess thats needed so ev-jobs.h could be found

