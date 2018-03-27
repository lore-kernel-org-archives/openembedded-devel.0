Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id BE6DD606D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 21:53:52 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id b198so428600qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=N+hF8piedaENfMkvO98G++ZhNMBYxCv0bZpSC6PcpaY=;
	b=Uh/+PRu3RB2aM8qfpYlEbepqWgCjhS698KqcdTesWa4xolE6lQcqWXVCqHzbkIdaa9
	Sj8AH/v/ube3oY5p/lErTgtKX9WSSDNnYTJDytfAOygCVhkwDu7quP+fa84bujGebxgz
	SKD5qjnEncGPC/B9kiKGcI/pJnxu0ERpk5+yu8DDr4hdQ9uCopnpK56c6cD8T+RGiUAW
	kpV2ueeEHsDSAaajg7/fhSprnQuNpdvVgBrRvARc3he4/YVH8q/2IHog9i97fAACOspM
	mXLMxZIBskdL1Fzp3dzRjqGAiW3tcJKxGWYLg3a3ix2FdxCKgu81vctR5n4Jj+lC5Vsv
	nTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=N+hF8piedaENfMkvO98G++ZhNMBYxCv0bZpSC6PcpaY=;
	b=C6fi2zB4penVs5IP8KA1+GZqdji/0jjfgLZ+kF153oTcG0TJvywpub8bvmnWNX3Lui
	5JyQo3EglkQK4dh+8uxBeaveJDkrNAcc1fbKCZByrpKxfdzAYbGPH58HpAq86hdx3a79
	Wv+YMYHuCf4392GlPRQ99++mNMEqkWSHvHCUBRnSDjx/XTfsdb1hT+M75ZLilToGIosS
	hh6o3XDhevUjSf2nHvQH02pkwh1RKtqKdFTz7kVk9AWOb4b5e1VUQ8sej5VEm+ubMS+C
	0tsrjSKegdFGrK03MH+zfCtn9YM9tTG8tN27rqEsNhIb+TTpgq9ZogyDf3xaxx2ohYEg
	ZeCw==
X-Gm-Message-State: AElRT7GPHvMWoGrvNVLHcwdwDYZl7kuP0fyCeQj2AHwMjWbKK2b3lt1z
	IruylWwzdv26uDNms6fyb9nrAv42v7Cards0v/a2RA==
X-Google-Smtp-Source: AIpwx4+udSaW6h/a9HT0ScDWsiEHgXudUEDbv0LA2TPJ+6vpbw2nspKLd9JRhWXfuoZr4h+GRoE7vVQkwouML6u11vg=
X-Received: by 10.55.78.86 with SMTP id c83mr1677199qkb.264.1522187633229;
	Tue, 27 Mar 2018 14:53:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.41.91 with HTTP; Tue, 27 Mar 2018 14:53:52 -0700 (PDT)
In-Reply-To: <1519829592-17286-1-git-send-email-carlos.rodriguez@ridgerun.com>
References: <1519829592-17286-1-git-send-email-carlos.rodriguez@ridgerun.com>
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
Date: Tue, 27 Mar 2018 15:53:52 -0600
Message-ID: <CAGzYGe3RrX9EvRzZniVaTs3w5XVUxb_sZKSR+_0VJXyS13Dn5g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v3] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Tue, 27 Mar 2018 21:53:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Do you have any comment or feedback about this patch?

Thanks,
- CarlosR

On Wed, Feb 28, 2018 at 8:53 AM, Carlos Rodriguez <
carlos.rodriguez@ridgerun.com> wrote:

> GstShark is an open-source project from RidgeRun that provides
> benchmarks and profiling tools for GStreamer 1.7.1 (and above).
> It includes tracers for generating debug information plus some
> tools to analyze the debug information. GstShark provides easy
> to use and useful tracers, paired with analysis tools to enable
> straightforward optimizations.
>
> Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> ---
>  .../gstreamer-1.0/gst-shark_0.2.1.bb               | 38
> ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-
> shark_0.2.1.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-
> shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-
> shark_0.2.1.bb
> new file mode 100644
> index 0000000..8ca165c
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "Gst-Shark Tracers"
> +DESCRIPTION = "Benchmarks and profiling tools for GStreamer"
> +HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstShark"
> +SECTION = "multimedia"
> +LICENSE = "GPLv2+"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
> +
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base
> gstreamer1.0-plugins-bad "
> +
> +SRCBRANCH ?= "master"
> +
> +SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
> +SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
> +
> +SRC_URI = " \
> +    git://github.com/RidgeRun/gst-shark.git;protocol=https;
> branch=${SRCBRANCH};name=base \
> +    git://anongit.freedesktop.org/git/gstreamer/common.git;
> protocol=https;destsuffix=git/common;name=common; \
> +    "
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS = " \
> +       --disable-graphviz \
> +       --enable-gtk-doc=no \
> +"
> +
> +FILES_${PN} += "\
> +       ${libdir}/gstreamer-1.0/libgstsharktracers.so  \
> +       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
> +"
> +
> +inherit autotools gettext
> +
> +do_configure() {
> +       ${S}/autogen.sh --noconfigure
> +       oe_runconf
> +}
> --
> 1.9.1
>
>

