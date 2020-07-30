Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.2266.1596086763859661800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 22:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhY4keYY;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id f9so3561074pju.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 22:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=jtgXvFmwGYwIMC5f/RTWeRVvW321XIEy+HSzfUPMTSc=;
        b=jhY4keYYfmj2pmLoR1yxmBjPdmRpvNtZNoftDr6pqeayEbqIa6t1HIQvyjLPKM/AGy
         IokJICZoxxoOPLZhVd7QfBZK2mR/Y9bEnA0oTMZZUiWDTbZxjrCRaqtuA3DpFtmxkvGc
         7n4putw4WbPFXYgYYaFz/bx9YzrYO/0EeyA1qi7L30wmpm6apoiiTvmHAoN4YehfmNHj
         Z8gSNrDpEPMpxlUG4bVh0giL7PMZZ5VnGB4ifRLthRSpSfD/bruS0UPm2pLtD0NzNzo4
         fBOefcCZtp6Lml5ijfLBvPLXOWBE3YIJbGj4eu9oGvuwX4Jw6Qq/dRMD3dt/VDbJLr90
         rxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jtgXvFmwGYwIMC5f/RTWeRVvW321XIEy+HSzfUPMTSc=;
        b=nzEqDdSapjzO0yDXhKoTNciw4hgqIeXjc/kTmVFtCNewV+PHzo/pmu95ro6QBEXWpG
         sSILPdgiuH6xvGX3TYU0u0C5zhF3Czm+WuBWeqg4s34+gjD43ZlO9ndBT5/ivAJ198/w
         hiM3/Pvp8XpjzDMtVueEeIGqQivsRFlEaIjRAxRgkFySfUkMd3AIW9ZNAQtNHdsur+K/
         CFyvBtJ9JPbmJNMLIE5EeJLkcmNSMlPpCP6XOKSJ+3i4N4sxXBalYnxJZs3VfjeOwt8Q
         qvzlcz3H7d/3ZzGaphyNmUPh8cD2O5g6yKb7XYqNGQrEcqD7/LkoT/EDy2FTJS1MKr8Y
         N3Sg==
X-Gm-Message-State: AOAM532Ar5NmYjWWIbhV/r88M1uOyU4WD+0FPcrUHxc4LiNE5XN4pdHW
	F4Qxy2h9NT6x2opQqXEG/gDgoYZKy9I=
X-Google-Smtp-Source: ABdhPJzXlsgfwVIOy8SG9/gpmAajxzKa3HnfOmGOMvfEQG7N/N8OBMuTd7tmzBNP6wCJw30Mx3GOrQ==
X-Received: by 2002:a17:90b:4c49:: with SMTP id np9mr1364195pjb.42.1596086762916;
        Wed, 29 Jul 2020 22:26:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5ba:2655:68eb:112e? ([2601:646:9200:4e0:5ba:2655:68eb:112e])
        by smtp.gmail.com with ESMTPSA id x128sm4189192pfb.120.2020.07.29.22.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 22:26:02 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-oe] lsscsi: update to 0.31
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20200726103045.3995966-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <b14897e6-d31a-fb97-1210-3b57eb4f468a@gmail.com>
Date: Wed, 29 Jul 2020 22:26:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200726103045.3995966-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/26/20 3:30 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../recipes-bsp/lsscsi/{lsscsi_0.30.bb => lsscsi_0.31.bb}   | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.30.bb => lsscsi_0.31.bb} (63%)
> 
> diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
> similarity index 63%
> rename from meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
> rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
> index af34cdc483..2c96de163b 100644
> --- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
> +++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>   
>   SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
>   
> -SRC_URI[md5sum] = "298a700cd50bb4be1382d618f7b038f4"
> -SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
> +SRC_URI[md5sum] = "efb68946f51860e8eedc18d6784afdae"
> +SRC_URI[sha256sum] = "12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca"
>   
>   inherit autotools
>   
> -S = "${WORKDIR}/lsscsi-030r154"
> +S = "${WORKDIR}/lsscsi-${PV}"

this is the default value too, so perhaps it should be deleted here

> 
> 
> 
> 
