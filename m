Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29FF46086F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 16:01:06 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id o202-v6so5165619vko.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2018 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7HgyO4VDV9WNxQk3x8zSCDsQ5L6FQWHyw3PO+JqmpmA=;
	b=Z7TCONeBE0iesUXYjDPjEd7vrCawS83AI0+2tHe6oPkhJFOCnGbeDiCtQMZOrBPWHf
	Wee22+iPJ1QOY/FBXDxKiUKX0aQVFTC7AH1t9RosNPdhGG4F49Pk9DD6+O33sF2tWdGP
	UxJQsfQ0z4jRxdZBWmSDjAFCBEh9vg8iOe+IJKGkX6Q1O9Lfq7AklQ3c0Qo4HNLFY0Wj
	trUi0ez6K6HSaEQ/3Qsv0qZqXjfopbH6eKR0hEtWlC4EihZbhcDgvr0DdKbUsTbiKol3
	46sGNVmvFdxrQZyVnbYsbIrIFzBghuY4f5yn0FrL9WwUiRvB8yoB1gW0ahnyjFut0lRe
	zFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7HgyO4VDV9WNxQk3x8zSCDsQ5L6FQWHyw3PO+JqmpmA=;
	b=DPQG1gwcdomswwaxdxruAZ9q6XqGH+6rHwFO4wZvFBMiAOVzDs8eKovsHlJWr++F79
	H+idMEPmT4mfqyaL1KVOmArkLief30qxWbh8eZcdJ2P8S+pH1Q7x6UQbRrDAAv4gxyX0
	ORTIcv1PZmYO1lEw1lm754MWCCBEfWeXXrKgiu88TOY9alapE7UPpopwP0q49Bxw+lcY
	elLgH/NSey7Ci0Ykq85GVfXOyl781DeuAAJ8jCQELJxA8W6S7r8c1h5fdkDMVpX1astQ
	MRXWu3h7+ofTOmvUJO322FheLa05exPnMFIRqb+kllqvxPn56PFXeRgcCfcnDLCt6J2r
	LAjQ==
X-Gm-Message-State: APt69E3prMGuarBFVrgXrYb9YPdkZPO3VVoH1/PWFik/BXJeIlwD2cI1
	u/nDo1wqUju9whqWO2bborcGEtcPim+fmE9LmnE=
X-Google-Smtp-Source: AAOMgpd0qW74LRj/w5Dxyha0PmbZwYqAz13JI0uc1sG8LcP4eEONwLu+1dUzC1lWCT11guPkARgIqGi3o8Uo/Vg807w=
X-Received: by 2002:a1f:7c4:: with SMTP id 187-v6mr3661781vkh.60.1530806467765;
	Thu, 05 Jul 2018 09:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20180705065408.103714-1-mingli.yu@windriver.com>
In-Reply-To: <20180705065408.103714-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2018 09:00:41 -0700
Message-ID: <CAMKF1spY_iwTDuGjzD7N6cNq+n6W9KhhYYd=vhJCg=uE=aNQyQ@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iozone3: Upgrade to 482
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
X-List-Received-Date: Thu, 05 Jul 2018 16:01:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 4, 2018 at 11:54 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Update LIC_FILES_CHKSUM as the file iozone.c
> used for LIC_FILES_CHKSUM updated
>

Please describe what has changed that is causing the checksums to
change.

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../iozone3/{iozone3_465.bb => iozone3_482.bb}              | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-benchmark/iozone3/{iozone3_465.bb => iozone3_482.bb} (95%)
>
> diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> similarity index 95%
> rename from meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
> rename to meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> index 191b93425..09306e044 100644
> --- a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
> +++ b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> @@ -4,14 +4,14 @@ AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.or
>  SECTION = "console/tests"
>  LICENSE = "iozone3"
>  LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
> -    file://iozone.c;beginline=260;endline=266;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
> +    file://iozone.c;beginline=260;endline=266;md5=0aa488fd139eac078be6eca86e1435e8 \
>  "
>  SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
>      file://parallelism.patch \
>      file://copyright.txt \
>  "
> -SRC_URI[md5sum] = "c924e5e46fb1cf8145f420e8e57eb954"
> -SRC_URI[sha256sum] = "2e3d72916e7d7340a7c505fc0c3d28553fcc5ff2daf41d811368e55bd4e6a293"
> +SRC_URI[md5sum] = "31ca1d3d28bc375c20a2808217cf212c"
> +SRC_URI[sha256sum] = "2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30"
>
>  UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

