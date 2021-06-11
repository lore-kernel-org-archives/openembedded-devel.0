Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.4194.1623385647818265686
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 21:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J5aRrXOi;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x10so2192410plg.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 21:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=R6PXwteKFRda2WUkxRGi5n2LlikSaFifG40adlQWNX8=;
        b=J5aRrXOikNn5ONnwuXwFEwdqdDPDHP/O4FY48gINQoquDzNjXaAf6DGzwu/OxK9NGc
         +zW2RybH6YeCtVnFIJ26yPqr+YtIac/ZphaX1WsNokY7kzUi3nCVqAZswu/tla174PMX
         KxT7trTePgcMig636+/0KcnwLoMs8hE2ZVjO4vXeKZddncCLVNsqAomFHRAqtK2H2Dpn
         y+3Gxsh2O54E8HpGzDCxwtBPIJfv8sro6DKqDd2U52LqFFNtQP3vpYjYbtUYBsMHcIlJ
         kHv2i78iwyoUzDwlLfaWx/xdFddGjebxXwPZXV77an8PmnvL6K/wYbNXOx6bmBCk7rpv
         pneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R6PXwteKFRda2WUkxRGi5n2LlikSaFifG40adlQWNX8=;
        b=FkX/+0KCgKzmYz5S5CROxbXpGA5fiY0jQo3r9M09j/gZnJcFQIbMPpzELcLljo7TcJ
         ugBk6K3aOPfAOYzNliZqWZm/4Ew/mMnlW++dcaz1bUS+HzbNa76ITqL8HQLyH2zEFaVG
         hhpGq27mneT8x8hpsWMbIqUYnvQHEBwKZTQMkDbJ5dNkcNBf6/eFfRIhTBjnwmMjUKpw
         2kyzg2bxoO1tvBGcNyCyABcVHx3UP1Yg9DIQabOszu1vigFEIjkj+cTPiZ0dIhTikRtI
         BpTNpr/pLE0LPFCd8kU/C0n2mT1lhp9oFoVDKxNnm5bk8luLFfS5+DZXCumKj8u3jUUn
         Gk8Q==
X-Gm-Message-State: AOAM532mZjBhp3c8xzHnvW7NZw/n/M9F2K+csjnY+IwwBPZe7I3fv/Xh
	JhQPFBV6Q85AW5O1YB2ApqU=
X-Google-Smtp-Source: ABdhPJzh9nYzoYf9k0Y8lpTFT+SOIC6d4SPM53H4uKyBhFRRwTGmCkS6RfO306R2LKFQome1Lgf4Ow==
X-Received: by 2002:a17:902:b482:b029:114:7531:a52e with SMTP id y2-20020a170902b482b02901147531a52emr2117345plr.70.1623385647099;
        Thu, 10 Jun 2021 21:27:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:dd6e:8cde:9267:da1? ([2601:202:4180:a5c0:dd6e:8cde:9267:da1])
        by smtp.gmail.com with ESMTPSA id b21sm1191124pgj.74.2021.06.10.21.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 21:27:26 -0700 (PDT)
Subject: Re: [oe] dunfell merge request June 2
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
References: <1684CA9392B80A90.9760@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <2bb803e7-baec-2d98-b62c-f6a0173d970a@gmail.com>
Date: Thu, 10 Jun 2021 21:27:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1684CA9392B80A90.9760@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/2/21 7:34 AM, Armin Kuster via lists.openembedded.org wrote:
> The following changes since commit 11eae114522a6befa06c7f4021a83bc016133543:
>
>   linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to c38d2a74f762a792046f3d3c377827b08aade513:

Let me know if there are any issues with this merge request. I may have
missed a response.

-armin
>
>   dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45
> -0700)
>
> ----------------------------------------------------------------
> Alexander Vickberg (1):
>       hostapd: fix building with CONFIG_TLS=internal
>
> Mikko Rapeli (1):
>       ebtables: use bitbake optimization levels
>
> Sana Kazi (1):
>       dnsmasq: Add fixes for CVEs reported for dnsmasq
>
> akash.hadke (1):
>       opencv: Add fix for CVE-2019-5063 and CVE-2019-5064
>
> wangmy (8):
>       exiv2: Fix CVE-2021-29457
>       exiv2: Fix CVE-2021-29458
>       exiv2: Fix CVE-2021-29463
>       exiv2: Fix CVE-2021-3482
>       exiv2: Fix CVE-2021-29464
>       exiv2: Fix CVE-2021-29470
>       exiv2: Fix CVE-2021-29473
>       libsdl: Fix CVE-2019-13616
>
>  .../ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch     |  19 +
>  meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb    |   1 +
>  meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         |   7 +-
>  .../recipes-support/dnsmasq/files/CVE-2020-25681.patch          | 370
> ++++++++++++++++++
>  .../recipes-support/dnsmasq/files/CVE-2020-25684.patch          |  98 +++++
>  .../recipes-support/dnsmasq/files/CVE-2020-25685-1.patch        | 587
> ++++++++++++++++++++++++++++
>  .../recipes-support/dnsmasq/files/CVE-2020-25685-2.patch        | 175
> +++++++++
>  .../recipes-support/dnsmasq/files/CVE-2020-25686-1.patch        | 332
> ++++++++++++++++
>  .../recipes-support/dnsmasq/files/CVE-2020-25686-2.patch        |  63 +++
>  .../hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch |  45 +++
>  meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb             |   1 +
>  .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch  |  27 ++
>  meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                |   1 +
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch        |  26 ++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch        |  37 ++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch        | 120
> ++++++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch        |  72 ++++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch        |  32 ++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch        |  21 +
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch         |  54 +++
>  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   |   9 +-
>  .../opencv/opencv/CVE-2019-5063_and_2019-5064.patch             |  78 ++++
>  meta-oe/recipes-support/opencv/opencv_4.1.0.bb                  |   1 +
>  23 files changed, 2174 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
>  create mode 100644
> meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
>  create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
>
>
> 
>

