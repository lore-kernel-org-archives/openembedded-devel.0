Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.992.1615324688785274729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 13:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G6VLq+8g;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d11so11386860qtx.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Mar 2021 13:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rl0KyT0tyR0pqPREbukxJmLy2AeZk2SeL9YUKTeRVNQ=;
        b=G6VLq+8gXV1Mrserp0uvL+daBPnPymxrclgW02vyOkOiHFVUZdLI1e/i3WhNRy+yQ4
         sc7o90OszLf6EFMZx67TJUChGot0S+QJ/SHxEmJJWsGJJFGjhiciFxIcp+SkQb/hKShs
         zWNq+CxiTOMOjmrRGBDKamxyfjb5h/atGAVVj/ksNRHbd1cZm4wHh1uhy9hLclAY+dyv
         EfmMUxc2HjwaptKnCFXK84tJKEUlMxGF53ea/XBv0OhQKk5lLIqxvf786PlL3JVQvdeS
         XFgO4VFGbDyZ7kPPnl9feN+nHlKvbFCLV/N3bmaOzi6nbeFal6yY8H3PYDRdSY1dLE3u
         j2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rl0KyT0tyR0pqPREbukxJmLy2AeZk2SeL9YUKTeRVNQ=;
        b=W384S3DhOFnyp3lfYtdzOWjpSYLOM3wkLMiy4vvmF8C25hhrjpQGrfVWpnvHoEn1vx
         QbJs+H0SUeOeSkCMHSpJIKNliLy9iDNLruRXxe4vMt88mUP7rlz5A2b5/KbgVoYtlEVk
         2DsmgO9MxRK4sY1fkvxN52lC0OmlxpnhLPtG5Z7/9rr6VgNz8iF4yjYNfbtr/6/LNrb5
         /E/MshMljNB8rjDyxIwzX8wqbcgD8bBzWGUHs8mK+ubt59BdM/P/AvCE+KsJ56EMd8VK
         la/SnaiNCXNftwqTBF65lniVFJMYFegp5LSkG9ZAieqtYxpsQBZlc6+7mZrrgTQWN0HX
         JYVw==
X-Gm-Message-State: AOAM533lilGMUV1xtAP2NIS2TNL1mHeVAko6xZVZzndzmF92f3CgxYkC
	+GfSlvN8EQeyo5WPaVbqyGteXrQrd30AJMsp1gc=
X-Google-Smtp-Source: ABdhPJzLoRNg+kwqoIhoM74HNBXzIxrkGxMcpCb+3iPq9duaeLTFGiMnlvhJGC3lRcwY5LkdK/7ickrJh4MwXh/bkDE=
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr19833885qtv.299.1615324687661;
 Tue, 09 Mar 2021 13:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20210305160256.3333334-1-andrei@gherzan.com> <CAMKF1srsrFhBwXVAwtrR=MUajm2zeHbS77f8ZyG8n5dNAtS5bw@mail.gmail.com>
 <a51e0676-0874-44f6-821b-6342ff9dc430@www.fastmail.com>
In-Reply-To: <a51e0676-0874-44f6-821b-6342ff9dc430@www.fastmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Mar 2021 13:17:41 -0800
Message-ID: <CAMKF1sqc36gikxGsBCkm0vgWRQHZXzfVBo6KgPFoLDNZm457fw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3 1/6] python3-ifaddr: Integrate a dependency of pysonos
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>, 
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Tue, Mar 9, 2021 at 9:50 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Fri, 5 Mar 2021, at 20:29, Khem Raj wrote:
> > I am seeing fetch checksum mismatched on AB see
> > https://errors.yoctoproject.org/Errors/Details/573554/
> >
> > then I manually downloaded the file and checksummed it,
> >
> > % sha256sum ifaddr-0.1.7.tar.gz
> > 1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94
> > ifaddr-0.1.7.tar.gz
> >
> > so builder on AB seems to be right, perhaps we need a v4
>
> Sent v4. It picked another recipe in my testing so I didn't catch this.
>
> ---
> Andrei
