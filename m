Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33669C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:54:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.4699.1648079689225691330
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 22NNrkwB027920;
	Wed, 23 Mar 2022 18:53:46 -0500
Message-ID: <1f5ec823-589c-7021-7563-67835976723a@kernel.crashing.org>
Date: Wed, 23 Mar 2022 18:53:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [oe] [RFC][meta-python][PATCH] python3-kaleido: Add a lightweight
 graphics library
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>
References: <16DF2772F6FBFAE7.12991@lists.openembedded.org>
In-Reply-To: <16DF2772F6FBFAE7.12991@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 23:54:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96175

I've already been talking with Tim about this.  It's rough and I'd not promise 
that it's "perfect".  So it's definitely RFC quality right now.

If someone uses Kaleido and notices an issue let me know and I'll try to fix it, 
but Tim suggested that RDEPENDS on python3-misc is likely missing.

(The person I wrote this for should be testing it over the next few days, and 
I'll send an update if they find issues with it.)

--Mark

On 3/23/22 6:49 PM, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
> 
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>   .../python/python3-kaleido_0.2.1.bb           | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb b/meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb
> new file mode 100644
> index 0000000000..3b95f3cb18
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Cross-platform library for generating static images"
> +DESCRIPTION = "Kaleido is a cross-platform library for generating static images \
> +(e.g. png, svg, pdf, etc.) for web-based visualization libraries, with a particular \
> +focus on eliminating external dependencies."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=33ee0e1da4dbba9e5232bb1dcabfd47f"
> +
> +SRC_URI = "git://github.com/plotly/Kaleido.git;protocol=https"
> +SRCREV = "624c30ca29b3a120215264b3b2e9341bf1bb4247"
> +
> +inherit python3native setuptools3
> +
> +DEPENDS += "python3-wheel-native"
> +
> +DISTUTILS_SETUP_PATH = "${WORKDIR}/git/repos/kaleido/py"
> +S = "${WORKDIR}/git"
> +
> +DISTUTILS_BUILD_ARGS = "package"
> +
> +do_compile:prepend() {
> +        mkdir -p ${S}/repos/build/kaleido
> +
> +        cp ${S}/README.md ${S}/repos/kaleido/.
> +        cp ${S}/LICENSE.txt ${S}/repos/kaleido/.
> +
> +	python3 ${S}/repos/version/build_pep440_version.py
> +}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96174): https://lists.openembedded.org/g/openembedded-devel/message/96174
> Mute This Topic: https://lists.openembedded.org/mt/89988783/3616948
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

