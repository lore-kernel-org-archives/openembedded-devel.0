Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.735.1593708584807030596
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 09:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GgHWulOu;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id k6so24791157ili.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2020 09:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOAvGD+bdh3LKZt1oUehfs+pMhWpv9yz2a5Gb0CuY+g=;
        b=GgHWulOuA7sj9I39fws+K5P3MG6ROM1KCnoneVT/Jb32R4wA4Hm37Uf52GpyuvWJeh
         DoopwW7/rgcDXXiZs+jvM19nAMN/QzqL96QHliYqr1Ts9Pny+XvcgznmyaP9yj0Xl6ex
         MQWX95qBm9yw/Ka/lJ73FnbzRmynI5jSfwpR142yU0VPjEz7ACDgroMqNP5Ov0qzqhCv
         asrq+UAbbGEOCdgrknSpigeRTMhzqFg6jg93wQYx9USWwxUXQkU4ms/jz4KNOdtcg8QG
         GEoIWSVPdv7hjy+DCInavY63vetbz00BGsnpN+At8f9HXRqyzcFwu6ttabwiXYeQDlSK
         KAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pOAvGD+bdh3LKZt1oUehfs+pMhWpv9yz2a5Gb0CuY+g=;
        b=oWPEsRk5twqmNmkIkGOjBFk4IPBJrPKfS8EVIKsPz1RNMHgKn4Uo9ywfM4GEa3JaJb
         YBWv1sp+jfRjEo1E8E+ouN/sTJfxuJ03nsu3MYr5azgqm6vaZLLysqMirXkvHHwU2NHx
         NJIaD4ApMo7vBEsbD0MxUJIe/4MkSKTIlSZ5FGisjJLzmP0Rg5V6emhIrFnhHPZ1psA3
         9nUuZ902nRLI06mY10C40cFUDqZhu3ZDpNp/D8EIvea0pEJTw5gdPNRSiH0X0s7CTV0+
         7I14Edf/T8aZy+pt7eeWtYyMuJVDjiqQIVZRnBEHzouv7jFgkDHMS9DEFXmQT7D0EkYl
         Jb+w==
X-Gm-Message-State: AOAM5311ynwBH4frPALxvJFy6nb+Y4JK3z0TJ36MuoEbXJVFbrjNUr7B
	rug3TxqtfTRSb/QhrWE7GQvS6V6T2Owu1P8PBRs=
X-Google-Smtp-Source: ABdhPJxmgGJjNo+NaixAxi2QJUQg/SXKxI2g0ABNMiPAEgNE8OvsamXQaCgcnfaPHFkSkus5M9ttEv/Q8PPO7pUTyzQ=
X-Received: by 2002:a92:5f12:: with SMTP id t18mr13742810ilb.267.1593708584160;
 Thu, 02 Jul 2020 09:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200702163602.1768259-1-andrestc@fb.com>
In-Reply-To: <20200702163602.1768259-1-andrestc@fb.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 2 Jul 2020 18:49:33 +0200
Message-ID: <CALbNGRQHfdOpaVESaGQZ3zCcs_LPMJYWEHAYnRW+zzwPyPHCHQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] netcat: Set CPE_PRODUCT
To: andrestc@fb.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 6:36 PM Andre Carvalho via
lists.openembedded.org <andrestc=fb.com@lists.openembedded.org> wrote:
There is a typo in commit title

Andreas
>
> This way yocto cve-check can find open CVE's. See also:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139897.html
>
> "Results from cve-check are not very good at the moment.
> One of the reasons for this is that component names used in CVE
> database differ from yocto recipe names. This series fixes several
> of those name mapping problems by setting the CVE_PRODUCT correctly
> in the recipes. To check this mapping with after a build, I'm exporting
> LICENSE and CVE_PRODUCT variables to buildhistory for recipes and
> packages."
>
> Value added is based on:
> https://nvd.nist.gov/products/cpe/search/results?keyword=netcat&status=FINAL&orderBy=CPEURI&namingFormat=2.3
>
> Signed-off-by: Andre Carvalho <andrestc@fb.com>
> ---
>  meta-networking/recipes-support/netcat/netcat_0.7.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> index 14d743f82..1e113de51 100644
> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> @@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df0967
>
>  inherit autotools
>
> +CVE_PRODUCT = "netcat_project:netcat"
> +
>  do_install_append() {
>      install -d ${D}${bindir}
>      mv ${D}${bindir}/nc ${D}${bindir}/nc.${BPN}
> --
> 2.24.1
>
> 
