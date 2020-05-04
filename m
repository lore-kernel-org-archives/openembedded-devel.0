Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.13592.1588619410126567919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 12:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vHypqMUc;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id d184so6016534pfd.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y4Gu85LyCZBZQ+ClZCk2wu3glhVAAk8UmHdorAOe/9g=;
        b=vHypqMUcjbDlAeEmeIbo6yy0LPhfwoCsKjCWkXCwBCOEcfhnAGGq8A4X+Ip6T4Cpvc
         N7R2ASUtSa4mTk5EoKcWW5+TlO6Uw/ZFGPlX54eEX6rdTF/VCqB14JW1KUT0onOMO9Vo
         BnKjMah2BpcR7DupB0yd+SUkx/CYHR+838m50LlWIQBhN1/dC5ZI7IOhsDkCyAmvk7Iz
         f1V1VuhhBHZJEuV8kEszIJWySo0/BIzyfonyajs0nIrZ7WfcaFfMwxNQtqvPD5ho8brD
         50pmsCLKV/EJhUDVrT0KxpMh43BN6lf9/x5u7jOflAGZtjXDYW2pKlK1mdT12PAai8Pf
         mjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y4Gu85LyCZBZQ+ClZCk2wu3glhVAAk8UmHdorAOe/9g=;
        b=Ztcrk2HtZAy5HiNAuD7egEnEChK6KD1sLzZHVf8hE6gmPok1ladiwXUW6TKwJ67New
         snXXpPrt1F5u0vGdKI0RCHo5nOUytienSjCD2ft667wyUZf7NM3qn/Iz9XDWkWMiz0KF
         yIpfyb65qkVqzjuHJbrs+ozNvIA4saPABXDikyMuMFDQTgyRdaeRLacxAuLniKqNBQJN
         Qg5FKFK+fUd1AXJ8yJsoJeKMQE14fpPIc7Gl6/kSI0B5+d9XQj8B+CCoOAHkpXYCoasi
         r1FVcsX+HtXrPP5lUG/U8Dnys/zfWMIVJEgDnE01jQwxRVk9TTojjuv83JDf+JpgcJiA
         /eow==
X-Gm-Message-State: AGi0PuaOh22gqb4YxU+GojShdgKgBeSqtxQR6tuK4qnDadVn1xnC2GnH
	T9PVmgTzXFp8jsbtNVMaPMSCjRUFvt0=
X-Google-Smtp-Source: APiQypJEDEg2t8OwqV9+jxSbr0o4gXFgV+NU1Mxvp/5Tg32dECmQ/mVArRMgRSh5SQHUygheioq2xg==
X-Received: by 2002:a63:2485:: with SMTP id k127mr409143pgk.159.1588619408961;
        Mon, 04 May 2020 12:10:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::b3aa? ([2601:646:9200:4e0::b3aa])
        by smtp.gmail.com with ESMTPSA id e11sm2747842pgs.41.2020.05.04.12.10.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 12:10:08 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] iperf3: Add OpenSSL build option to PACKAGECONFIG
To: openembedded-devel@lists.openembedded.org
References: <CAAxSGfY93AeTPnL=4sDVqTFLvMpP154+2eUB=esToBTQuM9MTQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <6789a6cb-ce58-25b1-1912-a17141ff88fe@gmail.com>
Date: Mon, 4 May 2020 12:10:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAxSGfY93AeTPnL=4sDVqTFLvMpP154+2eUB=esToBTQuM9MTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Can you rebase it on master or master-next and resend ?

On 5/4/20 5:02 AM, Alexander Vickberg wrote:
> Make building with OpenSSL optional but enabled by default as today.
> 
> Signed-off-by: Alexander Vickberg <wickbergster@gmail.com
> <mailto:wickbergster@gmail.com>>
> ---
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb <http://iperf3_3.7.bb> |
> 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
> <http://iperf3_3.7.bb> b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
> <http://iperf3_3.7.bb>
> index 98d2faabf..c7ad91b24 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb <http://iperf3_3.7.bb>
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb <http://iperf3_3.7.bb>
> @@ -11,8 +11,6 @@ AUTHOR = "ESNET <info@es.net <mailto:info@es.net>>,
> Lawrence Berkeley National Laboratory <websupport
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f9088fe7ffdccd042f7645f1012d7f70"
>  
> -DEPENDS = "openssl"
> -
>  SRC_URI = "git://github.com/esnet/iperf.git
> <http://github.com/esnet/iperf.git> \
>             file://0002-Remove-pg-from-profile_CFLAGS.patch \
>             "
> @@ -23,8 +21,9 @@ S = "${WORKDIR}/git"
>  
>  inherit autotools
>  
> +PACKAGECONFIG ?= "openssl"
> +
>  PACKAGECONFIG[lksctp] =
> "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sctp_h=no,lksctp-tools"
> +PACKAGECONFIG[openssl] =
> "--with-openssl=${RECIPE_SYSROOT}${prefix},--without-openssl,openssl"
>  
>  CFLAGS += "-D_GNU_SOURCE"
> -
> -EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}${prefix}"
> -- 
> 2.25.1
> 
> 
> 
