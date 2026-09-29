Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15DCC9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 15:13:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8685.1790691052095951678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 07:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=e2isW/0S;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9137360136
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 14:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490C71F0089B
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691050;
	bh=c+txiXrp/wAV2uBOewUSq9rBZpkfTP+q2U1LFLeNlqE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=e2isW/0SDykU0+vG2rUWdMONLvtCO0rodVPyV6NQzP64laWWcaJRCrMcv7s+YcJMY
	 aMGfc5GOVLsYny8QJ4x1XNSmXobPx9vCaOs1AsuAM4qYOhJZVWLdoE3PAHJogBfF1T
	 HwgVZZVu/uGb/m7d1QbsHrHUhgc6qVyMdRmCcaohbldcJHPplbpCtGc5fDQNQBFWNA
	 VDmAs6r/pdzNOx32j+FcCVcaqbbEe+hZLTwJMHmul871jpxviM4f86L0ZyOPTsWGgD
	 UKPJOIWXnsRSYX+TEYoFFLMaxtp6smm1S56SUU4XQ6TrMxcgIYTyzSWCHZ1uRfBTTs
	 nZqngjqhLzPQQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so5858440e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 07:10:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfJvWrNuEMvG1uhpEj5PNsrlsNYnPnuoxGWvbqb9BXZ8FF/+IfnPoxls2X7j4WpelHi6FqHnZ6yIhilehLZIS+GMU=@lists.openembedded.org
X-Gm-Message-State: AFq9FYIHoyI0SDlqIs3Y1HfNh1JLFJyc44syazR/ihV3fekyA4c/OULx
	80mNGcqxH/Wf3N4/H3uwmuCrnfszGCW2LXehb1AZbZcheRKAhQGo93/lcWozx/bk/GxqFflBIJT
	fKvGM2OBxiSHRVrK3qjwMrL8uk2sJ3PD6jDmv3QpSUA==
X-Received: by 2002:a05:6512:2522:b0:5b8:eb27:a009 with SMTP id
 2adb3069b0e04-5b8eb36e33emr4857577e87.17.1790691048979; Tue, 29 Sep 2026
 07:10:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 14:10:47 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 14:10:47 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929131346.1894-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260929131346.1894-1-mark.jonas@de.bosch.com>
Date: Tue, 29 Sep 2026 14:10:47 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfbBDStRjxERqXG8n3Vx0Dwi+dTut7txU_nyKwgOYfQTw@mail.gmail.com>
X-Gm-Features: AclHuK-nvsmzk0ES2kHOSvFxBoD08_SIJ6tg0I2T8N3RB543jJJxwZmzSR9OV1A
Message-ID: <CAMRc=MfbBDStRjxERqXG8n3Vx0Dwi+dTut7txU_nyKwgOYfQTw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 0/2] libgpiod: detail package licensing
To: mark.jonas@de.bosch.com
Cc: bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130480

On Tue, 29 Sep 2026 15:13:44 +0200, <mark.jonas@de.bosch.com> said:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> This series corrects the licensing metadata:
>
>   - Patch 1 backports a patch which fixes the libgpiodbus license
>
>   - Patch 2 splits the recipe-wide LICENSE into per-package assignments,
>     so each package reports its own license (e.g. the library as
>     LGPL-2.1-or-later, the CLI tools as GPL-2.0-or-later).
>
> Changes since v3:
> - Fixed libgpiodbus backport patch commit message
> - Fixed checksum of CC0-1.0 license file
>
> Changes since v2:
> - Inversed the order of the commits.
>
> Changes since v1:
> - Squashed addition of missing CC0-1.0 license into setting of
>   per-package license assignements.
> - Backported the license change of libgpiodbus from GPL-2.0-or-later to
>   LGPL-2.1-or-later.
>
> Ricardo Simoes (2):
>   libgpiod: update libgpiodbus license
>   libgpiod: set per-package license assignments
>
>  .../libgpiod-2.x/fix_gpiodbus_license.patch   | 26 +++++++++++++++++++
>  .../libgpiod/libgpiod_2.3.1.bb                | 15 ++++++++++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_license.patch
>
> --
> 2.43.0
>
>

You dropped my review tags.

Bart

