Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667E6CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:03:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58453.1790604918139343175
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 07:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=ZTxVzTRY;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E611C4364A
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 14:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1AD1F00899
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604916;
	bh=UZbcKX57WkeOGOCDWKvaKf1uCyvsQ7xcDLB58Y8xNKI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZTxVzTRY8Ua2NWMcB7V3Ab2z4vhfa4wE0FJJJrDVL1s5Yr8a48WioG+FXCA/Y+wGP
	 qbO1kg2NiqUxUXiUMml9jYFOVgq585tqJ0gXLfWGIfNz4+Rk79ut+6VKguushY0NTr
	 asQuJpcfy/qmmJ65uDABnjnQBTS1WRDEOCTYCyepYT8hvsUcvM6veAqVKWAw0BZErQ
	 izeq2kbimDDRtWiocRW3N+u8ithqTgcBeUlszG2Glsg/pNuaXpqZa0kYdCcwGjHRS9
	 tgFNmVIP6I7ZMklRPQWiqPAIhAHfUCdByG+LERZVhu/MpFyI2gkIkNt7siG6kGa3Id
	 Bdd9XRtbfyY+w==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so2702651e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 07:15:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKxYQuqPREmswfzOe4RHLHkR7aAWos30sE7nTUcZBOF99lCXTYIFHlgdv0YHh7W9VA0X27EaBksz3xQMdLbNcuheI=@lists.openembedded.org
X-Gm-Message-State: AFq9FYIbLWCQ/+HLaazSInDH1nw5yq+cjKQnfy+h2gjK4JTI873mvjAS
	lmfWm/lallUCoXi8aBH/CoJxpSzrdiU0fmKAs9y2To/n1vZJT9Ko1wmSgxJyJNG9laFJ/Afa99Z
	r4H+CHkQbgL3h//pBEOXT4vd0Rrj+xf+nWegeLAsp4A==
X-Received: by 2002:ac2:4e11:0:b0:5b8:bc5e:b575 with SMTP id
 2adb3069b0e04-5b8df2025f7mr4357545e87.45.1790604915547; Mon, 28 Sep 2026
 07:15:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:15:14 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:15:14 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260928130631.4254-3-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260928130631.4254-1-mark.jonas@de.bosch.com> <20260928130631.4254-3-mark.jonas@de.bosch.com>
Date: Mon, 28 Sep 2026 10:15:14 -0400
X-Gmail-Original-Message-ID: <CAMRc=McYD0Xfp-a7945FgLZw3OELiTXSDrToJafjDH=+Wwp5uQ@mail.gmail.com>
X-Gm-Features: AclHuK9dq4yRguz8nhtHXQ_lfnr6LsWJoR00xDSkAmYetNRCwzfXOBsSkldADSk
Message-ID: <CAMRc=McYD0Xfp-a7945FgLZw3OELiTXSDrToJafjDH=+Wwp5uQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 2/2] libgpiod: set per-package license assignments
To: mark.jonas@de.bosch.com
Cc: "Mark Jonas via lists.openembedded.org" <mark.jonas=de.bosch.com@lists.openembedded.org>, 
	bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 15:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130442

On Mon, 28 Sep 2026 15:06:31 +0200, "Mark Jonas via
lists.openembedded.org"
<mark.jonas=de.bosch.com@lists.openembedded.org> said:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> libgpiod 2.x has more complex licensing than its 1.x counterpart, with
> multiple licenses applying to different parts of the project. Because
> the recipe has no per-package LICENSE statement, a user installing just
> the library (LGPL-2.1-or-later) might be led to believe it is also
> subject to GPL-2.0-or-later and the other aggregate licenses, which do
> not apply to that package.
>
> Thus, to make it clear which licenses apply to which parts of the
> project, split the recipe-wide LICENSE into per-package values so that
> each generated package reports its actual license instead of the
> aggregate expression.
>
> Additionally, the CC0-1.0 license has been added to the recipe to cover
> the 90-gpio.rules file
>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

