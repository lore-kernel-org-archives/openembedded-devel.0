Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47594CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 19:59:45 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.33382.1758139174977633003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 12:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtwa+K8I;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d5fb5e34cso2532227b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 12:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758139174; x=1758743974; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKH/X//uJcymmsneNhHEtSv1gD4H46dT+meZ0ONnPZM=;
        b=jtwa+K8I/pueHswBKKtE4Q4swQmplk+ivT3Z2joRP4zTMmpmDRw54/kjL1MdC0dgLv
         T53zsPT1YSDnOtc00rmuj68U5PHwmO927en7hMHs/4EVeT20Xi6hSZZYuOrvw51kqorG
         OMEaY3fjzxcvkxBMDSSxDK59lbFfHUEl4wechBV3Z1xrVkzqFQgTWjV/q8Gxb+LTdavX
         lYs63QqlD+LaAQ3PdpffD27WaBguqoQ7dQOtB8fg7EuzRKNJILl+1ATWR6I0jaRdLddv
         wmm+wy9r4osWsbLL6PrJEfzSBVW534Yt6AwYtfPLz94IDihV73hphbkeOVQSREZ3r5MU
         j1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139174; x=1758743974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKH/X//uJcymmsneNhHEtSv1gD4H46dT+meZ0ONnPZM=;
        b=cqNJlasoN7qx+zl0bj7Nm1a2xdMNEuUyoVHLupwX691NP73gSO82IjU74l9yaORbeg
         +HptTNHe0hnnpCaYocxmw1DhSJdmnMshc2SVeKi4YFCzo98Ue00wLC/L+0gMLT6JRnZg
         Hn9CrgSaWKe8FIYu7byOoW8YODc6jMop6uyeT8zUPIHh3U7raZx8PhC3xCw4UYEOCTD8
         IJjWMbbEJPAVTAcupDOJQutwmjAtOL6v0YhyjOzmHBUH9hZwnjGwIlLXfx90UwZDuWHY
         5yoPEMVeuJ73FYcS9Wq45rdSJv11ops3zrnwzfiJHM5NMaeNb83Zyoy1G75zgFcTiazW
         2rTQ==
X-Gm-Message-State: AOJu0YxzehmtgTjCegwAqzl5rWZvu4EdkIY/4Ary9RfDcIH0ttjADYPV
	oNaXJQXA8DKK2dBxs2W4eokwrHVgXmNqB8Rnd/5c7Iiz8HTPxy3coh3+QkyazYPvM8RLuwB5QjH
	zKYSTZsqQ5/VqhR7ZJswlJn3gw9BHtKu5KWOMwuc=
X-Gm-Gg: ASbGncvYpBNhYBwq8XVMe7IttUdwNBkMerFwaqiaC1mEek2CXKtHFDJLe/Hn36kKQlR
	S6UZ3GDf9abkp0lUJpcxc0jrLD+UOH96rRXjuuoHW9gQibfMEPi/RWuGN/fZ8olL5i9UcThkkyY
	AJQGR6dNty5ua05DuFS+6W5BdDLiCWlyZyie+0yIl1eUW87f/JczkI6qfz+zbk3Oqza79Hg0M0u
	cz4gXE86g1IGu0JsxEN9V2MZq20poW1MNA57xv6jtXe42eWGD29Rj/A03whhG5/CuXzCEwGbqDi
	HLajRJH2/CPjNmzG/PbRcAk=
X-Google-Smtp-Source: AGHT+IFJ6Xq5NdWFLqLcbIZMSi3ignCMI3CcDS73ZcOraa1v/V+M9NO91yYe5Ld/VtTG7rterUHL9vIK5PEACmei+eY=
X-Received: by 2002:a05:690c:670d:b0:71c:990:3009 with SMTP id
 00721157ae682-7396f071d7cmr8183677b3.17.1758139173866; Wed, 17 Sep 2025
 12:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250917140203.895760-1-dmitry.baryshkov@oss.qualcomm.com> <20250917140203.895760-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250917140203.895760-2-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2025 12:59:07 -0700
X-Gm-Features: AS18NWCzgwcP02EAKBevMd9eIWGVAzFjsmmFXsDWs6nNT1rw3uoME9srZWybcXM
Message-ID: <CAMKF1sqnSzcKxd9O1cUxc5LQ2Jd3hDMFeYJA50nqw_6BcJe5xg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] opencl-icd-loader: make use of the
 'opencl' DISTRO_FEATURE
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 19:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119488

I think more recipes need this conditional.

ERROR: Nothing PROVIDES 'virtual/opencl-icd' (but
/home/kraj200/yoe/sources/meta-openembedded/meta-oe/recipes-support/opencl/=
clinfo_3.0.23.01.25.bb,
/home/kraj200/yoe/
   =E2=86=AA sources/meta-openembedded/meta-oe/recipes-core/opencl/clpeak_1=
.1.5.bb
DEPENDS on or otherwise requires it)
   ocl-icd PROVIDES virtual/opencl-icd but was skipped:
PREFERRED_PROVIDER_virtual/opencl-icd set to opencl-icd-loader, not
ocl-icd
   opencl-icd-loader PROVIDES virtual/opencl-icd but was skipped:
missing required distro feature 'opencl' (not in DISTRO_FEATURES)
   ERROR: Nothing RPROVIDES 'clinfo' (but
/home/kraj200/yoe/sources/meta-openembedded/meta-oe/recipes-support/opencl/=
clinfo_3.0.23.01.25.bb
RDEPENDS on or otherwise requires
   =E2=86=AA it)

On Wed, Sep 17, 2025 at 7:02=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Currently packages like Mesa list 'opengl' and 'vulkan' as required
> DISTRO_FEATURES, disabling GPU support for non-graphics-enabled cases.
> However in the modern world it's a perfectly fine usecase to have a
> headless box with GPU being used by OpenCL only. The OE-Core has added
> the 'opencl' DISTRO_FEATURE, making it possible to specify whether
> OpenCL is enabled or not and also making it possible to enable GPU
> packages if only OpenCL is required.
>
> Follow the example of GLVND and vulkan-loader and disable OpenCL ICD
> loader if corresponding feature is not enabled.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> ---
>
> Note, this depends on https://lore.kernel.org/openembedded-core/202509152=
32557.536762-1-dmitry.baryshkov@oss.qualcomm.com/
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> index 16c070e4b538..8c8f1ae7dbe0 100644
> --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> @@ -4,7 +4,9 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
>  SECTION =3D "base"
>
> -inherit pkgconfig cmake
> +inherit pkgconfig cmake features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "opencl"
>
>  DEPENDS +=3D "opencl-headers"
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119484): https://lists.openembedded.org/g/openembedde=
d-devel/message/119484
> Mute This Topic: https://lists.openembedded.org/mt/115291651/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

