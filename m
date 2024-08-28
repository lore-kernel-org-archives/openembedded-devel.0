Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0BCC5479B
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 09:47:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.9639.1724838422677178327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 02:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BomRRE1V;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f406034874so65648401fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724838421; x=1725443221; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cT8fayd+v+mKfCXCpCtaNYh9SDFNcmhaaiN5XDCdmjk=;
        b=BomRRE1V8WIZgKdMWo2sNRmLj3OPCnkUSS7/3GaPCILRWd3IACzGdcc0LuP1okdpaC
         OdaEsqW/2YnDLSMTEtIelhKapIAPqa5Hj1q2eBTBM25xC1QG1kve0MGB+7iYVaTFK9nI
         7ZnVa1YMlF89WZ/OJGBMyb5hXBwSOg1kQkCTVjKG8NEjkHdUyWJnZuEAzC9/ef5Fq/St
         Ohthnspg7utFVe0/A/gKXTZpBCW38G5ber/NCAXfh90wya//iMTbucKOi8tzsN1rSHrL
         X0f2mi+GopSxNAybPdop277CHCC93fFuCYtlVEfjfgWwr73d5tEIWo2GHu4WJb5r9Mo3
         lF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724838421; x=1725443221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cT8fayd+v+mKfCXCpCtaNYh9SDFNcmhaaiN5XDCdmjk=;
        b=sdti9XTPby1OMMVedr4WALnWaEvOEmDNNQRrga5DcxdaAv0ez6kyQzVSejUdM6yPJk
         MM8YUjVoJjlKt1nHGRdyEWusUd3YCm/h26CuLYbyjgQlKvQ//EsF3rgRwqyFbvQCrJxC
         IFz63kcIMYJaCVYe5vJbi7iHGt7xwUOEq9Hf2DHOGGNCa/2W8byad01Ae9RR6i5lJl0B
         eVkj8Kibc+IwGN3w1UVGR2aCzMlaCJKE+4NcXSpiIEq0haNbLwgRtMUKhWjCtmRVuvUq
         uDFxTkTVfRVGJW5A6zZC2JftDmBegulue7XfkSnhQ9M3MeZAqj44AWuSDtWaYP6G1GVb
         zmZg==
X-Gm-Message-State: AOJu0Yy2KsknyfLfT0/wuww9qBQ/1TQWNnHg8pMPQVJh8vpv6+xNds3W
	QeLE+6mxg3BV+m1NPBDnUzeoJmVnyGxpmh8LpOxhtbUwfTOEJ4DzxaNP2693d/dPZVjWGWhzkM4
	PedYxC6+wayV8ASq4D/iWxU2mrgk=
X-Google-Smtp-Source: AGHT+IH21LbOuq5HA2OwStMnIbrjvp+DJ4BPNBpaNrHUeL6Y5NFK06dNX/G3BTAQOEPq9vzCldEv2krXXngbdGs3624=
X-Received: by 2002:a05:651c:1543:b0:2f0:198e:cf86 with SMTP id
 38308e7fff4ca-2f5617cc258mr10891561fa.33.1724838420053; Wed, 28 Aug 2024
 02:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <1724833587-2225-1-git-send-email-wangmy@fujitsu.com> <1724833587-2225-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1724833587-2225-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 11:46:48 +0200
Message-ID: <CANNYZj8h1di5JPTcr_o1FQ2=5cACZmyvG9X-b-qKAOiy8X3Yqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] polkit: use update-alternatives to solve
 conflicts with systemd
To: wangmy@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 09:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112028

This is problematic for the same reason as the similar change to
systemd proposed in oe-core, and shouldn't be merged.

Alex

On Wed, 28 Aug 2024 at 10:26, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Error: Transaction test error:
>   file /usr/share/polkit-1/rules.d conflicts between attempted installs of polkit-125-r0.core2_64 and systemd-1:256.5-r0.core2_64
>
> systemd also uses the doc '/usr/share/polkit-1/rules.d'.
> systemd has a priority of 50.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-extended/polkit/polkit_125.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/recipes-extended/polkit/polkit_125.bb
> index fe1ee467c..5ba9690c5 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_125.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
> @@ -43,6 +43,13 @@ USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysco
>  SYSTEMD_SERVICE:${PN} = "${BPN}.service"
>  SYSTEMD_AUTO_ENABLE = "disable"
>
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE:${PN} = "rules.d"
> +ALTERNATIVE_TARGET[rules.d] = "${datadir}/polkit-1/rules.d"
> +ALTERNATIVE_LINK_NAME[rules.d] = "${datadir}/polkit-1/rules.d"
> +
>  do_install:append() {
>         #Fix up permissions on polkit rules.d to work with rpm4 constraints
>         if ${@bb.utils.contains('PACKAGECONFIG', 'libs-only', 'false', 'true', d)}; then
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112026): https://lists.openembedded.org/g/openembedded-devel/message/112026
> Mute This Topic: https://lists.openembedded.org/mt/108138519/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

