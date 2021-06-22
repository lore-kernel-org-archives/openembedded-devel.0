Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.287.1624379710975333295
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 09:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dmMzeH2x;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id b3so3068449plg.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 09:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=caN+UsJOZcXNbWpeth2GE01BKRPUSn+r8Fdm87fS/KU=;
        b=dmMzeH2xv+5MgPUS6gd8u5lFe+1qcuSELOP1D2UaACMJXhsUUeVgNwwcQnX65JfD+G
         a6EnZdUi+Gk5PCv36cJ9qD4AxFBa69hL8F6d8Bn4UicEryF9eN6yek13aKKVXDSklgqF
         ga86R8EM8kC1fSaJUgHMU4ht6xls5ora5mQ1bYO8BWYMD5N1+x240tkTbp3DoUUuw5fW
         o5Ejzh2Z/4Gd/152gs1EPOLP6BSZjo7NP+/5l5lCW7KNwzrpTJP6Y4jXoKgyRz13SmTZ
         A/PB5G7I+JQJP8Di4d98Q2KYaBBPgj2ovAeVCqis05Sn2vQC1k9az7li1X8deSkYot+O
         En1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=caN+UsJOZcXNbWpeth2GE01BKRPUSn+r8Fdm87fS/KU=;
        b=TKkAqmYLKZ+NyX5p3MmO5VCMvHG3nhytn0EsiKVjUyOUQSQVdabHf8ndjHdeJP6Cul
         vUdwLry5FvDTImmCKVFA1NQDC8auSULA7Wp6AmxeAqoYdJDXZQ6IcAALN+RVL1uRHi0v
         qUhSsBzyjmiao3ITLTi8z7/9823qokdDj4tdAAJNQu11ZV052meypAfkEEJt9GqJ7VPz
         UiNiQIhh4aAVcmwXhWYdEChEUz/bk2Zm0BjiXKvQVqniBkLxfVV4HVWeT9aVTbghCSna
         fS9cAW5QsZyTEGIE+BQNKMzGobxmFhQ/Skdf0LzYyQE1RMpY+Xc/ognyCwjqYTGAZSqy
         iBYw==
X-Gm-Message-State: AOAM532tesBvzGkKGSLEH7t2t3NleuKgkEEM8BCkVn6oZAAfmnzswNpT
	+SuS8OTRkiZI+MfSkSyk3O82T+kyfMq+9g==
X-Google-Smtp-Source: ABdhPJzRixwZh2/RsXAYtOeR7/nrxcimurLxpkDaapN9NN7VPewEtQ/mGmUSyGElMtVX5Lxckmy8PA==
X-Received: by 2002:a17:902:da83:b029:122:d385:d280 with SMTP id j3-20020a170902da83b0290122d385d280mr16662422plx.43.1624379709976;
        Tue, 22 Jun 2021 09:35:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d102:fdcb:61de:2062? ([2601:646:9200:a0f0:d102:fdcb:61de:2062])
        by smtp.gmail.com with ESMTPSA id b16sm19510261pfr.194.2021.06.22.09.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 09:35:09 -0700 (PDT)
Subject: Re: [oe] [PATCH] cve-check: Add allowlist that is same function of whitelist.
To: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <20210622082917.1567681-1-ito-yuichi@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ffe8bb78-c56b-08de-dfab-77ef8c89c6e6@gmail.com>
Date: Tue, 22 Jun 2021 09:35:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622082917.1567681-1-ito-yuichi@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks for the patch, you need to send to oe-core mailing list since 
this class is part of core metadata.

On 6/22/21 1:29 AM, ito-yuichi@fujitsu.com wrote:
> The Linux team plan to removed references to racially-charged jargon from
> their code for more neutral and inclusive language.
> So replace use of "whitelist" with "allowlist" in cve-check.
> 
> First, we add CVE_CHECK_ALLOWLIST and it is considered patched as well as
> CVE_CHECK_WHITELIST.
> We plan to replace about other word later and eventualy, replace all
> "whitelist" to "allowlist".
> 
> Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
> ---
>   meta/classes/cve-check.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 112ee3379d..5e3441a783 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -52,6 +52,7 @@ CVE_CHECK_PN_WHITELIST ?= ""
>   # CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
>   #
>   CVE_CHECK_WHITELIST ?= ""
> +CVE_CHECK_ALLOWLIST ?= ""
>   
>   # Layers to be excluded
>   CVE_CHECK_LAYER_EXCLUDELIST ??= ""
> @@ -238,7 +239,7 @@ def check_cves(d, patched_cves):
>       old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
>       if old_cve_whitelist:
>           bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
> -    cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
> +    cve_whitelist = d.getVar("CVE_CHECK_ALLOWLIST").split() + d.getVar("CVE_CHECK_WHITELIST").split()
>   
>       import sqlite3
>       db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
> 
> 
> 
> 
> 
