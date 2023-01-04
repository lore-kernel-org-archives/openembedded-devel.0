Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46A7C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 17:00:04 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.17863.1672851603186282120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 09:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h5Nh2/mg;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id c133so30018465oif.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V9H2WNBHvYkDI0nCaXMA2h7jNgIEXIbmYsuEn9ouAyQ=;
        b=h5Nh2/mgw7g1VciA4BZkWbc7L/Ey7HNoWQra9VOZ6wK0c1jq0ZFIbdKV7hlnSwWagg
         WOeFHJIYu8eRyC8OZpyYuATtWrCjpJhmUYpK7LLmWLUHN3WiLfNNATnjnP8ypSwGpiZ+
         gP4Wvjm/VEc/2zN5BZ7Hs2f9e+gpuw6IqonTFDkgcEAob9jnjT/351q4tpFXNYAlLT2I
         Ua0rH5KG69hS6pI4Patr24qXAFtZ/RePIkPpVNBXra7Qh9yDmKl28jbv9nmak7GM7LV1
         6K0x5t5VPKOB09au/lUOnbVKOhibNPtAAQ1W+wtiLiw4q68nnCQgn5FdNMPZpeDZ5vcV
         biUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9H2WNBHvYkDI0nCaXMA2h7jNgIEXIbmYsuEn9ouAyQ=;
        b=AUCX7SqH6pH44KniKmkhpqUk6CUYjfEpKnlaSvEll0tnz8gy4KFzbIDs8rQUEt90K9
         G9QueBIfMuzaS8/iejOtoymlA1HH6e09zV/OQjMG9MK0SIgvi39+/UfiVGEhNv6fBTDZ
         6fH8FK0meBNIyyjYi63lNhjzTunNVVii4jaTTubqIxcsbNUmRzt+HWRpRoaQK0VmnmJq
         2Ow3iaQuVastr6TWxzpDc/qD6FY0SxkvsH5aTn8Xmnpm0zJFsraGCTdrwd9+SkknFlh+
         zEW1Tu9cjiEfThsaidijYtUWC7wH6nWAtelgInEkWGuZIsierNSSBcxW0OKAJhucgjqh
         P+vg==
X-Gm-Message-State: AFqh2krM4TlwR26dkQX93Xs9vh+AsIYGbLYA7BCQ9YlFWHx+z72kcclz
	cNGvxaPf8Lm9CyZ1x7DbnxxKFsBMreLzzrOLBHY=
X-Google-Smtp-Source: AMrXdXtOvgkmWioDGe/lPlKYqzJre0IrQdo2nZC+dpMDBzmK/PioMyJrXEZlZjC/4qYaGsUGQ3r8b+9Hp5jx7pmK20k=
X-Received: by 2002:aca:6085:0:b0:363:240c:bdc7 with SMTP id
 u127-20020aca6085000000b00363240cbdc7mr1938287oib.55.1672851602188; Wed, 04
 Jan 2023 09:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20230104112157.2537461-1-alex@linutronix.de>
In-Reply-To: <20230104112157.2537461-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2023 08:59:35 -0800
Message-ID: <CAMKF1sr8vfyye2mNQMeZ-F3zymftt1zsM7tn-Dt=eT8sweRZOA@mail.gmail.com>
Subject: Re: [oe] [PATCH] packagegroup-meta-python: drop python3-strict-rfc3339
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 17:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100399

On Wed, Jan 4, 2023 at 3:22 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This has been unmaintained, not needed by anything and is now
> removed from oe-core.

There is also python3-jsonschema in this packagegroup which depends on
python3-strict-rfc3339
perhaps that needs to go as well ?

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 4e318967d..2275ccd6c 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -414,7 +414,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-sqlparse \
>      python3-sqlsoup \
>      python3-stevedore \
> -    python3-strict-rfc3339 \
>      python3-supervisor \
>      python3-sympy \
>      python3-tabulate \
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100397): https://lists.openembedded.org/g/openembedded-devel/message/100397
> Mute This Topic: https://lists.openembedded.org/mt/96048124/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

