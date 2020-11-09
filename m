Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web09.15417.1604944089120423421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rwc06SRY;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n132so7616342qke.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eX60g/+Ez4qp2JJaoyUGVxjRZBvlJ8WJBZjdoDaRlIM=;
        b=Rwc06SRYhWAyBLenL+vHdWYVrUUYQhEZuMNFQX5fNBN55fYfVp1Lhol/wdHJ9LDiOg
         kIWDvHxMzd54zpaGVY0tfxL509+/GxTaK77At6OaVN6+tRJifSGZPSa4A+s5gpVSnTAi
         9TkQRn1cw4cZwLXAyZl/91Dr/+dt0YPKeGlgEuWdlQoj2vkn/tzNBt6Xp6W+Xp2oK2Se
         K7Pt5u3901Rjzif4tK3c3k8eTl5CV6ZXL6rqjgz81MztCsrl2XIXXupZ/Sf0CFUKQA5d
         QtXEqUmM7xZeJNOmVo+3fiHS49HUVjNIxvAc01GW8b+XPl7LXrzcOd/dMd1RVgfsqjoS
         p7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eX60g/+Ez4qp2JJaoyUGVxjRZBvlJ8WJBZjdoDaRlIM=;
        b=sA5ygJCutkDINTaT8S/LaYJDnAsklrFu0QRdxPTpzoYtAeEl2kdnEPlXKj92c87FEx
         hnVUcB/8DLGoXFkkF6VW3cu7mS4XJljLklapwYv+/M7/QifW/+UHc6i8UQV2GRqBj8dV
         Q/gfth61AwnOblxiBvPOTLReWxYZlXrDJMQpCqNHmJ3OYBOFwFYX3WcfsE7brOnQO5mj
         pf6GZTDotYIZaot7NxvEBoN6ouQccG09Q0ZqTEp0RAwLwMeeKbZ/odTRnHo4BY2+cUXB
         /k7tEYCuMulHOKF6bwujyANmrZ6yK8Hq3pLCScVXatlU4UCpxgTG11Tmn1WVgY5WRNdy
         jCVQ==
X-Gm-Message-State: AOAM5320S72GATapFUU65HH/N59icQPjjuhQ9An2w6UwRzhiJL15MXS6
	Wzo3zbVRjH9oHZuaI0OhBjLZtoE6/yJlaA98+pH1RtKhDaHVpw==
X-Google-Smtp-Source: ABdhPJya0OLVMBQXJHpx5AAvU0g5U8SaFNfu+tJa+xefznu7TIHhKOgJdOOlNR3kGS3Q8C9SBtrstK0AyuxFuYYzVRc=
X-Received: by 2002:a37:7fc7:: with SMTP id a190mr14897681qkd.337.1604944088205;
 Mon, 09 Nov 2020 09:48:08 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1srN3p5HPwq1n0qg51g8yU7sS0Di9iX_hb89Unjsfs6WLg@mail.gmail.com>
 <20201109021306.47468-1-mingli.yu@windriver.com>
In-Reply-To: <20201109021306.47468-1-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 09:47:42 -0800
Message-ID: <CAMKF1soDn1dXir=B+A8Bu-udT0MLQ8sLjdcgT188o_ohFVjCSA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH v2 1/4] libmaxminddb: add new recipe
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this needs to go into appropriate package-group for testing as well
meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb

On Sun, Nov 8, 2020 at 6:13 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The libmaxminddb library provides a C library for reading MaxMind
> DB files, including the GeoIP2 databases from MaxMind.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../libmaxminddb/libmaxminddb_1.4.3.bb         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
>
> diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
> new file mode 100644
> index 000000000..204148e63
> --- /dev/null
> +++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "C library for the MaxMind DB file format"
> +DESCRIPTION = "The libmaxminddb library provides a C library for reading MaxMind DB files, \
> +ncluding the GeoIP2 databases from MaxMind. This is a custom binary \
> +format designed to facilitate fast lookups of IP addresses while allowing \
> +for great flexibility in the type of data associated with an address."
> +
> +HOMEPAGE = "https://github.com/maxmind/libmaxminddb"
> +SECTION = "libs"
> +LICENSE = " Apache-2.0"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +"
> +SRC_URI = "https://github.com/maxmind/libmaxminddb/releases/download/${PV}/${BPN}-${PV}.tar.gz \
> +"
> +SRC_URI[sha256sum] = "a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b9fc7d83551a439"
> +
> +inherit autotools-brokensep
> +
> --
> 2.17.1
>
