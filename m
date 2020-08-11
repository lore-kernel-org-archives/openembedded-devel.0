Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.3732.1597187080654913436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 16:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pk4R8AZt;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id o2so206159qvk.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 16:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1PpWYtVW9o9MqnioytSt01tbjbw1ImZijyWJMQ87y9o=;
        b=pk4R8AZtibXFumcjLMtxFTSK+VXgY8o2CXy4WDTSD6gCy/tN5dUAb8oY6jMesugSCe
         R2md7/ZLWDG4RY3Wp+1Ku1+UNCdbkjU1oBEdRdT4ZAREjHeo04a/W6MkFnoKb7vCK5Fm
         REG6hDtadCfqwQKPWkZS/i02SucpRvtyAbb4sM0QfDIQhKIUi3366oZ9y6x9K33Qk5Ru
         ctWeCShsq/ivVQsrtFlSPqPwGJTLANvFfkqWA5o5O/Iy03NslarBAb6MxDIPpDk1IsDG
         tRC5E1oshWa+Om0i2RubryslbbWTVj2vQavWiV2YU6ey8sEn5g255fZPNmhaDhF1iF4k
         YwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1PpWYtVW9o9MqnioytSt01tbjbw1ImZijyWJMQ87y9o=;
        b=aKYaGMvGN9uMn8qkahUo+nLHWrlAKBXVwAmjxHWvZy2zAYlvxkCnDh0l3a+FsbnOVJ
         cs6N4JRAPwYAxF+s6QZFwSuWMhsJrRtrrnMjcM85hp/lSNVDmlG5Y+MRqxv6iA89/GwO
         +Kn6s6txh4LioeZOl8G/+ldbiQzDWoOVDmiUsu2YGL7VWyGfcXEubk5ZiKaMSMefKGfx
         R/c2UKQDzBNjnPn8OivpVSyaP3sYwFz7pQLn8UXdyBoOB6iqIyElfMrV7f+f0cYL6+4y
         k0+Q169VRm+NgZKZCvO9MM9nzdsTkhYBYdWJIp5LS9iMNCv0qdnTMKHzmcihektvzwDE
         DWsA==
X-Gm-Message-State: AOAM533XU378IlNZBtTYKHl/8BMuvHH4Sl11QP4sROhyzzKKotUdDdVV
	L/l9LQXWOSDwPT9iLYELoeITPG1/bH1PLf2gXbk=
X-Google-Smtp-Source: ABdhPJyrg9JgQLdZkLEvCA1++Ol1P43szJSdH3vzktohkzeur+vGc7vYAg29foU9+lzXYhoCbFMsRFtUSzupKn9bPBQ=
X-Received: by 2002:a0c:ff06:: with SMTP id w6mr3919084qvt.61.1597187079744;
 Tue, 11 Aug 2020 16:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200811210229.93989-1-joe.slater@windriver.com>
In-Reply-To: <20200811210229.93989-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 11 Aug 2020 16:04:13 -0700
Message-ID: <CAMKF1sqUt6+-5AhPB1j8LtQgY0=gjAm4jNoXEx5txCChr0xzMQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] mozjs: specify TMPDIR
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 11, 2020 at 2:02 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Although it is extremely rare the following type of error
> can occur during configuration:
>
> Creating `/tmp/conftest.i53clm4z.cpp` with content:
> ...
> x86_64-wrs-linux-g++: error: /tmp/conftest.i53clm4z.cpp: No such file or directory
> x86_64-wrs-linux-g++: error: /tmp/conftest.i53clm4z.cpp: No such file or directory
> x86_64-wrs-linux-g++: fatal error: no input files
>
> So, specify a local directory as TMPDIR during configuration.

Do we know the real underlying issue ? it's not clear to me from description

/tmp is always mounted on linux build systems so I am assuming its
hitting some sort of race condition
since /tmp is mounted using tmpfs it might be more evident since its
faster whereas when its pointing to custom
dir on HDD its hiding the underlying issue.

IOW how is the problem manifested and how is this patch helping ?

>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> index f13a184..629c652 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> @@ -100,7 +100,9 @@ do_configure() {
>      autoconf213 --macrodir=${STAGING_DATADIR_NATIVE}/autoconf213 old-configure.in > old-configure
>
>      cd ${B}
> -    ${S}/js/src/configure ${EXTRA_OECONF}
> +    # use of /tmp can causes problems on heavily loaded hosts
> +    mkdir -p "${B}/lcl_tmp"
> +    TMPDIR="${B}/lcl_tmp"  ${S}/js/src/configure ${EXTRA_OECONF}
>
>      # Make standard Makefile checks pass
>      touch ${S}/js/src/configure
> --
> 2.7.4
>
> 
