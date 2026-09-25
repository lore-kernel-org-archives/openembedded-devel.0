Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FCDC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 14:19:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8811.1790345150551989719
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 07:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=Ma506IqN;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C68D860230
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAF11F00899
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344607;
	bh=0nL07YL9c3Sw2P5/5dHLyvZhvwu9Bq0r449H1ofE4gU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ma506IqNLf5KXvdgRegHdP1mNXKAjpdb3YXB2xN1jQzRbjlxcn1bUClJlAIK9VLVp
	 y1rFxbO6Lhoz32Fd8ICT3iDbda1hZd/ZdmymRm+LMIvLE1H6OkT62Tz7xwIIoWH9p+
	 1YomWAyvyIERydcRtw9EqiHR3QOpsW23s9Eu5m20eXsrjFbXugtSgjMnD5KN4QyopL
	 lDK/EdaRcmLfWLO+npyR799f5dI7cIL2JE4AIO6uze+1Ks8fLopbI6RExg+i4dBWGM
	 vanydnA7OXME0BiwzApANnDwm8m/3RNLryF6l6aWDMKRGqiOun2YJsIobvRbDAnVZl
	 JtLrMw7omAHPQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so624340e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 06:56:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQ760AbjkQLC70EuqujzxYv6GEcDXvCkU8oFjbtCxtRphXakz9JoqRXElrtKHDsRaL6DRcYr9IKYATTM/vHTX7STk=@lists.openembedded.org
X-Gm-Message-State: AFuF++kW58l7IOMIV2UfaoYwsWbCFht8xlLxTGJF4nTrJpDjTnm/m0dp
	1kyNbGv2vE8nFVp1JdtNmZedYityUuJj3Cq6dv2b2LVD1DsMllqgDrRvpGgCbMgxQLcuiQ7ZsPn
	S07gXLv3MpxqoWnu8Hi+1Og9MXBcpveJtO9CVIjLeTw==
X-Received: by 2002:a05:6512:3c87:b0:5ae:b01a:d213 with SMTP id
 2adb3069b0e04-5b8e09ac044mr2248059e87.3.1790344606224; Fri, 25 Sep 2026
 06:56:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:56:45 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:56:45 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260925133929.1991-2-mark.jonas@de.bosch.com>
MIME-Version: 1.0
References: <20260925133929.1991-1-mark.jonas@de.bosch.com> <20260925133929.1991-2-mark.jonas@de.bosch.com>
Date: Fri, 25 Sep 2026 13:56:45 +0000
X-Gmail-Original-Message-ID: <CAMRc=McfFFyPqzDtawR2Fz2hBc0A5Qb_y_ShzMGnA2yZt4ZQ9g@mail.gmail.com>
X-Gm-Features: AclHuK9xtLdX-Kgux_2C83W21TvFgLqkutmSgT2tXl8UHlXc0ONf4ApejsMovIk
Message-ID: <CAMRc=McfFFyPqzDtawR2Fz2hBc0A5Qb_y_ShzMGnA2yZt4ZQ9g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libgpiod: set per-package license assignments
To: mark.jonas@de.bosch.com
Cc: "Mark Jonas via lists.openembedded.org" <mark.jonas=de.bosch.com@lists.openembedded.org>, 
	bartosz.golaszewski@oss.qualcomm.com, khem.raj@oss.qualcomm.com, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 14:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130305

On Fri, 25 Sep 2026 15:39:28 +0200, "Mark Jonas via
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
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---

Thanks for doing this!

>  meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
> index b3cb33ac89..977405c2fc 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
> @@ -3,6 +3,17 @@ require libgpiod.inc
>  inherit meson systemd update-rc.d useradd gobject-introspection
>
>  LICENSE = "CC-BY-SA-4.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later"
> +LICENSE:${PN} = "LGPL-2.1-or-later"
> +LICENSE:${PN}-cli = "GPL-2.0-or-later"
> +LICENSE:${PN}-gpiosim = "LGPL-2.1-or-later"
> +LICENSE:${PN}-glib = "LGPL-2.1-or-later"
> +LICENSE:${PN}-manager = "GPL-2.0-or-later"
> +LICENSE:${PN}-manager-cfg = "CC-BY-SA-4.0"
> +LICENSE:${PN}-tools = "GPL-2.0-or-later"
> +LICENSE:libgpiodbus = "GPL-2.0-or-later"

Ugh, this is a mistake on my part. The libgpiodbus library should be licensed
under LGPL-v2.1 like all the other shared libraries in the project. I'll send
a patch.

In any case:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bart

