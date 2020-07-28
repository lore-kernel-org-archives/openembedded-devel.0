Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.19389.1595961438562839037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 11:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DYGEYoZI;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id b25so15636270qto.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 11:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tr+GIqzTapKLzh9FSZkjV7DOnJChHgJ6MgrV6HzM4z4=;
        b=DYGEYoZIS9EMuUWwVqWPL2VtLjEvxEa0vamfgZvltdKofTPB5P5qHcIBC6WJQ37ZhU
         cvYxkvD/a0QgxYcJydN/2zZwFBnLJXyPCOkWDFqM4sNMWyWTPoCFIl3iVqR0FrkBRNuw
         w7jIAKn74u8210VEAlrh9pwc7WuwvnCFRyDbYUOoWBg5gj0wnSSuxF14gVYfLHJ+Zm7A
         KfAGpn+4fwi15QkZudsAesCfE6joKlACJjgDBvOzqP00HC7JZ+CAVhp3iQqyEce/ChpZ
         rxpdCr3DCQRAu1I7qpNy2gidyIAqZMlCcC8551ss5XiUvlNBq4NMpeMP+vllTlDSwEuQ
         GqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tr+GIqzTapKLzh9FSZkjV7DOnJChHgJ6MgrV6HzM4z4=;
        b=EDZbjG+zXQXH4lES7HN1pBWcDWi8LA0gQztJq+ursZOWQgri7675K197t7RiMgbGBN
         Pi113HkBw9tK74tGMOe7vVgEKeQAQi3w82ALc0w7XzqB0P13DOc0OCW6XoDugvHBG9CE
         yrwQaxK8Hn0/boQce2MhgD4BTlona9hyOKY2jHWg3DOzkLMZAzKpFj/DUPWEbe4gWC2p
         4aMgijx6u8AV5qiu73ZPr9GbtCAN7cDf5fQ8cIcyOVXkr5lUaf6msYW/8kJQNe1n7kWE
         iT50Xi9AdDVkE2m8K1LUDoNAUGEYiOsCjYKL1Hj8CdFjytCaWqq0M3ZYVFAzitry9PCX
         LWwQ==
X-Gm-Message-State: AOAM5321tYgJzPHeBig0LoW91HO8AhD3hqTQ7EGKils9CRq89ZONR8xi
	PyE3GnpwSVivCW7/C+iIiqJj9smAd9VpbskEkiUYszAyjSw=
X-Google-Smtp-Source: ABdhPJyeL1AlfIB8nQqNoRaUx/Sulp8+46/IHcNqirjP6oNHp1xP5ubHS7znR/xQ5DpvUK/E/4ULmpwTrN812aDg+so=
X-Received: by 2002:ac8:748b:: with SMTP id v11mr27989795qtq.293.1595961437616;
 Tue, 28 Jul 2020 11:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200726095913.3962157-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200726095913.3962157-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 28 Jul 2020 11:36:50 -0700
Message-ID: <CAMKF1srPjAdFQtJGJ2x6gbTN+zjjzTRhzwikQt+LCN2DmJb4Dw@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe 1/2] opus-tools: update to 0.2
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 26, 2020 at 2:59 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../opus-tools/opus-tools_0.1.8.bb                | 15 ---------------
>  .../opus-tools/opus-tools_0.2.bb                  | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 15 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
>  create mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
>
> diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
> deleted file mode 100644
> index a84f2bf078..0000000000
> --- a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Opus Audio Tools"
> -HOMEPAGE = "http://www.opus-codec.org/"
> -
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=843a066da9f1facfcc6ea6f616ffecb1"
> -
> -SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
> -SRC_URI[md5sum] = "b424790eda9357a4df394e2d7ca19eac"
> -SRC_URI[sha256sum] = "e4e188579ea1c4e4d5066460d4a7214a7eafe3539e9a4466fdc98af41ba4a2f6"
> -
> -S = "${WORKDIR}/opus-tools-${PV}"
> -
> -DEPENDS = "libopus flac"
> -
> -inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
> new file mode 100644
> index 0000000000..766507de17
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Opus Audio Tools"
> +HOMEPAGE = "http://www.opus-codec.org/"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=79f6fc2a6239fbe5f6e52f20ac76698c"
> +
> +SRC_URI = "https://archive.mozilla.org/pub/opus/opus-tools-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ff2d0536e960cabbfb8ca7c8c1759b6c"
> +SRC_URI[sha256sum] = "b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86"
> +
> +S = "${WORKDIR}/opus-tools-${PV}"
> +
> +DEPENDS = "libopus flac libopusenc opusfile"

this is causing

step1b: ERROR: Nothing PROVIDES 'opusfile' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
DEPENDS on or otherwise requires it). Close matches:
step1b: ERROR: Nothing RPROVIDES 'opus-tools' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
RDEPENDS on or otherwise requires it)


> +
> +inherit autotools pkgconfig
> --
> 2.25.1
>
> 
