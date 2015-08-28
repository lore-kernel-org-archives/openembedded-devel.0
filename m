Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id AAF5271633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 03:44:34 +0000 (UTC)
Received: by iods203 with SMTP id s203so80141631iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 20:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=mTC6cPta//EduIodtmcLSi31ED6LCxMUW/AnIStVX2Q=;
	b=iMdEUIjxSxU+g3N4nICj7bMCQZG6h+pQhJem287i3azruHdpkQf+zvaZiR/lfZGbWx
	uHfM9YAwY6dbC3v/9Rzd1btQ8x7pOmYMgXt/q7uPs13SSlcmPsESQghS627iRQS3TJsh
	ng/Ut9VmTYdCygmGAMDCnfGfzClHaPXtNai4RwOOpt0cXiZXG+Nk6NPswA9R3g2NNNHF
	xBkC8Olh7TiTPvSypWlKZ/DfVdZ7uqgfcBJICARgM/Kjk99WNHHovYkV4v7ZzvHiRcoe
	TmSG+TFRQkgaK+HbS65F4N1j8Ui7Bm542+l/LLzakCD6s1DCI4qDCv/YERIHjDi5WRjG
	bPMA==
X-Received: by 10.107.14.84 with SMTP id 81mr14385270ioo.195.1440733474602;
	Thu, 27 Aug 2015 20:44:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 20:44:05 -0700 (PDT)
In-Reply-To: <1440712214-30967-1-git-send-email-soren.brinkmann@xilinx.com>
References: <1440712214-30967-1-git-send-email-soren.brinkmann@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 20:44:05 -0700
Message-ID: <CAMKF1spGXzAVzKMfc=nvV8ARV6tndHY15g7rj=-HR2z3SMUtNg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Add analyze-suspend
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
X-List-Received-Date: Fri, 28 Aug 2015 03:44:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 2:50 PM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> v2:
>  - replace 'boot'->'suspend' in commit message
>  - document kernel dependencies in recipe
>  - pin git commit
> ---
>  .../analyze-suspend/analyze-suspend_git.bb         | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
>
> diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> new file mode 100644
> index 000000000000..6932e9fadfc4
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Analyze Suspend"

If you add  DESCRIPTION with more details it could help folks trying to use this

and please define PV = "3.2+gitr${SRCPV}"

> +HOMEPAGE = "https://01.org/suspendresume"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +# Apart from the listed RDEPENDS, analyze-suspend depends on some features
> +# provided by the kernel. These options are:
> +#   - CONFIG_PM_DEBUG=y
> +#   - CONFIG_PM_SLEEP_DEBUG=y
> +#   - CONFIG_FTRACE=y
> +#   - CONFIG_FUNCTION_TRACER=y
> +#   - CONFIG_FUNCTION_GRAPH_TRACER=y
> +
> +RDEPENDS_${PN} += "python-core python-datetime python-stringold"
> +
> +SRCREV = "bce3cbec43bc2ce7a8c79b210314dd9d9ac1010b"
> +SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +       install -d -m 0755 ${D}${bindir}
> +       install -m 0755 analyze_suspend.py ${D}${bindir}

both these could be squashed into

install -Dm 0755 analyze_suspend.py ${D}${bindir}/analyze_suspend.py

> +
> +       install -d -m 0755 ${D}${docdir}/analyze-suspend
> +       install -m 0755 README ${D}${docdir}/analyze-suspend

same as above

> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 2.5.0.3.g52d66ab
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

