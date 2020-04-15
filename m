Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.7523.1586917895183099981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 19:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LvUAUhah;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id c12so1002523qvj.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 19:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qPN1ja47A34VwEw/fxJZD1DIkNFldIRuSmRWehSCB28=;
        b=LvUAUhahPoUUuszGjj5HIZwWxN3PFqP8NeCxZokc8OLkt85AI9KSRUeZg+qqzHTIa3
         PcRpwJkK6orTwIVgjdNyPtc7bR1q8hUWY20XejrhKylmKSVz5rVvWwP8BBdK0uuG7N+d
         fAufDiMFUCuE3+TOpfX2j/L6YvgmE0irtBgQgp5jYWwhDbrK0zOlSq2uCkksLPEYpUSS
         rmSl5cXfnecI0pdwXDSUSbO8moKB6OvJhtYq5NBSm0xdVDDhzRqOt9XqXOVG3U+/1lLI
         1A9roq2puzY1HhWxsyuwaL+mPs+Ybfx0/jHbfNeEgaI2oTDn8aev8Hvxy4I3sKA504y5
         xh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qPN1ja47A34VwEw/fxJZD1DIkNFldIRuSmRWehSCB28=;
        b=bbMAudXtMWcT8X974XO2dGlzpaMWfLBd4S38jw6F/T9csj5xn4Z7kv9RhidzIGCK4J
         JGgctxQr+FOGt1MHMm+9iAyoPdt9WNiizVVRdoAtJK6VouI+xXy4be9oN4LVt2dfQwWZ
         dPwBe/+tsTXz4u7wKa4KvOJE7I7g+dEgTZd4K6L7dBU90uLVJCW5bwMorvk9FSohON5a
         44NSz2nOCbyi3OHGVXpRKh0aVmh79uEafn0wzSA0Uv5ujbon82xuU6ZFp9m/tmkh/ZSx
         jjC4MoJRceKWSlyQSAAbjAzSAF6hlIfQodCUWXQRJiek7IyQr1vabcojjnB+dNzgsEzf
         iu4g==
X-Gm-Message-State: AGi0PuZ9BxXSv+dDxMuBhdkCewI7k94jRTvyLy0L0AvSpaQELTMEstG4
	BMhiZPOYMWKemb1gD6e6j3MzikbZ3jW41cuBkm4=
X-Google-Smtp-Source: APiQypKnKj85osQMMcJVdncgSEBIvyOr6QsTxJsRu1ZfB04Blb6I7IFEY1U8bdvk/eZuUYzSVY4jLI0ZvkcFoV2YY9E=
X-Received: by 2002:ad4:5448:: with SMTP id h8mr2974660qvt.23.1586917894176;
 Tue, 14 Apr 2020 19:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com> <1586939501-29659-5-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1586939501-29659-5-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 14 Apr 2020 19:31:08 -0700
Message-ID: <CAMKF1sqH7934+ao2TPo6OfTgnjPq=OdWKyhAjJx5=S9UEJ_BTA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-cheetah: upgrade 3.2.4 -> 3.2.5b1
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this is also a pre-release. perhaps we should wait until final release.

On Tue, Apr 14, 2020 at 6:51 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5b1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5b1.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5b1.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
> rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.5b1.bb
> index 05882d087..289b70298 100644
> --- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5b1.bb
> @@ -10,5 +10,5 @@ RDEPENDS_${PN}_class-native = ""
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -SRC_URI[md5sum] = "8c0ac643263ffc3454fb321342284d0a"
> -SRC_URI[sha256sum] = "caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b"
> +SRC_URI[md5sum] = "5c07ebe4a31edf605a5ab2172bfc411c"
> +SRC_URI[sha256sum] = "52f4abe6cb862fbc6047ac17dc3d7b4bb0faf82621fe911fefbb04b7a5d5a7ee"
> --
> 2.17.1
>
>
>
> 
