Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.9002.1628084473181731680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 06:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KjaqGirV;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so3626938pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=pmpxoeiTVcR2j88xeq89SO/TdM/Er119Tk74FXaBc2w=;
        b=KjaqGirVB2UGXrfByB8PCiTZwAsrz3860imbcwoFwOr5BoyOLMUzrXc24e3eeG51d1
         g3uSPcrWSTLxt20HXTYF9pHQgMxHKQlL8Br4IezW0Lomft8UsXqxKKcOegn6z5oY7TuQ
         omp3uea9SuaRfi6/5SuMWpIFV+0m78uDESXqf/5RJWDVKzAQx5aF82CAgIMk0/4zRVS0
         EAOtubvfZwfC1nIssYz7tny19Zoi2RD5fTK9nqu3ysh5fEHEKSkkf7WGOf4duuYeKBbR
         ojAKL79gVDxNEqeabFEqTtd6lc0mDF0yHDzleJ84amZ9NbY9o0k/ySnJJ5tX13Gu6nrY
         kyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pmpxoeiTVcR2j88xeq89SO/TdM/Er119Tk74FXaBc2w=;
        b=HywWKODEUTF6AfmanwahJNNjmyWrXWqQ+Dmt9rasR4LJv+j6S0Q4mYMOtwiBJNUhV3
         jJSm7AhS7wdpUOiGzchyC1otUTAriahTHqVCajcJECH/197nSbqTHGL4cd3pDBUgBVZ4
         pa5oA6sjo+xmOkCaBaGMinceFT1viP13riFjL/Ng4+tBpWLzrVV1Yoa4azd4HGkltmxv
         jAUjNN8T0lvyfkuv6jv+8laB9U7esRoCq8xE5OZn3qoGIqTkq2b1HRbxmA9f4yypqKjZ
         T//PkYk26pnxBGg074aA3tlOj821jbZezVcC4BfDOgMQfIgiJlMpYjs6Y9BI+pjZ1Nw+
         L3fA==
X-Gm-Message-State: AOAM533ZV5xLCS4yzhuj/850EKGgpNtzr6FeXyrq15oA54QusFKJqxj/
	jcB3QS8B9nbRf28IRoSUVf/I7l+mBRjrMg==
X-Google-Smtp-Source: ABdhPJzcAJ19ylPvuRvrwji2RHj7yoR1MuB97hrT9RHRQghEPKOfze44Xlq2ot+O+sUs4/SEiJrx9Q==
X-Received: by 2002:a63:1614:: with SMTP id w20mr2087979pgl.198.1628084472591;
        Wed, 04 Aug 2021 06:41:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:484:f8e6:e2bc:be7? ([2601:202:4180:a5c0:484:f8e6:e2bc:be7])
        by smtp.gmail.com with ESMTPSA id p20sm6171055pju.48.2021.08.04.06.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 06:41:12 -0700 (PDT)
Subject: Re: [oe] [meta-python][hardknott][PATCH] python3-janus: introduce new recipe
To: Holger Assmann <h.assmann@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
References: <20210804091900.7640-1-h.assmann@pengutronix.de>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <231c4f4f-4312-e562-595c-9e80de9fbd7a@gmail.com>
Date: Wed, 4 Aug 2021 06:41:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804091900.7640-1-h.assmann@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/4/21 2:19 AM, Holger Assmann wrote:
> Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
Adding new packages are not allowed in stable branches per process.

-armin
> ---
>  .../recipes-devtools/python/python3-janus_0.6.1.bb    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-janus_0.6.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-janus_0.6.1.bb b/meta-python/recipes-devtools/python/python3-janus_0.6.1.bb
> new file mode 100644
> index 000000000000..83630eceb4e6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-janus_0.6.1.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Mixed sync-async queue to interoperate between asyncio tasks and classic threads"
> +HOMEPAGE = "https://pypi.org/project/janus/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=23878c357ebb4c8ce1109be365043349"
> +
> +SRC_URI[sha256sum] = "4712e0ef75711fe5947c2db855bc96221a9a03641b52e5ae8e25c2b705dd1d0c"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-asyncio ${PYTHON_PN}-core ${PYTHON_PN}-threading"
>
> 
>

