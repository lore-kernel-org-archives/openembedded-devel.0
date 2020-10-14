Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.4944.1602653228192943180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 22:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ko6rMvqE;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id q63so1825758qkf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 22:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGEKxRtFP1wh2rCLYcjZWkJMkNKzFV9LJIJgHR9kkWM=;
        b=ko6rMvqEc1rzbZjoEP5+jSbWAdDJurMtXgkwYiEmq+JPqalefgUN7pVrHxQjGF7GmS
         O4wwGmWdQ6wly39a3EQKYrlFIOEjfKBAsfN6L0cwz/Fiy1FNhZg8WQhGQUf2o81lWwiq
         UaApnS7sDM8p8xhFCPtFMLRG5zFVXf7+Bs5DR/bh/RCs+04c21AYA8VPrm1Ij25hY+ui
         BlSlmKxZESrfjeB3xGaLUQXu+osvMY0mWYh3icC1GZm4OdwbSQV2kOzpxt/SCaRGThwn
         lP3294GZtC15fFQv7ledxGEMOWHLm6Qd0GDcxcX2eE4Z6d6v3Dlk54U7D+8Bxq4lwQeZ
         38Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGEKxRtFP1wh2rCLYcjZWkJMkNKzFV9LJIJgHR9kkWM=;
        b=sushnfpwpCCd+FIzIs1YJg1vnHpD7h0WVLXqxDhLk2Oq7s/ztpmg1DuGPjIhuAJLPt
         cWulPqnFWLgjGfPgPzemTeM2jKcZe5XKZHrhGrx5y+Se/1mH7qlLZIWqM0I+ZV5+UVu/
         1TxF82kJ1xXlt2+1/QMJMwf8UoENfAP7n1urAY51ipgFbmALXMqglo2iZcd4Th6UWo7R
         zSIUltuSpCresYq90paT3bUTDMipPeLr1kKwf5/S4LBKMAL9Z6YxsAzoWWBNXItXWa4j
         JERUkjY50YjbukRm6GWsv5mIPt1tTfDs0TEXizmWnvyASgY/CJtG58agN3wi3/s/gd42
         ckcg==
X-Gm-Message-State: AOAM530l456WGp2LH3nv0dabhy0X60oslVAxujfjjIw1xxvWVbFOLK4M
	l0drC1BsXhKwSX0X6E/VJTqQtfxyR+Vm1nKoygw=
X-Google-Smtp-Source: ABdhPJynnu7dGsQtGk1N0nSXuiMXlLcSKwwU1ngmxVJTumJl3NYX62KdKS4AMeddlozzqAjMBbZnK0YjR6q80P/YyZY=
X-Received: by 2002:a05:620a:16cb:: with SMTP id a11mr3513293qkn.474.1602653227290;
 Tue, 13 Oct 2020 22:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201007052509.3526946-1-raj.khem@gmail.com> <afe5a405-d84f-bac9-8549-578b46020b11@windriver.com>
 <A408747A-8931-4B18-AB9E-F303B83D7703@cisco.com>
In-Reply-To: <A408747A-8931-4B18-AB9E-F303B83D7703@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 22:26:41 -0700
Message-ID: <CAMKF1soS0H1N3zihZUMQQp2DLk9yPoZ3i5+CGSGy7jDdQeFGig@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-paramiko: fixing runtime dependencies
To: "Siming Yuan (siyuan)" <siyuan@cisco.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 6:43 PM Siming Yuan (siyuan) <siyuan@cisco.com> wrote:
>
> Hi
>
>
>
> getpass is a built-in python module though
>

OE has more granular packaging, so as suggested in last reply please
send a new revision which has the needed dependency added

>
>
> Siming Yuan
> pyATS Development: cs.co/pyats
>
> Cisco DevX Engineering: devx.cisco.com
>
>
>
>
>
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> Date: Tuesday, October 13, 2020 at 9:00 PM
> To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
> Cc: Siming Yuan <siyuan@cisco.com>
> Subject: Re: [oe] [meta-python][PATCH] python3-paramiko: fixing runtime dependencies
>
>
>
>
>
> On 10/7/20 1:25 AM, Khem Raj wrote:
>
> From: Siming Yuan <siyuan@cisco.com>
>
>
>
> added rdepends to bcrypt, cryptography, pynacl as required by the
>
> actual python package
>
>
>
> Signed-off-by: Siming Yuan <siyuan@cisco.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Overlooked this one until now, sorry. Looks like it's still missing something. Installing python3-paramiko on core-image-minimal, I see:
>
> root@qemux86-64:~# python3
> Python 3.8.5 (default, Jul 20 2020, 13:26:22)
> [GCC 10.2.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import paramiko
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.8/site-packages/paramiko/__init__.py", line 22, in <module>
>     from paramiko.transport import SecurityOptions, Transport
>   File "/usr/lib/python3.8/site-packages/paramiko/transport.py", line 37, in <module>
>     from paramiko import util
>   File "/usr/lib/python3.8/site-packages/paramiko/util.py", line 34, in <module>
>     from paramiko.config import SSHConfig
>   File "/usr/lib/python3.8/site-packages/paramiko/config.py", line 25, in <module>
>     import getpass
> ModuleNotFoundError: No module named 'getpass'
> >>>
>
> ---
>
>  .../recipes-devtools/python/python3-paramiko_2.7.2.bb        | 5 +++++
>
>  1 file changed, 5 insertions(+)
>
>
>
> diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
>
> index 324847c31b..1b81171f68 100644
>
> --- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
>
> +++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
>
> @@ -12,3 +12,8 @@ inherit pypi setuptools3
>
>
>
>  CLEANBROKEN = "1"
>
>
>
> +RDEPENDS_${PN} += "\
>
> +    ${PYTHON_PN}-bcrypt \
>
> +    ${PYTHON_PN}-cryptography \
>
> +    ${PYTHON_PN}-pynacl \
>
> +"
>
>
>
> 
>
>
