Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.987.1595965941002285348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 12:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PknOQP81;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id w9so15816095qts.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ROFUWpj5WOQZOqu5infhkv3cBKQ8HKrAgW/kvCP3Bvk=;
        b=PknOQP81Yb6HORHzdqqSd9Hc1PA2JlquHnaUWSgMWPHi7vmV39tW+nvxIwJ44qtPq6
         QbzfZR3bKf1uap64sxMQMqPvqvM9PuwkqD/M23SFVItbo00sC5SnETgUMVptL+sQrePW
         DEiG3P0ozpVd2ReZY+peqcDPFxqwo4vSjmBi5dqyFG47I4HmrAnZnjs4dT8dx5rOPBjq
         S6vcbAvDPnEebiN66s/Vj0QNcl0DLpxlNVccIDwwbwpK0TNfgXLRkBm55X33lEdlMaNJ
         ad/PJ/swtlbdqY+v80JqmjSboo8Eha2nSA60Jb3iKUPf08qxrDffsJxKu620pubRfbrU
         zVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROFUWpj5WOQZOqu5infhkv3cBKQ8HKrAgW/kvCP3Bvk=;
        b=ixa/UG1QWt+dFmEhx2rHTJzoSFjT3hBeyh2rz30jf8v/ksYSAVaomJhASWGB7Ik1+i
         590xgc9cBnpS8FQIKamXko2Clf0+a+AsiX3smVXSskpgWicN6Vc+8pdvBgwlFmtxamCb
         /7++NudbEY01OzVzaBzGZdonqCFsM7uT0ySVL5rXF1hLGvUBYI5T2ryn/VdezGp7lDiw
         DeexBm7LuQKQYl0w9GA2RtNLHsCLWSGhtPivEzMF0D59lzYshLxdQsXfDl5JJ7KM6a2l
         GrWuPaMCaTbxm+L924bRWPcfHpOHSCoBoN5Nit5gPGYK/dpigcGWtuXXJRJAc63V+fXU
         gr1w==
X-Gm-Message-State: AOAM533viu/3WXcRqRIMyubRf2NDbgJm05GuhlmeJXCUM+7qqqXYIeMG
	MIGNqbO/ylgMLexJPifG74uXfbWhkYUyAX80ZHE=
X-Google-Smtp-Source: ABdhPJzdBxQ/T0p5Fqal/ZR485/nMLNrClJLMYUVQOUhGbbO2unRJTWZEUBPIlKgfvbhatFREXun0eaeGYjhgPRJXC0=
X-Received: by 2002:ac8:1344:: with SMTP id f4mr7906958qtj.285.1595965939990;
 Tue, 28 Jul 2020 12:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200726005544.3645042-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200726005544.3645042-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 28 Jul 2020 12:51:54 -0700
Message-ID: <CAMKF1sr9c2WGQMyo-tnozq+c=wnPSmVmDfAgGTDbrN2EzB9w_Q@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] libpeas: update to 1.26.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this fails on musl

http://errors.yoctoproject.org/Errors/Details/425660/

On Sat, Jul 25, 2020 at 5:55 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libpeas/{libpeas_1.25.3.bb => libpeas_1.26.0.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-gnome/libpeas/{libpeas_1.25.3.bb => libpeas_1.26.0.bb} (80%)
>
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> similarity index 80%
> rename from meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
> rename to meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> index 57419a4275..888525e085 100644
> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> @@ -10,8 +10,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>
>  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
>
> -SRC_URI[archive.md5sum] = "08bfff8f9688cf630dcb0f950617661f"
> -SRC_URI[archive.sha256sum] = "1c9bbb29740c29cd6e1dd0c9964722ff08cd5e6f68f1b5c135bc391a6ce97639"
> +SRC_URI[archive.md5sum] = "f7723bf8433b7984121157e1e9a629b5"
> +SRC_URI[archive.sha256sum] = "a976d77e20496479a8e955e6a38fb0e5c5de89cf64d9f44e75c2213ee14f7376"
>
>  PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
>
> --
> 2.25.1
>
> 
