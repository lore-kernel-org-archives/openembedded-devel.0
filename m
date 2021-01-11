Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.38033.1610387367058422428
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 09:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KOYEGgPg;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id 22so237941qkf.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 09:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QBDSxsQrkVagW2xdAiaBc6W9NLxEU8J2nBUdwlShzUc=;
        b=KOYEGgPgHaA4yk7pYqej8E0IAK8XMDwkIBf7RT02msK/HTD9wuQDp+866fYybbqIfn
         MtQboqIxjWV+GsoE8NPdB7Sd779ns9Gt/jna1ER3eLYb31TS9lXQ9XN6qB/fmnhTOPdF
         EIQFlVF45glYruKEd83jo2+dvmY26lGpvxWmWN9b+aQJsOXzLANr7jxqSSEeHOI3ggn0
         lbbkN58aIn2IzDVkH0SPnTfYmk4abM3Jp8ZxGUBv2Z+1IVakkRSOn7xrcid3JxQ1f9vl
         Snt1E6O6qwCFnCmZhYs7+ZXAaMO1uHEZWDOFdV5q0Lxp8dAjM1isDMQceuSblSMbcE2m
         UuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QBDSxsQrkVagW2xdAiaBc6W9NLxEU8J2nBUdwlShzUc=;
        b=XVMKGY6JK/37Js8zhzhUHZDRoEDtJzMx3SZ85TQ3xM6CxgMLfzujNsF9nPyEErIpio
         W6SuF0OutQax6P1qrcUaTBb8fcyL2veycJZRmd9yqA3cBeCBag04s8Lx83Ya5Gay79p3
         MXrJzQu12prwTyNXb32NAytmwy6CM2PwdAjWBaPyEtZP9nxSbHsvnUwtw4v7MN6qN+/S
         KvGktUWRgSPU9HyUuo79mv33QxLUHtv8c3ZYj1+f7YsrDsr0i9lhrpHpQCDhYO7pl/kn
         nVTiKgvhsbPPRRlw9NXnLGJ3+NvvEr1SDKDV99YLBa5/kD0G5LyKdYE7jMCWWC64FXif
         yChw==
X-Gm-Message-State: AOAM53123QzL4wxD1cHOzKnpwZkPZu/9Kf/6nssf6GvrDXnk+wq9e4Lr
	4lF+hpYB1gVPb98K7HBNmOth6UBqul5iHdyp7ik=
X-Google-Smtp-Source: ABdhPJwy7DvOssx7Z5/QXI9fVUb/fwUwlII16AnK08DMvnkMB4QfP4twAtjqJ+s7mTZ5t/vzjzmvF3Z1xwHG7f0v5xs=
X-Received: by 2002:a05:620a:1139:: with SMTP id p25mr444449qkk.9.1610387366199;
 Mon, 11 Jan 2021 09:49:26 -0800 (PST)
MIME-Version: 1.0
References: <CAAfyv35iGwiKWorpEthr_CCDj_dVQUT0PW6MacAA+4k3h=foWQ@mail.gmail.com>
In-Reply-To: <CAAfyv35iGwiKWorpEthr_CCDj_dVQUT0PW6MacAA+4k3h=foWQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 11 Jan 2021 09:49:00 -0800
Message-ID: <CAMKF1sryLZF-Qx2UDXCFpguOi4Yd3AVVR3KV+4g-QUoskL-SCQ@mail.gmail.com>
Subject: Re: [oe] nodejs complation fails on dunfell
To: Marek Belisko <marek.belisko@gmail.com>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

you might have to add -latomic to LDFLAGS

On Mon, Jan 11, 2021 at 5:18 AM Marek Belisko <marek.belisko@gmail.com> wrote:
>
> Hi,
>
> I'm trying to compile nodejs12 from dunfell branch for
> raspberrypi0-wifi and getting following issue:
>
> /usr/include/c++/9.3.0/atomic:254: undefined reference to `__atomic_load_8'
>
> For raspberrypi3 build it works perfectly fine. relevant flags are:
> -march=armv6 -mfpu=vfp -mfloat-abi=hard -mtune=arm1176jzf-s
>
> Strange is that nodejs8 from rocko branch works fine for
> raspberrypi0-wifi. Any ideas?
>
> Thanks and regards,
>
> marek
>
> 
>
