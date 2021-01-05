Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2116.1609830385553419056
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 23:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mRC6qOQu;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id be12so15882426plb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Jan 2021 23:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WppMMDCcREVRIILcSTV+vM99CypVG2MxFDwXb3t0i2k=;
        b=mRC6qOQuyMWmDryokTGiY5WvbmMIk8YDUUWMy54rQDzxLuK+DZDLo5wDZpjsJ8vt6b
         7uPDLQXXnbX0GY9BaXRfxNAsuSGdG7OL8P6dWkMNpK0MLDcMPvJDqa3vTNAPW/klFUwT
         2UafW/4iDeRzqD5a9uvy2YPAW62KS8TSe+OZPnxcsmQY0Tja0HXlELNB1DtEfUN4OKQi
         1DHumKq2IKs/AXQb09R6FT3ae7QYTs/iSH1dDDjO42OqtmmyW0IRPGD1//YmsBNSOOzZ
         hFrqWLe74e8Q7fQ1pMIIRdezPj1MxQzInE6YSUf2joISlodIZcCz0gEkd3NT7z1XzGVV
         Mhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WppMMDCcREVRIILcSTV+vM99CypVG2MxFDwXb3t0i2k=;
        b=q6tk6QcpSpxHxSy5Z6CwIPdPdUneN5qqCRxFMqC5VOZdpFJ4AF1rhxMUb8SrpbO5cy
         d4hBqFU73+39CYrtbW1I9xTnUzlzfkrjOukpAbuefbY6TMh+R0kkfm0eNpfbToEmiESU
         Qtdqi+H0nprIlWuvPQJoIPh7ns5pAVEh4J4JWs3Y+8IT5rh3ul5v+U1xLyO5tRGFeO05
         TGDnyYO/zSt4suhdHMXk8nEevMzIqQ04dZD6BgcB6MXpiK2/Ajmfabp8Dnr0cry+4wog
         ZX8w+7+afKKhJdHfwaYmFtTPcatjdtv92pCDPJrBXYtT87pIclN0745pSkD39b1y8Y2R
         XaZw==
X-Gm-Message-State: AOAM531LtkERJM+enMjHAXYEY7E2mwt+XiTMZnwOuF8vsOnhpjmfGfxK
	xHjQDqjbWDieoN/qDranow5WsBwYvPZkGLiME3A=
X-Google-Smtp-Source: ABdhPJzcDujBwBV8W8M4Zwg/VX1IqJ/mi65/uuV+bUbX/GOK1y/JB91uh0OJyHbcbGHXwStlLScecqT5U0E/K+63wUE=
X-Received: by 2002:a17:90b:2282:: with SMTP id kx2mr2710561pjb.77.1609830385156;
 Mon, 04 Jan 2021 23:06:25 -0800 (PST)
MIME-Version: 1.0
References: <1608278860-111600-1-git-send-email-zhengrq.fnst@cn.fujitsu.com> <CAMKF1sr+JqTfqs2KvSvfzQahPHmCA0JBySkGvNebxJQyHuqKjA@mail.gmail.com>
In-Reply-To: <CAMKF1sr+JqTfqs2KvSvfzQahPHmCA0JBySkGvNebxJQyHuqKjA@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 5 Jan 2021 08:06:13 +0100
Message-ID: <CALbNGRQmNWsu7Sf5O2k85bEw7R+5jzGGzmMVf4tKE=O5V78iJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] poppler: upgrade 20.11.0 -> 20.12.1
To: Khem Raj <raj.khem@gmail.com>
Cc: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 5, 2021 at 3:07 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Seeing this error
>
> https://errors.yoctoproject.org/Errors/Details/540475/

FWIW: poppler 21.01.0 has been released and from announcement it seems
they have been working on jpeg. Maybe it is worth to continue with
21.01.0:

* Maybe the error was fixed upstream
* Chances that patches do not apply on upgrade are fewer

Cheers

Andreas
