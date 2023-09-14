Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9C4EEAA59
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 16:57:29 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.493.1694710640573766128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 09:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=opVpKOFE;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1bbb4bde76dso587788fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694710640; x=1695315440; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGfKk21yxVZ7+fzPyhemBepR1eGq02dQ1bDuufLb3h0=;
        b=opVpKOFEApQJ+KE7hglipTSYYsGz1hvb6FepkJ/zzBa2TBoSRPEL9Iox6agWy7F4DZ
         55w/tkjOv8zQTT3V0jKMyRzxKOLbiW0GnS7a8fpvknmwdUng+q5X3FsCg2fbQF52HUpz
         5gP7EZ0/KMS+x8F/nuwY7DDdnPAsYrQ4eX2T+QJFXlRf985H7u6i/rdKSEU6CIKR0EnD
         q0EOoYhqzKkAbIhRxRx7MsmwYuMm7Y87uxglIrtpA4OeVd8u5bkGjjyjsolvssmF5l7F
         I9Nqd8o/m458Ut4lY5j6E4gsQsGJZo4wGCQQSww1uZuoq2IMp6JuCoSiq4aR/PsjNZGt
         MW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694710640; x=1695315440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGfKk21yxVZ7+fzPyhemBepR1eGq02dQ1bDuufLb3h0=;
        b=qtIGMaE4YJN1+pnoSze+Xis29kYoxigSIoLed6YyJPRBSu4LuKYsqRTqCDSpNWMBrg
         viiH0XZwPYUN4NvA+ZsI5RqFCiq8cSl7qHCO/+mIORunRS+LyjyQSFiiDzoTD7Nui+1R
         OQkiBNJ2ks8c/AGOczjbQaQCIBA53XPw45reddkeA9MW4k4udSEwqLx976Do8q3Goo1s
         AxqubBeGVbP12GV7lUJCFeUmfYzkQEzODSz7GyvMBB//p1rjdxpIlMDUmSD8ILbXjDWl
         AXEi58Cj9l4XMptr2TuyLgTk+4IyHx2hOYfvtO4SFZwvLu3ZABHXJSekcEz+GOBjFXSA
         VOJQ==
X-Gm-Message-State: AOJu0YzS+3QncqLN5RttCfoOQx+Ve90hXIdR0LUQgFFsZkegKCW0+qHn
	h0ek2joAHfiyc2xU3nIx9OpMOwIwq9FaV+eqa1I=
X-Google-Smtp-Source: AGHT+IEEmR3h5zmfFw/PkBJrMLiRHet99WVCblSZvQoCYyx/bd+lTJY0KO56LOzDMSsC5Ty28Ck4hXnftSUO3jod8F8=
X-Received: by 2002:a05:6870:58a9:b0:1bf:77e2:95cc with SMTP id
 be41-20020a05687058a900b001bf77e295ccmr6047550oab.17.1694710639775; Thu, 14
 Sep 2023 09:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230914154206.2143189-1-f_l_k@t-online.de> <CAMKF1srwzjtOq1vxfhMcEsb1YQmFbMbRidfcYT=tW6CRYck6hg@mail.gmail.com>
 <4RHZ0S.429LO849YY5W1@t-online.de>
In-Reply-To: <4RHZ0S.429LO849YY5W1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 09:56:53 -0700
Message-ID: <CAMKF1spKNX7YOrEbApJLi2KxD0hCKRJrMwAo3LYTer4G5ouh6A@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libdca: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 16:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104877

On Thu, Sep 14, 2023 at 9:28=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Thu, Sep 14 2023 at 09:14:26 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> if we change it into $(LN_S)f libdca.a "$(DESTDIR)$(libdir)/libdts.a" The=
n it becomes relative and can be submitted upstream as well.
>
>
> This change has already been requested some years ago:
> https://code.videolan.org/videolan/libdca/-/issues/3
>
> Anyway, the static lib isn't built by default so this would add a broken =
symlink to the package I guess ?

That would be a separate problem and the target creating this symlink
should depend on static lib generation target.
but as such, It would be good to use the upstream proposed revert.

