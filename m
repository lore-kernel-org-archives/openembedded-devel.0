Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.6474.1587401953506989768
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 09:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j0ortJIz;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b62so11390329qkf.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6wURsZH58aeIG8wr7We0gOc6AUzSBJ8p8JOKYkUu7VI=;
        b=j0ortJIz1+K5wgISRt28RH1eJnfs1KhIyaIcdztOu/CfCTfdCw6rOTvRicQ/B9mjb/
         7mXAI2OHncm4Y8A3ygry+Heq0bc1wNPJUz0FPTJfoRJtSp7+/MCiWytnHuHzeC4Z3CSB
         cpKd4QjwjUyYudjuYYv/fRdd9utAMd21mEL0Sxue8dSM1gr6UKXRTCT4XDv25cNM26xc
         x528/Fss+q9V9xX+XUFzJzDO0GQSvqtjfhHe6BHjS7e57Y69dRkzUYnAI9sanYikvAds
         Twbu1XA0Vt2XfdVxSotRMRIrEYP9GibZxSVeEG837GShkrXScQOpYNVNgRMT+rCOhn7T
         mHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6wURsZH58aeIG8wr7We0gOc6AUzSBJ8p8JOKYkUu7VI=;
        b=Kg4htrZ6YgIruyzsrLMLdWw6Sv/KY1IiUTAkzV72GT6I8OgXi8iEQ5e/dMn27gimzF
         4IFaFDSqqMj1pekz7ejYyRYV7xVNmi3J7+yS8hVkq/Vc1yoz7ic/mTvMx2zfF/50CiZi
         35iHDVTu1qAeU7104tfAkI+bZqwYj5zbjGuia73eW64QoQ21UsuRMLRvRX6MXm43FXVm
         LsFXjCUZTFJvql3ANBRYclo/6e+ReRsBnZo3Q2WQSSMHzJoYNrqFWI2SgQNxfNrJeaTB
         rsN2fhyYm6R7w0Y6aSty3jy1WA5GZ5ZvlybZriY18VNlOjLcTAzqUzRkAyUOZwdZBTS4
         sNHQ==
X-Gm-Message-State: AGi0PualB/x+brWzP0FjeB5gMn2l6C1sIe3oJBC7nKt220e0vePFODxL
	CnvbEAymmBzAMPYmuU423P47UuR6fMMj8DI4M5Y=
X-Google-Smtp-Source: APiQypKYiMxJyPoYtw7HoBUuCYVzHSRQyiOjFh12Nij9ytmRqPRZegDhhYPz+J9vNvbTogZKIZevmwheA3ZjQpcW3jM=
X-Received: by 2002:a05:620a:16aa:: with SMTP id s10mr16785782qkj.225.1587401952452;
 Mon, 20 Apr 2020 09:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200420070739.29557-1-brgl@bgdev.pl>
In-Reply-To: <20200420070739.29557-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 09:58:46 -0700
Message-ID: <CAMKF1spGCjO2vc0GaCOkUwZMRmTUwmrzhw9KsdH0WeWFMzDTdA@mail.gmail.com>
Subject: Re: [PATCH] doxygen: update v1.8.17 -> v1.8.18
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

hmmm I am seeing
http://errors.yoctoproject.org/Errors/Details/405970/

On Mon, Apr 20, 2020 at 12:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Upgrade doxygen to the most recent release.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb} (79%)
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
> similarity index 79%
> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
> index 45de71826..f3562b54f 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
> @@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>             file://0001-build-don-t-look-for-Iconv.patch \
>  "
>  SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
> -SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
> -SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
> +SRC_URI[md5sum] = "eda8e82fcc58970894029b0399776cb5"
> +SRC_URI[sha256sum] = "18173d9edc46d2d116c1f92a95d683ec76b6b4b45b817ac4f245bb1073d00656"
>
>  inherit cmake python3native
>
> --
> 2.25.0
>
