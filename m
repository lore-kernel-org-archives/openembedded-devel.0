Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6DFFA78354
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 20:58:03 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id n4so16822493pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 13:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=5lEyHYdFqh+tlHOb4VFxJlHXu+0cxYwtCpl2lyq3k0I=;
	b=WGHw0M/R9LR8KGKyu784QRaxtHp/NtX4Arszz52B5zeNxe4mwaUYzQVKCsFJcbDELw
	f5HDdjsQ0WYzLutbM1CHkfw2V2Og1zhm55ZTWwRQJtuNOIWY1rfBaMoaKWzTYIb0/pMI
	bM2cipqNx43zBaWIb62zR6cZzpt4FgSkjG4X0DWkPBdeSQYqu/FOIkHAm5q7hCgwRjZW
	XYQIsiVV9HwIgcyfSrMXxDisZgsoVs6CPV41dcM7CFMHDYvTo93ovrIIUPZJhgKZ6++C
	52Dp1dN9wBtMg0ggDlAAAVuHI1FwNEKZARJboZ9l8DVunJT6NLwN62IKLGZBviEF3dqc
	rAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=5lEyHYdFqh+tlHOb4VFxJlHXu+0cxYwtCpl2lyq3k0I=;
	b=f69RGN4iwORP9SnziBxYE81AMnvzAsRUY5dc3zDlChBS0bRJp/G5KghzTpKNcKEAIj
	CnFSSmsqPZnDfv1YkfU35znsL32RyCTyOUnSCII0aCoZIltq9csgS6auQxdZATjLN0aN
	t6++iXIjOATu4oGc7mzANlZlHr4thJOknC87aXhtHpuKPu3K/cPWb54x6Ubl64XSwa5L
	GzaAmQMZIbBQS/N3++sQdcNGTdD0F45b4Vwb4P+ycF516rVXqgB0Tr63GCv4UoOhpatL
	SndCuzLXqn0ejOz5kmfJz9r3/VTOdU/Qy2/npzLWE4OJ8dWUEiD0WnRVaSRkaZ+9afZ1
	QwiQ==
X-Gm-Message-State: AHYfb5jtGF3oSpI/WR4E6LxiPN7nT0v+HgktBFusi3VN6TRuk7muRMes
	SoeVDKO7qqDASisFbNt3jlCWBpm9sg==
X-Received: by 10.98.30.7 with SMTP id e7mr12754312pfe.329.1503176285574; Sat,
	19 Aug 2017 13:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <1503048145-5907-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1503048145-5907-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Aug 2017 20:57:54 +0000
Message-ID: <CAMKF1srOrf+ZJP803bFzAHL_LYRX7yVZtmvvnCZLx9tEhOD9rQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] pcsc-lite: Update tp 1.8.22
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
X-List-Received-Date: Sat, 19 Aug 2017 20:58:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 18, 2017 at 2:22 AM Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade pcsc-lite from 1.8.13 to 1.8.22.
>
> 2) License information has changed in pcsc-lite-1.8.22/COPYING, so modify
> the LIC_FILES_CHKSUM.


You should state what changed specifically

>
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../pcsc-lite/{pcsc-lite_1.8.13.bb => pcsc-lite_1.8.22.bb}        | 8
> ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.13.bb =>
> pcsc-lite_1.8.22.bb} (82%)
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> similarity index 82%
> rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> index 0d2cb33..90d58b0 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> @@ -8,12 +8,12 @@ LICENSE_${PN}-dev = "BSD"
>  LICENSE_${PN}-dbg = "BSD & GPLv3+"
>  LICENSE_${PN}-spy = "GPLv3+"
>  LICENSE_${PN}-spy-dev = "GPLv3+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
>  DEPENDS = "udev"
>
> -SRC_URI = "
> https://alioth.debian.org/frs/download.php/file/4126/pcsc-lite-${PV}.tar.bz2
> "
> -SRC_URI[md5sum] = "4dcd22d20a6df8810fac5480cc320b6d"
> -SRC_URI[sha256sum] =
> "f315047e808d63a3262c4a040f77548af2e04d1fd707e0c2759369b926fbbc3b"
> +SRC_URI = "
> https://alioth.debian.org/frs/download.php/file/4225/pcsc-lite-${PV}.tar.bz2
> "
> +SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
> +SRC_URI[sha256sum] =
> "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
>
>
>  inherit autotools systemd pkgconfig
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

