Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.52424.1597086524520183099
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 12:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A872+ng9;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id m7so9386135qki.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2020 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYX57rfEIJ+eI5EuQODMnFEAFGZNz0i7KMnYLkA43mo=;
        b=A872+ng9vuONDhxUVLQX3AHqJHGI7P919w4zyxUZpN7GsvPshAFJ9h0od1aUQGI6pQ
         LEALjOPo+hgBy4IHFzlNn5GOOjjMMUVBrHuHLaO1/gt00ki0MdNyRiTYy9Qswib8PhaJ
         pGpQIe+G80GfEd02zotcrG+bLUKEgeNIPBWO4VsY2qeg2AEY07MYq2+Yp7LmOFZB3xP0
         1+evMq054fkA4bICEANazG6xYMZhgcZKhd7hq0LkkZL9SCX4AKNSSNnW37FAXbt2Pnph
         SUkbvTteZKh5lOjC0//GSzLmPgWKRwWiPEmtZP4RQrgyGOXwT+BiuE2ELkR6mvnDSkE3
         /IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYX57rfEIJ+eI5EuQODMnFEAFGZNz0i7KMnYLkA43mo=;
        b=Z5cmxiPwveVCCf/Gkp9OpJnuHLVwq8S6whvLADSOW7+XLjVNEWPNZEe6WodIplafxE
         yaGYxAPX7Ac8Dx8rl3VXIlbwCpWSSDME197iMp38Cn/Oc3u391EXBbwYUBFtI8ZMDq0i
         GWwJgkSQ6QAoPRyitnMX2h0IQ4SRwbgsC6J5PDAhU182ik8rakd7VpnybpZ/FoecQl+j
         cZJ8iu1tb6FiSEhQhZ1glL6XDHfanYM8HrAGzWi/1w3vt3o1HMi3FHzO5L1Q4ZZ1Qrqr
         zwCnmLFF00RtavoXJUJxeD8QsAaNJd7DdJ9qeIsYnwKDbpLSpmoBT5iMxHgC2JKgBCAc
         OM8w==
X-Gm-Message-State: AOAM531822zu1dqjnPhKvfcvhzE1M/dct1Zo0PGHU3bID9l1Lw3rQplu
	vqZBpsy3AWp1YPm77xkIhhUYrpDE8Zv6UI9WJTIVBin9
X-Google-Smtp-Source: ABdhPJyYRNBkeu8yCtSpudRZA1q4eCSvLRoJzkQbdEg+vcmGQ1cnwzhq7HW2fdlRb1BNg0oaKfhlYltVGRN3Z4lw3eE=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr29055058qkp.215.1597086523421;
 Mon, 10 Aug 2020 12:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200808125351.17467-1-bunk@stusta.de>
In-Reply-To: <20200808125351.17467-1-bunk@stusta.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 10 Aug 2020 12:08:17 -0700
Message-ID: <CAMKF1sq+=xDPy6mfM2cSb1eVruGe3bQjV8dATa3Eb8=bUVymfA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpeas: gobject-introspection is mandatory and cannot be configured
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 8, 2020 at 5:54 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> ../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR: Unknown variable "libpeas_gir".
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> index 881751008..1b754343a 100644
> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> @@ -10,6 +10,10 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>
>  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
>
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"

these are autotools options but since dunfell we use meson to build
libpeas so I wonder how this is happening
perhaps some bbappends need to catch up may be ?

> +
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI += " \
> --
> 2.17.1
>
> 
