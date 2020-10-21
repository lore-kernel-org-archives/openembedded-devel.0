Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.14596.1603297902082512652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 09:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jPBN/B0P;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id t6so1432217qvz.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RfPMSQsm+9pMjysvYmbtOcytvJt08BBpGFFpuAoT0aA=;
        b=jPBN/B0Plezk9NICeR04KhjUVHz8Cy7L48mEnAyfsGLMKx8K5y2hI9fPKmcuk4TZ4l
         ew2QpvdrjvK/VJnOVoDg1+DjpnEhku+c/PCgXxtiK9KjsXjfczG0MtEK3AJtiuCxIZ5L
         SbE+jYW+WWRC0L+kRCfPjjOJXKSof0IToSgBRHZEOGPZ121JRIFB96IgYpU/UxjIN9kv
         I4TAT/ld04icXPthFM0FRSVTMM1UtVgyuyzYa/nDh+UJETGlXljRNXqrFP23HDn7PcCl
         twNVX6OH3kVLk2Qi8vnDJ8HptSH4tBO+FCdAbYl+ofml2ZTWbjLVT2C5g/1kZ69TXinx
         0Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RfPMSQsm+9pMjysvYmbtOcytvJt08BBpGFFpuAoT0aA=;
        b=HlzjTW4BqNnuSkPTDI8CRASnoN3muB/3YC4Z9tBNXxEwr6I+j/PvLy87/28nAL9lpI
         qzI1s/Xs8rXxP+8sMRxLZRv1f4IzCoLUkN6JopV2/LFsa3y8krctBwYmofst1pDBWNHb
         ZCeCSmiUM0jfITxecUeuwnL2b60IQ120pR6BENRFJf7M5x5Svls7Xfz6jT4KbMGMVaY7
         JvES5nrfybZrHpcj4Jd/gneMHMZ3J3Ms4xUePapSpeprkztq8SxKrd/ANDmzTC0V5I9w
         AWrmkkzImJbDnLqrhDnCkDsKaCRZLpqiBlsb3VR70zaFCUraJiGA0DaZmbFxSmbL4sK1
         Qp9A==
X-Gm-Message-State: AOAM5323TevSovxjrOHX0ZM29VM68eBwwfOwhI0HEGum8yo+FtVxdiOE
	6w1DYsGAxeK5F5wpxvhuN8r1MZ6aEgaYo89uH06YKshQ75EAIQ==
X-Google-Smtp-Source: ABdhPJyoldbDPX6i9fneWvDVMSJ1aR9N2RSmd7nf3KQHl0AnjDOGGsnqZC0zi9OQ2uH+SbpWslxs7yb4y4IRtfVSdIM=
X-Received: by 2002:ad4:58f2:: with SMTP id di18mr3518334qvb.19.1603297901017;
 Wed, 21 Oct 2020 09:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201021103315.23613-1-daniel.ammann@bytesatwork.ch>
In-Reply-To: <20201021103315.23613-1-daniel.ammann@bytesatwork.ch>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Oct 2020 09:31:15 -0700
Message-ID: <CAMKF1sqgxj0VCabps0+3832e_BSF7UpxQnw7yV9v_zf61VhTBA@mail.gmail.com>
Subject: Re: [oe] [PATCH] pcsc-tools: add new package
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2020 at 3:33 AM Daniel Ammann
<daniel.ammann@bytesatwork.ch> wrote:
>
> Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
> ---
>  .../pcsc-tools/pcsc-tools_1.5.7.bb               | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
>
> diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
> new file mode 100644
> index 000000000..875c97ef0
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Test a PC/SC driver, card or reader or send commands"

may be use whats in README

Some tools to use with smart cards and PC/SC

> +HOMEPAGE = "http://ludovic.rousseau.free.fr/softwares/pcsc-tools"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https"
> +
> +SRCREV = "34ac207adbba0d1a951b314c1676610a1d0bba01"
> +
> +inherit autotools pkgconfig
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "pcsc-lite"
> +
> +FILES_${PN} += "/usr/share/pcsc/smartcard_list.txt"

Its better to use bitbake variable ${datadir} instead of /usr/share here

Since its a new package please add it to packagegroup-meta-oe recipe
as well so it gets into the meta-oe test image
> --
> 2.20.1
>
>
> 
>
