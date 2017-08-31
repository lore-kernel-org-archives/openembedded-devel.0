Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E1F9B78418
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 21:50:39 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m15so551323pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 14:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=TemiBP/rFgkaU3Lq+kMhSJnjnkUVTGuVy5yf2eQ2/Ds=;
	b=n6NuozBP17Pc62BjMDeY32SuAY9/rqV3wptfohkj6MnOYC+uyTO+DL89dzsuqb88ir
	hqqJ23hjQDLOb7KHUUsz5Ua4XjSJnfwatAD86NnTKBBonl8LtjSh8xdtV0QKEFtmFSgl
	yTY8sfxHkUuHeEsSTL/HQ2bDwqx4Vq95ftGqF5dt70iYuIpSDpAL3BTzaIy9npmLw1+Y
	ul5r1nfDIZfGws44aXisuCrD++nA1QVAT5+vOXQ+yce8x74d9Tzq9uX0Udkx1Bg8kYlm
	MDifSUYha86Uk5PR1g1hFQULlyOh8tgacN73qHKjOjBclAJVqz/we1W3krmn467W7X5F
	xl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TemiBP/rFgkaU3Lq+kMhSJnjnkUVTGuVy5yf2eQ2/Ds=;
	b=uny6mcVn3/o67BFBpW4hnCMmGc8Leai7DwL0TooD6/8l04u0rHCMD+Kp/cAnuBVLzm
	7xCS5Tve3Tot3WDSee5MDZlxqDJRlurubhM4jevlDZQAxD5V/OzFDdjFwc5uCgfV9cn9
	WmGRNL1yx4IoN7MouZsExqt/MkqMrLDEhWv9a9ie9/jshJ64BIDSv0tQDjchovQjpy++
	4GXq2qFpPJVf+BL1EjbnmxBCaB1cjvKZT7jtDpQY00I+yr39TNDux/ZJLjC/hdY9wpr+
	llvWwaRjxpjeYTs67eBSpfCmCTvzKs4mU+k3bIRHCGuz4DDsHn6cqcqFyZImqasWAK+V
	bdqA==
X-Gm-Message-State: AHYfb5hckg2sm5n4Hgfm1Tye6HcB9ZHpgWJ0yARr8350RvPt/GzBoyTK
	ZdmYGGmt5+KS8VvB
X-Google-Smtp-Source: ADKCNb4+Q9/NQ/SqwdOLKpro3/qF6vVclo3Q45xw43YQ/+d6ScIPFeMfUn85TVImv4rhfbOHzhDcZA==
X-Received: by 10.99.96.10 with SMTP id u10mr2488136pgb.76.1504216240854;
	Thu, 31 Aug 2017 14:50:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d7b:f9dc:579b:aa63?
	([2601:202:4001:9ea0:d7b:f9dc:579b:aa63])
	by smtp.gmail.com with ESMTPSA id
	s76sm723287pfs.112.2017.08.31.14.50.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 14:50:40 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20170831020401.6367-1-raj.khem@gmail.com>
	<20170831020401.6367-4-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5f5ea77e-9fe1-9dfb-4ed1-0960afb42e58@gmail.com>
Date: Thu, 31 Aug 2017 14:50:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170831020401.6367-4-raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH 4/4] netkit-tftp: Fix build with musl
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
X-List-Received-Date: Thu, 31 Aug 2017 21:50:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/30/2017 07:04 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../0001-tftp-Include-missing-fcntl.h.patch        | 25 ++++++++++++++++++++++
>   .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb |  7 +++---
>   2 files changed, 29 insertions(+), 3 deletions(-)
>   create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
>
> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
> new file mode 100644
> index 000000000..c5dcdb423
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
> @@ -0,0 +1,25 @@
> +From fa57e161fc953264a75d50a787cb83983e60acc7 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 30 Aug 2017 18:30:02 -0700
> +Subject: [PATCH] tftp: Include missing fcntl.h
Did I miss the "Upstream-Status" ?
- armin
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tftp/main.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tftp/main.c b/tftp/main.c
> +index 8c54843..5c9b698 100644
> +--- a/tftp/main.c
> ++++ b/tftp/main.c
> +@@ -63,6 +63,7 @@ char main_rcsid[] =
> + #include <ctype.h>
> + #include <netdb.h>
> + #include <unistd.h>
> ++#include <fcntl.h>
> +
> + #include "tftpsubs.h"  /* for mysignal() */
> +
> +--
> +2.14.1
> +
> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> index 67a541d25..92c13e850 100644
> --- a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> @@ -6,9 +6,10 @@ DEPENDS = "tcp-wrappers"
>   LIC_FILES_CHKSUM = "file://tftp/tftp.c;beginline=2;endline=3;md5=84d2cfe1e60863a7d82648734ba4d30c"
>   
>   SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
> -    ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
> -    file://tftp.conf \
> -"
> +           ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
> +           file://tftp.conf \
> +           file://0001-tftp-Include-missing-fcntl.h.patch \
> +           "
>   
>   SRC_URI[archive.md5sum] = "b7262c798e2ff50e29c2ff50dfd8d6a8"
>   SRC_URI[archive.sha256sum] = "3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21cb9205fe55ad14d"


