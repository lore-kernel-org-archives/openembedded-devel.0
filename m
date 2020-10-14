Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.4990.1602653119677558683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 22:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ioy2zFyP;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id s4so1805012qkf.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 22:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fstKXAEkE3I93J0wffENyPGxWPeuUEOixjicNfCl7oM=;
        b=Ioy2zFyPse6VCJl7aa6AdmFIUeFU2LSfxNwhf+Fmntfim7dmjMhgc909bII2vKFV7X
         AXu8LdKHFTF0bnFfgHdZyykVjBuAXv1NfFL4hG4jYVq/FhTC/Hi9lLASmrrK0bUdXcf/
         deRjNjv33EH40BTDJdh2yJnUH+ZMLixSWVvIgs6LNNZuhjc/UBeljE6Uut4Odd3fKN4Y
         7R1EcZz0WskEk9mpF1io02OgYGru4N/sxiCNpO8OreW/qKLRzy84uJymMo45mb9Alwa2
         ajLbU41N5pTQ/jUrfR1CR1FS7qmc+1KPm/BPooskwknvHY8Dy+Oxf6ytqRvWU13rEuyV
         hbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fstKXAEkE3I93J0wffENyPGxWPeuUEOixjicNfCl7oM=;
        b=MrdNkw6oa0yfmuKl0EA7c/7OY9ahCVRwCGMaTM8tdZRu5c9Okn4Du4WP/eYUjoACws
         +LfJFu5/ngUKtyfYlHWK409ZceFuDYQR4EG7HJIkyg+Sifql3ub/LBaNyHYtZDnddZ03
         IAgWEunr5nE6FwcA6t14BaOh5euUvTpp9BL8zmaPxOITYLsB7G5N+Nf3CB9XrSe801fx
         taT1k17tq+MiZWXvyWCng6Qz0l278rwNu4/BPkN2RWH8wYgCHfD9ccTVrvwm6s21fGL8
         NHn8A+djJiyWNV1MQyGeZouVlUyFG5hYCbajczafJhWj1TNaY+m+Ttl41QTGPQ7tKbIH
         NcKg==
X-Gm-Message-State: AOAM532rdf1Fwgv77t/gp4OTDkDsOhsngvF4FNzlgg9+/dOg02hpRiia
	pqItk2YgLSI3Ih1CA5E3O4kD8HB663JL75wpvQs=
X-Google-Smtp-Source: ABdhPJxKwpjl0NFcLH5l/3olU9uTps3cnHv3TrAdw10YOuzxGTrS8huA39KU2FV3L9Pz7L1qfLz1Zx7SW12osjgXvXs=
X-Received: by 2002:a05:620a:c07:: with SMTP id l7mr3594552qki.9.1602653118506;
 Tue, 13 Oct 2020 22:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201007052509.3526946-1-raj.khem@gmail.com> <afe5a405-d84f-bac9-8549-578b46020b11@windriver.com>
In-Reply-To: <afe5a405-d84f-bac9-8549-578b46020b11@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 22:24:52 -0700
Message-ID: <CAMKF1spv5MoqVJGN8neAvvHMDe5=K-dq38v1og+P-HE-1k3sZg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-paramiko: fixing runtime dependencies
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Siming Yuan <siyuan@cisco.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 6:00 PM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 10/7/20 1:25 AM, Khem Raj wrote:
>
> From: Siming Yuan <siyuan@cisco.com>
>
> added rdepends to bcrypt, cryptography, pynacl as required by the
> actual python package
>
> Signed-off-by: Siming Yuan <siyuan@cisco.com>
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

right, I think it should rdepend on python3-unixadmin which provides
getpass module.

> >>>
>
> ---
>  .../recipes-devtools/python/python3-paramiko_2.7.2.bb        | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> index 324847c31b..1b81171f68 100644
> --- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> @@ -12,3 +12,8 @@ inherit pypi setuptools3
>
>  CLEANBROKEN = "1"
>
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-bcrypt \
> +    ${PYTHON_PN}-cryptography \
> +    ${PYTHON_PN}-pynacl \
> +"
>
>
> 
>
