Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A035FCA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 15:14:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8812.1790691066465064244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 07:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=NCna0fDR;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E78F43AA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 14:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346711F0089B
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 14:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691065;
	bh=wzCD8j41zpw0N+dDLJWeG3jhBD4A7dQ7xpyUObjo9II=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NCna0fDREY+RGOggYodQW0l5Lfejo2Ru93vaE/hFLpaC+614xdm4ZCWboXCidoS5D
	 bc8RYk8/lhPxnDjfWpTUFqZrJvX5EmSFeMsJwItMMyp91q3xhe5TCzz14oAACncHXn
	 3vLkZ+BJMJm03njVluaHhb2qw57/yrsPy/bTWLnWyIaRhG9916PP/qfzVUd9iIVKBU
	 3Gu8GJS/oxsjkO+y+6qj25YanEC69Lt/62yTIoGkuDMzJgUN2ztgCgKXBjUWqnymI8
	 4059TL3j2thRadeIv/isYk1yc595Ja9Zsau7v+8CVZ77x0rSqIdqfpm6ablrdwOpyJ
	 mjQIe2rg/jJZA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ecca9f3fso3262088e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 07:11:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWdKpF0Jcc018Fv8YXAk8Ucirz82Ki5j+wPCQ4hkJr8O03GqGxqGdySt+ZmeUUjGnlo4tbKMTZgTLCZxFdcW9+B1U=@lists.openembedded.org
X-Gm-Message-State: AFq9FYK9G82JHolcUnkz1xbXhgUtfIqgLi/NOJWuiYc1gZnYU78O4Zv9
	SXu0ZGoqD3M9kMzSd91Trsw7oCvxD5arwoCtzlNmSb1tqDmYbogl0YwkNoftHTNW+8P0WMojKqw
	t613MHtW6eOibWH5Qu0Bkfg61RzrfQo8mRJsMDycspQ==
X-Received: by 2002:a05:6512:1052:b0:5b8:bc5e:d0f9 with SMTP id
 2adb3069b0e04-5b8df09b4b8mr5810053e87.35.1790691063920; Tue, 29 Sep 2026
 07:11:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 14:11:02 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 14:11:02 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929131346.1894-3-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260929131346.1894-1-mark.jonas@de.bosch.com> <20260929131346.1894-3-mark.jonas@de.bosch.com>
Date: Tue, 29 Sep 2026 14:11:02 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdQvL_y5q3QQau9QnEEKp5sqV+D0vR9bH3vkK_kui_zow@mail.gmail.com>
X-Gm-Features: AclHuK-pePe4noeZdYHPyggPeNN2ll0hskRLE5yAVu1CnSolA2GyVVQSefDU7v0
Message-ID: <CAMRc=MdQvL_y5q3QQau9QnEEKp5sqV+D0vR9bH3vkK_kui_zow@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 2/2] libgpiod: set per-package license assignments
To: mark.jonas@de.bosch.com
Cc: bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130481

On Tue, 29 Sep 2026 15:13:46 +0200, <mark.jonas@de.bosch.com> said:
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

