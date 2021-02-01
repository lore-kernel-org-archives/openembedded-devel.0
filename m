Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.35079.1612190901990743463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 06:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=UdTeaMoc;
 spf=pass (domain: burtonini.com, ip: 209.85.208.169, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f169.google.com with SMTP id r14so19936567ljc.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Feb 2021 06:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7GWtT1flxMzEYiIZ9ClOuIp2NzizuHG1qut5WNqIBD4=;
        b=UdTeaMoc/CAIgytvILFIrRHxn/fxm05y+8qryrgsXxQFJ6F16gWgfig8OxMVTuQWz+
         ZFptE2pne3iO7HjAxrcGSIWBrQL3gxOdO4PvJwe4YnGdcV3qLoaGF3r72+cWu1cJ2YY3
         IuObxTvj8Ie2YKe5aPpsLs4nkCL8+jodEHJAyz5EtT7CNt1ykkeMvEqscPZjmoNSa5Ir
         4JcoSRQNiqh9TfzkbWbHt7Qc597k5Hdr/kCjyfXipG0CEHsX72bHwcacSkUnG/8jA2/X
         BWPwBygWs0O7ghIhhn6CCFNlhFXnv2xtDmxQHrlsg0p14173LKlz3K3b61J9/P01WOjR
         06Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7GWtT1flxMzEYiIZ9ClOuIp2NzizuHG1qut5WNqIBD4=;
        b=EB/xTWr0Rw9qrNzlL7NNHuzjuKer1TAunxDif3cuv1mQqYlGYNEVzd8hkBTLkOaGrH
         7OV7PI4Tl8rBC0lbiL1EmHwolBE7/pZyDZJXU+/8Fs5nu1DOTYb+CnHlfxG9eCaBrfQY
         CfxjguyewwhLkBJtfCvjNDrUTnF8s4T1DW3aG1t8xdf5nh0IsNfCYpGiiHL+RN3Nc2L4
         jpYm0N9q0KMaca9pNtcFLvtOrEWclVXpy6E022f+fFcluQPeim47fhwd71EmTNg3+SSe
         /R4NyeFGn58EhL4UidUviIFiDGuLmeMO5NRn9vcUP/5fldP8P61BqJdBbW5bcHg573uC
         VihA==
X-Gm-Message-State: AOAM533Uw0Tdv5U74DU/gUHgtqY2YAt9Adz5OOJ3DMnkYCYXqpwLRurG
	M76grNRDxALpXz1g3Q5LitMmgyoGZOoWEugxSqxP0A==
X-Google-Smtp-Source: ABdhPJwFTuAqqbbWOMDmUb02oQa2Nzb4RP3oiPJ9HejtepJrn+fv9H1eKjCK8ThAhWhsOAyvDtk5wUY4NAzER1rbnU0=
X-Received: by 2002:a2e:8887:: with SMTP id k7mr10574169lji.24.1612190898916;
 Mon, 01 Feb 2021 06:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20210121131709.27097-1-leon.anavi@konsulko.com> <20210121131709.27097-4-leon.anavi@konsulko.com>
In-Reply-To: <20210121131709.27097-4-leon.anavi@konsulko.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 1 Feb 2021 14:48:07 +0000
Message-ID: <CAAnfSTu0mfh5qtFV475KuuqARASTL3jZvLiE9Qq=j7bBSh07rw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pykwalify: Upgrade 1.7.0 -> 1.8.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

This is why we need more ptests...

On Thu, 21 Jan 2021 at 13:17, Leon Anavi <leon.anavi@konsulko.com> wrote:
> Upgrade to release 1.8.0:
>
> - ruamel.yaml is now the default and preffered yaml parser
> - Dropped support for pyyaml parser
> - Update minimum version of ruamel.yaml to 0.16.0

But the RDEPENDS:

RDEPENDS_${PN} = "\
    ${PYTHON_PN}-docopt \
    ${PYTHON_PN}-dateutil \
    ${PYTHON_PN}-pyyaml \
"

pyyaml should be replaced with ruamel.

Ross
