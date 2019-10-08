Return-Path: <net147@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D30227D534
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2019 12:11:32 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id q15so8352714pll.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2019 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H1Q4ldzg+WALo4RVcyBYzeS0id9evx2d1JfBrXME7qY=;
	b=AKbQGI2M+8VVTpdvnv/wEdnLsiGAoEuS0cKn6shHtjZ9LJ4NMrsQEC5SanFZO/vhwH
	2OYLDho4KN4r9GlcL5vR0C5bNwL28hB5yq6vk05defoe97A3f9Zl2F+At2O79dqySjcc
	IsI/rjvnUXTsa9Vw+F0Fm5ppfQ7ZQcVvYuKSY1G+oU8kFuKffUDa2rtG0ADBlPaMqly1
	rEEKPnC2hjD9lYG+fFV06SFaI/pkcyJc2g7bBCDY99x43n9U7v8zHfFdEEVul1xPRLwQ
	PUlRgcIvm33d2Cey05PDbFNnjPDVkf1U5HauMY+qJ3/ofmX9BUR4uWIenQ0eZER4zbPH
	DdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H1Q4ldzg+WALo4RVcyBYzeS0id9evx2d1JfBrXME7qY=;
	b=d+J0BUTNZ+x9c6ymw2GP8xa6/5Gz13wdEFaC2Ve8RynS4q3O/xY1vJYSC322iC1VEE
	eFFJ9PbeIyHXsXiX14uNvDMZ7k8fX8BJmtLpMqUlUwNnbnl9ubIYd9y5xpdtN1Atjp/b
	ItacNbJp839gXaET0/9bnEqnvjnAk2oQMI3UaoMDvTmoKrCoMSfNtA7GKSGYMymSEDPX
	heLPkdkgDrg0uWan5QR7VJyTY6A654M+fgNYLUPqZM35CsehDHzEdl1ycAeldqW3Ffy+
	8pRCc2WVcLGeLb+ZhzmiPNYita7+vGMwTLd6INvWJzZqj7uzDM8Q2JleaQdsMQkRVu0e
	7OXw==
X-Gm-Message-State: APjAAAXjpdQ2XTIcnIQaCjue52Z1A+IMbqz3TKw4hkDeDm6tQ2yw0QKh
	eRGz2N6nT+KZayIwQh+yzZa/TO7YklpIiNV3w3nh22BA
X-Google-Smtp-Source: APXvYqyYbrOgQ4N63S0bLCax5OYUnTpNoe80xzCFDlMrP+0xO54p0X3LFqd/Q9Lcv0hryAOzzg0SKCtaDnm15uQ3lE8=
X-Received: by 2002:a17:902:b70b:: with SMTP id
	d11mr32769672pls.275.1570536693645; 
	Tue, 08 Oct 2019 05:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <1569907719-30159-1-git-send-email-denis@denix.org>
In-Reply-To: <1569907719-30159-1-git-send-email-denis@denix.org>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 8 Oct 2019 23:11:21 +1100
Message-ID: <CANwerB2CLMDNBWn15k2c_Jqrj3=iVjxK7dG3R8TZgbqTZX8wqQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] rwmem: add recipe
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
X-List-Received-Date: Tue, 08 Oct 2019 12:11:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

I imagine a lot of people don't need the python bindings.
Can you make the python bindings optional?

Thanks.

Regards,
Jonathan

On Tue, 1 Oct 2019 at 15:29, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> This is being moved from meta-ti as it's a rather generic tool to be useful
> on other platforms.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
>
> diff --git a/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
> b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
> new file mode 100644
> index 0000000..0a15134
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "A small tool to read/write memory"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS += "python3 python3-pybind11"
> +
> +PV .= "+git${SRCPV}"
> +
> +SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
> +SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
> +
> +SRCREV_FORMAT = "rwmem_inih"
> +
> +SRC_URI = " \
> +    git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
> +    git://
> github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih
> \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> +
> +do_install() {
> +       install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> +       install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

