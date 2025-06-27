Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFFAC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:36:38 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.15386.1751034995299368682
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LCVVfrOB;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fb01566184so19681326d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034994; x=1751639794; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V2FTICDvLFDBhNVHeBHUm/pGPQEXRIQnMQOWQ+xO+XA=;
        b=LCVVfrOBdq5NOojf/uiJ4C4GX1EwHunJxwVfLf+JPGiZ4n5vBNJvPk1/guGbF4HiLg
         24k+ZP2Q1AaTsFalydVW7ak2gppK/yPHLvHuN3vJjXlxXnuKHiskOYWm4x54nhZb+1Z5
         Jzvd7yeL/xLUUr8I9HnQjjFamsT9zbVA1oMeT+t8btkngY+fvAJRREgboMXeIy/EONk2
         GiCzPIhc7ucUmaWafArUfFaH6bIDwAw8dSXYwrXBOt+6RB/bIE+76Ar+vKY21k0o195O
         rV0L3ZaT8UD3+k318xn6ssXd2ESsvLWfaETmomoZHNx8LtFW7aD2Gk1W9UwYtIsNTgnm
         Sbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034994; x=1751639794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2FTICDvLFDBhNVHeBHUm/pGPQEXRIQnMQOWQ+xO+XA=;
        b=ctD7bRu4cYoV1DvkUIqo86wCyLb/hfQTiDkkC8wFu2rhaBpS1or3baoD0ex+2vv9Tk
         qoM4SzEiHZCyXMnxqQBfl8eLzA6RHOZL4xlFBiM+IFZ94CPZXClbAaF71rBPGAuCa6++
         jwMK9wUe4CRMJbnZzQu0iZZc2K4NgZCmCMUzDy9CwYsDWG4XnuyRXOW2QfbJ1USAtS+o
         y45SLWcJ0ILEyjA15IS/1hSazUizI6an+qLKY98XDNNOeN284mXUV7W4U2eX8OfPAVQr
         XjWuufPooM4AIS1pvN9nVglZ+W5xnfw746GfNBKdq5NGzKGqIiI31oBn3OVu64eKNwCq
         Thmg==
X-Gm-Message-State: AOJu0Yz660inhku40gaW6A1veWoLC3MjHVebo6UD7lofyKIaCtRhWm+i
	AADksrGX1G+B+nCPcc2X9py6tcXPD/1XtNa8taJkbT4hLGqddlSfw0dLJDi07c3ZvLe8mHjModu
	BjDadE4FdT4HthEDxGkvCMkymIXdtMVA=
X-Gm-Gg: ASbGncsXLNFgHxv+mlw9mvVJCYffZVW/pr4ZBo2hVdeA7gUCp3KfBtec/FjpRG0vjti
	SuffBMkOOJrFGWgDFb2dI9VPoAJBjaJr8LuIQKqFf6RlqY78FeWzOJq07ZHUGAzrU5+oVM64XHI
	V+D+xoMcfImvLxbm1x8tKXN4mr1T0MzR/zUsq7VtdD5tpwSXoU/SVlb2a4epnYTO4v91gJQAs5P
	S1g1Q==
X-Google-Smtp-Source: AGHT+IFr2i8IvfH5x3BjeSnrIMk0S770YY8DYHsU233O4/nwpZCdOfeeEdFVTQVesbbmRdbEqUlFa+6XgiZ1icUWHE4=
X-Received: by 2002:a05:6214:5c03:b0:6fd:75e4:982b with SMTP id
 6a1803df08f44-700134a743amr56819846d6.33.1751034994194; Fri, 27 Jun 2025
 07:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250627140633.354460-1-skandigraun@gmail.com>
In-Reply-To: <20250627140633.354460-1-skandigraun@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Jun 2025 16:36:22 +0200
X-Gm-Features: Ac12FXzIBcSg0Mriqhnra8RYNQw6Rh0m4D-xI38kTuGrzXwkl89fS1g33vP0bsY
Message-ID: <CANNYZj_K1AT8nov3Wz30bUVdReE=c=DNvgKEQ5tKAygVb1MshQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: inherit qemu class conditionally
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 14:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118158

On Fri, 27 Jun 2025 at 16:06, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
> The recipe unconditionally inherits the qemu class, because it executes
> some target binaries when it is cross-compiled and the bit-width of the
> build host and the target host are different.
>
> Since it is unconditional, it also means that it is inherited for native
> and nativesdk builds also. The qemu class uses some qemu options that are
> always derived from the target machine's configuration, even when the
> recipe is built for class-native. This means that some of the variables
> used by the recipe changes (e.g. QEMU_OPTIONS), and the shared state cache
> is invalidated when the target machine changes, even when nodejs-native is
> being built - and it triggers a full rebuild of nodejs-native unnecessarily.
>
> To avoid this, inherit the qemu class conditionally, only in case it is
> used (when the target and build arch's bit-widths are different).
>
> Also, inherit qemu-native based on the same condition, and move around the
> qemu-dependent code a bit, so it will be only executed when the qemu class
> is inherited.

This doesn't quite look right. Plenty of other recipes inherit qemu
unconditionally, including some pretty foundational ones like python3,
and they do not need this fix, or do they? I think something else is
going on here, and that issue needs to be properly investigated.

Can you describe the steps needed to observe the issue? Can you take
those steps for e.g. python3-native?

Alex

