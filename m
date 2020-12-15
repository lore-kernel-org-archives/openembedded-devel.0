Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.7395.1608013230705462427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 22:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MhJasemS;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id j1so10436217pld.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 22:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4ew2pDKkVKWbLXmK+g0VeNI9YDcC9sk9aOiBw0i0A8M=;
        b=MhJasemShJ4izmqwijtKrt3JvEl6OLWnIzH/qeAuxxv+P1Ja3tY3FJ3S5zdjQ1YG4H
         8xgx51XRU9ph5ra5JLsxljg7fCY/Na3hGrUPUXNaL/yapqobo77zVR+CXYr83LuF3cgW
         so86Mu6xt/LvdpsMu0BDP+P0ZVUN4zqloGQ5e81E14xsi6zcUZhFW8KMehVkUa+pMOwW
         TcAF2wFswUCLRA/iw38mujEtnKXQj0m18tTN0M6BA2Y9pa+JQHPZROIqJqFfXtJo8W+/
         foBkiJoZXIoyNwWMNyttUUzj5V5eVpkazrPNSqjgwOMCQrf8GSZT+fXSg6YpOnIFDY0x
         vmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4ew2pDKkVKWbLXmK+g0VeNI9YDcC9sk9aOiBw0i0A8M=;
        b=tzTSAubZuR72gmErk89wxzqm/bpXsooTdskmOioXitgP/dKmI2ulAbrtX7+n26++va
         3Mz9VbkT/LA5Gi3Df/cybeKxneozcvFRFncnvbMPUNrStY5q7al7wXNGumpx0wWakkBA
         WcZroXKtq8looRe6g1F/+Rt27zPXXY2mWwfEVME3+MKi/Wac/V1Jkyk9g1fh0GmQXVA6
         Dw00scKZyyBFSCHR3UuWZT9svBbnnR9kYchN8cek4CHoG3lpc48UBBomw+CddGXrzjOe
         NDjhBZltAVci5knMRt0gLITwPcLI2h05L68v1KbzYtqw9lBD/oBsNFi3674S4+06S+4j
         29QA==
X-Gm-Message-State: AOAM530YwbhXRC5JNdhjK41LHr2NEtQRR4d5saaXO81Zzf2S26K8xbXS
	sn6N2aG4fdtYCSUlB+wAW7Q4H0Bc1jQbsQ==
X-Google-Smtp-Source: ABdhPJw0fwMED4vHerNE2kceeQVsV6WriOYwNt0wnlGnMVFPBxYyRwGiDnNq8VPvaEBGojZUmHPoAg==
X-Received: by 2002:a17:902:b209:b029:d8:e7a4:bf10 with SMTP id t9-20020a170902b209b02900d8e7a4bf10mr26176658plr.77.1608013225076;
        Mon, 14 Dec 2020 22:20:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:d4b8:2f3a:109e:b8c6? ([2601:646:9200:4e0:d4b8:2f3a:109e:b8c6])
        by smtp.gmail.com with ESMTPSA id a21sm20184381pjq.37.2020.12.14.22.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 22:20:24 -0800 (PST)
Subject: Re: [oe] [PATCH v2] bitwise: add new recipe
To: Ramon Fried <rfried.dev@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20201215055226.1395-1-rfried.dev@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ded0788f-0501-f733-7d3f-267ceb9455f9@gmail.com>
Date: Mon, 14 Dec 2020 22:20:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215055226.1395-1-rfried.dev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 12/14/20 9:52 PM, Ramon Fried wrote:
> Bitwise is multi base interactive calculator supporting
> dynamic base conversion and bit manipulation.
> It's a handy tool for low level hackers, kernel developers and
> device drivers developers.
> 
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>   .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>   .../recipes-extended/bitwise/bitwise_0.41.bb  | 28 +++++++++++++++++++
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
> 
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 2c46d21b7..577f2e788 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -307,6 +307,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TU
>   RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
>   
>   RDEPENDS_packagegroup-meta-oe-extended ="\
> +     bitwise \
>       ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
>        brotli \
>        byacc \
> diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
> new file mode 100644
> index 000000000..2c4ffb1eb
> --- /dev/null
> +++ b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Bitwise terminal calculator"
> +DESCRIPTION = "Bitwise is multi base interactive calculator \
> +supporting dynamic base conversion and bit manipulation.\
> +It's a handy tool for low level hackers, \
> +kernel developers and device drivers developers."
> +
> +HOMEPAGE = "https://github.com/mellowcandle/bitwise"
> +SECTION = "console/utils"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> +
> +SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz"
> +SRC_URI[md5sum] = "62514cb4d26771eec56a54901299b09e"
> +SRC_URI[sha1sum] = "753662205db576f86de7ab89b303b6e411dcf04a"
> +SRC_URI[sha256sum] = "33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c"
> +SRC_URI[sha384sum] = "ff15c72b60e71b2029d316688350ec07119b1b56e3c911d9bf3f23e3939d9f86d43853b9e812ad7ae7a002a71a559fb2"
> +SRC_URI[sha512sum] = "fc4a612d73bd34a20a87181420ca46549815a86c2861ad918a6539e3bf15230af5e534724f368080a2de0874deac7052e58075683fd32bce1ee070b777d24a9b"

we only need SRC_URI[sha256sum] please delete rest of them.

> +
> +UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
> +
> +S = "${WORKDIR}/${BPN}-v${PV}"
> +
> +DEPENDS = "ncurses readline"
> +
> +CFLAGS_prepend = "-I${S}/inc "

I meant that you can avoid this by fixing the code with a patch like

https://gist.github.com/kraj/1e5f8fb76705159afa4bb78a5a8f0311

this patch can be upstreamed as well, if you want to take it forward 
feel free.

> +
> +inherit autotools
> 
> 
> 
> 
> 
