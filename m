Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.573.1608141128005356172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BFWIIqpP;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id z3so17883940qtw.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Dec 2020 09:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOkd8R8KtfMKj3qpe/VBeHni4jtH4LxC2jXheK2XtCM=;
        b=BFWIIqpPqWacieBglPZEwNCvSib9BuWUiN4twcAAuHqwJ+CzBQ6AK0GRg+oOfxLpgu
         xLdx4LCK7Vj8SxsJB/CjG79hPhjZhmUYlJMHuH+DdoZHZ5BmZBU9zTR30Pk7N9Jd6GTq
         VFrjECCk7Mof93+cDklZwKZZj8zJHRkhQxglcziWE5zew7A7/JAXgbfHuXB92EzJ4hd4
         tQjdXuloYzbS5BHuRzoTIlXr5dfnQrRjQdQ8/TIDMqwAuTflwqFwd8D/xOOVA9Cbc1w+
         o23nhj1p1zet+ofCZgwomcfOoKxHWxk6l0fw6z4Jw65qVXWSz6UVBpSo3rw8Usq8y6xP
         HdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pOkd8R8KtfMKj3qpe/VBeHni4jtH4LxC2jXheK2XtCM=;
        b=Zw/pBA5ZJDCkO0cGX/WVZ10qG1fTZ+W+SRrbobylNluXg+0q2xhwIq6oO18Nsk+f9k
         f8OcxBP1tRfWnkB02jBhn3uAgqNDgoCHzWhHofFEhQAZt1xGVWF/FcAT9Okg3CXTYLHd
         SxWOSX8BkG+maHC4Ce5TVzZ2rul1evQhbxroj/bekQvpx00DxiwULJw+v/4wjLRfEplK
         UiVBBnFNHPTAYEx0O0WyhO98Vd+830WJBdaq2fOAiiJ2ZytQKZc6okz30R6TFzZHNm8+
         6d7bJsM5Aq6B2hFyEq3uAyBYqgXn128y/BbPD5LTgO6YQqvho55SkGTHhTpFs9pcrweW
         U67A==
X-Gm-Message-State: AOAM530OlJZrXxURMLJAjER8/4o8QMzTQn3/cQ0tH4H5OfX+2fLgh/YX
	aCAp32shC9RK2VkfZA5MZybscxQ//PTHfjN0j18wSkhHQxA=
X-Google-Smtp-Source: ABdhPJwg/saGaJgHwL8msa1MQtrZY4Vwozlf1DyluAwr1Ay7D13VzkcvlBz85Ipl/gNh2zc6VncrbnzMBRX/QQfg8jQ=
X-Received: by 2002:aed:2ec6:: with SMTP id k64mr44091616qtd.194.1608141126887;
 Wed, 16 Dec 2020 09:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20201215144850.23152-1-kory.maincent@bootlin.com>
In-Reply-To: <20201215144850.23152-1-kory.maincent@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 16 Dec 2020 09:51:40 -0800
Message-ID: <CAMKF1spZYVC7-1_mXmBeVFuRTdsh+MhqVmW6jk0idqUWF8vrtg@mail.gmail.com>
Subject: Re: [oe] [PATCH] ltp: fix rpc build error
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

please send it to oe-core mailing list since its oe-core recipe.

On Tue, Dec 15, 2020 at 6:49 AM Kory Maincent <kory.maincent@bootlin.com> wrote:
>
> Add support to tirpc tests build.
> Export incdir and libdir to have the right path.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
> index 7acf15b360..9b17d68f67 100644
> --- a/meta/recipes-extended/ltp/ltp_20200930.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
>      file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  "
>
> -DEPENDS = "attr libaio libcap acl openssl zip-native"
> +DEPENDS = "attr libaio libcap acl openssl zip-native libtirpc"
>  DEPENDS_append_libc-musl = " fts "
>  EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>  EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
> @@ -44,12 +44,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>
>  export prefix = "/opt/${PN}"
>  export exec_prefix = "/opt/${PN}"
> +export libdir = "/usr/lib"
> +export incdir = "/usr/include"
>
>  PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
>  EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
>  EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
> -# ltp network/rpc test cases ftbfs when libtirpc is found
> -EXTRA_OECONF += " --without-tirpc "
>
>  do_install(){
>      install -d ${D}${prefix}/
> --
> 2.17.1
>
>
> 
>
