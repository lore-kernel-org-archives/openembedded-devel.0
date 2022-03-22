Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E659C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:47:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.8794.1647949666282794583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=nnhxCVqd;
 spf=pass (domain: burtonini.com, ip: 209.85.128.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f43.google.com with SMTP id
 j13-20020a05600c1c0d00b0038c8f94aac2so1866796wms.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iwkBcf5nUgeR6Kqyit96ewtyket96CNG4mnTy55V6K4=;
        b=nnhxCVqdiwFcj4VEuYS/KLuqQoiLf/3+PqmeMGea1NGfFKfe+LlZT6Op+rEG8DAGYN
         niUhsxGEWuLfWn0QgDAV7OhThEbiEmMM8GlTbkmWa58RazwXHLoA8ZOtvhQHI21YkgP+
         Qjefgel0ddnE8lN+K0qj1e5nmLRi8b8OAFpyWvoKRN0SZc8l9rlprhMNpySnFYCsbNzc
         EgrLYZtaNUSx7PtXB0UhbE5lcV0rK6Njl+ckDTCYcvZAen/IrvNOnmQWlZ1nK5v+Ul0V
         bgDKE/+9Grm7JemhxPRQXDwfiAPgUgs79pzuDo2Kz03fb0uo9XJRbKvrl264rwrpvX1V
         W7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iwkBcf5nUgeR6Kqyit96ewtyket96CNG4mnTy55V6K4=;
        b=yDCOVBeb+peRRUWMb/OVAmN8wlDqMLU5ODJg57TNMJXMIb58JQ4z18vOiMABsJtGNm
         WOqZJOdt+oSdxgR38sbuiCY7y2V/zNWlXWG6kyM0E+rQGDIgpjDxx4c6zg87RHMhyU2c
         e+vw6TLMfiykY7ui7qKjiH3nqjQWNdMWkP9HmDuZ/qdfKqWG1rxQUHFyQz2Gd9uuvwuM
         pUnAndpgk2fXZWoOINK/9hsJsfy6nRk65GXakLdLpKUp27L8GbXZSTuWhp1MQdvTEqOu
         evBhsn1eOXQFA95HL/5rEtJL8SqNHMO8RPPQf359/VnubFoeudK6ohVAG2f4XlvEGHqK
         mF1Q==
X-Gm-Message-State: AOAM533LFqhLhbm5Yji4Hdu4uiZiBPJeHgKV/TAWgtViVJKk5xDSawkp
	HiC+7y03pmT+qY6R0MAa/96BaI+MjwNXmQJNQqW2Dw==
X-Google-Smtp-Source: 
 ABdhPJy0fapurwGdgH8VwU0UvZExX4sfpEbIu2Pu1gAvZxviDZQNGVDcacpd+crl9nOuh3B7zk+8/a6H6gMZzG7FpVg=
X-Received: by 2002:a05:600c:2185:b0:38c:9091:892 with SMTP id
 e5-20020a05600c218500b0038c90910892mr3361175wme.14.1647949664428; Tue, 22 Mar
 2022 04:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <2261745fc01a4e3887ee98f98a425e88@vivavis.com>
In-Reply-To: <2261745fc01a4e3887ee98f98a425e88@vivavis.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 22 Mar 2022 11:47:33 +0000
Message-ID: 
 <CAAnfSTuS1bkdXaVkd977-PWvdGdD9N+H=zNL1FHUvDT4RCW96w@mail.gmail.com>
Subject: Re: [oe] Question about usage of FILESEXTRAPATHS variable
To: embedded@vivavis.com
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 11:47:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96135

On Tue, 22 Mar 2022 at 11:18, VIVAVIS AG via lists.openembedded.org
<embedded=vivavis.com@lists.openembedded.org> wrote:
> I wonder which assignment is correct within an append file.
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> or
> FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
>
> The development manual (latest version) shows in chapter 3.1.2:
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
>
> But in chapter 3.1.5 the recipes-bsp/formfactor append file uses
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
> The reference manual only shows examples using ${PN}.
>
> I've searched for ${BPN} usage in Poky and found only this one
> ./meta-poky/recipes-core/busybox/busybox_%.bbappend:FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
>
> Without additional prefix or suffix added, should I use ${PN} or ${BPN}?
> Are there possible pitfalls from using ${BPN} instead of ${PN}?
> When appending for a native recipe only, it seems clear to write ${BPN}-native.

Both are valid, both have use-cases, but I'd say BPN would be usual as
you'd normally not want patches to be different for
native/target/nativesdk builds, which would be the primary reason to
use PN.

I'd suggest that recipes that use PN are most likely never built for
non-target (ie, native/nativesdk/cross), so there is no difference
between PN and BPN.

Ross

