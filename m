Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.39105.1628872477609802875
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Aug 2021 09:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fvPjJVUZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id l11so12696424plk.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=300YNyxMt+5sBkpqj023HDisdZ+Aq4G5YEjG2Oz6zBM=;
        b=fvPjJVUZduhi5UbmGGpKNbj5vj2/0awfKylMokx53Hw3AoStMkrG8Pi+aOIlwgqRqF
         hD9DjSPGP1NBK9M2ROtssDT5zgZIAXOR+/wNLtdKPKnFmOI1XmiyXkkxfzcF5GoS8Ecp
         QwRllbmnNF1268O7OiOyUagnoVduc4HpOL4pHVYxSXe1dzMhepr+lbuAwiIqdRUi2oqE
         G+RbXdgO+7lG2gv+WpyCLWjO0Gbea8aBotDHJOXOVE/0ekDCJoZ7PAkAX9PfRA6vAy08
         e+rxzQoi/TSvcMQkd+nCTzhSOiTFYfJ+XKgqa+gEZaS2fMja1EzutCh9rCzdPPmT4yBF
         iCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=300YNyxMt+5sBkpqj023HDisdZ+Aq4G5YEjG2Oz6zBM=;
        b=MdDt2rUiuGXxBOZAoChviajEBrRFmi7ZFlrAM9OblM0v2fUkuW/QXZzjPZzX/SFEaR
         wBADFWSIn7Xr5rKuh7BCaCaNffxUE0xn4EKViHtlrCRKEYkem7n8Hlv+pRG3LYl50iRX
         2GOWCUF1OBUaHUk2EPEXLoKocVgu2Iuu107qnt/9CIqVdqGryZeNQYDpHM2sWmYmMIsp
         QDPCT7vqdz8CUJY99wcFOXmHHKierSjwf+H2779q/H8nRSN4EghgtlMuYG4RG2XpDpNW
         iUuwm7sVDyqcaOuLG0CogWNxvCF9ByFcI5J1wDn1tizToZClsBGznWjcWeNU3FITJJQA
         HfwA==
X-Gm-Message-State: AOAM5327HHAe5UuAe2rIcxHpkPlgnyxMHrKtsegrNXVne1ihsbkpLgQl
	NRQhHFHOsMnOwzeC72Sj/0A=
X-Google-Smtp-Source: ABdhPJxjUQRPlFvsmFe2s1oFr4tOj0r9ZHVNE/AMJyfyNQQHPALimt74l9K1FS0pre24I81+Ii9gMA==
X-Received: by 2002:a17:902:ab53:b029:12c:57a6:13ae with SMTP id ij19-20020a170902ab53b029012c57a613aemr2739663plb.53.1628872477130;
        Fri, 13 Aug 2021 09:34:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:c078:a19b:8919:aba? ([2601:646:9200:a0f0:c078:a19b:8919:aba])
        by smtp.gmail.com with UTF8SMTPSA id n5sm3145610pfj.49.2021.08.13.09.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 09:34:36 -0700 (PDT)
Message-ID: <310505b1-0d00-f578-deb0-33a08af4fa34@gmail.com>
Date: Fri, 13 Aug 2021 09:34:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [oe] [meta-oe][PATCH] ttf-ipa: Added a new font.
To: leimaohui <leimaohui@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com>
 <1628871245-5054-2-git-send-email-leimaohui@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1628871245-5054-2-git-send-email-leimaohui@fujitsu.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/13/21 9:14 AM, leimaohui wrote:
> IPAfonts is a Japanese OpenType font set.
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>   .../ttf-fonts/ttf-ipa_003.03.01.bb            | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
> 
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
> new file mode 100644
> index 000000000..b0af08097
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
> @@ -0,0 +1,25 @@
> +require ttf.inc
> +
> +SUMMARY = "Ipa fonts - TTF Version"
> +HOMEPAGE = "https://moji.or.jp/ipafont"
> +LICENSE = "IPA"
> +LICENSE_URL = "https://moji.or.jp/ipafont/license/"
> +LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276 \
> +"
> +PR = "r0"

not needed.

> +
> +SRC_URI = "https://moji.or.jp/wp-content/ipafont/IPAfont/IPAfont00303.zip "
> +
> +SRC_URI[md5sum] = "39a828acf27790adbe4944dfb4d94bb1"
> +SRC_URI[sha256sum] = "f755ed79a4b8e715bed2f05a189172138aedf93db0f465b4e20c344a02766fe5"
> +

only sha256sum is needed.

> +S = "${WORKDIR}/IPAfont00303"
> +
> +PACKAGES = "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
> +FONT_PACKAGES = "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
> +
> +FILES:ttf-ipag = "${datadir}/fonts/truetype/ipag.ttf"
> +FILES:ttf-ipagp = "${datadir}/fonts/truetype/ipagp.ttf"
> +FILES:ttf-ipam = "${datadir}/fonts/truetype/ipam.ttf"
> +FILES:ttf-ipamp = "${datadir}/fonts/truetype/ipamp.ttf"
> +
> 

Since its a new recipe, add it to test packagegroup as well.

I have addressed all these issues this time.

> 
> 
> 
> 
