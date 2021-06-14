Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.32108.1623685949116315831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 08:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pAxe7sp1;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e20so9019673pgg.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jun 2021 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=q/DjsgbDIPGjahXlkL8hzzLNIUGVxGjwRRTzKFYohdM=;
        b=pAxe7sp1VNa5QapM8b8uFXFKnfNeQbMRDwQxMkU7MVY9tucvUTNrcOiUI7DHFFjAJM
         y+5/EWeaAaRUqHb1+HRpRhzUYlG9Tw2Uf9c4hbKhJm0D6//ihMsK9xWCABwDluiBoPHy
         Q2ZXCk6fFLDjS+zyP8dTITTe2U04NLWPUKjNQO8FqScanldfnROTIZVp6nb+5ELOawhB
         S23fHY813G/eAsG/G9LpUIUia09gHZUz/knJykHvg7wuBrgY3yJ6zTiJ4cbIqZOpSaBc
         zekA2kdq2w60UOh6jeO6LPUyz4nc4HWOJgSbpa98B6NAsSwd4d/agc8zmqQh9WWu4d2G
         ZCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=q/DjsgbDIPGjahXlkL8hzzLNIUGVxGjwRRTzKFYohdM=;
        b=LoE+zhosz6TzCd1I5Cryf1UhmgFcpOwq2J4lqKz8jm9v/zLlXzAZr1Q/pljWfDb88w
         X4hfb+x+ZZ15YfCkU8GEokHEqR6Sl2xw8YfEJasL9ihbKZFnYdiFc2gqiYuJGG45InYV
         CEpLoLnzqYbaJWCBzgOcCizUvkJB8qcjbCm507Ba6maWMPSngSH92ZEbh5HihSaLdZjG
         FSokQBKMycf9lvEOc2X/JCiQT/VH8CHKVUcCz8ECUVAoI7pFlMwfVNR8PKWXdPN9vxF4
         6aqENXAGUNyp7D/AyDTN51xJ2qtUtFxe0FT+tBe4InPyXhUBCvpPjHmhPj7VMV7Q5RbH
         gMWQ==
X-Gm-Message-State: AOAM5315wumbjaGDU2YolSQBcYazpH8fEMEPSoZsLUQwJkPFdqfq4WrN
	q6d5CKNbLQR9vAD5RG9eE6o=
X-Google-Smtp-Source: ABdhPJxMlg839893b5XF1covJsETAjZdxEmXDUmfMJuPN2Qwv/m7doKxzXIv7Sn85xg9mv3sjqReYg==
X-Received: by 2002:a63:81c3:: with SMTP id t186mr18040190pgd.123.1623685948670;
        Mon, 14 Jun 2021 08:52:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ed93:eb87:6dc9:a518? ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id d8sm13302068pfq.198.2021.06.14.08.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 08:52:28 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
To: RAHUL taya <rahultaya96@gmail.com>, raj.khem@gmail.com,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: nisha.parrakat@kpit.com, purushottam.choudhary@kpit.com
References: <20210614111515.21348-1-Rahultaya96@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <090d4e01-c395-fc87-66ee-06fba6d691d1@gmail.com>
Date: Mon, 14 Jun 2021 08:52:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614111515.21348-1-Rahultaya96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/14/21 4:15 AM, RAHUL taya wrote:
> As per below reference links this CVE issue seems to be minor and
> harmless and as per upstream this is not a real issue in practice.
>
> And as per red hat this issue is marked as low severity.

Does this affect Hardknott?

-armin
>
> 1. https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> 2. https://security-tracker.debian.org/tracker/CVE-2015-5237
> 3. https://ubuntu.com/security/CVE-2015-5237
> 4. https://github.com/protocolbuffers/protobuf/issues/760
>
> Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> index 4d6c5b255..f845a72a0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> @@ -88,3 +88,11 @@ LDFLAGS_append_arm = " -latomic"
>  LDFLAGS_append_mips = " -latomic"
>  LDFLAGS_append_powerpc = " -latomic"
>  LDFLAGS_append_mipsel = " -latomic"
> +
> +# As per below links this issue is minor and harmless and
> +# as per upstream this is not a real issue in practice.
> +# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> +# https://security-tracker.debian.org/tracker/CVE-2015-5237
> +# https://ubuntu.com/security/CVE-2015-5237
> +# https://github.com/protocolbuffers/protobuf/issues/760
> +CVE_CHECK_WHITELIST += "CVE-2015-5237"
>
> 
>

