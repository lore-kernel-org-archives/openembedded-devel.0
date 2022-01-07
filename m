Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A53C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 19:12:00 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.11310.1641582719087551392
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 11:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GRSBcZVC;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id kd9so6331645qvb.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 11:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BuAZuI3QwQhl3/DkOHA/7kV72O5KAkWdcXWKeLe0KS0=;
        b=GRSBcZVC83BmKD6AnIJamyytyvjeVnnlPHAJ2t2sT0xtdokoCmrxLqaMg/7ee+A7Dk
         PtcpDV5Dk/alI1x1x83eTj7nTRtmyEG+fCCAu0Jw8WO3oLmNAEKxs83zIT8sNb1Cl6tg
         ws+Sxhh0BtmVHtyO9sutI0txeh4O6BuWR+8JBFr6DiEK8vqTd8xvAABpBALczXV4KUIt
         FF8dqb2krH5JX0MJuq5/tUgo12dhsx4JPefs38oNdep4pYQfggQVHQNtWwlwZgeoUEvt
         HuvN/lHCZ+omaY90qvNyIHmVqYr3b58wUHyyXlTNsE/DU4nVYEEN7NJK0RX0Fs/Vi7lU
         ozYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BuAZuI3QwQhl3/DkOHA/7kV72O5KAkWdcXWKeLe0KS0=;
        b=FdDN1NQyfULxrPY64+rgViCIJ/QT5t0D9ycRb9ipGIi+KHWrzlGalwV9hjXPb4vWo/
         yLJyPZIPnwWeSI6CGGu28X99POQbrpy9J6pXyAYB0xzke1a2fAcAlcccHmTkQ2u6ywQo
         FX96f941+asyo8gN099zUPPf8ZENHY0FiYOAQ3DocLhhho3bnCyKaQo5yTaKDSCzfxtu
         7jGRg2FtX1k+fAKaDxINUSO+A2k95JtQ234qZv79MDGjKx0hV56TIuHnYDKOViL58rUn
         6UZ6Etoy/8AfKGPDadpla/BbpQqY8YBuytK+zyEQ2zA9jtExn0vgsHyOWyQ9Lr/QS6pi
         CNNA==
X-Gm-Message-State: AOAM532PLIjp2/edg9dXmqmJrpks3v1L615cJ0l1XKDaFS2TZSYx8jDZ
	Q4xW27qn5axn4h23zD+eqbvu6ImcBl+wS39/U24=
X-Google-Smtp-Source: 
 ABdhPJyKKbmlytKsOG4yXwbA5eysgXOu0NMR3lKZJJ/CaxaZZ+W4xdbwHc6C5nlfLxMzd3OPxigcBuR4qrUi9ZjCCfI=
X-Received: by 2002:a05:6214:1cca:: with SMTP id
 g10mr36719900qvd.36.1641582718066;
 Fri, 07 Jan 2022 11:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20220106104532.204464-1-brgl@bgdev.pl>
In-Reply-To: <20220106104532.204464-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2022 11:11:32 -0800
Message-ID: 
 <CAMKF1sqaef9bGci30=BVUrfQGBkvbP-VjbFSYckcF9P-2_WS9g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] cmatrix: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 19:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94703

this fails to package on yocto AB

ERROR: cmatrix-2.0-r0 do_package: QA Issue: cmatrix: Files/directories
were installed but not shipped in any package:
  /usr/lib
  /usr/lib/kbd
  /usr/lib/kbd/consolefonts
  /usr/lib/kbd/consolefonts/matrix.psf.gz
  /usr/lib/kbd/consolefonts/matrix.fnt
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
cmatrix: 5 installed and not shipped files. [installed-vs-shipped]


for details see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1816

On Thu, Jan 6, 2022 at 2:45 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This adds the recipe for cmatrix: a tool for displaying The Matrix like
> codes in terminal.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
>
> diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> new file mode 100644
> index 000000000..3edf8ea90
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Terminal based 'The Matrix' screen implementation"
> +AUTHOR = "Abishek V Ashok"
> +
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "git://github.com/abishekvashok/cmatrix.git;branch=stable;protocol=https"
> +SRCREV = "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +DEPENDS += "ncurses"
> +
> +FILES:${PN} += "${datadir}/*"
> --
> 2.25.1
>

