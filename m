Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9C04A7827E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:42:38 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id g21so1883598ioj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=SYXC1y1IoHOJ4hdKqN5+iBvxIe3ZHPx3Zp9rHDIV/aw=;
	b=MTdMQzth1LfJKfgceZjhnGDLCPdE2uGDj8yChEINox684lvrkKP/XlpBUbvOrtNTHC
	JtagzfvfZKqy4XnlbIeLtX/WhEVD85C4D5izM9DxtzrBCngfrjwnpu+jPbyMU+SYpOU8
	9bFTYycY0GoO2n29zJH3Ttwv8f0DDTg5PUPjoRnFdJ6vRWNWzZvZMvnQbk99Xxcepj6n
	HnHUzJ+munFh7C9feFT7SF7skIG2uwQj6wKroPQpt6Npr0v9dwe30OgL93is5VWR1zRu
	Mf2P53xOp0YRzQnkurhsj3zUa/TcAl9A9fWAe6jv9bYKvDLLin3AIRDd7pNvWAF0vb/x
	yG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SYXC1y1IoHOJ4hdKqN5+iBvxIe3ZHPx3Zp9rHDIV/aw=;
	b=iwbg+tSFZQONnhKoAq6vRUsMf4x3HR+jwF1ERU8FuY633Gf41ENj0Mh9XBY7e9hXP0
	TtH6b5riTScQTrbCT64IQry4PzdM57kLNXXxb98CHpVWLy6Ko3kuocHR21X1y8rmv66Z
	v1MxKlHXdX52pcZsRPrjfFUrz5bVXwSty9MfAsdDJKaDH1hKShP7bMvwLwKMHYHaZ+Sn
	LwqTdd9tdOXxpKpqXYXLdv4deFnLP639/0u6bJ7Cp8rOVdfsVo8Ct/rTVhFYFKsnm1IS
	uI3MBM42VuBWdT5Cz6sASh7/Ur4ovZsSdBlDsf21kV5Z/Z8i03uKTZoVzCsWB9qzUPay
	TvHw==
X-Gm-Message-State: APf1xPDLRSXsLoiqjfLFO7XxdNKSYaGfvJBLrkYg71rgg/Hj3U8rQQm8
	Ie8kamaVVdsJNj23tPgrBQRx9w==
X-Google-Smtp-Source: AG47ELuXzmil3ABhEz/FFKfFnxFBRTYh0b21i0l9mZcz3AMA7iNaG5GHIJZk54oRd786+KHUE9fdmA==
X-Received: by 10.107.146.215 with SMTP id u206mr17718158iod.96.1519796559456; 
	Tue, 27 Feb 2018 21:42:39 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id i31sm582580iod.78.2018.02.27.21.42.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 21:42:39 -0800 (PST)
To: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>,
	openembedded-devel@lists.openembedded.org
References: <1519774940-2279-1-git-send-email-carlos.rodriguez@ridgerun.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2ed06f0c-d590-60ba-a629-b0bd8775d9b2@gmail.com>
Date: Tue, 27 Feb 2018 21:42:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519774940-2279-1-git-send-email-carlos.rodriguez@ridgerun.com>
Subject: Re: [meta-oe][PATCH v2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 28 Feb 2018 05:42:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 02/27/2018 03:42 PM, Carlos Rodriguez wrote:
> GstShark is an open-source project from RidgeRun that provides
> benchmarks and profiling tools for GStreamer 1.7.1 (and above).
> It includes tracers for generating debug information plus some
> tools to analyze the debug information. GstShark provides easy
> to use and useful tracers, paired with analysis tools to enable
> straightforward optimizations.
>
> Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> ---
>  .../gstreamer-1.0/gst-shark_0.2.1.bb               | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
> new file mode 100644
> index 0000000..981bbe8
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
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
> +
> +SRCBRANCH ?= "master"
> +
> +SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
> +SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
> +
> +SRC_URI = " \
> +    git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
> +    git://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
> +    "
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS = " \
> +	--disable-graphviz \
> +	--enable-gtk-doc=no \
> +"
> +
> +FILES_${PN} += "\
> +	${libdir}/gstreamer-1.0/libgstsharktracers.so  \
> +	${libdir}/gstreamer-1.0/libgstsharktracers.la \
> +"
> +
> +inherit autotools gettext 
> +
> +do_configure() {
> +${S}/autogen.sh --noconfigure
> +oe_runconf
Please use proper intention.

- armin
> +}


