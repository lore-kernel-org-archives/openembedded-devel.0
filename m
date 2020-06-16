Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.2027.1592333074796287617
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 11:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C+X6rOTi;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id q8so20164927qkm.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2020 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UfXBQShDkZvd0gn08p4WjU5udqlnDQwgi24L5h1vt5c=;
        b=C+X6rOTixTmVvQkE+YosjdqxifM+RT9P0evQRBCbjeWhjQx1TOEtS4odJs89N3uliw
         cEDjm0NTqllvnOTggFPtKH1SGHzJCPtqaUuqwHtvAWnxH6YRVoSw/Hb41EDjz8aLB4nb
         qvKNNRn5ypje7/i6m+VqaFN4Cnse9qgDvmnkX+glEaeIQAg6fbqYXxt89ox0Qt1kPQgm
         VisB0/V9icioinO1xil0vsUIfb9ZPuQObq5xi4d5akSFbAHajT1pwcrnNjD58r/QkpN4
         RbqXRbeIAQJdLZCOXJtOd+16JR8oDbVUCOgFyiVTTqcla77M7Yc/JxCq4xZHCJeswh0t
         VtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UfXBQShDkZvd0gn08p4WjU5udqlnDQwgi24L5h1vt5c=;
        b=X9NNdgKX2LnncirE0UKaxv2RQqhF7DG6WyOCcLRivwowboQtIj0q4aK9ei9BTUKedj
         A3mPchgEM1M9MUyXiLBZmYdYBOlyqkhH3g+LVBP6OMm/6L0ufEEeOK3vcVD1pGS4WRQw
         jgUwBC4jZkGipB18IKhntScu9XHljWZCAF8NbX3SXuaPtEk0I30KkvFCGSDNdhP4QysO
         HZp7Mx0KGUnGLoTzy/6I8l0HEfIxl5Z1nHi+VKCDnH26hJhj5EwvSZ4HTFuylxQ2rKer
         HENM7Y3edTffmZ1Y0FokCcJ7VibgKXo0M7cyZjugNyp4vLB0r4DvBTwiilL1l9teCivL
         GiFg==
X-Gm-Message-State: AOAM532z5nlkiMDexQ0TEZ085iOux9pU+1vFRFOBO22oFIGtGvTLDQFG
	QXWuavwKmQhMwB6kyauOJCtF5GorenmhpsrYjYk=
X-Google-Smtp-Source: ABdhPJxBu3L8u0i7yiyUJCgXImbxFxE+lyTIry2YvfFBdomPrg2oBw+lbhGnm7ES5PRx4/yZc09fJFjt8zNRJpunEYI=
X-Received: by 2002:a37:9c55:: with SMTP id f82mr21538084qke.225.1592333073720;
 Tue, 16 Jun 2020 11:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-7-leon.anavi@konsulko.com> <CAMKF1soGT84aAF9Swywx7XQ+cUpfK44GvnEM+C0xNYcJJjQstQ@mail.gmail.com>
In-Reply-To: <CAMKF1soGT84aAF9Swywx7XQ+cUpfK44GvnEM+C0xNYcJJjQstQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Jun 2020 11:44:07 -0700
Message-ID: <CAMKF1srE06vgexB8xjkYpLXZzKY1PGGsdcVAKYSAJh=0psbS0A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-pocketsphinx: 0.1.0 -> 0.1.15
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Leon

please look into

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/392/steps/8/logs/warnings

I have accepted this patch in confidence that a follow up is coming
from you to fix this warning

Thanks

On Thu, Jun 11, 2020 at 10:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jun 11, 2020 at 2:10 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
> >
> > Add pulseaudio as a dependency and required distro feature because
> > libsphinxad requires it. Upgrade to release 0.1.15:
> >
> > - Add all travis osx
> > - Remove bdist_egg and bdist_msi
> > - Bug fixes
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  ...ocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python3-pocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} (65%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> > similarity index 65%
> > rename from meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> > rename to meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> > index cb22040df..5aa0eb6bc 100644
> > --- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> > @@ -5,9 +5,10 @@ SECTION = "devel/python"
> >  LICENSE = "BSD-2-Clause"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
> >
> > -SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
> > -SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
> > +SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
> > +SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
> >
> >  inherit pypi setuptools3
> >
> > -DEPENDS += "swig-native"
> > +DEPENDS += "swig-native pulseaudio"
> > +REQUIRED_DISTRO_FEATURES += "pulseaudio"
>
> this also needs to inherit feature_check
> please send a followup since I have applied the original patch.
>
> > --
> > 2.17.1
> >
> > 
