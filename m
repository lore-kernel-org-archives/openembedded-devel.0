Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8497F4BB93
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 10:38:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42131.1772013202317416127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=b0DHIZpN;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AC46600AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0999EC2BC9E
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772013201;
	bh=Bb5eV6BmmC5BLUm4m4CS5i+vkZ0ShMg7zpCLSoROaDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b0DHIZpNOkE+Gm4jxLp4N0NlyAG9S9/u2mvYn4HBKkd6/ujrd5KuXh5bU74sZuEni
	 gaWwtudsfeNQIFQl32OJsaY71V5fSgRFV8xWSB1Ydd/a3q/0agpbTY/En3OETEAUtK
	 gjzXBPmlRSUtXP4FwCvwTCLsGVpa+D9SVjP0YJNlVEDnbQxY9ucw/hx3g/qh/z1aGI
	 ilXCdzcCVK7sX97xrMDZkigw3Al0R/L+IjG8lxZL1SGJbDFg9f5GmOEeuMd+0IAdVw
	 KQsbqcuGDx8SsBm7zY7m6ciumBdZb4ytNrpXhwwxhKmI61qscLpzG9lMU5Gnxqcl6e
	 xmrZcqEz4zb8Q==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38700168abaso52689651fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 01:53:20 -0800 (PST)
X-Gm-Message-State: AOJu0Yy9PhZYU2eYfalSeFwlfDifw5+W/IVZ8jQrbiyzuq+LeG3i5Rp4
	r2Xi8kDKfYf+PSpIqVcQb0rqfNBAIQgLkwAwf3paf7wYya9g6iLx6mjiMV4ql05VcAWFR+Y2nOa
	aN0p2VWkw5fCOU002qJsx1vk/SqEUpuMsw1BpaLb3fg==
X-Received: by 2002:a05:651c:b13:b0:385:d0fd:df80 with SMTP id
 38308e7fff4ca-389e2eda59fmr6950461fa.28.1772013199639; Wed, 25 Feb 2026
 01:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20260225093727.1284-1-wangmy@fujitsu.com> <20260225093727.1284-15-wangmy@fujitsu.com>
In-Reply-To: <20260225093727.1284-15-wangmy@fujitsu.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Feb 2026 10:53:07 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mej4gsH=YkJCQXULK3XJXan9UCdER1WfeEd4V6AzGB5eg@mail.gmail.com>
X-Gm-Features: AaiRm52GpB09IL2yJjcO-KxaEXUEbOuU_tpf74DfRPrT4h14pnY5icSl7-nQhOQ
Message-ID: <CAMRc=Mej4gsH=YkJCQXULK3XJXan9UCdER1WfeEd4V6AzGB5eg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 15/33] libgpiod: upgrade 2.2.2 -> 2.2.3
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 10:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124646

On Wed, Feb 25, 2026 at 10:38=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Bug fixes:
> - don't try to export the same chip object twice in gpio-manager on dupli=
cate
>   uevents
> - use the "add"/"remove" uevents when watching for GPIO chips in the syst=
em as
>   the "bind"/"unbind" pair is only emitted by linux for controllers which=
 don't
>   have a firmware node attached
> - don't allow clearing hogs on active devices in tests
> - don't install uneeded files
> - fix a pkgconfig check in configure
> - fix a return type check in test harness
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi!

I already sent a patch with that update. I maintain libgpiod and its
yocto recipe and I typically send a patch the moment I do the release.

Bart

