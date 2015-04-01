Return-Path: <andrei@gherzan.ro>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id ADCEB60034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 09:34:48 +0000 (UTC)
Received: by wgra20 with SMTP id a20so46786550wgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 02:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9vH+IxSoeWF9BvYIaOTI2mw84AohYzMw4ANVrv6M6a8=;
	b=OQ2MI4KtyyqN8O8h+CkhqYy5PwmHsCUdU3y9YLJye3dzQWNpZo9Ay2bdzeuT2IiUwd
	d/2/X6I1TU8LSwdPhkFTiwB3TSWwPm+gYFIq1MFNydBcXByJz1MTg/ZbRAKp2dldHiTM
	9tuUDE1IA+0jWql0izcJCn1THk1CGjY4OqqzRI7+v/SHn+vzFdeMYI0cyPR/PV/UxP+h
	TKTw/whkU8WYqRg0NNWuBTxv/Dvpa7xslvDcOnt12Z0VXj19Pd2uX5qWyeRF5zWWIhIi
	grceXGywPXhdZO8dYYQse7py0MaeLfBskO/1hMKGBwyOW9mP15tvYX3UxpEFX0nLthPT
	fBBQ==
X-Gm-Message-State: ALoCoQmxWWzHrIwWIIrw3lJ80/TegibPkzn6alnIcgucXFZB84qk637Ih3zqC5wBDOaJ/K6jIrXS
X-Received: by 10.194.110.233 with SMTP id id9mr82316240wjb.136.1427880888984; 
	Wed, 01 Apr 2015 02:34:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.224.193 with HTTP; Wed, 1 Apr 2015 02:34:28 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1427879628-7499-1-git-send-email-texier.pj2@gmail.com>
References: <1427879628-7499-1-git-send-email-texier.pj2@gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 1 Apr 2015 12:34:28 +0300
Message-ID: <CAK18fxG54HG5Lsc=xoarEGruKsfLQvUjsHZgu++tctYnrnieDA@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: texierp <ouf_du_45@hotmail.com>,
	Pierre-Jean TEXIER <pjtexier@amplitude-systemes.com>
Subject: Re: [meta-oe][PATCH] spitools : add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 09:34:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 1, 2015 at 12:13 PM, texierp <texier.pj2@gmail.com> wrote:

> From: texierp <ouf_du_45@hotmail.com>
>
> This tool allows you to test the SPI interface (through spidev).
>
> Signed-off-by: Pierre-Jean TEXIER <pjtexier@amplitude-systemes.com>
>

Ack


> ---
>  meta-oe/recipes-support/spitools/spitools_git.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-support/spitools/spitools_git.bb
>
> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb
> b/meta-oe/recipes-support/spitools/spitools_git.bb
> new file mode 100644
> index 0000000..20e545b
> --- /dev/null
> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "This package contains some simple command line tools to
> help using Linux spidev devices"
> +HOMEPAGE = "https://github.com/cpb-/spi-tools"
> +AUTHOR = "Christophe BLAESS"
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
> +
> +S = "${WORKDIR}/git"
> +
> +SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
> +
> +SRCREV = "cc6a41fdcec60610703ba6db488c621c64952898"
> +
> +inherit autotools
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
*Andrei Gherzan*
*e: **andrei@gherzan.ro <andrei@gherzan.ro>*
*w: *www.gherzan.ro

