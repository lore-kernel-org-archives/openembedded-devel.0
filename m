Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.13767.1605226376054251657
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 16:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qDs7HGGu;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id y17so5072664ejh.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2020 16:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wO8xtyNAshQsITJE5vliCxzEJ0jhhWqnL1WlMxjVmUk=;
        b=qDs7HGGuu9E2R5mwdlfBjK0/+2mCTH+ISTNLJrNfbr1Lb9J/gcKCcA99jy80xieyX3
         y5pmak8+wfBeConNfg9Fc5AWxZ6rJnxxjPis6PkGLlIZv9JNWeGYkQ/CJ/af1P/nOFWo
         p4BmVHZqlinUvR9ID6dP9hcennIGIpcI4nrHLCD1bk8WjP/aSw5XQwogtFs2PyTZjFdv
         YhJKzpHxln4BGBI51gRKdsAnyRvpbs3N7s8aEagG1EDdF6zx/Afm26G8uBqENMrDSEBg
         lH/MSnWswRsedTYHw0ae6u+tIIzIzx+C+x8iCaU+3jtTfoav8i9ZcDm6xSpJqx9cPDxQ
         v4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wO8xtyNAshQsITJE5vliCxzEJ0jhhWqnL1WlMxjVmUk=;
        b=XNTsRnbBRk2tMUPY02U0x1CcAlYJkn+xqiIS1J0Gt7uKm3ohuuSpSQ8Y3GU6O5ncHf
         omRx+KPMOCqWmr6oLQQdnrF9obSjED8gELOeQrzxE0MLn7QDu8ZYCkrkq/b+h7zOUuMC
         XnRbHMN5UfihHXHsCWB/EieBIMGqFyevwgD0E61+3o/IpDYG2Q1CJCvTY+WZtj+w1DNC
         t/6WSc0f4SHHSks3AQOCGC/t24TXNILXuB9Sq0fYPK92KTtjoufpKSsJA+wWKsVi4qyS
         kcmFJKgn5Q5Zepkf0M1kF8qL/iWJuE81OA1rlhFQcjZdkCm2RIJIufr9vbM5DwxjQodD
         FJcw==
X-Gm-Message-State: AOAM531q1oyuF3opn/GWNwg6ZSrhUXAudv2kjsLXPEG9RYOlMd5ziZak
	ezEBdbKeH6fQHVUQ4bcRfuce+25NxLlP1MZ9zQs=
X-Google-Smtp-Source: ABdhPJwKpJrsEpt9cYEpuAS67r8p2p12eOIYGHP+jW+iAywlOvqVaSU6hgjb0g/Ln1bsoFvUWOgLvVNqQmmByw+3a3A=
X-Received: by 2002:a17:906:4748:: with SMTP id j8mr1818635ejs.22.1605226374522;
 Thu, 12 Nov 2020 16:12:54 -0800 (PST)
MIME-Version: 1.0
References: <1787995e-ca28-2c7f-589d-de56b747b024@broadcom.com>
In-Reply-To: <1787995e-ca28-2c7f-589d-de56b747b024@broadcom.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 12 Nov 2020 19:13:09 -0500
Message-ID: <CADkTA4PTw6y8H5jTA8-b2FCHG3jKyj9hgxKR=9-zEhu0TH+ZGw@mail.gmail.com>
Subject: Re: [oe] all external kernel modules fail to compile with with poky and linux 5.10-rc1
To: scott.branden@broadcom.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 6:57 PM Scott Branden via
lists.openembedded.org
<scott.branden=broadcom.com@lists.openembedded.org> wrote:
>
> It appears the all external modules fail to compile if you try using the 5.10-rc1 or later kernel due to this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=596b0474d3d9b1242eab713f84d8873f9887d980
>
> Has anyone tried to compile the latest kernel or has a fix for yocto?

linux-yocto-dev is on v5.10-rc3, and is running without issues. That
includes on-target and external module tests passing.

That being said, there may be something different in the kernel
recipes, or there's an artifact that we need to get into the kernel
staging directory for what you are building.

Is there a reproducer that you can send, so I can test against it ?

Bruce



>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
