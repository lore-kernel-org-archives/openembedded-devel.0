Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA49C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 15:41:25 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.14197.1700235682857979071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 07:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWrqpJ1+;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5c5b9c142e8so14724067b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 07:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700235682; x=1700840482; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qK8p2lMnzQI6nCJAzTQqmLkV1eoYHkdemvfwbz13dL8=;
        b=nWrqpJ1+3hrK5sdV69alxJW9YCLlkrf1rnNgOCXM151NgDx042/a0CP1oVfje4DCDK
         gmF94BRzuOZ8kCJuWmFEqSrus9nJsdL+KGsgY5MfLhVbBuJ+nA6m08jgXxvQbVzW9OiO
         7JB5oIUWDWpUp8PS4ZpCuE9XG4+CCwJ4ECZIv8BwyOp27XKS7bDSWmwepG3KmtUJkkpM
         yjV2SCTRURBO67bxwR+HRDpmHnPU65tBN+8Dh6aEYQ+U7E8fF7OAsmpEXyyNKEHwLXiF
         fF6Z2rzVbAO7G+JqFHYs26QdAU0+sAXx9lhXZog34yn8fGcdVHhSTPFazs5zy4AZ7J+J
         +yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700235682; x=1700840482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qK8p2lMnzQI6nCJAzTQqmLkV1eoYHkdemvfwbz13dL8=;
        b=WprPWexBw3gxHG+LdC2DjVQj6M0j9siIE01PxEDimsZEFX/8RW6iRtyFmIoRyJivrN
         t5waRJNECe0R47QEwVaZuvAcYnpnAC02eju+LvwJJvfQRKc400WDKwlY4RRsbJJWUKXQ
         UxH4X7GpdCIpriaXkMwDQj48xS5bjCxRGrVyBnluyHh83dgDCPKVomIFKklFIMQ0VMIt
         aTQah0l+n1oIF+p66GHIHHlhDNsnGwHTp+4uY3mLszNuy5nHyAUdkiW3Ms2VKKdUOpn3
         7giuGImxWFJVY8ve3teOEJAGxtkU+/xB2zuqh9LskD92lfwGE8ObwN1z7uDX5p3Mpik0
         RxSA==
X-Gm-Message-State: AOJu0Yz3HzWMtnxB5YW+Bpbm+ss14cSQln0+ExKH6F4zqO1CHp589sVY
	XjJNaSEvyHglpTUahdFDbuMuKsPpD6Q=
X-Google-Smtp-Source: AGHT+IHYQsIOfdN+PakKHS1QXcz9692/mdkSOqUN0jCaNy0srk7DhF2K6Pr/0um35K3IKO+y/T8R1g==
X-Received: by 2002:a81:498c:0:b0:5a8:dd5f:dbf with SMTP id w134-20020a81498c000000b005a8dd5f0dbfmr21389100ywa.34.1700235682016;
        Fri, 17 Nov 2023 07:41:22 -0800 (PST)
Received: from [10.52.31.114] ([209.198.250.118])
        by smtp.gmail.com with ESMTPSA id b1-20020a0dc001000000b0059f766f9750sm545710ywd.124.2023.11.17.07.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 07:41:21 -0800 (PST)
Message-ID: <54505227-7b8f-477f-82b5-35ec4ab15452@gmail.com>
Date: Fri, 17 Nov 2023 10:41:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [OE-core][kirkstone][PATCH] qemu 6.2.0: Fix CVE-2023-1544
Content-Language: en-US
To: nirpradh@cisco.com, openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
References: <20231117045955.2183952-1-nirpradh@cisco.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20231117045955.2183952-1-nirpradh@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106870

Wrong mailing list. Please try openembedded-core@lists.openembedded.org

br,
Armin

On 11/16/23 11:59 PM, Niranjan Pradhan via lists.openembedded.org wrote:
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
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2023-1544.patch             | 70 +++++++++++++++++++
>   2 files changed, 71 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 83bd5d7e67..c8e4e2e6f3 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -101,6 +101,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>   	   file://CVE-2023-3354.patch \
>   	   file://CVE-2023-3180.patch \
>   	   file://CVE-2021-3638.patch \
> +	   file://CVE-2023-1544.patch \
>              "
>   UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>   
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
> new file mode 100644
> index 0000000000..b4781e1c18
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
> @@ -0,0 +1,70 @@
> +From e7d6e37675e422cfab2fe8c6bd411d2097228760 Mon Sep 17 00:00:00 2001
> +From: Yuval Shaia <yuval.shaia.ml@gmail.com>
> +Date: Wed, 1 Mar 2023 16:29:26 +0200
> +Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest driver
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
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/85fc35afa93c]
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
> +@@ -91,19 +91,33 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
> +                          dma_addr_t dir_addr, uint32_t num_pages)
> + {
> +     uint64_t *dir, *tbl;
> +-    int rc = 0;
> ++    int max_pages, rc = 0;
> +
> +     if (!num_pages) {
> +         rdma_error_report("Ring pages count must be strictly positive");
> +         return -EINVAL;
> +     }
> +
> ++    /*
> ++     * Make sure we can satisfy the requested number of pages in a single
> ++     * TARGET_PAGE_SIZE sized page table (taking into account that first entry
> ++     * is reserved for ring-state)
> ++     */
> ++    max_pages = TARGET_PAGE_SIZE / sizeof(dma_addr_t) - 1;
> ++    if (num_pages > max_pages) {
> ++        rdma_error_report("Maximum pages on a single directory must not exceed %d\n",
> ++                          max_pages);
> ++        return -EINVAL;
> ++    }
> ++
> +     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
> +     if (!dir) {
> +         rdma_error_report("Failed to map to page directory (ring %s)", name);
> +         rc = -ENOMEM;
> +         goto out;
> +     }
> ++
> ++    /* We support only one page table for a ring */
> +     tbl = rdma_pci_dma_map(pci_dev, dir[0], TARGET_PAGE_SIZE);
> +     if (!tbl) {
> +         rdma_error_report("Failed to map to page table (ring %s)", name);
> +--
> +2.35.6
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106847): https://lists.openembedded.org/g/openembedded-devel/message/106847
> Mute This Topic: https://lists.openembedded.org/mt/102642225/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


