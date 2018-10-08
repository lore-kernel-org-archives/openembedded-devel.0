Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0E39671A0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 13:40:03 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id e22-v6so13873487qto.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RrUJDpXsDDPbRytIWcaWuvC4lpnAtN+OzDY/nY0znGw=;
	b=m5Noqd28Y2OAducl35YSKd0ohJD9qedjzupIygYvdWjJO52Xq11RvaznLDXGezuMR6
	ZkQPsmOZ+7kb6fs31+0hC2awIJ95/n+stK7p72Ylaa4ZuvyYK8yx+iUjWhD0skqEoe44
	fohmhZy+8tS5G594fu9q/QwJR2b8goPUMuo7TMVfFSnlm1X0tqcWFTto46JA/bsA1ZLr
	iuVW2bHAjrlrg9/r1BKWVJ+q3Xz54SD+2GT3+GkxiIZuuoBc3JW7Q6yOIXKt3viKi6N6
	1XW5RCix880RiRZHF+RQQ7xFTXyWVYND3WhEjM9g5MkUlssD13roZB/C7DVJ5cqjBPb0
	Qx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RrUJDpXsDDPbRytIWcaWuvC4lpnAtN+OzDY/nY0znGw=;
	b=bUSBkOd2YpLgSZn3hC/r1BYCJYVMAviLygeBISORgHbBYUCT3401Ewgvf1XhoU+Ius
	l0EKwy36ukzsu666Q4DV5cxAV5A6ixpNocK4JsSUlRDNoIe0UPhb9RGYZk6X75lBjUTk
	LY4f2PdupEyddMfri03dbGOstD9vA5QQ/ZX13fAfgqZf2SdpVBIhhDo1Z8XF1qpxjhQ6
	1OY6SXa7jx1birhgt+4bRGY4R7zBoetTApneg/mAx8vevt+vumATgBRxFMM6uoBkdgjq
	TDoDuXxPV+jI6EYLBf6N9/cDYfm0CaRvFgvMKflkiNysuEjaVllZKMhlAjX4O+Nkb/RE
	LTyA==
X-Gm-Message-State: ABuFfogu9pwWi4TfNbKT8ZWaD/dX7EAXqpHQFKhI9i4Jl5SgRjfhcHvV
	CPWBTQOlW51Oo+7H2X/Kk8UQnwOrVmX0lX+PMF4=
X-Google-Smtp-Source: ACcGV607IunckmeghKnNOZeHmwwNbLoacuoCVmlH8MD+HnZTavS4D/fAArAAvsYAv78eccA+iWXXdhw8jkvNZqeDTww=
X-Received: by 2002:aed:3b04:: with SMTP id
	p4-v6mr18925338qte.218.1539006003934; 
	Mon, 08 Oct 2018 06:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <1538986717-13998-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
In-Reply-To: <1538986717-13998-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 06:39:37 -0700
Message-ID: <CAMKF1sqm2-6+mKtpLfk6jTwugc+vTy2U6mWrrKB8-iL-zV95qw@mail.gmail.com>
To: stefan.wiehler@missinglinkelectronics.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nvme-cli: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2018 13:40:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 8, 2018 at 1:19 AM Stefan Wiehler
<stefan.wiehler@missinglinkelectronics.com> wrote:
>
> NVMe management command line interface.
>
> Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> ---
>  meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
>
> diff --git a/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
> new file mode 100644
> index 0000000..68c73ca
> --- /dev/null
> +++ b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "NVMe management command line interface"
> +AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
> +HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> +DEPENDS = "util-linux"
> +PV .= "+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
> +SRCREV = "642d426faf8a67ed01e90f7c35c0d967f8cc52a3"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +}
> +
> +FILES_${PN} += "${datadir}/bash_completion.d"

this perhaps should inherit bash-completion bbclass
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

