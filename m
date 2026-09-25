Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DFAC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 14:19:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8936.1790345121098877271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=SbPs2spk;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3CD543507
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9909D1F0089B
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344645;
	bh=UQDEco+WYq+4QvG2iwfdpI73eFB1zYSKx/t8LW6ddGQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SbPs2spkBzy9ew6PS9SpxDjO4T8RKzgq62ISPtDTf1Kk3Shn1HmiDpTiK5dGGyldZ
	 xzTnNpcHjnb/oMaM6sbTXaWXIWeKrUngxuFQ8VvWUsT9Slt1VUO3r4hxCq1nOvv3P4
	 5Na0hsCfIUyZ2bBJeTI5wwpY+3/+cmzt+vNT1gxhhIhAVNw0TOxEREsboVcLrasZ7H
	 /pl+W8QYB+242ugaU8GDmYP/yCIUU/knAdnbp4YMrsLQtGIxPlUhz51xBEkCJOyxyD
	 wb5uqJLQtGBo6IksA8u8QAwgpiOVwamAKbk0aQ2m9PlOwes3QWE9Hum5RCp7xhdRGR
	 WJc5c9Lwnjb2Q==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb3a9d9bso373658e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 06:57:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3j9nmsp621GmVA7uoxlmA2CLBvTbuj3mn0HwLl2lEOScwQeke+4OijUnwOx0UulV4GzcD0w5HTNxo/Ly9SARBm/c=@lists.openembedded.org
X-Gm-Message-State: AFuF++n+uYWNvP0kXAFdjMHHTtlpLD3APkKtBSGtiY6Ji9g6iVcAp54l
	oi68y7X3DwyG8f3h6NsDJB11nPmFVAZS3GnbgwT8GrPp/OiVHg+nKZMkfMBFBd++83GQEkcM+rl
	iSmpY4kj2H0GpQk3tL32fT81fJkPbN2PeBaoDtQoz8Q==
X-Received: by 2002:a05:6512:3d02:b0:5b8:b37f:164 with SMTP id
 2adb3069b0e04-5b8e0a18645mr1788673e87.48.1790344644321; Fri, 25 Sep 2026
 06:57:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:57:23 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:57:23 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260925133929.1991-3-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260925133929.1991-1-mark.jonas@de.bosch.com> <20260925133929.1991-3-mark.jonas@de.bosch.com>
Date: Fri, 25 Sep 2026 13:57:23 +0000
X-Gmail-Original-Message-ID: <CAMRc=MeH8bFxdrrA3MA6+Zz90As_ZP=nOCyoeToSH8NzAU-5Nw@mail.gmail.com>
X-Gm-Features: AclHuK_gHw7JvOeixMMrwzwDdfl5QMVgBz3iPNpnukk10eJ1llRW6uYSAUgX_V4
Message-ID: <CAMRc=MeH8bFxdrrA3MA6+Zz90As_ZP=nOCyoeToSH8NzAU-5Nw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] libgpiod: add missing CC0-1.0
To: mark.jonas@de.bosch.com
Cc: "Mark Jonas via lists.openembedded.org" <mark.jonas=de.bosch.com@lists.openembedded.org>, 
	bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 14:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130304

On Fri, 25 Sep 2026 15:39:29 +0200, "Mark Jonas via
lists.openembedded.org"
<mark.jonas=de.bosch.com@lists.openembedded.org> said:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> The package PN-manager-cfg is shipped with the file 90-gpio.rules, which
> is licensed under CC0-1.0.
>
> Thus, include the CC0-1.0 license to the recipe.
>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---

Shouldn't this be squashed with patch 1/2?

Bart

