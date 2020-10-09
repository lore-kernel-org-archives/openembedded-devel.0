Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.15654.1602255083574904787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TzMZZldL;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o25so7381718pgm.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/Ju8GqEErVCafwAbGSRpdC4UY1BM3UQjY1EcCFjrvO8=;
        b=TzMZZldLdjuWRYu5xVjf5fOJWa1wkC5qmm878yTZKcQUfzNRUDWirTDNqe14zRwMKw
         i71TGX7+ES8CKJjPZW8J4FUOPt9NjZ2PHPWif5JkQBssoiKRzb+8XuxIdJ1i0cccO2Bh
         mKagHnuR4ipCqbS/f3+nZUjWMPfiWDjbjXefCVBa2fWZ2UXNMA29OyHpq3Z/0N3Ptf82
         /6YTg3UtRG2pyEF2+br9Bpl1SCTDwQC1/0ypYA0CI/NH8vHw33O0Be3GQnBersS3khhd
         H0JkjiMccCGl0gmRNgrZRIFAzyMEYvVshm8Tz8sWs5QrbgMWPQ1Z1qy4d6bVzFamDLdY
         8v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/Ju8GqEErVCafwAbGSRpdC4UY1BM3UQjY1EcCFjrvO8=;
        b=kZG9l/UqTGPI5eDSffENVC456YBU/FhiN1s2SsFdQAys90A7YctjqtgfIC/Z7Ppkxe
         M1Sh0vkjbKtQYLhTWr4e0TXTAY24/cxg57ERhBPaXjTlxItSThh3lilW59eQdHAMRmhK
         I1QJkbKGj6Uhy7k+phhA49IdCXQ77SWi4Li/f0oo6Q1gqgTf/655XhgLjp7lQJIJD6O7
         Twv/mNCkkc/ECqfhyqkoKGaRoE0UXPrY8AL4Pw28lvaua1yQ5CfucAag7HODPG6dm7GU
         YYmMbOuIGt4imAxWa6ABnoWZSv1ZMc4ifL0zMXEduYxVX9ZVYPCnKaTnbFyxtV085neU
         2VMA==
X-Gm-Message-State: AOAM530ov79iRkSEtJ0maL2oDFMkb0xCWktMp70CyuqyDyOm3gipgxlH
	tLbfLLgH0RmFmZvX9UW2DQso6fg4NGE=
X-Google-Smtp-Source: ABdhPJwIJETx0+SjLv10ZN5OpMTlDBJcXEDjCHVjm6FY69eHFOSGQwA3qHgPQ6+5gpfmgbXJdfCMHg==
X-Received: by 2002:a17:90a:e64c:: with SMTP id ep12mr4968922pjb.43.1602255082514;
        Fri, 09 Oct 2020 07:51:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f1c6:e45a:6950:664b? ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id a4sm11394540pgl.51.2020.10.09.07.51.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 07:51:22 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 2/3] template-toolkit: add package
To: openembedded-devel@lists.openembedded.org
References: <20201009043935.18597-1-akuster808@gmail.com>
 <163C3920505C8C6B.8231@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <87d6c7f1-8b2b-8e4a-f6db-0816c0c0d213@gmail.com>
Date: Fri, 9 Oct 2020 07:51:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <163C3920505C8C6B.8231@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

you may want to hold off on this one. I am finding dependency issues now.

-armin

On 10/8/20 9:39 PM, akuster via lists.openembedded.org wrote:
> need it for meta-security
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../templatetoolkit/template-toolkit_3.009.bb   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb
>
> diff --git a/meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb b/meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb
> new file mode 100644
> index 0000000000..79ea10aebf
> --- /dev/null
> +++ b/meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Template processing system"
> +HOMEPAGE = "http://www.template-toolkit.org/"
> +
> +LICENSE = "Artisticv1 | GPLv1+"
> +LIC_FILES_CHKSUM = " \
> +    file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
> +" 
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/Template-Toolkit-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "d6ad23bbf637a59b5dfd1ac006460dfcb185982e4852cde77150fbd085f1f5b6"
> +
> +S = "${WORKDIR}/Template-Toolkit-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"
>
> 
>

