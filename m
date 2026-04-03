Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDC3E7E349
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:50:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7597.1775206241388612984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jq/RaWVF;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so16850235e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775206240; x=1775811040; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKYJjbN8ihPNRsdLlo0+ynhXQHF0dZMZ5+ueARpxj7A=;
        b=jq/RaWVFnf96Qg4j9NygPVGO46DWW8nNh30PwDmNitj4y7MfU0UeEUmVowU+QsGfN/
         zFmSR++fIupIky0s/gSw4hnQYhY1S4UjQ7lWiMXLY+U9+ZCrcvYz0+BSU5NDEopI/XRr
         RgfeU6fdknxy6I9EfS4JsUqP1K7IjowmmwPF7n90noifHFIVVT9gUzY1OLS97/H4UTxm
         DeoLRrAvTZik1GN48j16ZMrWgfnR3wt4ghYVyl/a7PQ+4qEL3bJRsKIs7tTxXaiNoDFf
         CWkNzLno1BR/RxbRLYRgPu7bUiZHKqnSD9AvGn3HpsoJ5CKs9QJrugmFVP/zGnqIwazN
         Yp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206240; x=1775811040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKYJjbN8ihPNRsdLlo0+ynhXQHF0dZMZ5+ueARpxj7A=;
        b=XEjiMWrkkX6AQ33UonG95h6oWmnXCDtwDYaBK79RP4rP0s9Vb2Qlu9lDkojC5YeNXl
         0roHd8RBQwfco8rKCK5Pg+b23ebMUmy4WSR7qT8UUc8vmeFV+uxbjTK0pvMyd8B85Mvz
         t/gMDt4XbDJEdyAjdgckXvWJDHHjD+SPRg0vQDF2HcVs+Or2uxCC2QYzkpACJd7BlNt+
         XWOmSmFiy5kr9BdUaEUgCTq5D9eNtLfW5AQT0UY/C6ZxAWPM3/hVR4ypCfmPCrhRZyim
         vNdtWDGmbtg1aPGD6gluPghpZ1DvTuT2ouKKAXc5n4rVod2QRAYTKEVqAjsRKWyvFZHJ
         Sk6A==
X-Forwarded-Encrypted: i=1; AJvYcCXaszYhywhTbo0nCQ4lgOscnLy3t2ayp8RqGCHuotFWmf7fQidEG+iJv4Ewt1rLvnL2pcJlUXXf4HLLp6RWRPWnIjE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxSAvnyrzXcUaQC+zqX/peGAFvzcK2T24hZ8n0dxn6F2EchFmCK
	0W4SKU4nku9HOGaXgof52IZLXR/ppkf63KC9yNUGoznv6zhhwbBhJQB1EyJ0dw==
X-Gm-Gg: ATEYQzxYHcqp4P7TdX0oYOq42v82Z3nOiKgfeIRepJw/v9DX3mRXBXLgQuV4/c4Aw/V
	/Rf59dNR3Xmq4+BF/jIOAt6mXxmUckJPK9+LxjSmli2a0dgYlbmRBAtgS5abVw1ABKDPga9UACO
	nE8PcgsI1DDZH8OIp5gu8guDb2PQBBOTPY0+mrtENOMk9c62NiUn8NjNw6pdjfcw7HlUgb1cTTR
	kysNePFdM1g1voA2rxS06J4zzRw5XX/HVu+bpp6w8oelZ2L9oRFprvgI+dSQ/N0BB7tPFrpeoCR
	V3feNuhnykqM84W7PilDl4AYnhd0zoxFWbRpNjhZZtWmjxFE0h9e6k4IG4BvWEpG0OopcuGmHmW
	jouMQtMl4HYtvBe2rRcDvw0P37C3FIVM+Zpy3CGAw8TGcmv4jl0nML4ZAVcVmaIovo2J6nJDbFi
	PNbQgmuppA5vBUcNluQ3vTp53XNfEGCt8=
X-Received: by 2002:a05:600c:6286:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-488996dfebamr32324055e9.7.1775206239611;
        Fri, 03 Apr 2026 01:50:39 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm20449535e9.6.2026.04.03.01.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:50:38 -0700 (PDT)
Message-ID: <95c162a8-3a87-4d61-ad23-9d2548cfdb84@gmail.com>
Date: Fri, 3 Apr 2026 10:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-stopit: Fixed the deprecated
 pkg_resources issue
To: haiqing.bai@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260403033841.2186031-1-haiqing.bai@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260403033841.2186031-1-haiqing.bai@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 08:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125980

On 4/3/26 05:38, haiqing.bai via lists.openembedded.org wrote:
> From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
> 
> pkg_resources is deprecated as an API. The pkg_resources package
> has been removed from setuptools, so the way of obtaining the
> version needs to be replaced with importlib.metadata module.
> 
> Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
> ---
>  ...01-Drop-the-deprecated-pkg_resources.patch | 38 +++++++++++++++++++
>  .../python/python3-stopit_1.1.2.bb            |  6 ++-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch
> 
> diff --git a/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch b/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch
> new file mode 100644
> index 0000000000..4252386384
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch
> @@ -0,0 +1,38 @@
> +From b72825c89724c2c3b4c9c60d90c9d4ad597eead0 Mon Sep 17 00:00:00 2001
> +From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
> +Date: Thu, 2 Apr 2026 08:40:26 +0000
> +Subject: [PATCH] Drop the deprecated pkg_resources
> +
> +pkg_resources is deprecated as an API. The pkg_resources package
> +is slated for removal, so the way of obtaining the version needs
> +to be updated.
> +
> +Upstream-Status: Inactive-Upstream [lastcommit: Jan/2024 lastrelease: Feb/2018]
> +
> +Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
> +---
> + src/stopit/__init__.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/stopit/__init__.py b/src/stopit/__init__.py
> +index 6ca0180..5ddfa4a 100644
> +--- a/src/stopit/__init__.py
> ++++ b/src/stopit/__init__.py
> +@@ -7,7 +7,7 @@ stopit
> + Public resources from ``stopit``
> + """
> + 
> +-import pkg_resources
> ++from importlib.metadata import version
> + 
> + from .utils import LOG, TimeoutException
> + from .threadstop import ThreadingTimeout, async_raise, threading_timeoutable
> +@@ -15,7 +15,7 @@ from .signalstop import SignalTimeout, signal_timeoutable
> + 
> + # PEP 396 style version marker
> + try:
> +-    __version__ = pkg_resources.get_distribution(__name__).version
> ++    __version__ = version(__name__)
> + except:
> +     LOG.warning("Could not get the package version from pkg_resources")
> +     __version__ = 'unknown'
> diff --git a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
> index a952722619..a83adffcd2 100644
> --- a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
> @@ -2,7 +2,6 @@ SUMMARY = "Raise asynchronous exceptions in other threads, control the timeout o
>  HOMEPAGE = "https://pypi.org/project/stopit/"
>  SECTION = "devel/python"
>  
> -SRC_URI += " file://LICENSE "
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=497c556f42b1355b64190da2f3d88f93"
>  
> @@ -10,6 +9,11 @@ SRC_URI[sha256sum] = "f7f39c583fd92027bd9d06127b259aee7a5b7945c1f1fa56263811e1e7
>  
>  inherit pypi setuptools3
>  
> +SRC_URI += "\
> +    file://LICENSE \
> +    file://0001-Drop-the-deprecated-pkg_resources.patch \
> +"
> +
>  RDEPENDS:${PN} += "\
>      python3-setuptools \
>      "


After this patch, does it still have a runtime dependency on setuptools?
I think maybe that was the only reason for pulling this in

