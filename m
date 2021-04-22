Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.12668.1619099555982696708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 06:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pih5Zsuv;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id y32so32860913pga.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lIxqGKNmxutl5QaYKF5uS2S5EgvE8o+X6PZlyuLDAf0=;
        b=Pih5ZsuvQWxVfGfu7CsqOM7vig5Wks0Q78OWUnX2ns66MOPTI3ORhEg6nBGAU1iQAs
         a1iPT4rcD/R/b3YGLENFZBV8JdhnsT34alrhSz6toRjPWJBsGo/r2r2NnohnsU8ie5VY
         ZfDrzuj/NBhvDVeWdaxu+/XO1ASQufFPjFTNdWL60M2cY0HH3KrDSmIwRbQVUYm79YJQ
         qkP9aqxjd6ndjJyMGeq0nxRWtRCuolAMbrnjt3S2kily9viD4SBkF92l4GjP5Vkv3poK
         SRMftiAqOVaBUpNrrYDAUEuYVXfuYTIjVVe8HuKgVrUcJEpjSlYTfrGvzQOZNskiuvDG
         RMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lIxqGKNmxutl5QaYKF5uS2S5EgvE8o+X6PZlyuLDAf0=;
        b=RwnODnftxEBd4NRO28+3yAptOGCW1Epe9IEtC4cE2taURGDKz0HyP1hKuY3d8IDkp4
         Jpr9RnIzIcxQtgPXAlipeuJ/jf1TcIoASWO3RVNuV7yFrCi5Z5+ZowXudDj5mzbbrOBL
         3uzJSUrQXZrQ8DTHiIg6YmCo0Rcca7ZrT60FvBk7PGy4q9fdJP2srlVlns0C+P7nSf6F
         +nzZNiiqwwYWJVRlMt5fioX9KSDar7eGzSHRYDKmkOXWIlZ1MFsDY89hieUz5Zt+8eFI
         0VjP2+Z9sRzy0ViNQmR2l0dSEodXtr50OzrDGhTugFupUf+GlrMu11fLfqlIADDpml/u
         tIjw==
X-Gm-Message-State: AOAM530cAZdLz0sGPIaNJ+w/9pojP4q9wuFCubEY3K7+AQWK/5qmtNft
	0+d+Xkt2V1R5GPqPd4AMRWXAJerYMNnZ0g==
X-Google-Smtp-Source: ABdhPJwV/mk24b7HzwCARsLYI+Uo4p9XwOqDyITWRTfj52j9XOqZOI8/cbThu0w8vNK0n/1cCxZjnQ==
X-Received: by 2002:a63:105d:: with SMTP id 29mr3718787pgq.45.1619099555224;
        Thu, 22 Apr 2021 06:52:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e183:e120:a0a1:83e4? ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id 15sm2526796pgb.61.2021.04.22.06.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 06:52:34 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] fix(libupnp): apply cve-2020-13848
To: Andrej Kozemcak <andrej.kozemcak@siemens.com>,
 openembedded-devel@lists.openembedded.org
References: <20210414082721.32763-1-andrej.kozemcak@siemens.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <8646375d-35b0-5917-a6d9-350446492ab1@gmail.com>
Date: Thu, 22 Apr 2021 06:52:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210414082721.32763-1-andrej.kozemcak@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/14/21 1:27 AM, Andrej Kozemcak wrote:
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../libupnp/files/CVE-2020-13848.patch        | 56 +++++++++++++++++++
>  .../libupnp/libupnp_git.bb                    |  3 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch b/meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch
> new file mode 100644
> index 000000000..8a90942fa
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch

Patch missing all the needful as defined in the Patch Guidelines
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

- armin
> @@ -0,0 +1,56 @@
> +diff --git a/ChangeLog b/ChangeLog
> +index 4a956fc..265d268 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -2,6 +2,12 @@
> + Version 1.8.4
> + *******************************************************************************
> +
> ++2020-06-04 Patrik Lantz pjlantz(at)github
> ++
> ++	Fixes #177
> ++
> ++	NULL pointer dereference in FindServiceControlURLPath
> ++
> + 2017-11-17 Marcelo Jimenez <mroberto(at)users.sourceforge.net>
> +
> +	GitHub #57 - 1.8.3 broke ABI without changing SONAME
> +diff --git a/upnp/src/genlib/service_table/service_table.c b/upnp/src/genlib/service_table/service_table.c
> +index 98c2c0f..f3ee4e5 100644
> +--- a/upnp/src/genlib/service_table/service_table.c
> ++++ b/upnp/src/genlib/service_table/service_table.c
> +@@ -300,12 +300,11 @@ FindServiceEventURLPath( service_table * table,
> +     uri_type parsed_url;
> +     uri_type parsed_url_in;
> +
> +-    if( ( table )
> +-        &&
> +-        ( parse_uri( eventURLPath,
> +-                     strlen( eventURLPath ),
> +-                     &parsed_url_in ) == HTTP_SUCCESS ) ) {
> +-
> ++    if (!table || !eventURLPath) {
> ++      return NULL;
> ++    }
> ++    if (parse_uri(eventURLPath, strlen(eventURLPath), &parsed_url_in) ==
> ++        HTTP_SUCCESS) {
> +         finger = table->serviceList;
> +         while( finger ) {
> +             if( finger->eventURL )
> +@@ -352,11 +351,11 @@ FindServiceControlURLPath( service_table * table,
> +     uri_type parsed_url;
> +     uri_type parsed_url_in;
> +
> +-    if( ( table )
> +-        &&
> +-        ( parse_uri
> +-          ( controlURLPath, strlen( controlURLPath ),
> +-            &parsed_url_in ) == HTTP_SUCCESS ) ) {
> ++    if (!table || !controlURLPath) {
> ++      return NULL;
> ++    }
> ++    if (parse_uri(controlURLPath, strlen(controlURLPath), &parsed_url_in) ==
> ++        HTTP_SUCCESS) {
> +         finger = table->serviceList;
> +         while( finger ) {
> +             if( finger->controlURL )
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
> index 339c07cd9..828e351be 100644
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
> @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
>  PV = "1.8.4+git${SRCPV}"
>  # release-1.8.4
>  SRCREV = "d5a01fc9895daae98a0c5a8c7d3afce46add529d"
> -SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
> +SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https \
> +           file://CVE-2020-13848.patch"
>  
>  S="${WORKDIR}/git"
>  
>
> 
>

