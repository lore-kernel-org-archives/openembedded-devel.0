Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF87C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 11:58:19 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.17817.1750679894216308411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 04:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EsgsE4gD;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23526264386so44410095ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750679893; x=1751284693; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F314tGX7beBViBgjssCxAB0YMIS7bxQJZHn6RUfqG/A=;
        b=EsgsE4gDuE6ZR09+h14LQdJTP6hFC5x+cIWDDetf20JQwLCA1ikR5Bzz+ECd9JP6QK
         iwmicEZJfSiA7q+/QXwfQdDQ+TvvjHqtR98kkGsq20B0ELEPnwm1qFfSwSTxtIpBLkkl
         Q6wVeufdDwaTZKZqIDwK3nr5kqOt61gxQj2GvesK9t5fzG2sJDxxIN+JZzeBRiT+Crwj
         YcEjay2cxe675owC4hEi5IR8lQeAl7C7QGM04cXmD79BDsXRWpWEdKpOviIQ/2kOHx92
         s01f7Owg175BZUfN0oQQ00zb5IAq19RAW8KZrJ+75rqmgscfI/IzVIEWfqAg2wCFUZPG
         M38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679893; x=1751284693;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F314tGX7beBViBgjssCxAB0YMIS7bxQJZHn6RUfqG/A=;
        b=SPMxY5rbspJY4hoQN7j4x6+SJR9aEV6o6b0aMSfPEwt0tQbjBfLDMmi/fJHl9WhEag
         ITxr+n1eLYUNFhfJsqx76gzszDycw2F+mTwzEGRPLWgUkdvwEzFcn0zQ7kY0rjJjrD1L
         vjfWqu5U/1B/3m2jhlM0lHfcNRHyvQfzrv+6xUU8vbUbHr7BqbgCCbI3RgDFsZ3n3GxW
         qc2O0qZOZnr9Bbxisut/pu905yokE7U/nIUBKPSD8bejJVxbQw2xKrBXJFCe46GSAIlG
         n4dyn+qoG+7q5VlKZ+tnxpIWjdttmXYVtEYiRVw4fN9zvp6zCYVeQjpPvdmMN7fMWZS0
         bKww==
X-Gm-Message-State: AOJu0YwuYnkIQcQCPUmhPbhHTpaRRx464O3aC/kLMOY4t/eZoHiS++Mk
	2mKXWlBQ/+I0E0T3oC8Z5LFLCkIJJje5ts8GyLdowySr3PRgnlSuo6/eVMluIEaYu6rCu2crAHI
	T9J4RWXRj6k4qopFjXxCeqgaH3ZyHL2X8CEMy
X-Gm-Gg: ASbGnctpSbj3g9fgj1Nr5ocEtNLPVJA2kC1qB6s5pqhU2izLCWnFW+jRh61hXE6/2N0
	cNFEiTWiUNMKgvS0TN3uA0f+nSqFc6lHqcoJq5AzPIITHwyunOg/HsKGl08UMzGriiHiQkAcwb7
	vfjlagfviCb3Gev+WC/uO4cryobf+e3gJBbl3HTmfEQBo=
X-Google-Smtp-Source: AGHT+IGBcqq7Cr5l6MgBefN2HSvyEhXGvdyoMH/QwUu4zQNgNR1iFmVbOgsFHTNNKUsl2iBWOSqImV3T3prnJcfmKPk=
X-Received: by 2002:a17:90b:2703:b0:314:2a2e:9da9 with SMTP id
 98e67ed59e1d1-3159d8d661fmr17283681a91.25.1750679893300; Mon, 23 Jun 2025
 04:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250623115340.124825-1-alperyasinak1@gmail.com>
In-Reply-To: <20250623115340.124825-1-alperyasinak1@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 23 Jun 2025 14:58:01 +0300
X-Gm-Features: AX0GCFuY9JxT_OvVdDV0mCOcyBAsma7g6Yte4WI1TnPz8R591j1GtY6cx0wmSzc
Message-ID: <CAGpma=4JwxWequ9t77FM=RJDbF6uAkNrD32=WrwX2Wbmh8yhBQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] wifi-test-suite: Fix compile issue
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 11:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118077

This causes error, I will send v2.

Alper Ak <alperyasinak1@gmail.com>, 23 Haz 2025 Pzt, 14:53 tarihinde =C5=9F=
unu yazd=C4=B1:
>
> - Variables such as CC, CXX and related variables are usually assigned in=
 core class like gcc.bbclass. For example, CC is assigned this specific val=
ue:
>
> CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>
> If you use the +=3D operator to add flags to the CC variable early in you=
r recipe, your changes will be overwritten and lost because BitBake applies=
 class assignments to CC at a later stage, which replaces any previous modi=
fications.
>
> We should use :append operation to ensures that additions are applied to =
the final value, after all assignments from core classes have been processe=
d. As a result, when you want to extend variables that may be set in core c=
lasses (like CC in gcc.bbclass), you should use the :append syntax to guara=
ntee your changes are preserved in the final build environment.
>
> - Using CFLAGS is the standard way to pass compiler flag for C projects.
>
> - The Makefile of the project doesn't respect to append to CFLAGS so adde=
d 0006-make-CFLAGS-appendable.patch to make CFLAGS appendable.
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  ...oc-Store-return-value-into-location.patch} |  0
>  .../files/0006-make-CFLAGS-appendable.patch   | 60 +++++++++++++++++++
>  .../wifi-test-suite_10.10.1.bb                |  7 ++-
>  3 files changed, 65 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/wifi-test-suite/files/{0001-wfa_cmdp=
roc-Store-return-value-into-location.patch =3D> 0005-wfa_cmdproc-Store-retu=
rn-value-into-location.patch} (100%)
>  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/00=
06-make-CFLAGS-appendable.patch
>
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_=
cmdproc-Store-return-value-into-location.patch b/meta-oe/recipes-connectivi=
ty/wifi-test-suite/files/0005-wfa_cmdproc-Store-return-value-into-location.=
patch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_c=
mdproc-Store-return-value-into-location.patch
> rename to meta-oe/recipes-connectivity/wifi-test-suite/files/0005-wfa_cmd=
proc-Store-return-value-into-location.patch
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0006-make=
-CFLAGS-appendable.patch b/meta-oe/recipes-connectivity/wifi-test-suite/fil=
es/0006-make-CFLAGS-appendable.patch
> new file mode 100644
> index 0000000000..ae8d524676
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0006-make-CFLAGS=
-appendable.patch
> @@ -0,0 +1,60 @@
> +From 8bd7daada85d0a8520b915febe9845432bb35c14 Mon Sep 17 00:00:00 2001
> +From: Alper Ak <alperyasinak1@gmail.com>
> +Date: Mon, 23 Jun 2025 14:20:45 +0300
> +Subject: [PATCH] Allow extra CFLAGS via EXTRA_CFLAGS variable
> +
> +This patch introduces an EXTRA_CFLAGS variable to the Makefile, which is
> +appended to CFLAGS. This allows users or external build systems to pass
> +their additional compiler flags.
> +
> +Upstream-Status: Submitted [https://github.com/Wi-FiTestSuite/Wi-FiTestS=
uite-Linux-DUT/pull/61]
> +
> +Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> +---
> + Makefile.inc | 15 ++++++++-------
> + 1 file changed, 8 insertions(+), 7 deletions(-)
> +
> +diff --git a/Makefile.inc b/Makefile.inc
> +index 0094bdf..76729b9 100644
> +--- a/Makefile.inc
> ++++ b/Makefile.inc
> +@@ -22,28 +22,29 @@ UCC=3Ducc
> + CON=3Dconsole_src
> + WTG=3DWTGService
> + MAKE?=3Dmake
> ++EXTRA_CFLAGS ?=3D
> +
> + # This is for WMM-PS
> + #for Ext TG
> +-#CFLAGS =3D -g -O2 -D_REENTRANT -DWFA_WMM_PS_EXT -Wall -I../inc
> ++#CFLAGS =3D -g -O2 -D_REENTRANT -DWFA_WMM_PS_EXT -Wall -I../inc ${EXTRA=
_CFLAGS}
> +
> + ## for WMM-AC, WMM-PS, Voice, PMF, TDLS Test-Bed
> +-#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VO=
ICE_EXT -DWFA_STA_TB -Wall -I../inc
> ++#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VO=
ICE_EXT -DWFA_STA_TB -Wall -I../inc ${EXTRA_CFLAGS}
> +
> + ## for WMM-AC, WMM-PS Test-Bed
> +-#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_ST=
A_TB -Wall -I../inc
> ++#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_ST=
A_TB -Wall -I../inc ${EXTRA_CFLAGS}
> +
> + ## for non-Test-Bed WMM-AC, WMM-PS and Voice
> +-#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VO=
ICE_EXT -Wall -I../inc
> ++#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VO=
ICE_EXT -Wall -I../inc ${EXTRA_CFLAGS}
> +
> + ## for PC-ENDPOINT
> +-#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VO=
ICE_EXT -DWFA_PC_CONSOLE -Wall -I../inc
> ++#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VO=
ICE_EXT -DWFA_PC_CONSOLE -Wall -I../inc ${EXTRA_CFLAGS}
> +
> + ## for PC-ENDPOINT No Voice
> +-#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_PC=
_CONSOLE -DWFA_STA_TB -Wall -I../inc
> ++#CFLAGS =3D -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_PC=
_CONSOLE -DWFA_STA_TB -Wall -I../inc ${EXTRA_CFLAGS}
> +
> + # This is for WPA2 as default
> +-CFLAGS =3D -g -O2 -D_REENTRANT -Wall -I../inc
> ++CFLAGS =3D -g -O2 -D_REENTRANT -Wall -I../inc ${EXTRA_CFLAGS}
> +
> + DUTLIBS =3D ../lib/libwfa_dut.a -lpthread
> + CALIBS =3D ../lib/libwfa_ca.a -lpthread
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite=
_10.10.1.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_=
10.10.1.bb
> index 9703c10452..357789ad88 100644
> --- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.=
1.bb
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.=
1.bb
> @@ -14,7 +14,8 @@ SRC_URI =3D "git://github.com/Wi-FiTestSuite/Wi-FiTestS=
uite-Linux-DUT.git;branch=3Dm
>         file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.=
patch \
>         file://0004-run-ranlib-per-library-and-use-AR.patch \
>          file://fno-common.patch \
> -        file://0001-wfa_cmdproc-Store-return-value-into-location.patch \
> +        file://0005-wfa_cmdproc-Store-return-value-into-location.patch \
> +        file://0006-make-CFLAGS-appendable.patch \
>  "
>
>  # to avoid host path QA error
> @@ -41,4 +42,6 @@ RDEPENDS:${PN} =3D "wpa-supplicant"
>  # http://errors.yoctoproject.org/Errors/Details/766893/
>  # wfa_cmdproc.c:467:68: error: passing argument 3 of 'strtok_r' from inc=
ompatible pointer type [-Wincompatible-pointer-types]
>  # wfa_cs.c:4175:57: error: initialization of 'caStaGetEventDetails_t *' =
{aka 'struct ca_sta_get_event_details *'} from incompatible pointer type 'c=
aStaMngServ_t *' {aka 'struct ca_sta_manage_service *'} [-Wincompatible-poi=
nter-types]
> -CC +=3D "-Wno-error=3Dincompatible-pointer-types"
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> +
> +export EXTRA_CFLAGS =3D "${CFLAGS}"
> --
> 2.43.0
>

