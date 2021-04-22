Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.8375.1619069210077307797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Am4LVjzd;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso323368pjn.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Apr 2021 22:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vQm1f8oYAvkXHJp3Nr/eyLaeYcvlGig5DpzUR1F6l6E=;
        b=Am4LVjzdQsr4ALvoxSdSdGNbbonsbSwSc726Ki/FvzK7iqC6t9/GlQteqLiAan6MFt
         /DO7zfqTTBvFbRf/0yLKDhXDongC4iZcVx30K71sUbNTDCEvVN1JmPu3UbKOMgImRg6i
         WGwo9bOWms5yt5CJf1O+PuZ2QAU8cgzg2pTEoODeSTjqveLo5sbdz5ZLNFmGFGWuiVoz
         rYRQoSwbTb0LJVIpjOWiDvHMUolnlQtzTNiq4QuzpImMp8NAbX1af5p7JT/J7IT+J8SL
         GxNJBeEodhwZkYaMKxH+KUL19I71U7bAdfOUjBazssmbWhvihG7uM1jZPOouvk3HJLye
         aFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vQm1f8oYAvkXHJp3Nr/eyLaeYcvlGig5DpzUR1F6l6E=;
        b=fGrDCFqVvviC9cP2qrCsDuRDAsA3T5WzgrZ1yKtjNgp7eydW+u0vyQbR/FSqipQ4+L
         JE8vu3SnhLlKR84vLkj7vA8pRCF8tsUU8Xw6ioCdGY0kOCwhDCu+ndx3uVNnUZGda3O6
         FQiQOSZcE/9xCAuH91sJm0s4LkYZToF5eSdC/3y5NjS4oBckSZLPBd9V4ocfimMteSHf
         3NGnay/R5EY0LibRMebQ+BV6I8mIi0r6ejhbJx0Wz0Tqbc9mOYht0iZAf5BCxESvZswP
         2t1XS8iGHjJ9yzjRpNsiUVqnO5cduoFqa6bZz59j6SoKvcBiQtPGk/Qc1ODSXUipAQHG
         PAhg==
X-Gm-Message-State: AOAM5311QUpE4NZchzQFikxCGUaDtZ628/NYBhSMAQ8HiAL5kTQrRQV5
	p2+5DNaH20/7ni6KW+J/ZrrHDPKaH9iqHg==
X-Google-Smtp-Source: ABdhPJyGmE3unq0z/gP1eA3ps85gK1vc+0Zfr3DP8cX3p/Xdfrvd+qWbpvjbOazIRB2f7gLyOtXAVA==
X-Received: by 2002:a17:902:8688:b029:ea:f782:5eae with SMTP id g8-20020a1709028688b02900eaf7825eaemr1584792plo.15.1619069209200;
        Wed, 21 Apr 2021 22:26:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:68f4:e6f3:44c5:768e? ([2601:646:9200:a0f0:68f4:e6f3:44c5:768e])
        by smtp.gmail.com with ESMTPSA id k17sm929785pji.47.2021.04.21.22.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 22:26:48 -0700 (PDT)
Subject: Re: [oe][meta-python][PATCH] python3-django: upgrade to 2.2.20
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20210422045941.2319-1-Qi.Chen@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <2bbc38ed-9896-887c-bf83-2b4b91761d15@gmail.com>
Date: Wed, 21 Apr 2021 22:26:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422045941.2319-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi

Can you rebase it on latest master and resend please ?

On 4/21/21 9:59 PM, Chen Qi wrote:
> 2.2.x is LTS, so upgrade to latest release 2.2.20.
> This upgrade fixes several CVEs such as CVE-2021-3281.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../recipes-devtools/python/python3-django_2.2.16.bb     | 9 ---------
>   .../recipes-devtools/python/python3-django_2.2.20.bb     | 9 +++++++++
>   2 files changed, 9 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.16.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.20.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> deleted file mode 100644
> index 0715abbd4..000000000
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require python-django.inc
> -inherit setuptools3
> -
> -SRC_URI[md5sum] = "93faf5bbd54a19ea49f4932a813b9758"
> -SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2786594"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-sqlparse \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb b/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
> new file mode 100644
> index 000000000..905d022a4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
> @@ -0,0 +1,9 @@
> +require python-django.inc
> +inherit setuptools3
> +
> +SRC_URI[md5sum] = "947060d96ccc0a05e8049d839e541b25"
> +SRC_URI[sha256sum] = "2569f9dc5f8e458a5e988b03d6b7a02bda59b006d6782f4ea0fd590ed7336a64"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-sqlparse \
> +"
> 
> 
> 
> 
> 
