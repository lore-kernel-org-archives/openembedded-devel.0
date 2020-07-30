Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.2173.1596086206382411119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 22:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lrxFOJJb;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id d1so13143145plr.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 22:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=qw+Mdl6rcqnFP+xzrVbdgVSX4mPaOrISAduCSjGSoJQ=;
        b=lrxFOJJbQd+ALykZ3BvVmGO8fyGzyMwix4B5ivWDQi0EFshPZ9IqE/kgdQhm/chj5l
         rzeuC8Qx8P9v7G1gPMDHYm0ITRGvPbZG8yiIwdylmXi2JTcPZuZVb41LG1vulnmPNxlJ
         IGlo8pk/Y2GfGMcFBLkEdfztZAUZc3XuDEsa+Io0MgEaFIddZDS5qGXrzzz4yPmdAdfl
         cwq76nGl05geTeLKei7zuijH0oX8YlHHt/GiOtabznxoNZIqTRf3Zoydo3B6dsurcD7b
         zIFMFP1DfLrSPSF055XEs+YaFgkMWCy+G4EliqBHvON2k7MUiOss2IAVr5JbMX6nZvyZ
         glPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qw+Mdl6rcqnFP+xzrVbdgVSX4mPaOrISAduCSjGSoJQ=;
        b=pZh+Sj+mxV5csVw2klI+sUNxPv8dF5l8vQGqdR/yJqauwVNREhWUmG7GLYCQHxlCzl
         u/lKfq195ILzdkt25Svhx7oAOkJVthQGe5AF/E87sGIXkK+DDd7MVGlduzCTp3DR2VW8
         nGc369WIJp3RFhDk/PyBvGsa2IHMXSoG+GERHCPjOSYuLcmllZDH7XbK9sF9xERy8Fme
         4wzcBCdefDkSSmxUObjvEuiSfh4HPltyDdvWXr0sQkRcJd7vl1A01bHdeHDEks80ZgsA
         9vOMRXRhSmR833MBHyCCUOc++MkzaA00LCWTlqClC7qMMFfS1V9hgoG+UNKX2CBUyYvH
         xeOw==
X-Gm-Message-State: AOAM53169fr+BETQ9ujXEmMuo8q2dveI4ubMVCXCJChtqVRW3+ijiu+w
	naCYizyDu+ajvnMGr1nOQX+mG1NPdbc=
X-Google-Smtp-Source: ABdhPJxG9Yj5UhUVMmGe2iCEGs/PTsrIgzZdEfnr+TH6XSQFUzp8a/r/OP0Hqo1iG9Tsu9wtXl8a4g==
X-Received: by 2002:a17:90b:3603:: with SMTP id ml3mr13303810pjb.207.1596086205589;
        Wed, 29 Jul 2020 22:16:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5ba:2655:68eb:112e? ([2601:646:9200:4e0:5ba:2655:68eb:112e])
        by smtp.gmail.com with ESMTPSA id mj6sm4000963pjb.15.2020.07.29.22.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 22:16:45 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-networking] firewalld: update to 0.8.3
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20200729122637.3357934-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <bc292bf8-529b-f14d-37bc-c22939a8db2d@gmail.com>
Date: Wed, 29 Jul 2020 22:16:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200729122637.3357934-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/29/20 5:26 AM, Oleksandr Kravchuk wrote:
> nft build dependency has been removed in @3f7419dcb50a5bdcf800512d2491.
> 

does this also mean we do not need nftables in rdeps ?

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../firewalld/{firewalld_0.7.5.bb => firewalld_0.8.3.bb}      | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>   rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.7.5.bb => firewalld_0.8.3.bb} (95%)
> 
> diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
> similarity index 95%
> rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb
> rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
> index fbf586f76..ddf5ff88e 100644
> --- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb
> +++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
> @@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
>              file://firewalld.init \
>   "
> -SRC_URI[md5sum] = "b1aeede85a72adcf4f79d98019811244"
> -SRC_URI[sha256sum] = "45a8a7dbc084ef56ce306154d3834922e7f1fc2bf11b6c821f579cad51313226"
> +SRC_URI[sha256sum] = "4ecb16d82c2825ccfb8f109e543c0492cf6ea8c43e2d0f59901bddcead037dc6"
>   
>   # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
>   DEPENDS = "intltool-native glib-2.0-native"
> @@ -29,7 +28,6 @@ PACKAGES += "${PN}-zsh-completion"
>   # /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
>   # the Red Hat-specific init script which we aren't using, so we disable that.
>   EXTRA_OECONF = "\
> -    --with-nft=${sbindir}/nft \
>       --without-ipset \
>       --with-iptables=${sbindir}/iptables \
>       --with-iptables-restore=${sbindir}/iptables-restore \
> 
> 
> 
> 
