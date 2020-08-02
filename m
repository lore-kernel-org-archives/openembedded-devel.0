Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.4919.1596351410338057897
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2020 23:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQyuQLci;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id s23so26097860qtq.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2020 23:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TWOfLlE2AtncW1MaW+6K5eTfXjpUSen3chvylEEs21U=;
        b=TQyuQLciOO6rSSoqtCxM4XaQ5a8LsQ9e7+Je1E3K81BvpkyJGIbgHSipT1chMioXLS
         Ua+kfNvGFbKXJ789WSjZH4mium3AwGYViLSv36w1c7mixnWb00sI6FNuoaIpBTtJ82td
         ODfYpigQlkAsTf+3fyDk3T32A2A1rKi4LI4NT2POBm6XGX/IqZneEX46TFZB8yMWuxC+
         DCWlLBVn3N0eVAKRgtRlXQna3uWD8ziJKhoh8AW+657Hk9dOFhlQVQFQUZpB0f5zG0ZB
         4uMZpIMeznNMxltoCw8D4OIx0g7wgWICDzG7ZAoLdUad18RIpjyzfKtdzsbw9VvCwVJH
         ZKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TWOfLlE2AtncW1MaW+6K5eTfXjpUSen3chvylEEs21U=;
        b=Zt6DuOI5tr9WZigi5qMv9YYPc6oypcH9XltLqOMSslqFkyR6VtpQgwf7wRlmcJS16x
         1k28sHTIZGfo2JastP+yk5fYEMCDCqcI70W0uxkn8OQWyGSLycy8aEMz8ZHk7cgQdm0O
         9ClSZ1QDrDggPh6IQgZT25MOgeKvhnj6+3Ns/+EHQltk8YDc9ofj/6MocsZVg4H8VRg0
         4LRFzmsUCHvjPI3PUkR5FvKkt9h1bAQQ15j4laPFXKEYHbuieWEP0efsTsKVADH7Cy2E
         5SooQN5lmG0X8GYDUNAKjS1rCQ+AamO4lEijMOgTXDTDM6r11Yob3xBJXR8Bp+Ga6jGQ
         1HCw==
X-Gm-Message-State: AOAM533KlbnlUH+/LKezUpAMayFYojCg7kPA9d25Fe0YcZrzFxD0z1G5
	0rzjDne2iwD09kluEpC4DBa4mI/0sS5FbpNGujA=
X-Google-Smtp-Source: ABdhPJzHfZoRJgnBy+NK/isK6fDhlN+Qqbm5m3pjlbbKJABMYUAaqMSquuwymayKxnvoDWAMKZeaDsJW47zlP6rHhIg=
X-Received: by 2002:ac8:4097:: with SMTP id p23mr10738389qtl.316.1596351409351;
 Sat, 01 Aug 2020 23:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <1596228160-6530-1-git-send-email-zangrc.fnst@cn.fujitsu.com> <1596228160-6530-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1596228160-6530-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 1 Aug 2020 23:56:23 -0700
Message-ID: <CAMKF1srgVcmMF4UuYHf=arvD9M0nV9iftoQdBLi2GDqiO+yGxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libmicrohttpd: upgrade 0.9.70 -> 0.9.71
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This upgrade needs to rework depend packages since version 0.9.71,
callbacks must return an enum instead of an int.

See systemd fix e.g.
https://github.com/systemd/systemd/commit/d17eabb1052e7c8c432331a7a782845e36164f01

also see https://lists.gnu.org/archive/html/libmicrohttpd/2020-06/msg00013.html
where it says what the change is

Currently we are failing in jsonrpc package see
http://errors.yoctoproject.org/Errors/Details/427173/

Please take a look and send a fix for jsonrpc I will hold this patch until then

On Fri, Jul 31, 2020 at 1:42 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{libmicrohttpd_0.9.70.bb => libmicrohttpd_0.9.71.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.70.bb => libmicrohttpd_0.9.71.bb} (86%)
>
> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.70.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
> similarity index 86%
> rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.70.bb
> rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
> index 94976d2e98..2bd8148e3f 100644
> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.70.bb
> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
> @@ -8,8 +8,8 @@ DEPENDS = "file"
>
>  SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
>  "
> -SRC_URI[md5sum] = "dcd6045ecb4ea18c120afedccbd1da74"
> -SRC_URI[sha256sum] = "90d0a3d396f96f9bc41eb0f7e8187796049285fabef82604acd4879590977307"
> +SRC_URI[md5sum] = "c7e230e9b899282b43d9a9faa41e893d"
> +SRC_URI[sha256sum] = "e8f445e85faf727b89e9f9590daea4473ae00ead38b237cf1eda55172b89b182"
>
>  inherit autotools lib_package pkgconfig gettext
>
> --
> 2.25.1
>
>
>
> 
