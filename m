Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8C3C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 06:15:01 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.42471.1705817694146047979
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jan 2024 22:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYX03Gtc;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5986cb7bb61so1203775eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jan 2024 22:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705817693; x=1706422493; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMsqjvv680+n9h0NhY6BsFi/KSS66g6HpUaZtSByV94=;
        b=OYX03Gtca9ZvtL1IYgojNZAh8b22zvq1eY8ykrUVcsPPzQsP78wBS+HsOXanudr7IF
         mojZLgT39Jt8XhdlXgfZPoXIxEfs+gQq6qupTd0pSQ3bw84zuzKDPzX5rNDFzMCRVIY1
         I9EsN1Jf4vM1bN+eLLFbRsvmVLuXWV5hh/M549pQAHUTJ5EqbGiLKVzld6Ne59oqFDEs
         g77H5QC7o5uMcHHZFI/ZUKMSG5zxjIsmGrufdRzUyTM2nEhctj9umy+bzQChPsVnWPIw
         2D1FDYqCdda7NoElylJbDr7zGQToXqmKjms+WllM5l0HluZ2du7L/LUWzdOpK1+2uwG/
         iDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705817693; x=1706422493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMsqjvv680+n9h0NhY6BsFi/KSS66g6HpUaZtSByV94=;
        b=Ja5gF4SgTf6PgpoSu+zBAlzwaGoF6YAgyzrBBsWlgMptgPSi0pFinXGVsQcnlo6o2H
         rEvO6SCOaLGF3MGfXvqdtHNZ/wMou8KSyRVa9x8CsjdFVFRoxjnhI5S2JjrYqpe/w2AO
         5sfnwnBugS+/TPHFSWFFH8J4du37Y2HjIop9hXNAuDH9Z0UKtM4EST32yofJpK8+jxcp
         V8zYTIrndgVMUiV+aSp0TQ1L2N+ezGNkqj8CoWeBkmMJZp0I/pWzmwZMXUjoK1NpoJE7
         6jgosJmLDZbb+LL3GzLJuBb5jimpLzWoKzU31OR0Td1CaamkjV1NsfhoIR4xQ16bQ1xD
         Fwrg==
X-Gm-Message-State: AOJu0YyFnFV+xJAz3g11vY3oSORKc5qwqA/u7E3NFPuJZ51TvlgzMHIO
	FyWBzI+IBLn7Z1na71F6xrqVTe6e/F9qxn9YOkUR1IT/0ROCruLNx3jiEp8vTQKqabc+aXy9cKP
	JrWq5Yt9bYhdglpmrokypSa4MHhRrwL3Akoy/pQ==
X-Google-Smtp-Source: AGHT+IH12c93OR5+JqfIwvza54N4KN9/vPTCJf3mTD4rtfFXHvBcdDqdwjLOssDZ4UKTjkqOT7bgOiy4E9JWd5bV+xk=
X-Received: by 2002:a05:6870:63a9:b0:214:2cbd:3c12 with SMTP id
 t41-20020a05687063a900b002142cbd3c12mr1603024oap.70.1705817693250; Sat, 20
 Jan 2024 22:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20240119102009.18867-1-paul.leguendekerneizon@savoirfairelinux.com>
In-Reply-To: <20240119102009.18867-1-paul.leguendekerneizon@savoirfairelinux.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Jan 2024 22:14:27 -0800
Message-ID: <CAMKF1srn6ie3a8N7tYZQi2i-oYsi7kyaa=3QraViX5hNXO2ESQ@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH v2 0/2] add support of cockpit-machines
To: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Jan 2024 06:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108367

I am seeing some more missing deps

ERROR: Nothing RPROVIDES 'virt-install' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-webserver/recipes-webadmin=
/cockpit-machines/cockpit-machines_304.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'virt-install' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virt-install']
ERROR: Required build target 'cockpit-machines' has no buildable providers.
Missing or unbuildable dependency chain was: ['cockpit-machines',
'virt-install']

On Fri, Jan 19, 2024 at 3:40=E2=80=AFAM Paul Le Guen de Kerneizon
<paul.leguendekerneizon@savoirfairelinux.com> wrote:
>
> Hello community,
>
> Since version 242 of Cockpit package, plugin `cockpit-machines` has been =
moved
> to a dedicated repository. This cockpit plugin is used to manage in web U=
I
> virtual machines. There is currently no support of the new cockpit-machin=
es
> package in any Yocto meta and the following patches bring it:
>   - Patch 1 adds the recipe of cockpit-machines
>   - Patch 2 remove all the old occurences of cockpit-machines package ins=
ide
>     cockpit recipe.
>
> Waiting for your review, feel free to ask any questions or remarks.
> Regards,
> Paul Le Guen de Kerneizon, Savoir-faire Linux
>
> V2 changelog:
> - add needed distro features to match cockpit recipe constraints
> - add needed compatible host to match cockpit recipe constraints
>
> V1 patch: https://lists.openembedded.org/g/openembedded-devel/message/108=
327
> Paul Le Guen de Kerneizon (2):
>   cockpit-machines: add recipe
>   cockpit: remove occurences of machines package
>
>  .../cockpit-machines/cockpit-machines_304.bb  | 28 +++++++++++++++++++
>  .../recipes-webadmin/cockpit/cockpit_304.bb   |  5 ----
>  2 files changed, 28 insertions(+), 5 deletions(-)
>  create mode 100644 meta-webserver/recipes-webadmin/cockpit-machines/cock=
pit-machines_304.bb
>
> --
> 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108358): https://lists.openembedded.org/g/openembedde=
d-devel/message/108358
> Mute This Topic: https://lists.openembedded.org/mt/103828014/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

