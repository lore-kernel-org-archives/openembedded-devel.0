Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.60.1614709157946646755
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 10:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WoXLoP7s;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id j12so14324111pfj.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 10:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ccyKX9kmOZbkyMUO1AvDIRNyn1GsCS98aCm0ZPX9ArE=;
        b=WoXLoP7s5lZga6oE2ANJ2tv+RTFR4JPxDtyvYgS5TuJpcvzo+3/hFE54R26iw9h4FX
         9hIeskHLY8v989raj5EfXI0e72gM4rAqQmIAI9guFJqvI+e2QMEZNOoWqyHO64guJbNL
         3bf0spMZ8vnJHXZJmgrdOIQ8ekrmEHSc4DA20GZjohwGik82ss6gWxDdLs1R6Ps0mSc1
         zUiPruTXIiNbLYWx8wt+sLjbjPm6DUNihyCWS+Nq9QQ1K2xO1yEbfK+DJ8FJaoeeLOHU
         YzVeBctwmbNzxynZvJDn4WQKkZtokQEpsYJV5tETqBDQQJiTB3xjLDbLhxlAhb7b1So0
         f3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ccyKX9kmOZbkyMUO1AvDIRNyn1GsCS98aCm0ZPX9ArE=;
        b=AT3g9aLhkC4fljGryMd977SmxJ3VJ45YC8To65SowduMwI8pWdsIKTe9m5ZbfffVX8
         /laUGFYayBZ115YDSIaMM9cZsrXmV2ov2OYtxm92mVVJJ0KfJlY3dIAkk8X6K7zBnv2v
         H5Ytn+OAnN3GPtBs0MaN+mqKbCYWR8QEwZum8Cp1cl4LDo/TdjMCmURloHKpAhq+J2mi
         VQh0dNBRMKqq/46BvRjZbWuhtznVvbttnOBVj+QvXHniBzyeBOMIKtj8ArG3RmpDIqC+
         +Omxqzc9BkGFVpLEmA191kjwEpwjkiP/G2yXq25keY0RmKguUFMoJvlBQkD9r1f16jcV
         /3ew==
X-Gm-Message-State: AOAM532aUm+7IM8s1a1sbJRVwSRZCXFVRdOpTIvJS1lioERlse6HbXD5
	bB6Mw4Zb73S94h7Zuda/Gs8=
X-Google-Smtp-Source: ABdhPJx4HQI41LnJj8jb4Grcsd89Jm91CVZNQ3/miQZydsC8o0b23NfL2oSyjprPu/LzOHTb3sBeTg==
X-Received: by 2002:a63:fd01:: with SMTP id d1mr18555656pgh.319.1614709157324;
        Tue, 02 Mar 2021 10:19:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:8991:b66:15e2:cd87? ([2601:646:9200:a0f0:8991:b66:15e2:cd87])
        by smtp.gmail.com with ESMTPSA id 2sm21142162pfi.116.2021.03.02.10.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 10:19:16 -0800 (PST)
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-aiohue: Integrate the hue control python module
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20210302163742.2047086-1-andrei@gherzan.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ee5bbb54-298a-bd09-7215-0951a1b6ab37@gmail.com>
Date: Tue, 2 Mar 2021 10:19:15 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302163742.2047086-1-andrei@gherzan.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

can you send a followup to add these new packages to 
packagegroup-meta-python as well ?

On 3/2/21 8:37 AM, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>   recipes-devtools/python/python3-aiohue_2.2.0.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 recipes-devtools/python/python3-aiohue_2.2.0.bb
> 
> diff --git a/recipes-devtools/python/python3-aiohue_2.2.0.bb b/recipes-devtools/python/python3-aiohue_2.2.0.bb
> new file mode 100644
> index 000000000..a2a7363f6
> --- /dev/null
> +++ b/recipes-devtools/python/python3-aiohue_2.2.0.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Asynchronous library to control Philips Hue"
> +HOMEPAGE = "https://pypi.org/project/aiohue/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +# No license file available but the license is specified in PKG-INFO and setup.py.
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
> +
> +SRC_URI[sha256sum] = "35696d04d6eb0328b7031ea3c0a3cfe5d83dfcf62f920522e4767d165c6bc529"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-aiohttp"
> 
> 
> 
> 
> 
