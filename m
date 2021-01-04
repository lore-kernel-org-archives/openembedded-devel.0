Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.1726.1609789330442431647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 11:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N4HSRDkr;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id lj6so249143pjb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Jan 2021 11:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rfMqdH1KefHSSyWSVi/f8d3EJuxzi4Kb+aOYa3SkdGI=;
        b=N4HSRDkr+He7YmpFdd29l33A6XkDuePnmz0c0QPJuhAPUKY1FLU0hm9ZYA0mahJysZ
         3PfRI2kxiLj+rXNUGn+486liPjgwVb13WyHWjvFTt9wM0R4gtseU5VhcYPNPi7in8QoH
         aM4h7xKnPQYnLpaxBpoAY5dUcKARSy5gxJPuE5gKXmuTaJeDRXwrJn+mPI2g/gTxGq55
         dNzwV1JR2Q6Fiz+9V7FnUeyVBMzszYhzMQQbEFPvObRHnPWYwetjxz4SyDAeRQgrQZCJ
         1ZXLJUQ09kGZa/z1JmP1CyfPREG2UhfHNEEWreNjpLVKciUwOKdvmo0lmjqV9q5ovNX3
         ztIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rfMqdH1KefHSSyWSVi/f8d3EJuxzi4Kb+aOYa3SkdGI=;
        b=BvYST743+6tgBxBpX6ahNrQDLiP0AHV9D9XgEX/iH1hUvbf+k28ZXFoL/qGTB57N+Q
         av8tFX1BKtDIF8AmObfYxlIJPI1K/j5eSg+pAYo96RK3/YmFnPBc4zWQvGtJF2yJ4pDP
         cHlKEdpCVRxQ8rQ27nMT4APJjUuo75B7j0KGU5qzdN9Ny5HNNTGYQhJLb6Lq8A8TRyDg
         KVmsIEJXPSirDytjXWullbm2AEDF6MD9rO1yZbWD6P/g/G6wA1e3qbLg/JwaZdT5FCSs
         LCmIoxBaM5or001slnWUgc/ytvgablbjshOiH+hgG/CgNaM0a6S63HT6++YN38PSrNyh
         RTOg==
X-Gm-Message-State: AOAM532Wso/X0lyuu4spFLWJ2yelgJ84fkQxGQUxR1n8TtxyBqI8L43K
	0Bk3gmhUPzjNDb5zzeRaFSikhgLC3m0czU8jy+M=
X-Google-Smtp-Source: ABdhPJw2GXRyDVdHRa3WKYAgKJimeB1kcOB/V+ekeDs7YIHbGOPSdRMj0DeUQg9SOLIZjzIJB2S5PU4+BSDqAvJGLxc=
X-Received: by 2002:a17:90b:2282:: with SMTP id kx2mr406227pjb.77.1609789329930;
 Mon, 04 Jan 2021 11:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
 <20210103141247.1637618-3-schnitzeltony@gmail.com> <615e622d-7e4e-561a-ae75-a5c0d3186b69@gmail.com>
In-Reply-To: <615e622d-7e4e-561a-ae75-a5c0d3186b69@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 4 Jan 2021 20:41:58 +0100
Message-ID: <CALbNGRRACokX9qvatUo0izaoo=BmL_qhdbWatzoxT4Ombeb=xQ@mail.gmail.com>
Subject: Re: [oe] [PATCH][V2 02/16] xfce4-mount-plugin: upgrade 1.1.3 -> 1.1.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> it seems fstab.h header check needs some extra checks its failing on musl
>
> https://errors.yoctoproject.org/Errors/Details/540467/
> https://errors.yoctoproject.org/Errors/Details/540468/
>
Hoped musl builds not necessary for me this time...

OK - Will look into and come back

Andreas
