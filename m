Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.33296.1622390483380322594
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 09:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vLBXybxE;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id mq2-20020a17090b3802b0290162428291f5so2094257pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=/zv5Sc3hGQOHHL6i1mjNvM+p1d77f07RA2fmKsbvDKg=;
        b=vLBXybxELX4Hm82595IQIV4pBkPAxt5D6EtfdBwKOs8SCZYEBatTYaRlCycl6xT6eG
         Nq1DTfgGttR32LtyuXtDAS+NLJtNhAp6fP7VMYhFctwGGR8XQjPLlMAc79UsertvXphi
         60IMBQRSG9LPAkWHF21bUCNdxWSoi+uT4XiM7mgsG3vwzNa04SEqeRsyXy8XVTH1aC7n
         ivkYv3BfPlLLODnxiHPOIqVneeY2QttwNCy5rA0rlJn2CcrY/Om4EwIm6f/S7GplZ3j9
         YkcK79Wm1mSqaVKN7IoXfaS7bnbz+TvDxhRUbIFns4iKJdUFNSvVu0poXUe6zJA6VJr8
         Z42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/zv5Sc3hGQOHHL6i1mjNvM+p1d77f07RA2fmKsbvDKg=;
        b=lsjIU1Mcruj7mToDZh0EKISaQ7FoRVw85uMsBGbkwsuWbOxcY+s8oSlTrP71atQzmn
         iIZ6/hitswjGZ1a66YHcPyXiBsZEmNe/3Y16w4Oz2vLc5/daBwZtjvPQ+B5Qtg3pb4nr
         G0BEI0PB/oJTMSCUhPQBJ64eDPH7WuCXE9T80nntvSZyZdr7aAlc3RHbZPIEa1tN7eEs
         9urmv30VMp1iwRTz8yYFJxXezU3ZVD5uaWgtXBTBxq0RAhAaGX6CaYWPmi5g6gkdWEo3
         T5NVWnhpWKoOH+12dT5kj2opYZPHH+yMB3+/mwfxDa8nt6MbDMDqKMTaQHaXe0/5lA3x
         WTJg==
X-Gm-Message-State: AOAM530OBHLdlvGObbQ+Bnv9Wz+BhYGbt+R9re0YLUXhVHPz+VSw7ye9
	MF//UFg/2Ck8tBINBjhbXOz1spj/WBtNuw==
X-Google-Smtp-Source: ABdhPJxUo36P5YNtJQ3CNpgA7mOyuMEQELVG4+fiHZ/NB6vyP8jQSXTOL/asjFY81qP2ES5j7yRNvA==
X-Received: by 2002:a17:902:bf48:b029:fe:dc5f:564 with SMTP id u8-20020a170902bf48b02900fedc5f0564mr16013572pls.71.1622390482568;
        Sun, 30 May 2021 09:01:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:417e:d6cd:22c6:4534? ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id p15sm8905341pjb.8.2021.05.30.09.01.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 09:01:22 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-scapy: move from meta-security
To: openembedded-devel@lists.openembedded.org
References: <1683E2B4B7FA01EB.21857@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <810970b9-0525-c354-e1c9-378131adfc9e@gmail.com>
Date: Sun, 30 May 2021 09:01:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1683E2B4B7FA01EB.21857@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/30/21 8:45 AM, Armin Kuster via lists.openembedded.org wrote:
> Update to the official 2.4.5 pkg
> The original package has not been updated in years.
> Include ptest

Ignore this. It has a dependency on meta-networking (tcpdump).

maybe this belongs in that layer??

-armin
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../python/python3-scapy/run-ptest            |  4 ++
>  .../python/python3-scapy_0.26.bb              | 13 ------
>  .../python/python3-scapy_2.4.5.bb             | 41 +++++++++++++++++++
>  3 files changed, 45 insertions(+), 13 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-scapy/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/python3-scapy_0.26.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-scapy/run-ptest b/meta-python/recipes-devtools/python/python3-scapy/run-ptest
> new file mode 100644
> index 000000000..797d8ecf7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-scapy/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +UTscapy3 -t regression.uts -f text -l -C \
> +    -o @PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log \
> +    2>&1 | sed -e 's/^passed None/PASS:/' -e 's/^failed None/FAIL:/'
> diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> deleted file mode 100644
> index 31c88942d..000000000
> --- a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "Packet crafting/sending/sniffing, PCAP processing tool,\
> -based on scapy with python3 compatibility"
> -SECTION = "devel/python"
> -HOMEPAGE = "https://github.com/phaethon/scapy"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef"
> -
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE = "scapy-python3"
> -
> -SRC_URI[md5sum] = "513469447735a4a416d495f63e28aa4b"
> -SRC_URI[sha256sum] = "81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb"
> diff --git a/meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb b/meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb
> new file mode 100644
> index 000000000..b1b9bcbd6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-scapy_2.4.5.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "Network scanning and manipulation tool"
> +DESCRIPTION = "Scapy is a powerful interactive packet manipulation program. \
> +It is able to forge or decode packets of a wide number of protocols, send them \
> +on the wire, capture them, match requests and replies, and much more. It can \
> +easily handle most classical tasks like scanning, tracerouting, probing, unit tests, \
> +attacks or network discovery (it can replace hping, 85% of nmap, arpspoof, arp-sk, \
> +arping, tcpdump, tethereal, p0f, etc.). It also performs very well at a lot of other \
> +specific tasks that most other tools can't handle, like sending invalid frames, \
> +injecting your own 802.11 frames, combining technics (VLAN hopping+ARP cache poisoning, \
> +VOIP decoding on WEP encrypted channel, ...), etc."
> +SECTION = "security"
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +# If you want ptest support, use the git repo
> +# UTscapy does not exist in the pypi pkg
> +#
> +SRCREV = "32cd7eb0f620d9adf171c48d55514e8326a538d7"
> +SRC_URI = "git://github.com/secdev/scapy.git \
> +           file://run-ptest"
> +
> +S = "${WORKDIR}/git"
> +
> +UPSTREAM_CHECK_COMMITS = "1"
> +
> +inherit setuptools3 ptest
> +
> +do_install_append() {
> +        mv ${D}${bindir}/scapy ${D}${bindir}/scapy3
> +        mv ${D}${bindir}/UTscapy ${D}${bindir}/UTscapy3
> +}
> +
> +do_install_ptest() {
> +    install -m 0644 ${S}/test/regression.uts ${D}${PTEST_PATH}
> +    sed -i 's,@PTEST_PATH@,${PTEST_PATH},' ${D}${PTEST_PATH}/run-ptest
> +}
> +
> +RDEPENDS_${PN} = "tcpdump ${PYTHON_PN}-compression ${PYTHON_PN}-cryptography ${PYTHON_PN}-netclient  \
> +                  ${PYTHON_PN}-netserver ${PYTHON_PN}-pydoc ${PYTHON_PN}-pkgutil ${PYTHON_PN}-shell \
> +                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers ${PYTHON_PN}-pycrypto"
>
> 
>

