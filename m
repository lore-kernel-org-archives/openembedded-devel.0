Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BD9C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 19:10:05 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.14863.1700334600496608831
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 11:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4vv91tQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6ce2d4567caso1793324a34.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 11:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700334599; x=1700939399; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4FI5BhL/MKL0NP4yIvblMjybkQS6f6Hclv+6X00XoE=;
        b=D4vv91tQNUrMf4k5EE4u2lmX1l+1oDoAGC/fcmo8tCKsTUvUTs9wmjS2StxXDHkfce
         DLHdtwXVkfI603U0/0CHzp2/6ZS/Z1OR256QwASy9mWqigyHYKDcKcLefxX4POSzs7km
         OrmdCba3DIwcX2gpLil6ZvKka1pZZl3qtHbAr2ZMjNN0n12zqSvu3/fWbIMgsPJ8sHos
         cRNRFtr4a41BEMMdhrGHs38kCMMkakp68zDbj8LvWc1zb4WuyGvTTbBJGwYtw5nfbuuS
         /7QOn5RrOdZ16eRPAz44/8D7aKUfOKNk2GNOlLXViPnTDY7hi4JBrEwTi0t1Nu3bGmgg
         f2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700334599; x=1700939399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4FI5BhL/MKL0NP4yIvblMjybkQS6f6Hclv+6X00XoE=;
        b=EjNmZWjxSiLMHJLRKL1GoYkYBJW9Zmega00FS4QwIif2K7ccpRk3DXwWhAfWVQ9qP+
         QcRx/9lKHK7dm1RdAFemLourMMnHmxoBS/S9Qy/uIfezl8GBEnZwOaJtS/ZIjkfl4J/E
         622Hs9zZv3lhXoOencmu8Ym+7Z5ZKa7FpAhl0VdhpSXtje41tQfkkUp5ylFMLeIqS7Nz
         xAQ7KtnQ2hdBxOmB3FlyPI8UIPUSxatanTADIL1MVjI6bppWPQkW7C4uYlMQCy7PC+vZ
         W28hyBUgUshQYlBoidbYbFDvwbyAwXJyWPBAzmt8UXvBF3tELhIQc0dq0Xcg6cMxQHsN
         l/eg==
X-Gm-Message-State: AOJu0Yx0Ahb4HT+LQfWgPUIvI+7OrCxEuYtNimw7+JQGKltiaew1VbI1
	JhbYBcACaAG9TQISh/IqRaZZ2Ud3MohbGI8GIG4=
X-Google-Smtp-Source: AGHT+IHVLmRp4bc6fEVZkhe0jXncKv0w+F2ViJ5g7CXih3BMDjZrEjE5fUHtVPgWZ9Ir7GgMOT4WwaBqE5Ztnc6Hn84=
X-Received: by 2002:a05:6870:8929:b0:1e9:96c6:e04c with SMTP id
 i41-20020a056870892900b001e996c6e04cmr2984582oao.32.1700334599504; Sat, 18
 Nov 2023 11:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20231118182646.3237533-1-jan.claussen10@web.de>
In-Reply-To: <20231118182646.3237533-1-jan.claussen10@web.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Nov 2023 11:09:33 -0800
Message-ID: <CAMKF1sqNvLqxai8HX-OHV9+Tr9EO7UJxexEW7VFKQkFrnHVd+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 19:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106895

I tweaked the commit message summary before staging it into
master-next, here is some guidelines on patch submission

https://docs.yoctoproject.org/contributor-guide/submit-changes.html?highlig=
ht=3Dpatch+submission

ps: It also explains why we use mailing lists in contribution workflow.

On Sat, Nov 18, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> Adds btop, the shell-based resource monitor that shows usage and stats fo=
r processor, memory, disks, network and processes.
>
> Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> ---
>  meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
>
> diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipe=
s-support/btop/btop_1.2.13.bb
> new file mode 100644
> index 000000000..a944fe7b5
> --- /dev/null
> +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Resource monitor that shows usage and stats for processor, =
memory, disks, network and processes."
> +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +SECTION =3D "console/utils"
> +
> +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain"
> +SRCREV =3D "9edbf27f1b6d5844a97325fcda732762ba086a99"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/icons \
> +    ${datadir}/icons/hicolor \
> +    ${datadir}/icons/hicolor/48x48 \
> +    ${datadir}/icons/hicolor/scalable \
> +    ${datadir}/icons/hicolor/48x48/apps \
> +    ${datadir}/icons/hicolor/48x48/apps/btop.png \
> +    ${datadir}/icons/hicolor/scalable/apps \
> +    ${datadir}/icons/hicolor/scalable/apps/btop.svg \
> +"
> --
> 2.42.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106891): https://lists.openembedded.org/g/openembedde=
d-devel/message/106891
> Mute This Topic: https://lists.openembedded.org/mt/102675969/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

