Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.4018.1587451658545282514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 23:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=PlniBCfw;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.65, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f65.google.com with SMTP id f19so13885979iog.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 23:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1Y6lH3dw2z6GWtLubXD/+Lo7JNSBe1Xr3fIfpbmbLe0=;
        b=PlniBCfwW6ucoyY9PMSoig9nXY47VfBy92y2zcd7J9b4tvNoydQ/lp5K8+tXs6aQ44
         a460LFEjFQdwJexiRux6g874aJz61xYOpMLEj/JQo0zla/RmA/yFlCrD0JV+fE5YL+Pv
         Mh+qBCl24dvgeXM90Tohp0FtTWJaY0DwzV3bWRT6PqoXM5Fk36JVluiKsFpTZkgK/CXv
         9InjfoFS22WueTxarF8xPMNFIO7KaI63inWcp6eMMjCZxabv2aSZ+qlwtXo1NmgZ3w93
         /mA7SGu2Y+e0pmO34oudMkOLGodaLN4Fb4jlaESqV2x2KIJWyNxiRYNR5KRjRdNAl/Bn
         RUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1Y6lH3dw2z6GWtLubXD/+Lo7JNSBe1Xr3fIfpbmbLe0=;
        b=NjOKMfhthfPiTKenPfxXXDpGdHA0Qva7S8Q6vFA60XfK1QNbDAxj90ddWToVYqWRSk
         KwjqTaspWp0CuqFSP8zdYF12NE2toYw+xnRjibRhIPvQ0L2qDrzVk+bBjg3528S6IlxL
         EDTYRhflu8ZoxbN5vCMniLK6iMB+FP64K07Kc7kpHU5Lk7JB7tFPL+7cellOyvHPGYfA
         LylsfGpHNh/3XGmLH0i97nfMlkRu3MVou3CWeHED3AOHNItCzlA3Jxwr4x7IyPRmcvB0
         RHXWPMwyHcGdbULP1Gi5abFMaCm33JK8RYPNT/AKw6GUoT8OZTnpY+rAEOvwB019PZPy
         Ll1w==
X-Gm-Message-State: AGi0PuaJp3QvlcAijnYJUuFOLVvvgefZvZzPlh6Y+CkJwqkhjR13yaiH
	jahXIvoEzFUUmoutqYmhq0nj/5t6zTzNFEN4z7Mf4w==
X-Google-Smtp-Source: APiQypIOZGYi23opTA2HxG4WNhR8deneGyo7nnjVBXbASvS7QoJ3+C+TJ21pj1V6KsEndJzvoCJlYwKyDQ16IGNp0vI=
X-Received: by 2002:a05:6602:199:: with SMTP id m25mr19294528ioo.13.1587451658053;
 Mon, 20 Apr 2020 23:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200420070739.29557-1-brgl@bgdev.pl> <CAMKF1spGCjO2vc0GaCOkUwZMRmTUwmrzhw9KsdH0WeWFMzDTdA@mail.gmail.com>
In-Reply-To: <CAMKF1spGCjO2vc0GaCOkUwZMRmTUwmrzhw9KsdH0WeWFMzDTdA@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 21 Apr 2020 08:47:27 +0200
Message-ID: <CAMRc=Mfn+B2C26NhJ9Lyda_WhfFN+5n5dAwcXNyAS+9SAjZ0NQ@mail.gmail.com>
Subject: Re: [PATCH] doxygen: update v1.8.17 -> v1.8.18
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 20 kwi 2020 o 18:59 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
>
> hmmm I am seeing
> http://errors.yoctoproject.org/Errors/Details/405970/
>

Indeed, I should have tested the native build too. I'll resend v2.

Bart
