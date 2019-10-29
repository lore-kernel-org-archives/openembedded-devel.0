Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6537FA45
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:15:12 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id e66so333239qkf.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1jjk4jJrfKk7tN5l+rZEF31VUMZTIB5GvdPa05B5zC8=;
	b=ZkV+QMvMbHcsTovcZFhRQuujJb69RFz3XtAfIWRJi+5kW13/HE7PfdiiL767yjDHFK
	7EV/PMi29I/Jc2rOBJoRP48C93RXRHeqexvIxOt12+y3wSKxjLRkpDLz053WjAG3rU7x
	RLUst8rEvziXUHIwnLdwdSjCPaeUbre1Q6LFyV63DGjQXWdWmT0wNjZ/6Vdh9fHZU8ty
	SZeD/3SoEhAYTXE9Fjl0luZNx70wPWui/sy65FL34NekxqUWtEkiqSnVZHEEMvjuBZdJ
	S9CzIi3jQ7Vsa0K3IUkIDIJZLOMGkNFqQywFb9r3edhGcRNuTrYTVbMYr1Z7saVuZZS8
	eIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1jjk4jJrfKk7tN5l+rZEF31VUMZTIB5GvdPa05B5zC8=;
	b=D5xyj2VJwjD69cGPxznxJJQN3Dwvl3w/3sBM/uH0cdz0ceUa+13qr/rP7FRMKzHVc3
	rVfM+G7Nq1RNyb7oWZLc1lfq22+LkQd5boVopIesdjIE76FLVmmrcmYZwCrnJ3t8Zavn
	xbyHwwCVwBzqRvsCEExgsIN7c/PuZ4JQn/sVr56EChLEJdorWULb1cS7xmrYRf2CMgB1
	BtlakKuEl4ThsrkU9i8QTr4Ld5Ak3IehsCSmUAWKVaHjyChy8HQwAYCrrsZBLeG6YlPM
	9ccEBl4CiMD8p2vMGdFfO1h+n/IDOz11XvvOwDiOjNcmOVZcRMc7c1e7W+559FHjkhz9
	vSwA==
X-Gm-Message-State: APjAAAV9pHAs20+qxiVX+bpkaTp2w+G4pNiQ414iVMoHsEyYjjVftET2
	Bnwqvdk2f6QbTxN53+Uy4abV4J57xdyOfqczp9I=
X-Google-Smtp-Source: APXvYqwkgeeqLClqNIE4DTqwYiqZaIpuU0QCvDyy4uprIRF0OQgeWB7jpPAd03zK8fODrKcGb48Mj1a0C6SBji0Aopc=
X-Received: by 2002:ae9:f010:: with SMTP id l16mr8374455qkg.212.1572383712727; 
	Tue, 29 Oct 2019 14:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <1572373502-15453-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572373502-15453-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 22:14:46 +0100
Message-ID: <CAMKF1so-N5ajdntKxSCgq+BVE2SA3U21+QmPovvD1xhqw7a=7A@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] dhcpcd: upgrade 8.0.2 -> 8.1.1
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
X-List-Received-Date: Tue, 29 Oct 2019 21:15:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 29, 2019 at 11:30 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> 1) Add 0001-dhcpcd-Fix-build-error-with-musl.patch to fix musl build error.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb}    |  9 ++++--
>  .../0001-dhcpcd-Fix-build-error-with-musl.patch    | 33 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb} (79%)
>  create mode 100644 meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch
>
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
> similarity index 79%
> rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
> rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
> index 79d1dad..55ee452 100644
> --- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
> @@ -11,8 +11,13 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
>
>  SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
>             file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
> -SRC_URI[md5sum] = "c0375a1f725f1c191b43af60e4f7175b"
> -SRC_URI[sha256sum] = "33a26ad561546cd2cfe1e6de6352a85df72b41c37def8c7eb00e90e57c627a5c"
> +
> +SRC_URI_append_libc-musl = " \
> +    file://0001-dhcpcd-Fix-build-error-with-musl.patch \
> +"

we can avoid this. see below

> +
> +SRC_URI[md5sum] = "dc4f29a62afc53cdac311e925cfd1bc7"
> +SRC_URI[sha256sum] = "485d308fe10febd36b6f936e4260e4ab34a146e4f00a9f7a5509c4377ad5ea82"
>
>  inherit pkgconfig autotools-brokensep
>
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch b/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch
> new file mode 100644
> index 0000000..daca881
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch
> @@ -0,0 +1,33 @@
> +Subject: [PATCH] dhcpcd: Fix build error with musl.
> +
> +Error as follows:
> +In file included from if-linux.c:49:
> +path/usr/include/netinet/if_ether.h:112:8: error: redefinition of 'struct ethhdr'
> +
> +When build with musl, define _NETINET_IF_ETHER_H and include <net/if_arp.h>.
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + src/if-linux.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/if-linux.c b/src/if-linux.c
> +index fd47278..35c5dba 100644
> +--- a/src/if-linux.c
> ++++ b/src/if-linux.c
> +@@ -46,6 +46,12 @@
> +
> + #include <arpa/inet.h>
> + #include <net/if.h>
> ++
> ++#if !(__UCLIBC__ || __GLIBC__)
> ++#define _NETINET_IF_ETHER_H
> ++#include <net/if_arp.h>
> ++#endif
> ++
> + #include <netinet/if_ether.h>
> + #include <netinet/in_systm.h>
> + #include <netinet/in.h>

If we re-organize the header includes like this patch
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch

the above patch could be applied always and potentially upstreamed.

> +--
> +2.7.4
> +
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

