Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.355.1626730881497147557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 14:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SZUhq2mM;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id i16-20020a17090acf90b02901736d9d2218so1183218pju.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jul 2021 14:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oiCDNcOA/Nq93RvO48sMYrw/2TlpcqZkAzAvNj6vcss=;
        b=SZUhq2mMhYjV8T0IWG4jPkwFP/wY1JeVUGz+WYBTFoeQ5QRKTAWZVp7QruFrxtINnR
         rrfq+aXmgC0WTItBiVtYmrqzS+8npLOHLTt8l2IcvO1pDoI720lkOsVDIvKDA0DD3JeM
         Jd6IxmlYA27VEBEiB7OPmdde0xujOkdzDHTZO3Wwn9nlUtsRd80fcdGdrZT8NLQU3Mcy
         Ox83HLIUY64lZs+W9kVunpM32eW4lJx4HCJIjuiN13/+FjNm9wd8pRYzPczPWCV7sDOt
         UFIKJE1/H+eCOBVPFtwU1g5D45NWaZFmVnv65nDEdQyc+nfUjmOQ+mXsQ2uQnYF2WR2q
         ddSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oiCDNcOA/Nq93RvO48sMYrw/2TlpcqZkAzAvNj6vcss=;
        b=JF5A+ooDiH1XjzF/rZhjLTVXeDH0aNSsm9cK5E/f8MoHtDN5ihYJRGnKufzYjGwCuz
         hrpA7KSpaxHWD4lKIZ3G+T34nrOv4u6JsBemr8CJfyfNqAisCs2L6Yrh18da4/pbsbGi
         rU8M4B8BTfILsWYtxFANnIp+bqUxQVa0hQ5VxtkDXWyiQag6WvGuiQYsjMIkmuPyJZ9w
         o0R0nv7Ecdu9n08abdtZjOn5UfXlf6j+U9eWUKJounKe5+FU4S40DZizAwmYKeZC3ue0
         gXKNnMued+K9zHnig4/71UmxdEVbduWIOHV0RT/UPKtIav/K5wxJ1hwfZ4KEW3Y0Gbab
         jEoA==
X-Gm-Message-State: AOAM530rVPfnvpI7S7Ib0aCyO0tGiNE35pfNx8BiYZrA1oYHnM4TbsM4
	KWbts+O3syJesOi8cLGp9+7kippYIKuD4A==
X-Google-Smtp-Source: ABdhPJx5QkHmjHVVdgTI1ey+b5fQxEzErml4Ocp9C4i3nJtEXLWV9wGxXVdUfWSRW2NeKYpR08DrVw==
X-Received: by 2002:a17:90b:1195:: with SMTP id gk21mr10805707pjb.150.1626730880333;
        Mon, 19 Jul 2021 14:41:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:594e:bbc7:711:7e52? ([2601:646:9200:a0f0:594e:bbc7:711:7e52])
        by smtp.gmail.com with ESMTPSA id h8sm19935742pfi.47.2021.07.19.14.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 14:41:19 -0700 (PDT)
Subject: Re: Hardknott merge request -July 19th
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <a13e28fe-3433-7031-3dd0-35e1b95e9b7b@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <bba97ddd-cfda-5638-5500-7856bd94760a@gmail.com>
Date: Mon, 19 Jul 2021 14:41:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a13e28fe-3433-7031-3dd0-35e1b95e9b7b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/19/21 8:15 AM, akuster808 wrote:
> The following changes since commit c51e79dd854460c6f6949a187970d05362152e84:
> 
>    python3-django: upgrade 2.2.23 -> 2.2.24 (2021-06-27 07:50:20 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded hardknott-next
> 
> for you to fetch changes up to 6a7ba8f7f210e04183fb64ab181520d817a34a11:
> 
>    sysbench: fix memory test (2021-07-14 21:27:01 -0700)
> 
> ----------------------------------------------------------------
> Adrian Zaharia (1):
>        ntp: fix ntpdate to wait for subprocesses
> 
> Akifumi Chikazawa (1):
>        openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
> 
> Changqing Li (1):
>        nginx: fix CVE-2021-23017
> 
> Li Wang (1):
>        apache2: fix CVE-2020-13950 CVE-2020-35452 CVE-2021-26690
> CVE-2021-26691 CVE-2021-30641
> 
> Masaki Ambai (1):
>        nss: add CVE-2006-5201 to allowlist
> 
> Sam Van Den Berge (1):
>        libiio: fix installing libiio when python3 bindings are enabled
> 
> massimo toscanelli (1):
>        sysbench: fix memory test
> 
>   meta-networking/recipes-support/ntp/ntp/ntpdate                 |  5 +++
>   meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb        |  3 ++
>   ...1-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch | 40
> +++++++++++++++++
>   meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb           |  4 +-
>   ...1-python-Do-not-verify-whether-libiio-is-installed-whe.patch | 37
> ++++++++++++++++
>   meta-oe/recipes-support/libiio/libiio_git.bb                    |  4 +-
>   meta-oe/recipes-support/nss/nss_3.64.bb                         |  3 ++
>   .../recipes-httpd/apache2/apache2/CVE-2020-13950.patch          | 45
> ++++++++++++++++++++
>   .../recipes-httpd/apache2/apache2/CVE-2020-35452.patch          | 49
> +++++++++++++++++++++
>   .../recipes-httpd/apache2/apache2/CVE-2021-26690.patch          | 39
> +++++++++++++++++
>   .../recipes-httpd/apache2/apache2/CVE-2021-26691.patch          | 35
> +++++++++++++++
>   .../recipes-httpd/apache2/apache2/CVE-2021-30641.patch          | 66
> +++++++++++++++++++++++++++++
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb          |  5 +++
>   meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch   | 46
> ++++++++++++++++++++
>   meta-webserver/recipes-httpd/nginx/nginx.inc                    |  1 +
>   15 files changed, 380 insertions(+), 2 deletions(-)
>   create mode 100644
> meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
>   create mode 100644
> meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch
> 

merged thanks.
