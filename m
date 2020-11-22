Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.26785.1606087482982913722
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 15:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eHFbkg3k;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id q22so15139659qkq.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2020 15:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4T+MFRNa27uQvwomzy2p9yvqYw+mS3gJx8bpF6fBxpQ=;
        b=eHFbkg3kK5LOh19PjnItjchwH5Ay5anC22+bWQD/Np7mkT2WERGNcD6I+Tj4+bqn0K
         y5e2pHGdbAJU/fjBhryNOWJJyZbE+x0yI8yVrf89er8oixuS6/0QtkfMKKvosUheQWvi
         Bdo2FLXLqYKvwmRuW+XGV1UcSy7EDBFOkZX2ofhsGYuAsn2zecCbI9lvH1zZ45CuKCnJ
         CiMPEES6s4Y/YIDXWxCdWzFBCbAWNTnVeYpcbczZVR6ZFvfxiUioo/qkmJym7G7lXVFS
         w6Rqzo6Auql1NxAw3frh30NXHCwugfWw4gM/5c16aR6wQUpl3cwo162poB8QkMW9wq4C
         T5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4T+MFRNa27uQvwomzy2p9yvqYw+mS3gJx8bpF6fBxpQ=;
        b=bwN3quvsVeZweci9XNi5h08Q6Dte42ot/h5uX9qjfV63jTZoYaUhSNQywVEjPxtqah
         HLUTMFgD5D2vPrz+DbKz9pxHIuUgD9uN8FyuroYPRoG+bx5fvfPuwTgof+2D5KmXQ+Lf
         CUk/SpbcKj8mAeQ4od89NHD9ofxUL05s/zZu2Q7ZbaAeJdd2uXfY9F8HmfJoyqNqdF88
         Xf2P0+AEpOZS1iFdo2AK5hgSuFkKMfxiRuZMp3X2mCRQFgy7o9gxcsmQoJRnPTOVPH19
         26+552zXKZG0tHs6AsbFcehP5tx8iURuOq2vblQwMuGZZkHkHsrwr8g8X4OgrqKGTsYa
         A+sw==
X-Gm-Message-State: AOAM531jY19YUaHcwnPaTJjp5TK5noVy0g9FF5VuET8K6B0QV6H12JeO
	uHLV7ocj4GFFPcHpNywf6/CQYw5VvnyvWou9LAw=
X-Google-Smtp-Source: ABdhPJzhysaNLHoRL+qkM1H4zIOEjMR3yN5r13LrBOh4uVeosux5IY0DRkC+XSXp6FVNvTlyDTeWDrwKcyKz652Vvb0=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr27084069qke.337.1606087481988;
 Sun, 22 Nov 2020 15:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20201122224120.2931-1-okaya@kernel.org>
In-Reply-To: <20201122224120.2931-1-okaya@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 22 Nov 2020 15:24:15 -0800
Message-ID: <CAMKF1srEYm5L4oW1fWO83MWf4OBx7YEgnM4v1OiJxRs3s938iQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] heaptrack: add bitbake recipe
To: Sinan Kaya <okaya@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Add it to packagegroup-meta-oe as well please.

On Sun, Nov 22, 2020 at 2:41 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> Add this useful tool to the devtools list.
>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../heaptrack/heaptrack_git.bb                 | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
>
> diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> new file mode 100644
> index 0000000000..30d7b65bd7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Heaptrack"
> +HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "zlib boost libunwind elfutils"
> +
> +SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https"
> +
> +SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>
