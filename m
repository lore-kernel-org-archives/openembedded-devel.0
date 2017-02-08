Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADF660620
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 06:30:16 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id n125so4020380vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 22:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=N59pRHJcP0FVpb/wyyi1ZLS9DYGfx83c+KEIe4G895o=;
	b=mV9aPjmBS8+AoVE6gs5crvY0e8zIYmZaboSsWnBXhSseY4TxTJY5HC+zr7JN1OMqiS
	xYDokPnAZ60yoeLc0U0rtUGpil7NKi93ZEKTCt6FbIp02Dkd6wAVBSuE2qjSfCwrnX+z
	15DHceSm3QRstjOJ8ElviHwbCxqRUFFvjcYDQAfpepbDsQC2wL9rQVxr0KqFz6cxaPhA
	jXMEVSDPJDqRX/hyU1jobsDOeo+mka97zsJ7eFyyYLnvNUP/RMUrdO7uePF6uCVHpU8f
	VpvxtBZEG+xXFYInxACjLhqSCbgrGp4NJj29QK/eHZ3zEqSJpmOJOxAUYVz1FyTzpOHi
	xwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=N59pRHJcP0FVpb/wyyi1ZLS9DYGfx83c+KEIe4G895o=;
	b=fi7KkmJj8259nYg0FGwOBV+9LS1V835KwKnAXpyaY1MW/SQipYTJSw01i/xMQOfgBP
	m1+oKZjktPA+ko15QTWb8pmQsX+ipwJOA0VxRgBylOcWe5MrYn0nHdeU4hO9Fxi37Dfa
	ti1VLtCnobNgNRccSlb8yThp1Enoz1Kqai/yjxuPUI+xkI8Uj4i7sjvJcsHBP/lEKO2r
	P5Hi185bAtutA7/kpQQRE6IbDtRjQleEATeEXV6XZ+AkOTiRzxnhSdrHITcfUfDOo+Q2
	kOLG2fz1Y42v59Qh/iKhD7I9NiQp/xTF0xH6NUE3kDYAfjm7yC9MsBS3WAFcxexEIuIj
	nuSA==
X-Gm-Message-State: AMke39kIZHpOFTlf2HpV05R2koHuum5eXN5jN24GZKh1BCi6HBfhow0szVIqAtxbzu6WKSTnFxcWJyVx9FA2qA==
X-Received: by 10.31.28.193 with SMTP id c184mr8940797vkc.173.1486535417114;
	Tue, 07 Feb 2017 22:30:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Tue, 7 Feb 2017 22:29:46 -0800 (PST)
In-Reply-To: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
References: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2017 22:29:46 -0800
Message-ID: <CAMKF1soMAwn1rkQmEoduLS7GFZtFviwepgTaa73-kWee0OhUzA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Wed, 08 Feb 2017 06:30:17 -0000
Content-Type: text/plain; charset=UTF-8

There are some shortcomings in this recipe

Please merge the changes from

https://github.com/kraj/meta-openembedded/blob/kraj/master/meta-oe/recipes-extended/libev/libev_4.24.bb

On Tue, Feb 7, 2017 at 11:32 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta-oe/recipes-connectivity/libev/libev_4.24.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb
>
> diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> new file mode 100644
> index 000000000..40f7dc710
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "A full-featured and high-performance event loop that is loosely \
> +modelled after libevent."
> +HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
> +
> +SRC_URI = "http://dist.schmorp.de/${PN}/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
> +SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

