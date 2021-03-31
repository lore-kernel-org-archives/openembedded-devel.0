Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.7175.1617199953434752242
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jIsAyHpv;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id x26so14697951pfn.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Mar 2021 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dYfGkL8y9rs3PyYPxW7WohqrtnP+0f+pGDDW/ezsaSk=;
        b=jIsAyHpvctpjjop3BnIiUSMmMMD43USmS4xBN81PCtrrTo10lcF5kBr+tJnivc79z+
         aKPfl0y9VwHTVZ0guz2KkJBf7fuDzDTw4CsExq1CTOdBe6jRPO+7tz+FKmlxm9uAUA2z
         C4QKyvdg3YfN4MxBsz5F6jtw9aqEnJAjPUfO7JIOB9TNR3KJ4nDtGeYU6q52ou1Mey9u
         RLgHpzN3PPnvWBSLssDNV6+CLImmm1i2s6krDmUb6dup5fnEZ43TNFr4v42nvXxppBCM
         Q8KKrpzGUkXl1JkLiEkgYKZi9YvID+mA++Qntc0Yt6AVX1WwYnSrOuRSaFB/eWn1CO/N
         KDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dYfGkL8y9rs3PyYPxW7WohqrtnP+0f+pGDDW/ezsaSk=;
        b=EE/pJgSeUKJUP95M4U7mgYLyRT2MNGjvD0V5fSxqKQ8lKOd9xf4OLHLuXOoNaZ4lv7
         OfNtJz9/pEqjBtRCLVz+d+I4h8BxFemE9osKV/0LUV18Xe0tiD/MSmYpCQd29UQ/chTB
         y71HRtlH/LU5kiTvb3iVccuXDoUPauo85ilSN/DeJVu4Jk8QRlQwENHMSoKTZ/wAEzcn
         Ml7O2keQUa0IKj/b2E6oajCu3rNrW9Iv9dCSFXMMJAcsU5cfv42D2FqUMwy2AejPZuuK
         aTlGUVXOsJsrmpi35X7CQvBfV1hJBKDiXJTfMQI6o+NoXI/qPowz1xKVay1yFK7Q5MWF
         YU5Q==
X-Gm-Message-State: AOAM531cfldCCEBAJtW+2s3GODoKgdQkVcmTp4bz+bgnRlVOVExyc+Um
	xdVBjBGgFgJThXADmQvlF8E=
X-Google-Smtp-Source: ABdhPJx71SjGBzV03c8MTvJLmg+L6brO70tO3f47RegR0VMzd9fvyXvzhAg85oArhATL8edAk2KdLw==
X-Received: by 2002:a05:6a00:1510:b029:221:cd7d:90d8 with SMTP id q16-20020a056a001510b0290221cd7d90d8mr3188051pfu.61.1617199952951;
        Wed, 31 Mar 2021 07:12:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7c4e? ([2601:646:9200:a0f0::7c4e])
        by smtp.gmail.com with ESMTPSA id 143sm2704495pfx.144.2021.03.31.07.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 07:12:32 -0700 (PDT)
Subject: Re: [poky][dunfell][PATCH] qemu: Add fix for CVE-2020-13791
To: "Rahul.Taya" <Rahul.Taya@kpit.com>,
 openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com, harpritkaur.bhandari@kpit.com
References: <20210331092906.18788-1-Rahul.Taya@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <652a11f7-f26a-7815-0327-49b967bd9207@gmail.com>
Date: Wed, 31 Mar 2021 07:12:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331092906.18788-1-Rahul.Taya@kpit.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

this is wrong ml for oe-core patches, they should go to oe-core mailing 
list.

On 3/31/21 2:29 AM, Rahul.Taya wrote:
> From: Rahul Taya <Rahul.Taya@kpit.com>
> 
> Added below patch to fix CVE-2020-13791.
> 
> CVE-2020-13791.patch
> 
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2020-13791.patch            | 52 +++++++++++++++++++
>   2 files changed, 53 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 5e8d3e09ff..01c78f6577 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -54,6 +54,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://CVE-2020-24352.patch \
>             file://CVE-2020-25723.patch \
>             file://CVE-2021-20203.patch \
> +          file://CVE-2020-13791.patch \
>             "
>   UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> 
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> new file mode 100644
> index 0000000000..6582abce59
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> @@ -0,0 +1,52 @@
> +From f7d6a635fa3b7797f9d072e280f065bf3cfcd24d Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Thu, 4 Jun 2020 17:05:25 +0530
> +Subject: [PATCH] pci: assert configuration access is within bounds
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +While accessing PCI configuration bytes, assert that
> +'address + len' is within PCI configuration space.
> +
> +Generally it is within bounds. This is more of a defensive
> +assert, in case a buggy device was to send 'address' which
> +may go out of bounds.
> +
> +Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Message-Id: <20200604113525.58898-1-ppandit@redhat.com>
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> +
> +CVE: CVE-2020-13791
> +Upstream-Status: Backport[https://github.com/qemu/qemu/commit/f7d6a635fa3b7797f9d072e280f065bf3cfcd24d.patch]
> +Comment: No hunks refreshed and no warnings were seen while applying patch.
> +Affected version: >=4.2.0 but patch already present in Master and Gatesgarth branches.
> +Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> +---
> + hw/pci/pci.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> +index 70c66965f56..7bf2ae6d92a 100644
> +--- a/hw/pci/pci.c
> ++++ b/hw/pci/pci.c
> +@@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
> + {
> +     uint32_t val = 0;
> +
> ++    assert(address + len <= pci_config_size(d));
> ++
> +     if (pci_is_express_downstream_port(d) &&
> +         ranges_overlap(address, len, d->exp.exp_cap + PCI_EXP_LNKSTA, 2)) {
> +         pcie_sync_bridge_lnk(d);
> +@@ -1394,6 +1396,8 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
> +     int i, was_irq_disabled = pci_irq_disabled(d);
> +     uint32_t val = val_in;
> +
> ++    assert(addr + l <= pci_config_size(d));
> ++
> +     for (i = 0; i < l; val >>= 8, ++i) {
> +         uint8_t wmask = d->wmask[addr + i];
> +         uint8_t w1cmask = d->w1cmask[addr + i];
> --
> 2.17.1
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
