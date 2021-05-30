Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.33924.1622393713686709615
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 09:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OOGdNeyY;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id e15so4032286plh.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O6Xe7oo+4Gj7j3OmrSulSO5C+wz/kSROtlogWQMb5so=;
        b=OOGdNeyYj+OUOGe8XTedBNn/h9avMekJtgFLiHH43MONqKmlxCyDofm/t7o+WQpyXU
         iZGQLBBpnuNR9FdRLOWleXRySfGW6YwibDHjTLqEvm3B+DnYczhtfeKfFAkE984L7LZO
         J5e+A9crW7RU3Yq8XRkNhp461APgb+kBLieTVZraWAs/6Gn85OBaIVcoLTITOU3M8xky
         5Fs3c3JeKGKNYgBTt4s7wy56+VxvdN9plYghZueEILYauaqwcfRhhtVNh9GSXuFJmgGY
         Zt/54X/fTF1ApTpojSzpOq0BCm5OgCheOsJgGD7rivK2fHL08yActCxjNGFbJJfdTNE5
         M2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=O6Xe7oo+4Gj7j3OmrSulSO5C+wz/kSROtlogWQMb5so=;
        b=bFDN3Al8u0zspFKNDtvXU0/NPWJhUtZcXM1ZB8Tq/SGgoKbk2qiUXdiAUqYqK0MsIy
         RZKlUsJJ6wTszZBVYFiC/8Xqkupe/N9/yWWfBUiC2RNKz6A0+IIMpOf/fYwaIdFcT1V+
         vpWmxBq2RK7Tlc+XbU63YfKTV70ipPk5mjfONENWlgu9G8c0mkv/SVSFN0N4QckfyRx+
         9o0pJ59VWwCWxY2LSm7WRvc3XHsyfpENKI2J4to17FlNvxTEVZPqfWmLEle5B2Y3moaN
         CKsPZmGYjL+n2jK2hXeOs1JDrvDpHFls0GqUHGJ8b6Frv38GeBFubvQo0r1/K8PpPNAz
         rSAQ==
X-Gm-Message-State: AOAM533eW3bwh357eNpHimzMOFwqH7oBaKxRs3dU1vUlemtoeVvI0vDs
	ZU71MFU3m+DALgQEL8ziqJPGnmdNkaLQaw==
X-Google-Smtp-Source: ABdhPJxCtrqHHUwZ7FQj8SDVJgv/kyZgHuehPVXlBo5civBJWSSSNrmFioKDrg/M/qZGHeac3snN1g==
X-Received: by 2002:a17:90a:28a6:: with SMTP id f35mr14939494pjd.1.1622393712642;
        Sun, 30 May 2021 09:55:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::6bc9? ([2601:646:9200:a0f0::6bc9])
        by smtp.gmail.com with ESMTPSA id l187sm1749764pge.92.2021.05.30.09.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 09:55:12 -0700 (PDT)
Subject: Re: [oe] [meta-networking][v2][PATCH] python3-scapy: move from meta-security
To: Armin Kuster <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210530164653.546453-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a774d379-b6e6-0f35-efa9-bb79f99d467d@gmail.com>
Date: Sun, 30 May 2021 09:55:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210530164653.546453-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

also send a a followup to add it to test packagegroup

On 5/30/21 9:46 AM, Armin Kuster wrote:
> This tracks the official scapy project.
> includes ptest
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../python/python3-scapy/run-ptest            |  4 ++
>   .../python/python3-scapy_2.4.5.bb             | 41 +++++++++++++++++++
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/run-ptest
>   create mode 100644 meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
> 
> diff --git a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
> new file mode 100644
> index 000000000..797d8ecf7
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +UTscapy3 -t regression.uts -f text -l -C \
> +    -o @PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log \
> +    2>&1 | sed -e 's/^passed None/PASS:/' -e 's/^failed None/FAIL:/'
> diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
> new file mode 100644
> index 000000000..01ca63746
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "Network scanning and manipulation tool"
> +DESCRIPTION = "Scapy is a powerful interactive packet manipulation program. \
> +It is able to forge or decode packets of a wide number of protocols, send \
> +them on the wire, capture them, match requests and replies, and much more. \
> +It can easily handle most classical tasks like scanning, tracerouting, probing, \
> +unit tests, attacks or network discovery (it can replace hping, 85% of nmap, \
> +arpspoof, arp-sk, arping, tcpdump, tethereal, p0f, etc.). It also performs very \
> +well at a lot of other specific tasks that most other tools can't handle, like \
> +sending invalid frames, injecting your own 802.11 frames, combining technics \
> +(VLAN hopping+ARP cache poisoning, VOIP decoding on WEP encrypted channel, ...), etc."
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
> 
> 
