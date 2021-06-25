Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.9316.1624635346726796717
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FNlxccIt;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id h23so5664417pjv.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jun 2021 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pw7VslYQcljPTmfdU8FMpwv4/2S+ShOBOs0lbF0+Pbg=;
        b=FNlxccItq3yzayPDjFNvNPPa46cW6ERAfa/cF1yTMazRJwVr94b9fajxM+9sXgANGz
         rOMA+GDVQR0dePcKZwhd61pfIIY6vYFNYkddGQppTrL5f2uU7OBp8pvvRURSTOqbro/7
         o4NVPlkvCRgA8Z5UVcZNWnHYA69FUHuYrlAusYE2V80+FzpM08JlWicjyQZS978+EWJr
         yIpcyR22RV9gC+UWHlpu7ypqKlGnC3+X1qleePuHXJMdQNIYKYTE5B3b7P5pS9Y/QG4P
         zAcMnWxaDukCVfddHYivJwovy9+tXfceXrZwPS7hmDANjh6Rs6za7vctlJ6Qza+Q2TLB
         HwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pw7VslYQcljPTmfdU8FMpwv4/2S+ShOBOs0lbF0+Pbg=;
        b=DQ23LjkpFMI9LDhSsXCSbW3OWBS7OwoQ04iLm7PbHlebdEUhsA1cZL9KySjujOeyYJ
         +pJj2vPy+yl+aBxzcN3mCk+NFnIb+94IQJEril1FVpug72fwcCwD3Nvjs+hTfVGpIRdd
         OIFkgU5bbCsCBdc6GAmgMwLKRklITRZnSpdpKBQJMOuNgAsFAyHPTDyOTj/lgnmBpw25
         O7EjY+8JnR3dRhkIpOit58P+gQwBla23yCM9Y4aZ50iC4moc54scFGj0wFWDj+435BC2
         cr34u353GCPHpeyeiQS1HDo/xcFWfZW0jLDj2oAz2oGxHX508UwO/d3hXbROidzQFBre
         wAmA==
X-Gm-Message-State: AOAM532uQPllokAWXSXahV5DXed1p0e7zv3JKLRGILU/voJC5DSPI+s9
	VOl6TAXpsBu2OXNagRqadbBu1cbsH2C4ig==
X-Google-Smtp-Source: ABdhPJxFOFaUYOFsIaM8ohAgZOS9RdpJFpXEHjxAlvaO3WMe/7eHm0/BicA/RDM+kKWwYWXl8TOeZQ==
X-Received: by 2002:a17:902:8ec7:b029:11b:acb4:ac43 with SMTP id x7-20020a1709028ec7b029011bacb4ac43mr9495663plo.1.1624635345948;
        Fri, 25 Jun 2021 08:35:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c2:2fa:950b:5920? ([2601:646:9200:a0f0:9c2:2fa:950b:5920])
        by smtp.gmail.com with ESMTPSA id 3sm6602359pfb.202.2021.06.25.08.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 08:35:45 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-google-api-core: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210625101545.30040-1-leon.anavi@konsulko.com>
 <20210625101545.30040-3-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <83ea86dc-5d50-47a1-b783-fb008192e5aa@gmail.com>
Date: Fri, 25 Jun 2021 08:35:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625101545.30040-3-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

please send a follow up to add them to meta-python test packagegroup as 
well.

On 6/25/21 3:15 AM, Leon Anavi wrote:
> Add Google API client core library.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   .../python/python3-google-api-core_1.30.0.bb  | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb
> new file mode 100644
> index 0000000000..08cc35d064
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Google API client core library"
> +HOMEPAGE = "https://github.com/googleapis/python-api-core"
> +AUTHOR = "Google LLC"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "0724d354d394b3d763bc10dfee05807813c5210f0bd9b8e2ddf6b6925603411c"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-asyncio \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-math \
> +"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-googleapis-common-protos \
> +    ${PYTHON_PN}-google-auth \
> +    ${PYTHON_PN}-grpcio \
> +    ${PYTHON_PN}-protobuf \
> +    ${PYTHON_PN}-pytz \
> +    ${PYTHON_PN}-requests \
> +    ${PYTHON_PN}-six \
> +"
> 
> 
> 
> 
> 
