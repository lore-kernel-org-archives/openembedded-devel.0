Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.4233.1610679386461187546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 18:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IdBAIMeP;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id ce17so2088585pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Jan 2021 18:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=edEmD5A27vrTvtomtObKw1Jt30luJvLG+aYEWmR0Ktw=;
        b=IdBAIMePEjp1TBFa5LNy3lspdV/wU5iBoDsesHVvqfNQv9NSX57+i3hytfFavqGsPY
         tUQzfFYSJyZd8mCAAQjuKN2MnVvDAGcA9EDlZfrwN2T9JtiaY5G4mdUw4sVNYdDE7d0l
         vz92nsal1Rnl+DadnyvJLUCPExesgcZ4dmdBcIxozsL6BhQFZsf0Ix6mAWAcaQKAq3pq
         V7M8WWqQeKMX11exkoCFODYqcYbwgiVylCCXhnG2IH45KwkHinU4qFTQisD0nCRS+AZK
         yt/H8kw619xUNRbFuu1tHC3ts9rdysdcvaTkKwexpXQbzXSjDZAIVzXYpxMEsLfHe/mW
         mBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=edEmD5A27vrTvtomtObKw1Jt30luJvLG+aYEWmR0Ktw=;
        b=BFwaChsEBOoD0FnxhkEDDLH1z8LUmWj7IsrikWnPH1NSlDiBWSRF+zvg0YPM2jKxl5
         MG8qfz9LfT6Fz6zB+nsDKS6xjXakoojPt+cpYjz3rmM3tEWPVFWARnMq9OVy17iZPhyd
         4yKJRUtFRu+Z6iAjap1b/eQH3P4RJbZZw+m+Q+9kjAvYITxe7A5f11qh/x778gZIvC5B
         5mt/evBkSYC9ucd+piLXj+3YKTL8xUEsA+5nugS5z/bl3GMW3M0xBBXoRgwIyVuHHAkW
         HMRfo1Y27EgSqXMTCHkCz2i55u81/jpHjHyoQfmmNUCxAA3v40ZS3pP94F3hhshZnRJG
         tR8w==
X-Gm-Message-State: AOAM532CidJH5XiOT1fCgaCxUsQHr1Hh/QZTag7u1APEoXEB1EnRapwi
	vWa8uVz6ICku+dVqemqhYYb9QeMb4EpEeA==
X-Google-Smtp-Source: ABdhPJzYg4vpCFTSJ1DroWjqKNwkUm8Tb97hJ9H4IZ0XTDmrm70ImLsAf5ae7z/D3xnDdUeFjzVMMQ==
X-Received: by 2002:a17:90a:a60f:: with SMTP id c15mr8446562pjq.53.1610679385580;
        Thu, 14 Jan 2021 18:56:25 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:19ce:8609:7a34:860? ([2601:202:4180:a5c0:19ce:8609:7a34:860])
        by smtp.gmail.com with ESMTPSA id u4sm2884411pjv.22.2021.01.14.18.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 18:56:24 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH v2] xmlsec1: Fix configure QA error caused by host lookup path
To: Anatol Belski <anbelski@linux.microsoft.com>,
 openembedded-devel@lists.openembedded.org
References: <20210114173623.26233-1-anbelski@linux.microsoft.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3c1127ea-1125-3a66-8e66-63be6d87a5ee@gmail.com>
Date: Thu, 14 Jan 2021 18:56:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114173623.26233-1-anbelski@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/14/21 9:36 AM, Anatol Belski wrote:
> The configure script contains hardcoded lookup paths to /usr and other
> paths that might interfere with the host. These are overwritten with the
> staging dir locations for Poky compatibility.
The QA message has "xmlsec1-1.2.30" so this appears it needs to be
backported to Gatesgarth and Dunfell.

Please confirm.

-armin
> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> ---
>  .../xmlsec1/ensure-search-path-non-host.patch | 22 +++++++++++++++++++
>  .../recipes-support/xmlsec1/xmlsec1_1.2.31.bb |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
>
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
> new file mode 100644
> index 0000000000..a5a298af0d
> --- /dev/null
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
> @@ -0,0 +1,22 @@
> +xmlsec1: Fix configure QA error caused by host lookup path
> +
> +ERROR: mc:my-sdk:xmlsec1-1.2.30-r0 do_configure: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
> +
> +It will eventually arise after the configure QA as the configure script should only look at the staging sysroot dir, not at the host.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> +
> +--- a/configure.ac.orig   2021-01-13 14:37:42.254991177 +0000
> ++++ b/configure.ac        2021-01-13 14:40:56.546269330 +0000
> +@@ -250,8 +250,8 @@
> + dnl ==========================================================================
> + dnl Common installation locations
> + dnl ==========================================================================
> +-COMMON_INCLUDE_DIR="/usr/include /usr/local/include"
> +-COMMON_LIB_DIR="/usr/lib /usr/lib64 /usr/local/lib"
> ++COMMON_INCLUDE_DIR="${STAGING_INCDIR}"
> ++COMMON_LIB_DIR="${STAGING_LIBDIR}"
> + case $host in
> +     i*86-*-linux-gnu)   COMMON_LIB_DIR="$COMMON_LIB_DIR /usr/lib/i386-linux-gnu" ;;
> +     x86_64-*-linux-gnu) COMMON_LIB_DIR="$COMMON_LIB_DIR /usr/lib/x86_64-linux-gnu" ;;
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
> index 803016c96e..3464f2f43c 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
> @@ -19,6 +19,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
>      file://xmlsec1-examples-allow-build-in-separate-dir.patch \
>      file://0001-nss-nspr-fix-for-multilib.patch \
>      file://run-ptest \
> +    file://ensure-search-path-non-host.patch \
>      "
>  
>  SRC_URI[md5sum] = "182f5cbdfb8ddbac535c04470c170dc3"
>
> 
>

