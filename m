Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4257FC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 05:17:21 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.5839.1700198233309199788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 21:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Coh6YTFZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1f573a9ee2fso852680fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700198232; x=1700803032; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIKZKUlK16h0XwX3qYWtWwMNWxFIu9vIFp6t3h9bpJ0=;
        b=Coh6YTFZcXnXsu1QTTzUfv7sgliKOs6vK45oaNzjif9n0zD3u4n+DBa85pyxWZoWg7
         VE4HBN6ZZ7U0fc7FkBam8dk1y7p5WY4MwuqQuZ5GP2Lk42WHchgfmjRZalS3rpXbY3hR
         VymnWKIkrWSzVzSAt0JKR5ChxSR73UdpTfTthWZf/NEtY5GrK1uY2pMdPW+g8i00uJ+U
         Yi+Pok0iVPS++ZRy5eCxYSJRZ34kV+Ihq1fY+y21itwPoR5feSHsu9I1aKiSysFxo7uC
         4G4wVhk/BoffGSZujErLMJquFXy7quftYZ+2XwpvRaXaRkj+UccWRXDav8aQVfu4+ZC+
         Rx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700198232; x=1700803032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIKZKUlK16h0XwX3qYWtWwMNWxFIu9vIFp6t3h9bpJ0=;
        b=GJAn8d6xbEzS/tFzEuD0jKE6CxYZReJoEMJ1VqRtnK70bicOa2ksO5VuKGgZBvkIub
         3GSnu/cuFS5M6RXDNJ56H2J+UB1DeBk0AcIzh95CtnNiNb/oG6ARFTrtC9uW5e3bahtX
         ZU+tQOYoYVwibGu78Py33ty/Hq2L7y0DXpqVVFUgNQ+Z4Jplhj9ar5kyosNV+eIU/QvZ
         JJU5cnLGfL1nObvV9aY3Wqx+DvPX1GLvh9m6cRPEBqELXUcupdeYnIf6UfhA02W1OUYf
         1iTeNmu1LTRkvBsdmMnq9ui+SQm3/UfiMt14akKvYkv7BYb3GxkTnVmQdgca+2lXdYGA
         ZhRQ==
X-Gm-Message-State: AOJu0YxMEPI1HV34G+mcQwFiZgnjCbwa1onoJuQiD2wy+gp89NySALZH
	OWcUiBMoRO0c6ZURB8MkZbdkoXSxUkflv17/Mdc=
X-Google-Smtp-Source: AGHT+IERfwW1i+kHIpRrcJX4S6hhKAXLLVY6HRWGpypbxi8dlHTc5t3jFC8Dx8093U8Dx7a2wp3rZ9583jOHsFLi/d0=
X-Received: by 2002:a05:6870:3b07:b0:1dc:c65e:ded2 with SMTP id
 gh7-20020a0568703b0700b001dcc65eded2mr22997606oab.12.1700198232317; Thu, 16
 Nov 2023 21:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20231117045349.2182445-1-nirpradh@cisco.com>
In-Reply-To: <20231117045349.2182445-1-nirpradh@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2023 21:16:46 -0800
Message-ID: <CAMKF1srT8gdpvj67M5HYiw43hZw+_SSUt-gsdWd4UYcOSXHh=Q@mail.gmail.com>
Subject: Re: [oe] [OE-core][mickledore][PATCH] qemu 7.2.0: Fix CVE-2023-1544
To: nirpradh@cisco.com
Cc: openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 05:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106848

this should be posted to openembedded-core mailing list.

On Thu, Nov 16, 2023 at 8:54=E2=80=AFPM Niranjan Pradhan via
lists.openembedded.org <nirpradh=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Upstream Repository: https://gitlab.com/qemu-project/qemu.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-1544
> Type: Security Fix
> CVE: CVE-2023-1544
> Score: 6.3
> Patch: https://gitlab.com/qemu-project/qemu/-/commit/85fc35afa93c
>
> Signed-off-by: Niranjan Pradhan <nirpradh@cisco.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2023-1544.patch             | 70 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 80b5d966e4..2488edd6e6 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -44,6 +44,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>            file://CVE-2023-3180.patch \
>            file://CVE-2023-42467.patch \
>            file://0001-target-i386-fix-avx2-instructions-vzeroall-and-vpe=
rm.patch \
> +          file://CVE-2023-1544.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2023-1544.patch
> new file mode 100644
> index 0000000000..b4781e1c18
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
> @@ -0,0 +1,70 @@
> +From e7d6e37675e422cfab2fe8c6bd411d2097228760 Mon Sep 17 00:00:00 2001
> +From: Yuval Shaia <yuval.shaia.ml@gmail.com>
> +Date: Wed, 1 Mar 2023 16:29:26 +0200
> +Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest dri=
ver
> +
> +Guest driver allocates and initialize page tables to be used as a ring
> +of descriptors for CQ and async events.
> +The page table that represents the ring, along with the number of pages
> +in the page table is passed to the device.
> +Currently our device supports only one page table for a ring.
> +
> +Let's make sure that the number of page table entries the driver
> +reports, do not exceeds the one page table size.
> +
> +CVE: CVE-2023-1544
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/85fc35afa93c]
> +
> +Reported-by: Soul Chen <soulchen8650@gmail.com>
> +Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> +Fixes: CVE-2023-1544
> +Message-ID: <20230301142926.18686-1-yuval.shaia.ml@gmail.com>
> +Signed-off-by: Thomas Huth <thuth@redhat.com>
> +(cherry picked from commit 85fc35afa93c7320d1641d344d0c5dfbe341d087)
> +Signed-off-by: Niranjan Pradhan <nirpradh@cisco.com>
> +---
> + hw/rdma/vmw/pvrdma_main.c | 16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> +index 4fc6712025..55b338046e 100644
> +--- a/hw/rdma/vmw/pvrdma_main.c
> ++++ b/hw/rdma/vmw/pvrdma_main.c
> +@@ -91,19 +91,33 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRin=
gState **ring_state,
> +                          dma_addr_t dir_addr, uint32_t num_pages)
> + {
> +     uint64_t *dir, *tbl;
> +-    int rc =3D 0;
> ++    int max_pages, rc =3D 0;
> +
> +     if (!num_pages) {
> +         rdma_error_report("Ring pages count must be strictly positive")=
;
> +         return -EINVAL;
> +     }
> +
> ++    /*
> ++     * Make sure we can satisfy the requested number of pages in a sing=
le
> ++     * TARGET_PAGE_SIZE sized page table (taking into account that firs=
t entry
> ++     * is reserved for ring-state)
> ++     */
> ++    max_pages =3D TARGET_PAGE_SIZE / sizeof(dma_addr_t) - 1;
> ++    if (num_pages > max_pages) {
> ++        rdma_error_report("Maximum pages on a single directory must not=
 exceed %d\n",
> ++                          max_pages);
> ++        return -EINVAL;
> ++    }
> ++
> +     dir =3D rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
> +     if (!dir) {
> +         rdma_error_report("Failed to map to page directory (ring %s)", =
name);
> +         rc =3D -ENOMEM;
> +         goto out;
> +     }
> ++
> ++    /* We support only one page table for a ring */
> +     tbl =3D rdma_pci_dma_map(pci_dev, dir[0], TARGET_PAGE_SIZE);
> +     if (!tbl) {
> +         rdma_error_report("Failed to map to page table (ring %s)", name=
);
> +--
> +2.35.6
> +
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106846): https://lists.openembedded.org/g/openembedde=
d-devel/message/106846
> Mute This Topic: https://lists.openembedded.org/mt/102642135/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

