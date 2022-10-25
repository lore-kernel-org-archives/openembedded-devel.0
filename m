Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA95DC38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 15:13:29 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web08.8279.1666710803500167093
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 08:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nORNORgH;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id w196so14538157oiw.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ajTnefiUFCLiEv1Oua4vWM7UQGpafsIHKzRUx8ClTE=;
        b=nORNORgHQpWKgl4qJA2YOq6s8qG8SkINSBrMph20BGkxBYCHlmmnkVJOQqG/0o09XM
         csZe0f1smPQIT/qZ6Q8ZCn+DbalyA70iZBjtmgrKkuGfrqCAyVbrezuxGv/bLuhe/Res
         05gxfVcUOPMRwNeKIgEzsJEJnsoXoQdEu2JbZo584m4mqv/oIPt4L+Fx7XTuQEzd/bPZ
         sH253pVnX0haKTorvsZiarlFUgslXQTbAuSx+Y2yh/12Vxh7RrRj9ahFj+nw1G7IJxO0
         poJIF9lFim4wWMWeLa6OcMasHp7YCMg+JqqwtBnWpTmjjA89KKy5WftYIrObZyg2cobN
         fNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ajTnefiUFCLiEv1Oua4vWM7UQGpafsIHKzRUx8ClTE=;
        b=JTQvNne1V/x56gD4rwAm3KKcj0U9mJ6Wv/M6bNRr+NyUD8fC+EXKP9r6X/+645U00/
         oIiK/KcSnPalVlTqPBHPcqhpWMa1vjtsH2kyMzThcEk5A0tcEcJGHC530FtKwDayhU3g
         e6dp60EI3RyXZLyNBBh8MNmAdCdRONBLcKWQo9MrC8LuBKBGPPMKptV9s6u144tCNJHf
         aK8I2BD3BjEsWQqhYHF0h1AHyEuECVeWCT19KYO2C9e8Frh0oVGi6V3LHsy7cWT1nmsp
         VkTXNOq2SE91CakrEwgq4c4ExZ3PI/oi0Gi9L1UQCP1tc9QMS4lL+e0i/+swhYUUNeq7
         UFrA==
X-Gm-Message-State: ACrzQf0CVUH8BbZJdxfUTPaDyo/UwlPla7pVSNlZsVkrcUhAo7lJDOqX
	jL+na9tOi8TXgUAnKhYfNUcxmEp2dIgDDpEVECI=
X-Google-Smtp-Source: AMsMyM4Nsh2VC9U67vBaVgs7/UHSkp3Uowf53GMAUMnvNpPQKKb6jOu8EMd1HXtI9+u+gh2L5iVjODY8uHCV8Dc9mCE=
X-Received: by 2002:a05:6808:f03:b0:355:3cb7:b5a with SMTP id
 m3-20020a0568080f0300b003553cb70b5amr21025996oiw.55.1666710802514; Tue, 25
 Oct 2022 08:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6RADBEPh-m7N4Xmf_GuLP+Q+zm1FMUBoQF1Wsr+UBsUkrF-w@mail.gmail.com>
In-Reply-To: <CAD6RADBEPh-m7N4Xmf_GuLP+Q+zm1FMUBoQF1Wsr+UBsUkrF-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Oct 2022 08:12:54 -0700
Message-ID: <CAMKF1spYEKMExWJ3TwACwPVhKYut=rk6j=cX_w6p=S89sfTbxw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] jwt-cpp: add recipe
To: Meier Boas <boas.meier@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 15:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99307

On Tue, Oct 25, 2022 at 5:12 AM Meier Boas <boas.meier@gmail.com> wrote:
>
> From d3daf755814f0cff7e57bb521520fe6a52685050 Mon Sep 17 00:00:00 2001
> From: Boas Meier <boas.meier@siemens.com>
> Date: Tue, 25 Oct 2022 11:28:40 +0200
> Subject: [PATCH 1/1] jwt-cpp: add v0.6.0
>
> Signed-off-by: Boas Meier <boas.meier@siemens.com>
> ---
>  .../recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
>
> diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
> new file mode 100644
> index 000000000..bd3baa863
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "A header only library for creating and validating json web tokens in c++"
> +HOMEPAGE = "https://thalhammer.github.io/jwt-cpp/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHECKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
> +
> +SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
> +            "
> +
> +SRCREV = "4a537e969891dde542ad8b1a4a214955a83be29f"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "openssl"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF"
> +
> +FILES:${PN} = "/usr/cmake"

/usr/cmake is a rather unusual location. Can you investigate it a bit
more and figure out if we can have its content packaged under
${datadir}/cmake or ${libdir}/cmake depending upon what it contains.

> --
> 2.30.2
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99306): https://lists.openembedded.org/g/openembedded-devel/message/99306
> Mute This Topic: https://lists.openembedded.org/mt/94556657/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

