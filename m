Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.152.1601915718628225734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 09:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T0tqBKDf;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id d1so10140740qtr.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2020 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fMuO1dm8w5FFoj5WuQBGU75NYWI8YVqgR+KDBqT3srE=;
        b=T0tqBKDf/E//1rFGW0DHIeqLNxUGEeIcij3HgnV13WhMyBSsefmlL1PLzgeega01Ac
         zXKLOan25KAdAUxYMROphfDRj+ifTJXTdNy1z2arxq0F47+9n127M3vg8J6VDyTykxB4
         zUZDULAcNHJOfeVuZTSFT5Vtrjg7CF1QTeVwMYIdk5IBo3dC9bztFuh6l5z8BR7P8nZN
         biLHjkjk2z0Tlwi5Z58RCTo7gD2COsssHmlZ+imxbOQm3m5RDY1Hg+0JgelGbGrxTWUi
         2UVCgyqhhwvf/QYYz4oBKAwD8IhPewn/Ktg6EksCDnhWbaG1xCxEQQ2UOMVQvvjmbbMG
         RozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fMuO1dm8w5FFoj5WuQBGU75NYWI8YVqgR+KDBqT3srE=;
        b=eDGjHlJgZA2+58V6+055xnbzgMmrhSGoIdBGezfiOtNWAgUA0Vv8/xOE4vq+5YnwhM
         AAQCxlhO3eTqujDsUpEGinF7wY/jBuZ/sy/D/CqCKo1yWoB7TuCBOqd1GzHuFwM0vCrW
         FI0/fFLAQe/5rdiVjAc6PHzc29DyK1YmCTcnWCVHeZBNOLevgfzz971RlbaPDXDKX+7W
         lqfJQAteHzPk5GiuHVc2xT9vsTMqzPGGyBo90tfvmi6lrxx5Pv47aHSzZPbeTHIamA8e
         kSWSQFW7VMDCotcY/i0FoUwg2xzEys3OhetxfHqXQbTezg3DXnfxNJ2BZefcDuu0KfjT
         7wUQ==
X-Gm-Message-State: AOAM531NsKungrioTf2jdnASTQU2NgubANTNa7gQ68bCHJwfb+1c3SfW
	l/k+8AnzXj9Pne2ielufMI0vud7oPM1HQjkmZuM=
X-Google-Smtp-Source: ABdhPJx/I860n5VKh9FYmWNXSSIKJq7e47iHqWH0PfIDWus3IkGNVCCnPM2dQVzxafOPSsBqC0vsapAbwFrGnIk2ePM=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr719936qtb.80.1601915717515;
 Mon, 05 Oct 2020 09:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201005095019.30755-1-siew.hoon.lim@intel.com>
In-Reply-To: <20201005095019.30755-1-siew.hoon.lim@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 5 Oct 2020 09:34:51 -0700
Message-ID: <CAMKF1sojaqMS-FTVcLMj92750DqHykb2HhsWqMEFr1P-7-O5OA@mail.gmail.com>
Subject: Re: [oe] [PATCH] Alliance for Open Media: new library
To: Lim Siew Hoon <siew.hoon.lim@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I wonder if this should be part of meta-multimedia, secondly add it to
one of packagegroups e.g. packagegroups-meta-oe or
packagegroups-meta-multimedia if it is in meta-multimedia.


On Mon, Oct 5, 2020 at 2:50 AM Lim Siew Hoon <siew.hoon.lim@intel.com> wrote:
>
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> Signed-off-by: Lim Siew Hoon <siew.hoon.lim@intel.com>
> ---
>  meta-oe/recipes-multimedia/aom/aom_2.0.0.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
>
> diff --git a/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
> new file mode 100644
> index 000000000..4b388d57f
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Alliance for Open Media - AV1 Codec Library"
> +DESCRIPTION = "Alliance for Open Media AV1 codec library"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5"
> +
> +SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
> +
> +SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS_append = " yasm-native"

Just use DEPENDS +=

> +
> +inherit pkgconfig cmake perlnative python3native
> +EXTRA_OECMAKE_append = " -DBUILD_SHARED_LIBS=1"

Use EXTRA_OECMAKE +=

> --
> 2.17.1
>
>
> 
>
