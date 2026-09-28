Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6505ECA5FA9
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:03:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59427.1790604903108934406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 07:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=lKoNHVzg;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBADA601F0
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 14:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FAF1F0089A
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604901;
	bh=fbsibeGP9B0etevS01eIeLYxfnH7DbWCOCoeWFtQ9EE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lKoNHVzgsy4vwtcVkOaepsMqX4sw5nKnGPtaZY5UFvph4+DwD2oPAMPvmNvDkOUVb
	 7elwsmU073lVCcW3Cv0cjBoIL7cxQZTgV1+qSQ4BvYEXtTtY9PVrVJwiYg+5DlqIug
	 nawvtCrT1X0isw0q73em5EhJVOsskcsvTCuv/66orStHHF4bVmiV2dHAdcdoS40ojV
	 9mrqxJQoIYTpIcO8D8NPH3aTVMUAcSDTib5NB9sfqe5bEeK/w9W60OUzoICAACea3y
	 3xwgPc9wLK/2mvDzTiTeZbQLfVhgV2tS6HFEdxwPPoaAd41iAEoVVOV/FfEyuEziIR
	 q6Zi3FYIRaDVA==
Received: by mail-lr2-f30.google.com with SMTP id 38308e7fff4ca-3a65a2eb953so18710001fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 07:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlSc8rRxiGcl1Lr1eIOHqKxOGlFS7K6lE1SivDC+hE/kGbr2zWPp86HSiszqBkBFJfWQQ9juFkCim0xX3voQpAI4E=@lists.openembedded.org
X-Gm-Message-State: AFq9FYIJWE6TF7tsR/58aBvO038ZeXuM5iePgqQijpjEumXtmBTVsrQp
	NXX2cpVj9xS1eN9eoB48mFYXxE1jIKXThfrZON8qAM5477JL4F6DgjDYbvC66kR31NtFxc5fHWG
	e7mtmzNlrNZE1gzibAuzBOpJauRiNAMtNCe5fF+Bplg==
X-Received: by 2002:a05:651c:150a:b0:3a6:5c75:b3ab with SMTP id
 38308e7fff4ca-3a65c75b5f7mr17084981fa.24.1790604900108; Mon, 28 Sep 2026
 07:15:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:14:58 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:14:58 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260928130631.4254-2-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260928130631.4254-1-mark.jonas@de.bosch.com> <20260928130631.4254-2-mark.jonas@de.bosch.com>
Date: Mon, 28 Sep 2026 10:14:58 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mdv7cj-Sq7QdhyeVaQxQ3Q3vSzSYe+32tu_WEA3RkJhXg@mail.gmail.com>
X-Gm-Features: AclHuK9ISbPjP4eqjjhnaa2Su1rT4uhFBUaAhu_zG3NPVDXYU9W_cR4OCyoU4IA
Message-ID: <CAMRc=Mdv7cj-Sq7QdhyeVaQxQ3Q3vSzSYe+32tu_WEA3RkJhXg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 1/2] libgpiod: update libgpiodbus license
To: mark.jonas@de.bosch.com
Cc: bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, openembedded-devel@lists.openembedded.org, 
	"Mark Jonas via lists.openembedded.org" <mark.jonas=de.bosch.com@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 15:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130441

On Mon, 28 Sep 2026 15:06:30 +0200, "Mark Jonas via
lists.openembedded.org"
<mark.jonas=de.bosch.com@lists.openembedded.org> said:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> The license for libgpiodbus in upstream has been updated to
> LGPL-2.1-or-later.
>
> Thus, update the package license and backport the upstream change
> until it lands in a release.
>

Not: this patch now no longer updates the package license.

Anyway:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

