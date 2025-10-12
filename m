Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B36CCA476
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 00:21:27 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.10706.1760228479263682152
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 17:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k34xysAs;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-63af096d4e2so1098598eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 17:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760228478; x=1760833278; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRfEb0uM8nwmyHY19Q4zO3MJLKsKYSnSHD2pilzMQc4=;
        b=k34xysAsINVX05lEYkc65eVsCERYXjKWirQspEPmhFfeTOb4W9HpnOVTgRBS261aHq
         nBfyzpYUewjJazL4RR4QURx1Wwqgkq0lAufGxSM6bPLpmRhiQJQ7r/k7ML9GWGjeho+J
         HhFoxxk8k6pIpX1YR9eEHZVid7nITqrNXghrfPIcRtBmBuFs96D28/rKIO//SLY1coW+
         jLOjXdVas1B73noUP1CWUYMC18GpZKXoitIGvuiQ5cCH0u1Nk3wmBjVPhOAVPoOdo47i
         T1WAAzqn8Sn8Cu1cVefcmAHTYaM4rvMmdwYc0FTmSp47xYeZZKN9jiB1S0StI+nM1/2A
         wYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760228478; x=1760833278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRfEb0uM8nwmyHY19Q4zO3MJLKsKYSnSHD2pilzMQc4=;
        b=N8s+GBRMfk9pXaNOej/9SS3AW2mwirD2B1ZIkYn8mpKpUpRty+jl7sfotAqLZeN76o
         ilSZjl+WQMTXi+KSfQ4zANA7foEC+cIVkjFIEiR59g+cR/2J2kGvjG/8+Ibur3PNRXCu
         RKu+erajIC5fbquHzcRX2sRMNlobYEmEc/BZ//i2EUpgWPWOLkeZ3MMISA/GTgFLedhN
         5CbfAaw2mWjwOgIbPA1/QqmHqAe3Oo9UiQmC20rRs+FI9/1ed/GMi9D2U7BLMdVe2h58
         641FfEoiPMn/8E2dJgvxXs/LyAnFLBjIqhI1wPzKw3fWGpTEfbWnw+TGpnuXdBBO4QrM
         qwxA==
X-Gm-Message-State: AOJu0Yx571Ozxj498oRNd6y+v05YGZ28xOOulYWqnUmdRTOAOFE6z43S
	Au3FmMG7rktcyUX6TTtAlRBiSFQXNTbjOKs+7/9aaVvRg51pT7wFZOX8XF2/DhinrsnQ2Mlki+H
	8YmKlvhDXmrA33uFcRyJs015a5w7GUBI=
X-Gm-Gg: ASbGnct1DGVq68LUzX/2WAZmSOLgNYFpEQcSvHRIzeZTawkXdCiLYHJww2oWRRmVc3a
	EMNVwInDqdTW5qBiWMFUdkmiOz2Mwbhyd5lYPZrZKRfdYX714KQxClaF+5EkRNmeVpN8xZ6g2kr
	u2C536SRP5WrrC4tOvEabDVdn/gz5OYDu9Ar4nOi2M0xKnSxzLVSmJ7FUdZqsBEcMjrTABNnlqr
	7UQUWVgMTn4HDWYzDX7W45m/L5CfPnDhWT/E0g=
X-Google-Smtp-Source: AGHT+IGecviIdtouIcAk9wMz7pwUoS+NIGPZNprf+dc3zgsJIvpZNXEch95UzPguc7q+GNLjo/wl3kb8BmMrfdjkKno=
X-Received: by 2002:a05:6871:81c9:20b0:3c8:f3bb:92c7 with SMTP id
 586e51a60fabf-3c8f3bb9b8amr940850fac.15.1760228478121; Sat, 11 Oct 2025
 17:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <186D05F9B6EAD54A.4971@lists.openembedded.org>
In-Reply-To: <186D05F9B6EAD54A.4971@lists.openembedded.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 12 Oct 2025 13:21:07 +1300
X-Gm-Features: AS18NWDP09dUCF6aWcwCD18nwpyIFTTRWTricLwdxqgD9lkkhfhQ_cpWystzsZI
Message-ID: <CADySD0HydQahM2DqRq39k4RbGye3Quh0w2S83-LLr0MxsujZQA@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 1/3] exiv2: patch CVE-2025-26623
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 00:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120513

Please ignore this series as I missed earlier submission via
https://lists.openembedded.org/g/openembedded-devel/message/120366

On Fri, Oct 10, 2025 at 5:13=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> Details https://nvd.nist.gov/vuln/detail/CVE-2025-26623
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../exiv2/exiv2/0001-CVE-2025-26623.patch     | 86 +++++++++++++++++++
>  meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  5 +-
>  2 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-266=
23.patch
>
> diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-26623.patc=
h b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-26623.patch
> new file mode 100644
> index 0000000000..db561ed96b
> --- /dev/null
> +++ b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-26623.patch
> @@ -0,0 +1,86 @@
> +From 943fbd9c688a10037ccb42bf7c4b20be76df1119 Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Mon, 17 Feb 2025 16:34:40 -0800
> +Subject: [PATCH] CVE-2025-26623
> +
> +Revert "fix copy constructors"
> +
> +This reverts commit afb2d998fe62f7e829e93e62506bf9968117c9c5.
> +
> +This commit is wrong and ends up resulting in use after frees because of
> +C pointers. The proper solution is shared_ptr instead of C pointers but
> +that's a lot more involved than reverting this.
> +
> +CVE: CVE-2025-26623
> +Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/facce62=
8f3622764e91a8161f89ade8cb34bc120]
> +
> +Signed-off-by: Rosen Penev <rosenp@gmail.com>
> +(cherry picked from commit ebff8b48820b96c786cfddbf0bebb395cb1317d7)
> +(cherry picked from commit facce628f3622764e91a8161f89ade8cb34bc120)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/tiffcomposite_int.cpp | 19 +++++++++++++++++++
> + src/tiffcomposite_int.hpp |  6 +++---
> + 2 files changed, 22 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/tiffcomposite_int.cpp b/src/tiffcomposite_int.cpp
> +index 95ce450c7..3e6e93d5c 100644
> +--- a/src/tiffcomposite_int.cpp
> ++++ b/src/tiffcomposite_int.cpp
> +@@ -127,6 +127,25 @@ TiffEntryBase::TiffEntryBase(const TiffEntryBase& r=
hs) :
> +     storage_(rhs.storage_) {
> + }
> +
> ++TiffDirectory::TiffDirectory(const TiffDirectory& rhs) : TiffComponent(=
rhs), hasNext_(rhs.hasNext_) {
> ++}
> ++
> ++TiffSubIfd::TiffSubIfd(const TiffSubIfd& rhs) : TiffEntryBase(rhs), new=
Group_(rhs.newGroup_) {
> ++}
> ++
> ++TiffBinaryArray::TiffBinaryArray(const TiffBinaryArray& rhs) :
> ++    TiffEntryBase(rhs),
> ++    cfgSelFct_(rhs.cfgSelFct_),
> ++    arraySet_(rhs.arraySet_),
> ++    arrayCfg_(rhs.arrayCfg_),
> ++    arrayDef_(rhs.arrayDef_),
> ++    defSize_(rhs.defSize_),
> ++    setSize_(rhs.setSize_),
> ++    origData_(rhs.origData_),
> ++    origSize_(rhs.origSize_),
> ++    pRoot_(rhs.pRoot_) {
> ++}
> ++
> + TiffComponent::UniquePtr TiffComponent::clone() const {
> +   return UniquePtr(doClone());
> + }
> +diff --git a/src/tiffcomposite_int.hpp b/src/tiffcomposite_int.hpp
> +index 4506a4dca..307e0bd9e 100644
> +--- a/src/tiffcomposite_int.hpp
> ++++ b/src/tiffcomposite_int.hpp
> +@@ -851,7 +851,7 @@ class TiffDirectory : public TiffComponent {
> +   //! @name Protected Creators
> +   //@{
> +   //! Copy constructor (used to implement clone()).
> +-  TiffDirectory(const TiffDirectory&) =3D default;
> ++  TiffDirectory(const TiffDirectory& rhs);
> +   //@}
> +
> +   //! @name Protected Manipulators
> +@@ -944,7 +944,7 @@ class TiffSubIfd : public TiffEntryBase {
> +   //! @name Protected Creators
> +   //@{
> +   //! Copy constructor (used to implement clone()).
> +-  TiffSubIfd(const TiffSubIfd&) =3D default;
> ++  TiffSubIfd(const TiffSubIfd& rhs);
> +   TiffSubIfd& operator=3D(const TiffSubIfd&) =3D delete;
> +   //@}
> +
> +@@ -1346,7 +1346,7 @@ class TiffBinaryArray : public TiffEntryBase {
> +   //! @name Protected Creators
> +   //@{
> +   //! Copy constructor (used to implement clone()).
> +-  TiffBinaryArray(const TiffBinaryArray&) =3D default;
> ++  TiffBinaryArray(const TiffBinaryArray& rhs);
> +   //@}
> +
> +   //! @name Protected Manipulators
> diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/reci=
pes-support/exiv2/exiv2_0.28.3.bb
> index 3e33ab7953..4986415a6b 100644
> --- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
> +++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
> @@ -4,7 +4,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D625f055f41728=
f84a8d7938acc35bdc2"
>
>  DEPENDS =3D "zlib expat brotli libinih"
>
> -SRC_URI =3D "git://github.com/Exiv2/exiv2.git;protocol=3Dhttps;branch=3D=
0.28.x"
> +SRC_URI =3D " \
> +    git://github.com/Exiv2/exiv2.git;protocol=3Dhttps;branch=3D0.28.x \
> +    file://0001-CVE-2025-26623.patch \
> +"
>  SRCREV =3D "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
>  S =3D "${WORKDIR}/git"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120466): https://lists.openembedded.org/g/openembedde=
d-devel/message/120466
> Mute This Topic: https://lists.openembedded.org/mt/115655086/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

