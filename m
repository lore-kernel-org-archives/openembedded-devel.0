Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.576.1591678605222800540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 21:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m3uVsRNQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id ec10so9502475qvb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2020 21:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmCbrWDec4O7TMcw8Wlo9pr+Wz9g6b5ZjXmixB8+WjI=;
        b=m3uVsRNQVyzCwk2iK1ydAydmwd6NMvuWAtO6nFMMkiMyWgVQrR5ZiWw8L5Xs6/A0uT
         ok6sxY4QI0jdfxH7NMQyEgumAU2EbLYhKRexCYljXWTe8jfx2zMboGd+cOcJf6aV9sR3
         qUCniMMnmyizBPKIZQ5ogVvIb42Mgit+UtlQYTr8bUgDdCTUwKUZh7qL3lz26JOChuCG
         wPUcrek5C8Ddy+3YkthW/PEatz3ZLhPhBQ/bjpjIA+79OtiY9i2X12lkN5pNWkW5cxQZ
         R+xjfTabAHPuPuJO8hWlza78UhBRGjb6/qxiIMaRWjp0Rdz4su6obEkRSidDTixWUmhD
         wmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmCbrWDec4O7TMcw8Wlo9pr+Wz9g6b5ZjXmixB8+WjI=;
        b=O2amx9ESrkKlL1n1uD6fPa9Kc3/6HjzNT9qs0raWLevyJBpcTx5inmNekS5nolhIeg
         SCFaEKkt0kXZHLTuVqPa0NF3Gms9pMIP0/g1Yt8j5nuJXoR5SKo4efQD0l1Hvr3mNTEZ
         rYk5Y/xFhKiLhjhJW5EQzqEJ9tg/vCZq63MxBaJX9AbdmEf4dJc9k5lxnhMlF2KlTKIs
         /nhGHfI3Ro9B1UWZZ+tbbdtM75UZ1DZELgbTR3mVGNpI9baKpeyE2K/ATFmTyVdRmBdV
         eBMuEiiDae8XPR/P/fMntm5SbNHa+uQ0bd5R6JsTgWybtX37opFcZB8vnCd/Ak56ixTB
         LeuQ==
X-Gm-Message-State: AOAM533wZkpbEF/I3ujT72TCVTSLMCKHul9AbgLHjVb4a+Uk77Yl/+ic
	NDU//mH6TTS0w4pakDXSWkGBPvMInNDCOEPbSpU=
X-Google-Smtp-Source: ABdhPJzrlhTj1rQm+2SHTnx21+ni0Pate6uGE5cUvAFlLN/N9O9TPVhswsYJ1yeuQxg28cMaZx1WP/1lwyUx3fDKvWY=
X-Received: by 2002:a0c:e9cd:: with SMTP id q13mr2100507qvo.23.1591678604153;
 Mon, 08 Jun 2020 21:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200608205935.14937-1-yongxin.liu@windriver.com>
In-Reply-To: <20200608205935.14937-1-yongxin.liu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Jun 2020 21:56:18 -0700
Message-ID: <CAMKF1spzbjoXUiTeYyiA6ZefSEh5_0QPEUBKzOkNkhcCVnD+Mg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH V2] intel-speed-select: Add new recipe for the tool to validate Intel SST
To: Yongxin Liu <yongxin.liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to build for musl

https://errors.yoctoproject.org/Errors/Details/415731/

On Mon, Jun 8, 2020 at 2:02 PM Yongxin Liu <yongxin.liu@windriver.com> wrote:
>
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  .../intel-speed-select/intel-speed-select.bb       | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
>
> diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
> new file mode 100644
> index 000000000..a34f379b4
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "A tool to validate Intel Speed Select commands"
> +
> +DESCRIPTION = "The Intel Speed Select Technology (Intel SST) is a powerful new \
> +collection of features giving you more granular control over CPU performance \
> +for optimized total cost of ownership."
> +
> +LICENSE = "GPLv2"
> +
> +inherit kernelsrc
> +
> +COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> +
> +do_populate_lic[depends] += "virtual/kernel:do_patch"
> +
> +B = "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE = "-C ${S}/tools/power/x86/intel-speed-select O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> +
> +do_compile() {
> +       oe_runmake
> +}
> +
> +do_install() {
> +       oe_runmake DESTDIR=${D} install
> +}
> --
> 2.14.4
>
> 
