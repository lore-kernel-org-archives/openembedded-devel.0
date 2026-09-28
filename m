Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7654DCA5FA7
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:03:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56262.1790598623458318654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=MctWcVpe;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8A8743722
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 12:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0ED1F00899
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598089;
	bh=XdlosJD+iFkqUY5utrCCruh4Im7qCY7Ps8r3ZtsvbVM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MctWcVpeGIPz50TQMFrnsRSUGj2Z6riQqUD4lgAGOeHBxw4c5QwrSxxNXrXWc/f+z
	 Dn7ep5b/powv6NiV55vD+Gh9heMb/gB4oXPK1kDDrSHO1rHo7oPtZCwDP4oSs0mT0O
	 rqCnLQnh2K2I3c4QD+WXSPIeyiUGc2sYiGf7ecxasqdyknaN2n6R8nclx/P8BQFwCc
	 W2GdsDIhfM2lZ92/Ul9wRhTxp5nXG+S6/QMEGdllK3Mfmzgkdr3n8qipK9Mu2rUb+S
	 Gfg78VAX5lZryq0eCnT6hFWuxSzcJa20G9YdoSox/F4U7C85i7Ogl3rzXZHEiWeLId
	 DqEp8bM994uDw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so2868603e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 05:21:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxobT7WqYTZztlps2CY/ultZ4Ky9apzTq2SJTrg3z7G3wnzgYwJPAVFRmunm0iFCwa/x703robgDcKRYlryYHxQReg=@lists.openembedded.org
X-Gm-Message-State: AFq9FYKLFvFWQFRM66vUMuG/Ubnf05Lih6B/UerU3yUSjQmQKwblIF0A
	t2IV/zVOoXqKfusvXpJmVJQBenFkQaT8OaTSr/zC568DTGmYPYKSBbG+04lpupkbkvpqaDff/D7
	tMxZsYcpBaT9H0fj5IlPXuFjZgZc7RO89HPHwghJJoQ==
X-Received: by 2002:a05:6512:12c6:b0:5b8:9ef4:2bdf with SMTP id
 2adb3069b0e04-5b8df09c129mr4416690e87.26.1790598088320; Mon, 28 Sep 2026
 05:21:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 05:21:27 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 05:21:27 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260928114704.2719-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260928114704.2719-1-mark.jonas@de.bosch.com>
Date: Mon, 28 Sep 2026 05:21:27 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeQ4kt7KWsBYLPUdL+ukBcLJ1Nn8hDxYkqr2Gc0DNPOGA@mail.gmail.com>
X-Gm-Features: AclHuK8ld936qBH-c8HpCN1KsGK97WAcov3O-ZPT7DSvUIWW6RibNrDsgLrGd2I
Message-ID: <CAMRc=MeQ4kt7KWsBYLPUdL+ukBcLJ1Nn8hDxYkqr2Gc0DNPOGA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 0/2] libgpiod: detail package licensing
To: mark.jonas@de.bosch.com
Cc: "Mark Jonas via lists.openembedded.org" <mark.jonas=de.bosch.com@lists.openembedded.org>, 
	bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 15:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130440

On Mon, 28 Sep 2026 13:47:02 +0200, "Mark Jonas via
lists.openembedded.org"
<mark.jonas=de.bosch.com@lists.openembedded.org> said:
> From: Mark Jonas <mark.jonas@de.bosch.com>
>
> This series corrects the licensing metadata:
>
>   - Patch 1 splits the recipe-wide LICENSE into per-package assignments,
>     so each package reports its own license (e.g. the library as
>     LGPL-2.1-or-later, the CLI tools as GPL-2.0-or-later).
>
>   - Patch 2 backports a patch which fixes the libgpiodbus license

Please do it the other way around: first backport the patch changing the
libgpiodbus license and then update the licensing info in the recipe.

Bart

