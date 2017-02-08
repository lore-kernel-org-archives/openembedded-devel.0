Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 342A871999
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 18:53:46 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id n125so5436654vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 10:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tbmFMmAe0hMFK0Irfswk35OaxWrPrXLPR4CQE+RKJ0Y=;
	b=e/rRq8/u4/1O1XYGHDwtii098W6sTF9qR3h9jr6DHVFzWYdgq8d/cyF0qeROaB3kEp
	6XVzWs8eh1ul9imPJlfFIzOYJKSEDimoVV38NCDl9GRkQVjPSUNwf5th7NIeE/+RAYdS
	mgHaYEGvfqBBNB6rydjeIMTp5LOOxdwV9Rfj/mr3+Uh1Z9tyID4B6rTW3JuMmTfDAAdF
	GFUR6nzMxcrQOzETD3HLqfbNcQp91mg+ytLEcmAGqQUxDpbB+eq1OQ7ufl2YE2vSWLog
	Y6PCNZKXqK4wqTuqhIIsn+ZB+CK2mHoc7MfqgCI8yd/ytePl5zDlD254kDqs0ChgBNfT
	b7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tbmFMmAe0hMFK0Irfswk35OaxWrPrXLPR4CQE+RKJ0Y=;
	b=ARZAWdhIKo5h3eofu1BoilqQYmjkjRCNH+yvh85JeAUOCTb/gytHwD1xOP+GLjLiBY
	dDtfBJ28GEVfUdg5rKyqlxrDZmXpJB1afn7zr3Y05/taPmtk9TewXxKGMGKKfxKEA34o
	VvBQAa+75IFBIMjghTHydqKIQGV4S66HzYRe62m+CBWM2O4dQXrJ2vwGCTFl8GFXDxvs
	KvLwMQt5Z9RFIZcOxkrwQgrhWunmJr4sLFCF33/EKPkM03nD27YRZ/u0xDCyz68F5PWq
	JolRpvwoHtW9hdlkeh1ITM0P9SN0kix8Pn/v0IC3fkzAIB5LnXCemim/UVTEDkzFqLU8
	x9Yw==
X-Gm-Message-State: AMke39k0/KKZenLUVExEbhR3bg9ihhza7YAdkao4O7PSBK5ISLYrs/LLDz0mTbL+DdZGyx/zsNDf1d36Y+gjnA==
X-Received: by 10.31.28.193 with SMTP id c184mr10418656vkc.173.1486580026905; 
	Wed, 08 Feb 2017 10:53:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 8 Feb 2017 10:53:16 -0800 (PST)
In-Reply-To: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
References: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2017 10:53:16 -0800
Message-ID: <CAMKF1sr8UGiK8OHaPfw1ArJoRNBV3Qsy8NxoVuB5V4Xv6=8ouA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Wed, 08 Feb 2017 18:53:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 10:13 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta-oe/recipes-connectivity/libev/libev_4.24.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb
>
> diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> new file mode 100644
> index 000000000..f236eacab
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "A full-featured and high-performance event loop that is loosely \
> +modelled after libevent."
> +HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
> +LICENSE = "BSD-2-Clause | GPL-2.0+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
> +
> +SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
> +SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF += "--with-pic"

this looks good. I also have an after thought where libevent will
conflict with libev when it comes to who provides event.h file. So we
need to note that conflict down as well. May be a follow up. It wont
show up as much when we have rss now however SDKs and dev images will
show this up where we will unify the rootfs.

