Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52524C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 16:13:12 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.1697.1632845591647049670
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 09:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mPpCPOjv;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ce20-20020a17090aff1400b0019f13f6a749so1798177pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 09:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=2YE27qeGweeayRs8SaIPMBDAPiTfopgvuj/LAAjNc/c=;
        b=mPpCPOjv1fTDP6NSCaaxy+ErBjQt5YBfU/FPDu7woUh5lQt972V13WwWDFbdPMB2Lw
         dtny1IxjtgUJl5ejUckTAxZGVm8OLA0eqgmKMZSG0Q44mkWZ6PDDmLuk3x20JvYLhtIJ
         zbStNjwyk/XmJ8Qfu2SAUdxqRwCGsV0QK2qZ/GBE3rK8W2rXH6Nv6Ht791uHsTUeQ5Li
         HzPqgiA2AedZiRjbl9ihP6ELR++cKFRCDEp2rj5V2Vu7kTKwAuhSfdiKQUcd1t87PZIQ
         ush9MY+iGaueU0eh9+XMF6lq+kt+2Pv1NHJgTsm+CRTLAiswpJIUE0YgQRaAM1OGU+c3
         V1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=2YE27qeGweeayRs8SaIPMBDAPiTfopgvuj/LAAjNc/c=;
        b=XG7/cEi3apDXEGvALA2/KrOAmUnlDU1AU91fYKNvOu2GR6x4t9pGwkpUFqB3JjUwh1
         D0DLYiBwK0cG0vpcK6VTAAgs28ILpiNGyVWOgOuCuoFIiKxcjwJuix6qALd1u3Hd40bU
         ndUYjj09D/wp/b15sWx2cEs3iFOGZlu3e58xdfbvFUbKP3cCQpuxJdDi/c3FcXnk74xP
         UstiCO4dx0kiHa+6RkQ8ooALHaqI7q1d296L5PJ0Q0z5qRw8gHJTtzQkYMsc+kErUlIt
         jwImQOad0CAKPqik+RfrjN+6eNMiccd2MXKikCPdnq/3IdFaJYvhwGY783I58d2cdd2J
         DG9Q==
X-Gm-Message-State: AOAM531RF7tZKrpwgBFtXDgRNQ3LgOOD2jx7H/lbZk954QNo8gvDZUMA
	+WRcDnmKfUSnaEHRJ1n6mBU=
X-Google-Smtp-Source: 
 ABdhPJwKWrReck3FuQexq2/Zmo1qQhXvwi/NTG0SL56KKQ2/4Cb9V4U+DLCTDb7Hh3b481lh74pxWA==
X-Received: by 2002:a17:90b:1096:: with SMTP id
 gj22mr771266pjb.124.1632845590906;
        Tue, 28 Sep 2021 09:13:10 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:95ea:bfde:13ac:7152?
 ([2601:646:9200:a0f0:95ea:bfde:13ac:7152])
        by smtp.gmail.com with ESMTPSA id
 h24sm21457773pfn.180.2021.09.28.09.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 09:13:10 -0700 (PDT)
Message-ID: <8aa1018b-df28-2a5e-a14e-18cd9749992d@gmail.com>
Date: Tue, 28 Sep 2021 09:13:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [oe][meta-oe][PATCH] chipsec: platform security assessment
 framework
Content-Language: en-US
To: LiweiSong <liwei.song@windriver.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210928092958.19196-1-liwei.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210928092958.19196-1-liwei.song@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Sep 2021 16:13:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93162



On 9/28/21 2:29 AM, LiweiSong wrote:
> Add chipsec, tools to dump or analyzing hardware, system firmware
> components, like PCH register, ioport or iomem configuration space.
> 
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>   meta-oe/recipes-bsp/chipsec/chipsec_git.bb | 35 ++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 meta-oe/recipes-bsp/chipsec/chipsec_git.bb
> 
> diff --git a/meta-oe/recipes-bsp/chipsec/chipsec_git.bb b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
> new file mode 100644
> index 000000000000..019a8f5f12b5
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "CHIPSEC: Platform Security Assessment Framework"
> +
> +DESCRIPTION = "CHIPSEC is a framework for analyzing the security \
> +               of PC platforms including hardware, system firmware \
> +               (BIOS/UEFI), and platform components."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bc2d1f9b427be5fb63f6af9da56f7c5d"
> +
> +SRC_URI = "git://github.com/chipsec/chipsec.git;branch=master \
> +          "
> +
> +SRCREV = "b2a61684826dc8b9f622a844a40efea579cd7e7d"
> +
> +COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
> +
> +S = "${WORKDIR}/git"
> +EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
> +
> +DEPENDS = "virtual/kernel nasm-native python3-setuptools-native"
> +RDEPENDS:${PN} += "python3 python3-modules"
> +
> +inherit module distutils3
> +
> +do_compile:append() {
> +	cd ${S}/drivers/linux
> +	oe_runmake  KSRC=${STAGING_KERNEL_BUILDDIR}
> +}
> +
> +do_install:append() {
> +	cp ${S}/drivers/linux/chipsec.ko ${D}${PYTHON_SITEPACKAGES_DIR}/chipsec/helper/linux

Please use install utility here, so we dont have to worry about mixing 
build user with target user perms etc.

> +}
> +
> +FILES:${PN} += "/usr \
> +"
> 

hardcoding user here seems suboptimal, can we represent it using some 
form of bitbake variables e.g. prefix or exec_prefix etc ?

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93161): https://lists.openembedded.org/g/openembedded-devel/message/93161
> Mute This Topic: https://lists.openembedded.org/mt/85920605/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

