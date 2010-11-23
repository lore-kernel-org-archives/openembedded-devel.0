Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKwM0-0007Ba-Qv
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 18:08:32 +0100
Received: by ywo32 with SMTP id 32so505386ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=CPaVDQmC8XlFrym8knI6Ok8RyMDDaUgzpMgIkMV1jzg=;
	b=oXocZwLsrXNVEcXt8ATj1gV+MZ11/vGFN7IGICqe9Ypddp6a4vvU9vtTO61FvQMv9/
	TETcBY3Ietnd+0El0yOKQFe2tcj8h6O2EaAQmg7TAhWpEEr+TZj0OAuXRi9V3flx64Jh
	SMwGuAIaCIoJxxbToyYgqMMmqKH4lAXQmCVOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=k3eH+E7Q4S1C0rh8tVcwqUrTMkHe3khpV/lAA6YizEMcITkib8x4CPDm0fVyqUznTO
	rttPstauj6Mh26ULkf0HXLGCukSDnAcEPxdXHiYx/4P61A7plLDm8eNhW0HD2/dKi0pL
	BNqMm9tZ+Nk1kLTUPIhj1FMVXlbewciG6dT0o=
Received: by 10.91.212.4 with SMTP id o4mr704913agq.21.1290532034820; Tue, 23
	Nov 2010 09:07:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 09:06:54 -0800 (PST)
In-Reply-To: <1290531194-31338-2-git-send-email-eric@eukrea.com>
References: <1290531194-31338-1-git-send-email-eric@eukrea.com>
	<1290531194-31338-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 09:06:54 -0800
Message-ID: <AANLkTinnhAa=9qt6=xjYFzFiTWUfFn=uCgcTDjUgPOgh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] mx31ads: make linux 2.6.36 compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Nov 2010 17:08:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 8:53 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> and set this kernel as default version for now.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

looks ok

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../mx31ads/0001-add-missing-include.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 52 ++++++++++++++++++++
> =C2=A0recipes/linux/linux_2.6.36.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +
> =C2=A02 files changed, 55 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/linux/linux-2.6.36/mx31ads/0001-add-miss=
ing-include.patch
>
> diff --git a/recipes/linux/linux-2.6.36/mx31ads/0001-add-missing-include.=
patch b/recipes/linux/linux-2.6.36/mx31ads/0001-add-missing-include.patch
> new file mode 100644
> index 0000000..c76b987
> --- /dev/null
> +++ b/recipes/linux/linux-2.6.36/mx31ads/0001-add-missing-include.patch
> @@ -0,0 +1,52 @@
> +From d123b6ce668fe331c31c504e8d611d0cf7f48a39 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> +Date: Mon, 22 Nov 2010 21:37:50 +0100
> +Subject: [PATCH] add missing include
> +
> +---
> + arch/arm/plat-mxc/include/mach/board-mx31ads.h | =C2=A0 33 ++++++++++++=
+++++++++++++++++
> + 1 files changed, 33 insertions(+), 0 deletions(-)
> + create mode 100644 arch/arm/plat-mxc/include/mach/board-mx31ads.h
> +
> +diff --git a/arch/arm/plat-mxc/include/mach/board-mx31ads.h b/arch/arm/p=
lat-mxc/include/mach/board-mx31ads.h
> +new file mode 100644
> +index 0000000..94b60dd
> +--- /dev/null
> ++++ b/arch/arm/plat-mxc/include/mach/board-mx31ads.h
> +@@ -0,0 +1,33 @@
> ++/*
> ++ * Copyright 2005-2007 Freescale Semiconductor, Inc. All Rights Reserve=
d.
> ++ */
> ++
> ++/*
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License version 2 as
> ++ * published by the Free Software Foundation.
> ++ */
> ++
> ++#ifndef __ASM_ARCH_MXC_BOARD_MX31ADS_H__
> ++#define __ASM_ARCH_MXC_BOARD_MX31ADS_H__
> ++
> ++#include <mach/hardware.h>
> ++
> ++/*
> ++ * These symbols are used by drivers/net/cs89x0.c.
> ++ * This is ugly as hell, but we have to provide them until
> ++ * someone fixed the driver.
> ++ */
> ++
> ++/* Base address of PBC controller */
> ++#define PBC_BASE_ADDRESS =C2=A0 =C2=A0 =C2=A0 =C2=A0MX31_CS4_BASE_ADDR_=
VIRT
> ++/* Offsets for the PBC Controller register */
> ++
> ++/* Ethernet Controller IO base address */
> ++#define PBC_CS8900A_IOBASE =C2=A0 =C2=A0 =C2=A00x020000
> ++
> ++#define MXC_EXP_IO_BASE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (MXC_BOARD_IRQ_START)
> ++
> ++#define EXPIO_INT_ENET_INT =C2=A0 =C2=A0(MXC_EXP_IO_BASE + 8)
> ++
> ++#endif /* __ASM_ARCH_MXC_BOARD_MX31ADS_H__ */
> +--
> +1.7.2.3
> +
> diff --git a/recipes/linux/linux_2.6.36.bb b/recipes/linux/linux_2.6.36.b=
b
> index d15dcee..a395c04 100644
> --- a/recipes/linux/linux_2.6.36.bb
> +++ b/recipes/linux/linux_2.6.36.bb
> @@ -2,9 +2,12 @@ require linux.inc
>
> =C2=A0# Mark archs/machines that this kernel supports
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_mx31ads =3D "1"
>
> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2=
;name=3Dkernel \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig "
>
> +SRC_URI_append_mx31ads =3D "file://0001-add-missing-include.patch"
> +
> =C2=A0SRC_URI[kernel.md5sum] =3D "61f3739a73afb6914cb007f37fb09b62"
> =C2=A0SRC_URI[kernel.sha256sum] =3D "15a076d1a435a6bf8e92834eba4b390b4ec0=
94ce06d47f89d071ca9e5788ce04"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


