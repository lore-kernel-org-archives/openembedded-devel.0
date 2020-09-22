Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.1448.1600752227223284306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 22:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f63b1z6I;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id ef16so8877226qvb.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2020 22:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4TqOrwxaoV9dO/xfDHZSGHr9oyntSnCjpmcyrK9MgxU=;
        b=f63b1z6I1iusTUArN6ei+mN5R/0IaG3QUFBIJvb+nxsJn0MNuCn3HCFgWBOApus0Z9
         u4D9oTMQ32OE0dpP6iJTqOL8c1uSJheH4Y1Dfb9l2aBVdXmjRtqpVDKQ7SSRr3F/BnzS
         rgfK1USUu7kDMNqL2/EEC/KMfVrJBwU8mmmMLm3+5I/HBy2mO5DejYwREBKSNanQFu/0
         yz7R/UohXOjMG/KkFokpSikWlXOjZnGVCGpBaIrUj4qnDIanO49YL0WJDGXsS/9XUDuc
         8YuILCcK4Rd7aXG7xe4wV3K9dQuzjN+6hr/nQ9UakPA8SZZ+fDBiPsp13jVB1taHsQnp
         gRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4TqOrwxaoV9dO/xfDHZSGHr9oyntSnCjpmcyrK9MgxU=;
        b=p1KlATDHELNIuREa0U1kx8EUATQhQAmmUOcreVy84mf5r+27Cg3dhEVNSBVIPjioHe
         0W0S1z4KHkI/XXXag5+HRdpUwVwO75f2dP2lhJlVs7evHkXgHeH8QYETrt53VTwd5OPJ
         OhHZF2GIR9CFRbFBKXmE9OPNma5jBfcgEkxUNwVMNrHo2V25W9je67gsJY3ymItd7yH/
         O+Tr4MLawj2TMte/ANXZBjUFAMRW4tuKiIg8n/plKXs76K71sxJBInbvWPqoDJdkuY3J
         40txRw3Mvy9n/myxNDP+gDYmZnvvcjfx3etPyMr1RIKEdmeg759Vg32gvd+5HjuGsRTx
         PxRg==
X-Gm-Message-State: AOAM530/IY3ToYf+n3KfQCqFGOFNJN9vub6ANlEylkSwqfMdugKepjK2
	FKXLgwPGsts+qyqFbjoBsnNkPDg+Lw+jcfS7gN4=
X-Google-Smtp-Source: ABdhPJzM0o86NaK0Yl6tv0hWcU1b9g0t88nxfD6nt861KkG0WtSxNnbfVIw1ROXr0Hx/ciYgwY+VBwqs6E90dGsfZ68=
X-Received: by 2002:a05:6214:7a1:: with SMTP id v1mr4049161qvz.19.1600752226325;
 Mon, 21 Sep 2020 22:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200922044727.18107-1-ticotimo@gmail.com> <20200922044727.18107-3-ticotimo@gmail.com>
In-Reply-To: <20200922044727.18107-3-ticotimo@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 21 Sep 2020 22:23:20 -0700
Message-ID: <CAMKF1sowfj_AzyhkoJvrNxPpmg6HpN2P8b+++zDmz-pGckGadA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] packagegroup-meta-python: -jinja2 -markupsafe => -ptest
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please rebase it on latest master and resend.

On Mon, Sep 21, 2020 at 9:47 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> From: Tim Orling <ticotimo@gmail.com>
>
> The main recipes for python3-jinja2 and python3-markupsafe
> have moved to oe-core. No need to duplicate them here.
>
> Instead, we add them to meta-python3-ptest sub-package, since
> we do enable ptest with bbappends.
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-meta-python.bb  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index c03f610da8d..e1624df6e7b 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -17,13 +17,13 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
>      python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
>      python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
> -    python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
> +    python3-pyusb python3-prctl python3-werkzeug python3-pyjks python3-requests-ftp \
>      python3-behave python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
>      python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
>      python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
>      python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
>      python3-flask-script python3-cassandra-driver python3-ujson python3-aws-iot-device-sdk-python \
> -    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
> +    python3-pytest-runner python3-pyiface python3-flask-login python3-setuptools-scm \
>      python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
>      python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
>      python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
> @@ -68,7 +68,7 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
>  "
>
>  RDEPENDS_packagegroup-meta-python3-ptest = "\
> -    python3-cryptography \
> +    python3-cryptography python3-jinja2 python3-markupsafe \
>      "
>
>  EXCLUDE_FROM_WORLD = "1"
> --
> 2.25.0
>
>
> 
>
