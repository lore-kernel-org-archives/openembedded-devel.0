Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAD1C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:07:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8433.1789025431952255398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 00:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=HZwcEsHQ;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E86A3600CB
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 07:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22241F000FF
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 07:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789024948;
	bh=VPaqf6vUuFE17le/uxUHlIO4qBVRB7bVjKDXW+vYyvE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HZwcEsHQBUZkdg5wNMmKrva9BCd5oDl4AxBVQZEU5KYKYh8ddLZCj7QqFIXGJbNjF
	 EoCOXQNNbFZl4LlqJK2Qm3PHPk8T24cgMST0ZxC+rFrEvdSitZyuyLfZ+G2U7dv8TL
	 jivOT+G/2/yhfZa/5EazNMmfoXG8OCianqhg2YYLfQNVtiOYdvynhp+rOiEVwlX6aP
	 wVKF3mp1xvY1XnixkYMl9SIZ1nmLvOeotiuuL2jUz2M4pUX/5FMCZJsNL+u0BkR6Nm
	 EfnzASnNuXxj3YIoDDsLJA6ZvsjzCbPC7+iEpmpGlWyOKetNEUt0cbN3bAPvGGZ7+5
	 9U3g3aXW3812A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4ae0b3308so5018054e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 00:22:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOHQt6cj/I5MVR1SZnxq7mWmEiDxcUtdjCIcbJjVZnDWUKjgQdJDmsand37PqoflDNVEQePp+H6AxPJVcFGaLYRnk=@lists.openembedded.org
X-Gm-Message-State: AFuF++kPlCf+ljaPxE7f/Dl40OXE2HPt9V5xIkjNYjvREjVfjhSyOtr3
	Zx/OTnj4oI1vag4a6uhtH3bOZmyNW0CzYafPlr5OvV/2jR/S8xTnP+wtJMsLxDasOehb0dvmx6X
	DszDoi8jKsyLFhK6anoiiv83XeKwtrs+Jw4qrDpXzsQ==
X-Received: by 2002:a05:6512:31d6:b0:5b5:e8af:a5f2 with SMTP id
 2adb3069b0e04-5b616f35604mr6515367e87.20.1789024947347; Thu, 10 Sep 2026
 00:22:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:22:25 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:22:25 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260910-libgpiod-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com>
MIME-Version: 1.0
References: <20260910-libgpiod-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com>
Date: Thu, 10 Sep 2026 00:22:25 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdQnFMN+h2DT05+r2sTcLWNiqm8YQ+V7FE6MDbtfgcqSg@mail.gmail.com>
X-Gm-Features: AcwNN1VTTyJtdchoca3fy3nN127XgL8dk_P53mf5cTXbMs2vXK6EbQYh09HxDn8
Message-ID: <CAMRc=MdQnFMN+h2DT05+r2sTcLWNiqm8YQ+V7FE6MDbtfgcqSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: handle disappearing chips during iteration for v1.6.x
To: potin.lai.pt@gmail.com
Cc: "Potin Lai via lists.openembedded.org" <potin.lai.pt=gmail.com@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 13:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129913

On Thu, 10 Sep 2026 03:39:20 +0200, "Potin Lai via
lists.openembedded.org"
<potin.lai.pt=gmail.com@lists.openembedded.org> said:
> When hotpluggable GPIO controllers (like USB devices) are dynamically
> added or removed, a race condition can occur. A chip's device node might
> be present when iterating through /dev, but the chip could disappear by
> the time we try to open it or query its lines.
>
> Previously, this caused tools like 'gpiofind' to incorrectly abort with
> a 'No such device' (ENODEV) error if any chip on the system vanished
> during the search.
>
> Fix this by ignoring ENODEV errors when searching for a line
> (in gpiod_line_find()) and by silently skipping chips that fail to open
> during iteration (in gpiod_chip_iter_new()).
>

This should describe what this patch is doing so: "Add a patch fixing an
issue where...".

> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  ...ully-handle-disappearing-chips-during-ite.patch | 81 ++++++++++++++++++++++
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
>  2 files changed, 85 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
> new file mode 100644
> index 0000000000..bbf650e565
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
> @@ -0,0 +1,81 @@
> +From f6b384d2b906581e3cf072329e9bd03f3241c61d Mon Sep 17 00:00:00 2001
> +From: Potin Lai <potin.lai.pt@gmail.com>
> +Date: Tue, 8 Sep 2026 10:48:36 +0800
> +Subject: [PATCH 1/1] core: gracefully handle disappearing chips during
> + iteration
> +
> +When hotpluggable GPIO controllers (like USB devices) are dynamically
> +added or removed, a race condition can occur. A chip's device node might
> +be present when iterating through /dev, but the chip could disappear by
> +the time we try to open it or query its lines.
> +
> +Previously, this caused tools like 'gpiofind' to incorrectly abort with
> +a 'No such device' (ENODEV) error if any chip on the system vanished
> +during the search.
> +
> +Fix this by ignoring ENODEV errors when searching for a line
> +(in gpiod_line_find()) and by silently skipping chips that fail to open
> +during iteration (in gpiod_chip_iter_new()).
> +
> +Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Missing upstream status?

Bart

