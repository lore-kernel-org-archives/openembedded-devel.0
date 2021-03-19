Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.268.1616172065933626856
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 09:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1u8Ly1h;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q5so6287722pfh.10
        for <Openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=BxG/HFtnqDrOshMFXvz1EffAA6Ux50wpLUMp0Sj28lk=;
        b=r1u8Ly1htnAbDndhNAb83I+ZuidQufRymPR1LSN0t1cIBKlQ8mZwo7ncjXtpYmhXin
         jMMCMTrd6gQjOfb72mTvDNp1aCbS4kZCaU7W0uEC/mauN9Ay0coG1/AZw0O/09qJ3B7S
         GG8hKLedA+sA4mh9mKCADfvytgQi3bUoC4yLXFlfgvYsO23QXdq+zex9t1Ftnwh/5Zen
         zVlF0sFbJEKkdEGnPZh+oylZgxlEq9MX1sedEVIaF3GN4w77PPrzyC3OlwY6mkJMKg4+
         HnAXwtTYbTuizpWO3ntU+B5/SZ/Tu9erndwK3MtZSTLb5+9BBZhszu5CrDG5yXGjcmkO
         tcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BxG/HFtnqDrOshMFXvz1EffAA6Ux50wpLUMp0Sj28lk=;
        b=RGXS5XaWssSpizoU2kSZlIW/WjS0Xfklfq3Q/Ws6YQ9OGfTOUbu5oqv3SXdw28v+xe
         ZhBq/sR7m5Aa7JO80YkfQzEfa+sLkBHznmJQYJ/U5l8bfCWIwq6HFSC3PVj0NpsCxXXk
         Bx+l531tKGZz9LRSa+NgfTxMdtoLdJO0dq+3u8HPBueJc0OqzqwkH3I9RZVC0vyMq84/
         y+cHSXiQhm9azHTucJYQCF4zkXe1VfrAcCLESfSSh8cwlp5KfeBkICYihzJUGIzvN/ej
         s3Zo8o2aHTYWDzzUgBOv2n1kpNM5v4w+Io/InyO1O1DEPqzNA3EgrS3MAJja7+1QDvuO
         gPCQ==
X-Gm-Message-State: AOAM5304CtU1A0TNuYV5yuTH6XORbI97lyCiZsAYr6yzxwqQ8NAxCmR4
	ZW4OsxLPbZrkZrQiVMCMpZ44iSrxU2UQEQ==
X-Google-Smtp-Source: ABdhPJx0rhE2lrEYyUeU0Bw3NrjDTY3kqfFK1lxdn6AHei1Ufughp7gMmKmdiIquvygHaoIpOxw4+w==
X-Received: by 2002:a63:c349:: with SMTP id e9mr12188285pgd.20.1616172064991;
        Fri, 19 Mar 2021 09:41:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b117? ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id 25sm6017949pfh.199.2021.03.19.09.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:41:04 -0700 (PDT)
Subject: Re: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: Whitelisted CVE-2007-0613 for mdns
To: Sana Kazi <Sana.Kazi@kpit.com>,
 "Openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
References: <20210309063513.10410-1-Sana.Kazi@kpit.com>
 <BMXPR01MB3221CE7ACA0211ED19B9164399689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <c9489c74-f9c3-976a-c1e6-645afe9c2f4a@gmail.com>
Date: Fri, 19 Mar 2021 09:41:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB3221CE7ACA0211ED19B9164399689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello Sana

It was in latest pull from Armin which was merged today
it should be in already in dunfell now. Let us know if not.

On 3/19/21 6:31 AM, Sana Kazi wrote:
> Hi Team,
> 
> Could you please review below patch to be upstreamed for mdns
> 
> 
> Thanks & Regards,
> 
> Sana Kazi
>   KPIT Technologies Limited
> 
> 
> 
> ------------------------------------------------------------------------
> *From:* Sana Kazi <Sana.Kazi@kpit.com>
> *Sent:* Tuesday, March 9, 2021 12:06 PM
> *To:* Openembedded-devel@lists.openembedded.org 
> <Openembedded-devel@lists.openembedded.org>; raj.khem@gmail.com 
> <raj.khem@gmail.com>
> *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com>; Aditya Tayade 
> <Aditya.Tayade@kpit.com>; Harpritkaur Bhandari 
> <Harpritkaur.Bhandari@kpit.com>
> *Subject:* [meta-networking][meta-oe][master][dunfell][PATCH] mdns: 
> Whitelisted CVE-2007-0613 for mdns
> CVE-2007-0613 is not applicable as it only affects Apple products
> i.e. ichat,mdnsresponder, instant message framework and MacOS.
> Also, https://www.exploit-db.com/exploits/3230 
> <https://www.exploit-db.com/exploits/3230> shows the part of code
> affected by CVE-2007-0613 which is not preset in upstream source code.
> Hence, CVE-2007-0613 does not affect other Yocto implementations and
> is not reported for other distros can be marked whitelisted.
> Links:
> https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613 
> <https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613>
> https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613 <https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613>
> https://security-tracker.debian.org/tracker/CVE-2007-0613 
> <https://security-tracker.debian.org/tracker/CVE-2007-0613>
> https://ubuntu.com/security/CVE-2007-0613 
> <https://ubuntu.com/security/CVE-2007-0613>
> https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613 
> <https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613>
> ---
>   .../recipes-protocols/mdns/mdns_1310.40.42.bb       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb 
> b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
> index 445ed87e4..60bc26bf1 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
> @@ -27,6 +27,19 @@ SRC_URI[sha256sum] = 
> "bea29e1616cd56ccb8f88c0fad2bcdc4031f4deb2d899c793e2f27a838
> 
>   CVE_PRODUCT = "apple:mdnsresponder"
> 
> +# CVE-2007-0613 is not applicable as it only affects Apple products
> +# i.e. ichat,mdnsresponder, instant message framework and MacOS.
> +# Also, https://www.exploit-db.com/exploits/3230 
> <https://www.exploit-db.com/exploits/3230> shows the part of code
> +# affected by CVE-2007-0613 which is not preset in upstream source code.
> +# Hence, CVE-2007-0613 does not affect other Yocto implementations and
> +# is not reported for other distros can be marked whitelisted.
> +# Links:
> +# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613 
> <https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613>
> +# 
> https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613 <https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613>
> +# https://security-tracker.debian.org/tracker/CVE-2007-0613 
> <https://security-tracker.debian.org/tracker/CVE-2007-0613>
> +# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613 
> <https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613>
> +CVE_CHECK_WHITELIST += "CVE-2007-0613"
> +
>   PARALLEL_MAKE = ""
> 
>   S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
> -- 
> 2.17.1
> 
> This message contains information that may be privileged or confidential 
> and is the property of the KPIT Technologies Ltd. It is intended only 
> for the person to whom it is addressed. If you are not the intended 
> recipient, you are not authorized to read, print, retain copy, 
> disseminate, distribute, or use this message or any part thereof. If you 
> receive this message in error, please notify the sender immediately and 
> delete all copies of this message. KPIT Technologies Ltd. does not 
> accept any liability for virus infected mails.
