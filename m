Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.4000.1628131362288574632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFeIN6Hf;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id a19so4907127qkg.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K4QPcJ0FNKPwQRnv9CxrCB2ao2YSplzpRaAZrwAoz/0=;
        b=UFeIN6HfQ4XrNJgpgNGZ2f3amo5JBkRiERCYSurB6PYyjuxUeX0LphncmSuPXsjxa3
         3KpjDgubJd56760mEkUs6J0jliC5lzgHy9hP4opfTXDCgaYD44joWaPOBaIsbjnc51LD
         81kmAAW9RIfd88+Z+08ktxH1tMDPIOxWIfpxyMK1kV48TtzrVaKxwRKK9++yYx5KC/sU
         TyAhA6+8yxRiGpVC2MirYAXj7gY12l+Y879as5W4dG/pAylu5gV6psqoE+p6hKVhaUEz
         VPYrCJxgfxnjlLZfQ+WpLYbm8WBZCmLWWHU18Q9J+/aB3Y5XU5/cv7o+NjCXF1u1UAQO
         ctkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K4QPcJ0FNKPwQRnv9CxrCB2ao2YSplzpRaAZrwAoz/0=;
        b=UUmAU7aPhy2M1iK08sFPvHWoiHAEG8Z2+v6sqjohIEfHpqu7IDGhk3etSaM+hsykkt
         5BSfAv8xVblJY55NU6k13NLqEBEPkfmk/VdqNWb8hCO98BUpqfBRxd+A4f6qmu/s2jIH
         n87XBzOfja2rovKZsO3jvOG36EirKsls7hxGRTOl/IUB9HiWvXjPf25UYJgoS/+D7061
         u5sgRz7QMHSvhR2PeV7U096nxsZmK7laFNiZObFT4ll1jnj3DaFRnMKEYp3APE1TRdSx
         kZKOzT6T23lI255p8fCgB8maRNnwYuuIuPj+mNpWgPO2s+Rnx2tnNdgZYZI0zh2yrkJ2
         GvGg==
X-Gm-Message-State: AOAM531CDp7sVKbH/7HfQDP5v6OF2nWN3ntkuUdCZpQfHa9ycdIO39/n
	OA+V3HiLROQ0DG+G+g+uFKYSL0imHkCGu70EnGw=
X-Google-Smtp-Source: ABdhPJxNumQZlHIBV7VK8CVW8jV7ku6ZOMii713R22LKQjbLq3pZHgMfRdZV/1rpdY9Kzfz3AmrSwPheBr3DRwCKFwI=
X-Received: by 2002:a05:620a:b81:: with SMTP id k1mr2614329qkh.119.1628131361374;
 Wed, 04 Aug 2021 19:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <16959244EFE5AD42.32573@lists.openembedded.org>
 <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com> <19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
 <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 4 Aug 2021 19:42:15 -0700
Message-ID: <CAMKF1sqgy4PmVTbq0_Fk+=yvJgd3L4gK1h=LUX4Oz33V7F=+9Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: akuster808 <akuster808@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 7:36 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Armin,
>
> Though the do_fetch issue is gone after upgrade mariadb to 10.5.11, but after 10.5.12 comes out, the issue will be there again if we don't upgrade timely.
>
> Considering the previous URL only stores the latest tar ball and the updated one stores all the tar balls. It's better use the updated one.

Dont we have some persistent archive location to point to ?
secondly, we should put the tarballs on oe source mirror for fall back.

>
> Thanks,
> ________________________________
> From: akuster808 <akuster808@gmail.com>
> Sent: Wednesday, August 4, 2021 21:58
> To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 8/3/21 10:43 PM, Yu, Mingli wrote:
> > Ping.
> >
> > Thanks,
> >
> > On 7/27/21 2:32 PM, Yu, Mingli wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Fixes:
> >> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL
> >> https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz,
> >> attempting MIRRORS if available
>
> Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?
>
> -armin
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> index 2974341bf..e8ff41461 100644
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> @@ -4,7 +4,7 @@ SECTION = "libs"
> >>   LICENSE = "GPLv2"
> >>   LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
> >>   -SRC_URI =
> >> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
> >> +SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
> >>              file://my.cnf \
> >>              file://mysqld.service \
> >>              file://install_db.service \
> >>
> >>
> >>
> >>
> >>
>
>
> 
>
