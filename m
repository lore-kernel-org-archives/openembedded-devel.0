Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95E4C88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 07:42:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34460.1789112377200338336
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 00:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=ZBcC//Sy;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2005440929
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FC01F00893
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112376;
	bh=bk6/9kcP8xleo9OUPFlUjIUa5ASGTZXm5J5bz0IR+8s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZBcC//SyslAtDO9JFU50hhOZ0LZoXC8eSYu38FOeQSq51AWwlpV21ee5SdTdTSF+g
	 bFmkqvyTTftrRWrz0EshO8dvcuGUPaoRLbE983EjvYmoDdcw8GPWVS9XTGPv13d21y
	 iR56Az/roS5LG28fNKr77Tstn/lv+nrqrGEEu5ohzmCDNL+YGDOFsC5MQCA9DKsQWH
	 gTWCJ6uTQEhV3CZAVPjv7rQAvLOPZvGpXtGlEBrt39zrRUMhqw4ZZkT4vgGTPUyOy+
	 ruQrxuAyiGjshUi2tygzCpz3ArgoMeITLbtzFGLt5ug8GtPxyLgTr9YL/rNrKSlCUj
	 BVDOyam4PTjiw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b808456308so747383e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 00:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlc8yypAl3YeXdwWauPtvcsnflIzHpSHzXpZwcdzR3owJuTjyHA+Cb7JPU24sRhahE9JBi2Czq3ZV0aiqhd2YBm5k=@lists.openembedded.org
X-Gm-Message-State: AFuF++lX0YAdkvMAH0iRldN0kLiBgWVmwF1Hco0oJWbrNXwzC/0M3k4L
	ZvImy9myBzuZsFRAIUglMpvEh+EwwUOQ0+Ar8KClipPIkIKeE/rkgYB/rjnpmylkbAk7USOnpwE
	UMWSuUBAyTsJ+UToXl1cUmh/lUq8hFH4aFqcxtwrGmg==
X-Received: by 2002:a05:651c:a390:10b0:3a3:52a7:3a1c with SMTP id
 38308e7fff4ca-3a5a505dc84mr1895731fa.4.1789112374648; Fri, 11 Sep 2026
 00:39:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:39:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:39:33 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v2-1-37b56013e2cc@gmail.com>
MIME-Version: 1.0
References: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v2-1-37b56013e2cc@gmail.com>
Date: Fri, 11 Sep 2026 00:39:33 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdo73z-6PVu2HvrGdkB9k95p407AYduih0AHeL67Uh5Cw@mail.gmail.com>
X-Gm-Features: AcwNN1UL4cewOFz_q4bjNpFtc9RHVQFw3bgaqI5NGfoZcS1d9N_sb7nFDRmcmTA
Message-ID: <CAMRc=Mdo73z-6PVu2HvrGdkB9k95p407AYduih0AHeL67Uh5Cw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] libgpiod: handle disappearing chips during iteration for v1.6.x
To: potin.lai.pt@gmail.com
Cc: "Potin Lai via lists.openembedded.org" <potin.lai.pt=gmail.com@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129954

On Fri, 11 Sep 2026 08:19:17 +0200, "Potin Lai via
lists.openembedded.org"
<potin.lai.pt=gmail.com@lists.openembedded.org> said:
> Add a patch fixing an issue where tools like 'gpiofind' incorrectly abort
> with a 'No such device' (ENODEV) error if a hotpluggable GPIO controller
> (like a USB device) vanishes from /dev during the search.
>
> This patch gracefully handles the race condition by ignoring ENODEV errors
> when searching for a line and silently skipping chips that fail to open
> during iteration.
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Changes in v2:
> - Revise commit message
> - Add Upstream-Status tag into patch file
> - Link to v1: https://patch.msgid.link/20260910-libgpiod-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com
> ---
>  ...ully-handle-disappearing-chips-during-ite.patch | 82 ++++++++++++++++++++++
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
>  2 files changed, 86 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
> new file mode 100644
> index 0000000000..e637689e8a
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
> @@ -0,0 +1,82 @@
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
> +Upstream-Status: Backport [https://github.com/brgl/libgpiod/commit/40f18f16f573e6bf091d83cb1677e7386d0b8495]

I think the correct status here is "Accepted". It's not a backport as it's not
part of any release yet.

You should also take the patch directly out of the v1.6.x branch of libgpiod
tree including the lore link and my Sign-off to make it clear it's upstream
already.

Bart

