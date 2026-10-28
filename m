Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39175.1793180365555877181
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 02:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=Nv0iyjgn;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9314243C8A
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 09:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778BF1F01825
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793179917;
	bh=UztJfQXRyXIZrCbFezavOUCl/fMiPUBrYlq9O0rReSM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Nv0iyjgnZZ9c6bBQV+TG/884hU0NVHcDD//9FAYFgZzIYDHUwnOwTt4Jds3P91/CP
	 /7hRh1giD7eGPIHdbGPUImD+9/X8TLXdXHCKF4T2MQzqUdM69egPQdBCzxDYquLr0N
	 uAl2E0gtVNE0bXf8W7TRE0udyNr4CGOf8iv7PbdahlIs7iQYrAbZbqzUHCGE4YCEcG
	 JlWTUpW3Nw4gY/ZOMUpx3/XqZYfchheJ3dNkLfGxsimKMbD7T5K2T5fxz2/jAWa71y
	 0DTpZYcgP6OSFpTNVsC9XNQN4hVoD1aoaQA0Sg3qivWNmAx9YGL91Hmt1mbQdaYCCk
	 Ae20oEqgPRPuA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso2505163e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 02:31:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwh5Y2XeCB1H3IVS0vjPYuF99VUoW0Zp9jrK5YbSk0VwLUwU5KIhFI5z3lRzHaY5EYMKkZXQRGrARDNhKTXHiGj2H8=@lists.openembedded.org
X-Gm-Message-State: AFq9FYIVX640z85OWugfSQLY7CeuhFOJEGV1z3uYQT4F+JhWLPYBPfHf
	bwCcG3VWh8MNem3RxS+QaeJDv3cFXSUn++fhzOScn2mR3Tqf2wBSjhEGLRlGMnfVqlIEY7pAAfe
	zRenVeBrxFlrzIXn8LBcOS4yPVfE53v9GfP6ftXA4qw==
X-Received: by 2002:a2e:a9a5:0:b0:3aa:e5df:f852 with SMTP id
 38308e7fff4ca-3ac9f586c3emr2263361fa.14.1793179915667; Wed, 28 Oct 2026
 02:31:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:31:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:31:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261025214330.653779-4-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
References: <20261025214330.653779-1-khem.raj@oss.qualcomm.com> <20261025214330.653779-4-khem.raj@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 02:31:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdH_5uwkhDRLBYpemHDfEA3r8iN1QrOpTPpP3=6Rvhn0A@mail.gmail.com>
X-Gm-Features: AclHuK__YfS4xLY62dM8KBhlxxE4-qrpklm3lvxR4V0dMH9XTzQNCNhINeZ9svc
Message-ID: <CAMRc=MdH_5uwkhDRLBYpemHDfEA3r8iN1QrOpTPpP3=6Rvhn0A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/6] libgpiod: Show the output of failing tests in ptest log
To: raj.khem@gmail.com
Cc: "Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 09:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131623

On Sun, 25 Oct 2026 22:43:28 +0100, "Khem Raj via
lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>
said:
> run-ptest wrote each test's output into a file in the image, so an
> intermittent gpiod-glib-test failure in testimage left nothing to debug.
> Print the output when a test fails.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
