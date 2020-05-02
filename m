Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web12.2599.1588413591300164521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2020 02:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sc0ySaJF;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id q10so6640703ile.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2020 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=HsO1zVROYDodkYc4IHOW5PAD17nKRXz4Zl4fRtls+ZA=;
        b=Sc0ySaJF7TXiDK45MsjbT+ue/EwsIK81JSUmuaz+4OOgg0vwcOaozfkX7Mn9rKn+qJ
         o1IvM5st645w8WlIPtaw0ksjLq+YkEFAXXlTVSO5yTTxFlGs97auVOM0lXN9wfy5VFCb
         vr54EcOwXLaYefrKEdFsk36X1OZagzAy5bq29fidhTk+UgM8MJH3ub1cGFDDw6DC2u2s
         Rnz2JpCCIs5pbECHVzGErj7OOP6d2DaeoR1y7G9RxpRjqp7sYBVX25CA+RkNPVHTxpGy
         p6FEgDdjGE1IZ2UQPL5T01J66LUl472K0xuncgm8eQAFZbyOWyW5XscYfzMJm+2ZXYfL
         j/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=HsO1zVROYDodkYc4IHOW5PAD17nKRXz4Zl4fRtls+ZA=;
        b=c/+awKh49HCo++NZXu/Q6O6D+L8ATF+sJmxcTivau+D03gs0Hfb6d343MTvb+//keU
         sS8nkq7z+HrjDei3jFHRjIYgNt+nJ0ax83R8IP/D4voEMOx1l1WJtHEBDvIvadRiZBZV
         kS5y4wObfxdPzya8sj4PVwVoUMWlpv5K4EGXFkMUwGCiodambdgJqVY50wMIMHZvjXPG
         qkvQcoqpw3hS83kU0O32pICQc18kHhNaP5r9iiW1KjLK7sDJFvKJLfub7khQaQw1tkaP
         L3D+9s86UQdK8syjiO+fv2JyiZQ+ZjYHgfdzvVQQGJJ9xa8xdNMCH7n05sAcsPcy7yrG
         f9iQ==
X-Gm-Message-State: AGi0Puap5cVMJT7YXD/P2TiYwtJXAJHHgX1hW4yywpJDKiqisQPYIzp8
	9pDnP9uiBvQLtJTbTD2D91nBh4coGFjTdXp8yPrSuyT9nkE=
X-Google-Smtp-Source: APiQypLLPk4hP2Ff08h5LHIlpx4GDjCpOq3zyDpDSv/zgkodfg/EIJijkLuHXWPsz1bKfMFE9Y3TdskI/a9OxFfJke4=
X-Received: by 2002:a92:cece:: with SMTP id z14mr7409350ilq.147.1588413590487;
 Sat, 02 May 2020 02:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
 <20200501113534.16030-10-schnitzeltony@gmail.com> <CAMKF1so0ve_FuQJafWSxtJ8Mz7M0vZkZNhd7oK76SEN4Xu_mew@mail.gmail.com>
In-Reply-To: <CAMKF1so0ve_FuQJafWSxtJ8Mz7M0vZkZNhd7oK76SEN4Xu_mew@mail.gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Sat, 2 May 2020 11:59:39 +0200
Message-ID: <CALbNGRSUrqJgj-eZK0eJz0RLn4MzvgNsS=kHrfJkXOdKRwiUiA@mail.gmail.com>
Subject: Re: [oe] [PATCH 10/10] qpdf: upgrade 9.1.0 -> 10.0.1
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 2, 2020 at 7:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails on mips
>
> https://errors.yoctoproject.org/Errors/Details/409858/
>
> I think you need to perhaps link with -latomic on mips
In other recipes adding -latomic it is usually not only for mips but e-g

| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_mipsarch
= " -latomic"
| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_powerpc
= " -latomic"
| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_riscv64
= " -latomic"
| meta-networking/recipes-daemons/squid/squid_4.9.bb:LDFLAGS_append_riscv32
= " -latomic"

Do you still have this patch in - so we can see if other arches fail
for same reason?

Andreas
