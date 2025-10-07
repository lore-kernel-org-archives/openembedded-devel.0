Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10F1CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 21:58:19 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.web11.2179.1759874297003916988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 14:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fTDIqVFJ;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63bbf5f77daso4489263d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759874296; x=1760479096; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiFdcdhXX7WQ7o7QTMyxjURR8uP+1ZDmHocaHKa26OY=;
        b=fTDIqVFJJgguUMDYz2o/h02m64tpKzFtssYsRXKdOZzuqlOdTQdksWBnEj/X+6k1ce
         qaANLpOTwbo6HOSV7N/tHpFyirkaN981ZhNTSgqhcc8jOJ1CA7M7Y+sukk4w4axlGbmK
         h6IhJ8P12WJ3+8XmlR2RFebYqYQvrUl9IPkBEUUN6jSF4RaUe2jKawFCy9gOAgCIW2sC
         zj3jenP6Y5rOwltG1unzBcQzofZVl3fHxPsQYL+9uHaeaqueLCLOigSuIMI1nDsZJz8A
         WPYcdgfDs7/opqD5xNTvl7wy+hcjdSgJjHHG3CAoLxMlosntjELkD6O4SMccGHBBbPVg
         X3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759874296; x=1760479096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MiFdcdhXX7WQ7o7QTMyxjURR8uP+1ZDmHocaHKa26OY=;
        b=veRRGXFKjgsvo1wXCqdGwIEdRhsDkM09ywid+VkQehSren9SgtI7PBaCIjP90KvaXR
         fLEGTZt4BqH4iGrYExfk014kk0euwTrXLIuz+IkaD9h9V0s+d4emGl0/ye1tz7bfvuXc
         vo4D4sGizPPuaAoWRfxKv9ouzpb07UcCq99lp5X50JwfpAZ06j5oXLlRPOFpZugjXbBc
         ZBHvl2CDucnm32zTxcYj8CWXYTR4UCyECD2O+sVutd7U1VzTtRz6uNxbxLHBGvJ1H/Gj
         wdp6qQC04LF7SjGcft1N7NnbrTAoiGxY5XBgg6ZORrrkKhQFfDKSEPfb+7KV+UEFaumK
         85ww==
X-Gm-Message-State: AOJu0YzhiV/p4vjnCtAg/EyWnNgU1jyfEUSgiWVZDpEO/MahR362mTKP
	v1JaRUhzFeFT1c9IfNAcndAEMNewbbbexDX6Gs3Ph6/Ni0oYN7L0BGhc2jyEsOQqc/60knxekIT
	m0wcIYsXiEYhoxUraEztzghwgOFxy/jA=
X-Gm-Gg: ASbGncupAoaUdQaPux64Y0/HGlUPPs51uNXnKci95y4vBw13fHW05xk3s6paMnCiXCL
	xyVHIEov2kaxH93Ydu55jypOgYmZpIprslU+zLkK35KgP9k47oVPSWSEUQnYnQ/MWgTDNv2WqPq
	be/w4lqNRvBcDVaeo/Q+Dk0CC2w3pP78j6RwLVVx4cafUygfhQ1eh4fNV70POeO3s9GSZb2c6Rx
	jg7OtUs2sDGfMXXY4LOQy5igCZVH9JF3hg1EQ5lBen9LggVJQBU/j3S4r8XUMDehR4VId5i7tlE
	H6ryefaKt6FBHBFoXNraeO4AQaNBfP+PVbGQssbjGty2GxQRXBgM4NKzslG6R7rR3pkjeUATXKz
	27yFM2Q==
X-Google-Smtp-Source: AGHT+IFrjcNqQQLbcfAuD5+uvqirTqsjO5LEVK8pw+rGQKwCfX9cxVCBhg371S18JlnSN30LtoNpYnTCAnxsoLgkajc=
X-Received: by 2002:a05:690e:15c7:b0:636:5e6:cac1 with SMTP id
 956f58d0204a3-63ccb7fb22cmr890368d50.4.1759874296093; Tue, 07 Oct 2025
 14:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251007105350.1237-1-joao.lima@hbkworld.com> <20251007105350.1237-2-joao.lima@hbkworld.com>
In-Reply-To: <20251007105350.1237-2-joao.lima@hbkworld.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Oct 2025 14:57:50 -0700
X-Gm-Features: AS18NWCeXaJU5VtLNvNuM_zYHeG2A85MCcCiIwkbPTa5U4vNnyAkCxakCGeRsrs
Message-ID: <CAMKF1srm31ry7unszz67F=i7UhN-6a=xi+jP4DJ=3U-pFeLd_w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 1/3] openocd: bump the openocd, jimtcl versions
To: =?UTF-8?B?TGltYSwgSm/Do28=?= <joao.raul.434@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, joao.lima@hbkworld.com, 
	ivitro@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 21:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120352

How did you test it ?
I am seeing patching errors

NOTE: Applying patch
'0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch'
(sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd/0001-Ma=
kefile.
   =E2=86=AA am-Use-SOURCE_DATE_EPOCH-environment-variab.patch)
   ERROR: Applying patch
'0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch' on
target directory
'/home/kraj200/yoe/build/tmp/work/x86-64-v3-yoe-linux-musl/
   =E2=86=AA openocd/0.12+git/sources/openocd-0.12+git'


On Tue, Oct 7, 2025 at 3:54=E2=80=AFAM Lima, Jo=C3=A3o <joao.raul.434@gmail=
.com> wrote:
>
> From: Joao Lima <joao.lima@hbkworld.com>
>
> Version bumps:
>    - openocd: 91bd431 -> 66ea461
>    - jimtcl: fcbb449 -> f160866
>    - libjaylink: 9aa7a59 -> 0d23921
>
> Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
> ---
>  meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/re=
cipes-devtools/openocd/openocd_git.bb
> index 3bbe33ca1d..3b7705c41d 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -13,10 +13,10 @@ SRC_URI =3D " \
>  "
>
>  SRCREV_FORMAT =3D "openocd"
> -SRCREV_openocd =3D "91bd4313444c5a949ce49d88ab487608df7d6c37"
> +SRCREV_openocd =3D "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
>  SRCREV_git2cl =3D "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> -SRCREV_jimtcl =3D "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
> -SRCREV_libjaylink =3D "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
> +SRCREV_jimtcl =3D "f160866171457474f7c4d6ccda70f9b77524407e"
> +SRCREV_libjaylink =3D "0d23921a05d5d427332a142d154c213d0c306eb1"
>
>  PV =3D "0.12+git"
>

