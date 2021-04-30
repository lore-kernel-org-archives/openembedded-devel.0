Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.4264.1619817352439976909
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Apr 2021 14:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k+L9XDVK;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id a18so28875501qtj.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Apr 2021 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9si6yHW1suywA/2+kJzTPYHoGl/dVluQURhipfklS2I=;
        b=k+L9XDVK2XhTJ0vkvYuv/AaZRrsuYi4JPtwZ/9c00bHtio7xkW6rKeMoGxvNSFcv2o
         FynUAXqq6vdJIrYkFkiBvU1BEBis4TVLjSfhHGQCsKjLIeNU3Vr3DXYcabxRSybzDXe9
         HWZYdO3BO19uHs6zmKYikztZpzLmOEAUW60PmK6HBPUZsv5aO3FTWCNJ5TPemvF+dWHp
         yqTjqLRxirgJSu/CDFszsScG0H/h8AopFi6d0hBoN0qKl9TcuM3MRQJHe5mEmhZU817J
         TMyGtGkfaW6J8XdFjRq6iBt/8GKK8RTCAIi4trHX7NxgIQSHXMdwGue+Ki5iZ3a/978r
         i83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9si6yHW1suywA/2+kJzTPYHoGl/dVluQURhipfklS2I=;
        b=oJk+UrSz3TAVPWHhqtwG036m76huzjPZFze+hCRxUL7upAyq9joOdz8PrrxCqGMUmd
         uN2Y75WYLK8TmIbPi/eeWyQbTQTcAxP3LLWcSIvokCxN8F7swoeqJ6HymXNva8x1mIXO
         zYDkd3Pnlp/mk8WdpZM7sPNpbWmD624vr7OyMxNUh6m0/+xOipyx3Z2AwAhYJlzQ5Pqw
         bwl7dQiLK8GU1g0m7Nxrcjd6Bz+eQfDJmQxOELwSovkFISYh7pGlLFdr43NL4JzWFESV
         OybtnW4jNxBOEx0bBYx0wdh1zY0J//D6LjjcXbsSs7f73+Q2Cm4BcL3JL04ABB7FQnm4
         8YLg==
X-Gm-Message-State: AOAM532aDUobQNdZGYeJ4ml8qwNvvukHFNztrdHWSIjt2Qx4U6D8bR3/
	n/qdNS3lXeXKhXkwhpT0aNrIqgjzeBqq5d4GiOQ=
X-Google-Smtp-Source: ABdhPJz2ocbCJ9xGfTR80mFZ2N2ZT5ZUpQXcSli9U+CxBjtkiReRl+O7HdnIDcNRJU1Tw4x8KPvmYOHHdhssp+XSRkk=
X-Received: by 2002:a05:622a:2c9:: with SMTP id a9mr6306579qtx.82.1619817351535;
 Fri, 30 Apr 2021 14:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210430194505.69750-1-m.glembo@gmail.com>
In-Reply-To: <20210430194505.69750-1-m.glembo@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 30 Apr 2021 14:15:25 -0700
Message-ID: <CAMKF1spEJt_CBdm1owcOVPR-5RRd_g86Ey11ybcxB8bw0Wv89A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] yaml-cpp: Add a new recipe for yaml-cpp 0.6.3
To: m.glembo@googlemail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Michael Glembotzki <m.glembo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

it was already added via
https://git.openembedded.org/meta-openembedded/commit/?id=4090ca3b5be48b4df4c526cf0b66bf02ee2a8058
if you have changes on top, please apply them to this recipe and send the delta.

On Fri, Apr 30, 2021 at 12:50 PM m g via lists.openembedded.org
<m.glembo=googlemail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Michael Glembotzki <m.glembo@gmail.com>
> ---
>  .../yaml-cpp/yaml-cpp_0.6.3.bb                | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb
>
> diff --git a/meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb b/meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb
> new file mode 100644
> index 000000000..cee2ea55b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "YAML C++ lib used to read and write yaml file."
> +DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec"
> +
> +HOMEPAGE = "https://github.com/jbeder/yaml-cpp/"
> +
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
> +
> +SRC_URI = "git://github.com/jbeder/${BPN}.git"
> +SRCREV = "9a3624205e8774953ef18f57067b3426c1c5ada6"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TESTS=OFF"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.31.1
>
>
> 
>
