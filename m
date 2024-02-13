Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF46C48BC4
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:39:23 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.7443.1707813557293944845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=iz59pF14;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33b2960ff60so2883339f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 00:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707813554; x=1708418354; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X9TIW80vyjvP54HPlXR9yVe0e4SVJPcgNm4iW3nf3hs=;
        b=iz59pF14t0I3w+6l4iqAXkNwHHe3z8bc/O9ZBl6lUe3+75DHYm9X+f8mFcz+z9ifat
         TL02m5s1QjRp1e2gnAFMGPjkV2MZWumm7L6elPCoi4eqDbRVGU2lY/9jhs9Bk1vMEwLJ
         jgYFMrpskuP0whAPhRdsv0aovvZA8wmcwVFvNByQvi5y5armwEFsglMwLC8zKzM1WVRH
         mMMdjxxUKoTY6QDe3AUJjjoWOsW5cYp1ZFN5zpaDSIw5T305i12j6nW/QoTpOt1SZYO+
         Nr4HkIn8MALHukgDKK3HVp9gpZzKTJReP9+jg91mfTXmCnS19/mwEUV1uKiEbGH/GmZJ
         kIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813554; x=1708418354;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9TIW80vyjvP54HPlXR9yVe0e4SVJPcgNm4iW3nf3hs=;
        b=DQgLVrb5WuwSPbuNR+MQ+J5fTUYx9Dknmvp8NEet1u7WhgK1GEprTXstegXip9Ogkf
         5o+h06pfOf/lblkWyWbJP4bK3chEZuM1lfK76NOUkJ8MEKtvQD4vzn9AXuWLIMtEEhT4
         oGsZPCU9XZZiuPx/ZcPq3NqkWf8cnTjSTYwJJTsmg4VWyOYAogp1ESQzlTUkCw6n/DW3
         ke5xVKSOm6DS1wW2utEcnejOe4mdlmTL5AdqYHEtMdqv5XSZI7fIXEVrmWLCjgFvz/yq
         Eo8JdvSXe/lEi6hfkbe+ZaHmMlDXhyzzInxtoSRNkSDTTvIZujlqcnZw+HbjyVRS/Hq0
         Os8A==
X-Gm-Message-State: AOJu0Yy7qzsvC0A7fmsDSpoSQpyp9cAoqF1BayCH3baySt+SSwrjRrCy
	dYUjnNi6MB1avk29SCIRKlcRD6ztZEH4eK4nDevEzAvxss5Z/yadSPd3Qkevt2fm5quDgKpbomJ
	1BqM=
X-Google-Smtp-Source: AGHT+IF7cDFUGkwj1uuIJAgebvXN9vzuUXOFPz5ixsucnB+NtUWei9zVU3cs6qqKfCSB+eGBYMgSJA==
X-Received: by 2002:a5d:47c7:0:b0:33b:58e1:d281 with SMTP id o7-20020a5d47c7000000b0033b58e1d281mr1998712wrc.32.1707813554432;
        Tue, 13 Feb 2024 00:39:14 -0800 (PST)
Received: from [10.1.8.13] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id z15-20020adff1cf000000b0033b44a349e1sm8888912wro.38.2024.02.13.00.39.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:39:13 -0800 (PST)
Message-ID: <cf8d7730-0e29-42c8-b125-38a9f60375f4@smile.fr>
Date: Tue, 13 Feb 2024 09:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-sqlalchemy: upgrade 2.0.25 ->
 2.0.26
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20240213064709.102285-1-alperyasinak1@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240213064709.102285-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 08:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108723

Hi,

Le 13/02/2024 à 07:47, Alper Ak a écrit :
> Upstream provides a pyproject.toml which declares the "python_setuptools_build_meta" backend for PEP-517 packaging and requires cython
> 
> Changelog:
> 
> https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.26
> 
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../python/python3-sqlalchemy_2.0.25.bb       | 25 ------------------
>  .../python/python3-sqlalchemy_2.0.26.bb       | 26 +++++++++++++++++++
>  2 files changed, 26 insertions(+), 25 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb

FYI, you can tweak -M argument of git-format-patch to push it to see the rename instead of the deletion/creation (in this case, -M10 does show the rename)

> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
> deleted file mode 100644
> index 35011553c..000000000
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
> -application developers the full power and flexibility of SQL"
> -HOMEPAGE = "http://www.sqlalchemy.org/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
> -
> -SRC_URI[sha256sum] = "a2c69a7664fb2d54b8682dd774c3b54f67f84fa123cf84dda2a5f40dcaa04e08"
> -
> -PYPI_PACKAGE = "SQLAlchemy"
> -inherit pypi setuptools3
> -
> -RDEPENDS:${PN} += " \
> -    python3-asyncio \
> -    python3-compression \
> -    python3-json \
> -    python3-logging \
> -    python3-netclient \
> -    python3-numbers \
> -    python3-pickle \
> -    python3-profile \
> -    python3-threading \
> -    python3-typing-extensions \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb
> new file mode 100644
> index 000000000..4aaaa1f22
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
> +application developers the full power and flexibility of SQL"
> +HOMEPAGE = "http://www.sqlalchemy.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
> +
> +SRC_URI[sha256sum] = "e1bcd8fcb30305e27355d553608c2c229d3e589fb7ff406da7d7e5d50fa14d0d"
> +
> +PYPI_PACKAGE = "SQLAlchemy"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +DEPENDS = "${PYTHON_PN}-cython-native"
> +
> +RDEPENDS:${PN} += " \
> +    ${PYTHON_PN}-typing-extensions \
> +    ${PYTHON_PN}-greenlet \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-profile \
> +    ${PYTHON_PN}-compression \
> +    ${PYTHON_PN}-asyncio \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-sqlite3 \

Maybe keep this list sorted?

Also, I wonder if the ${PYTHON_PN}-xxx pattern is still useful (IIUC, it was used to handle python2/3 compatibility) ?

> +"
> +
> +BBCLASSEXTEND = "native nativesdk"

Neither nativesdk-python3-sqlalchemy nor python3-sqlalchemy-native can be built:
ERROR: Nothing RPROVIDES 'python3-greenlet-native' (but virtual:native:/home/yocon/Documents/projets/yocto/poky/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-greenlet-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-greenlet-native']
ERROR: Nothing RPROVIDES 'nativesdk-python3-greenlet' (but virtual:nativesdk:/home/yocon/Documents/projets/yocto/poky/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.26.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nativesdk-python3-greenlet' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-python3-greenlet']
NOTE: Runtime target 'nativesdk-python3-sqlalchemy' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-python3-sqlalchemy', 'nativesdk-python3-greenlet']
NOTE: Runtime target 'nativesdk-python3-sqlalchemy-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-python3-sqlalchemy-dev', 'nativesdk-python3-greenlet']


Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

