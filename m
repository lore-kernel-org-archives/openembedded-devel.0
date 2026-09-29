Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AF5CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 15:14:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8819.1790691075222229335
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 07:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=SH7pKUU+;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DEE3601F9
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 14:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2594D1F00898
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691074;
	bh=MlxnGRo5g4Pe9HDEBaVQBmbzitkD8ZkfsfxA8/vJ2rc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SH7pKUU+HidMmrhEGUIWJhfmysjOe3nY7ZfaUsn9Nf5zlTawULmgro7T9XEoV2q5i
	 9apsBVgRlK6cDPGCSPaLehaccZ0WdnfptQhYzsKgwgW1xFnP3mpQJPNj9vK//R/Gdp
	 s2/0DAH5XuUC+7/mVhSizUfB6sNeGYRs0PedctasP1YIEGSGEXp7kvzYY5FaSTcr/x
	 jtb8eCB0OT68yK40j4JhGIRX2Cv5CE1sJKx0VJRRdIauU6b1LX7Olb88+ZqpyhAldF
	 5VRzzOE2Xl0C/JLuM9JEwznmjvydfA2aPWKxYx7MbfkCJvTfJPgxaeqlUuIL7Vj4ZJ
	 WIBAxy4kyzsvA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so4214752e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 07:11:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXklAqSb/XqRwULPMRGrUkVOOzY6JjJfpE4PZPfLbfA3U5LY+2bbL5wbQHz9vjej5GojLyQm5y2Gghj8bvXkZJdoE=@lists.openembedded.org
X-Gm-Message-State: AFq9FYItuwdVdOBYy0HSVe7D6H5sWpvRQ5OjGiO9N3Tzib3m8gd3n1by
	6rTGzkqxGiCrOk/+d1OlZ4bs06AKDWK40HDYaZVlIEJkMaqVn1mTzGOitCkHYxvgJULmtWaLkoL
	0MjVY36ZeygQqWN4+eGNGDo4izfDjhIh7iudbr4B7ug==
X-Received: by 2002:a05:6512:6681:10b0:5b8:f45f:4bbb with SMTP id
 2adb3069b0e04-5b8f45f4defmr1777570e87.47.1790691072887; Tue, 29 Sep 2026
 07:11:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 14:11:11 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 14:11:11 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929131346.1894-2-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260929131346.1894-1-mark.jonas@de.bosch.com> <20260929131346.1894-2-mark.jonas@de.bosch.com>
Date: Tue, 29 Sep 2026 14:11:11 +0000
X-Gmail-Original-Message-ID: <CAMRc=MedDZ6EMwZ_fC_0TbKu-CWQevuH_Aky=NJ2FxJ55hyV2Q@mail.gmail.com>
X-Gm-Features: AclHuK8hGLcueuHayHNtSaNIx7_zfNN9HR92xafdpAe5iT3KjJssar6eQKhj5Ow
Message-ID: <CAMRc=MedDZ6EMwZ_fC_0TbKu-CWQevuH_Aky=NJ2FxJ55hyV2Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 1/2] libgpiod: update libgpiodbus license
To: mark.jonas@de.bosch.com
Cc: bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130482

On Tue, 29 Sep 2026 15:13:45 +0200, <mark.jonas@de.bosch.com> said:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> The license for libgpiodbus in upstream has been updated to
> LGPL-2.1-or-later.
>
> Backport the patch from upstream so that libgpiodbus can use the
> LGPL-2.1-or-later license.
>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

