Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.9588.1624030859910603189
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 08:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M8ZpMjDb;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id h16so5922430pjv.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vgJzZxnAenGGfLo64eNJUOCQAZpmqkGNXFUfogL2s0Y=;
        b=M8ZpMjDbk2dWrJCqm/72CePio40TWda/JpJmsenFCE85AWQmBD1AVyFDMO3aDQJ2r+
         qVJFTZdQsgy6bJ/BM/GJ4lOtneD3ppdH/3sPgIgKsumfjy/SjQchyY0S8NbFGphOZPx4
         bM0KI7BeIPrN3dfFQOtLbDH+aYAXQRhnrDCvM9RhBPv+j28F0YKTcys9aictOnT4iHQF
         pFdVYZU8xYF6ZouCDmmDDIh8OyOspwjMYGpYOBRbx27HCO+fP137XNU2vUoQ7bVfI3d4
         pOc5N4ylNC0k6YWybTUywLq8rdW+IHrBhF1L9FROE84gPnnUvHhkCys6z5U/JttssiSM
         puhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vgJzZxnAenGGfLo64eNJUOCQAZpmqkGNXFUfogL2s0Y=;
        b=MS/NxJ4w+AeWZIw+YeyiAWnANE6xE+Nb/yVBuxYS/5Eo+a4B8G4rY07ijWPmwQnObr
         ynWs5Rw7veR7QsJJjM1K0YRl+uJDrMi1931e5ke6dq1sPJqkulrrVVCXpAjTt5HyAmiW
         Zc2RhrunijQjXNeAPGgjM+zbYaBg8A2OImEIenen+8QqgpSgDkPY+KNJRDfjIcF2ZCD2
         Au5kkI1/TLXzaovvw8h/4SirDOzGZjTVSULrFlte447Kynw6hweCQeIFe2hhJg68IR4E
         pr8McEY+JYV0VE3shOXVM62Udme2BDf9AACGE16As352oZaQToWh2HlX/lJHO2hb7DSY
         j16Q==
X-Gm-Message-State: AOAM5333aUqcL9uPovApL2FGl8V09vA0NnCCDJ4gRNk5rqVebsgpkjcc
	i6+tAcR4zubJT8pgHxx+/Ldjr5j2u3Nd4A==
X-Google-Smtp-Source: ABdhPJxjp064L9m0rbc9mrSRt/jaBu5yCuhkQaSVx/s/yydJ8e23XQxqxq4YA0j1vk/kwyGzmrTvCw==
X-Received: by 2002:a17:90a:6404:: with SMTP id g4mr22338461pjj.155.1624030859220;
        Fri, 18 Jun 2021 08:40:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:547b:1a51:8143:a5fd? ([2601:646:9200:a0f0:547b:1a51:8143:a5fd])
        by smtp.gmail.com with ESMTPSA id b3sm8555652pjz.49.2021.06.18.08.40.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 08:40:58 -0700 (PDT)
Subject: Re: [oe] [meta-networking] [PATCH] mosquitto: upgrade 2.0.10 -> 2.0.11
To: openembedded-devel@lists.openembedded.org
References: <1624025493-7195-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <474dd766-33ef-b9ff-d61c-aa679b60bb88@gmail.com>
Date: Fri, 18 Jun 2021 08:40:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624025493-7195-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/18/21 7:11 AM, zangrc wrote:
> -License-Update: notice.html does not exist in this version, use NOTICE.md to
> check.

is the content still same ?

> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   .../mosquitto/{mosquitto_2.0.10.bb => mosquitto_2.0.11.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.10.bb => mosquitto_2.0.11.bb} (93%)
> 
> diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
> similarity index 93%
> rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
> rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
> index b815ac3b49..9f1c024bbd 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
> @@ -10,7 +10,7 @@ LICENSE = "EPL-2.0 | EDL-1.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca9a8f366c6babf593e374d0d7d58749 \
>                       file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
>                       file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
> -                    file://notice.html;md5=541f8f37af492858dab8d2c1b69ede69 \
> +                    file://NOTICE.md;md5=a7a91b4754c6f7995020d1b49bc829c6 \
>   "
>   DEPENDS = "uthash cjson dlt-daemon"
>   
> @@ -19,8 +19,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
>              file://1571.patch \
>   "
>   
> -SRC_URI[md5sum] = "3d1c327d8c5881f56983bee1e3c8f068"
> -SRC_URI[sha256sum] = "0188f7b21b91d6d80e992b8d6116ba851468b3bd154030e8a003ed28fb6f4a44"
> +SRC_URI[md5sum] = "638d801e6aac611b41de76d030951612"
> +SRC_URI[sha256sum] = "7b36a7198bce85cf31b132f5c6ee36dcf5dadf86fb768501eb1e11ce95d4f78a"
>   
>   inherit systemd update-rc.d useradd cmake
>   
> 
> 
> 
> 
> 
