Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.19292.1601481955811223646
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 09:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rV1kFewG;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id f63so1208302vsc.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dIZqqBxSf24JnxrDdFTEkJ4I275l4P9hzTxdQhskkrE=;
        b=rV1kFewGLEeimfZVFABcsbULzaCXrFCr42EK9irotA3ybTT4PhjouWcNuSwEamQRvL
         b2tHuazvcpkNUf0+Ziz0YT4Sx0col5cggVPkACWXiu6X3ePs9UICE3ZJcJCKlfAtKRve
         LMzISaWOsxasdJo3IZ1Y6D8qSy80Aqp6CDrBDEIz5dYebYaChLGN1mUJc0keYnW9BkCs
         gisSCdnVDlrPYwkeuGkw1dtThOdsgyUkH0ZRuM4q7dRElT9ZE5f7G5facsFhtRDlCXe1
         hSa5i5SaxNHCFKG3Nc36oTPGEzyhpSsz8PwGRfiZA4fYICfr7tVRwU3WFB4X3ZV/X1IO
         rzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dIZqqBxSf24JnxrDdFTEkJ4I275l4P9hzTxdQhskkrE=;
        b=hzCQJxWfXB5i684iDbHIdbsst00p00eNJ8bcLA3BykN3/OgMjBUMCj0Eyf6U5vrpAB
         CtI6CUU4wEkiktvr3U6pY5oKKR56PLHrUlrDTTXcNHSJVy83mOhL5cv3A+pWJ9uRzjfl
         GgJpHnpuEiNxulmR+8cL5/5/ACfBi7tdKhN8sun34aBOkGbrvv9vucIOHUysiAZFEMeS
         Xe6JAuRxhc2JRZRk7DscDUj9bDfqnEZ6IU9+yEJOxEm60Vc3I2ksBxfGqsdyrbRqqdxg
         mNwCvH8o9X1A4o2NAcHUQLq/zUV+jE3ABQ/E+nUScV3vTpkQKtRHsVZQQDGL/vX5aImH
         TE1g==
X-Gm-Message-State: AOAM530M5tol2gMRRisEew9jotm8sUZZHV5ceMXbRyYsqgylf2a2/zx4
	5oKGgkGHJNdPjOYTpbwFtMY7I1Ei0dNsk2I/SRQ=
X-Google-Smtp-Source: ABdhPJxaACc+GIgygSpuRdnLDOlQuUHjUO0IyGf0RTkQ6oXvcA4nazZ+cEi2ijQxC02ElBgNXAKsOpFR2LeEFYFy3ag=
X-Received: by 2002:a67:db87:: with SMTP id f7mr2032317vsk.32.1601481954949;
 Wed, 30 Sep 2020 09:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200930142720.15556-1-andrey.zhizhikin@leica-geosystems.com> <CAMKF1sq2M7kOAmdTBz6q-DPxLzZV--RVYPrAXFBDfdp9uOUhHw@mail.gmail.com>
In-Reply-To: <CAMKF1sq2M7kOAmdTBz6q-DPxLzZV--RVYPrAXFBDfdp9uOUhHw@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 30 Sep 2020 18:05:43 +0200
Message-ID: <CAHtQpK5+0v=GGTfueekV4Ud+OKcq6dz8q68gXLVcH3=CBm-ixw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pybind11: extend to nativesdk and consolidate inc with bb
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 30, 2020 at 5:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> its already done in master
> https://git.openembedded.org/meta-openembedded/commit/?id=c855e5be160d24c80303a30b99b34e45c6af1038

Ah OK, thanks for pointing this out! I was looking at dunfell then,
that is why I saw that there is still an .inc file for this recipe.

I would re-submit the v2 with BBCLASSEXTEND change only.

>
> On Wed, Sep 30, 2020 at 7:27 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > Extend this recipe with native and nativesdk classes to be able to
> > provide a package in SDK.
> >
> > Consolidate inc and bb files into one single recipe.
> >
> > Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> > ---
> >  .../recipes-devtools/python/python-pybind11.inc       |  7 -------
> >  .../recipes-devtools/python/python3-pybind11_2.4.3.bb | 11 ++++++++++-
> >  2 files changed, 10 insertions(+), 8 deletions(-)
> >  delete mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc
> >
> > diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
> > deleted file mode 100644
> > index d1d53e125..000000000
> > --- a/meta-python/recipes-devtools/python/python-pybind11.inc
> > +++ /dev/null
> > @@ -1,7 +0,0 @@
> > -SUMMARY = "Seamless operability between C++11 and Python"
> > -HOMEPAGE = "https://github.com/wjakob/pybind11"
> > -LICENSE = "BSD-2-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
> > -
> > -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
> > -SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
> > diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> > index 355e28460..2c456aaad 100644
> > --- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> > @@ -1,2 +1,11 @@
> > +SUMMARY = "Seamless operability between C++11 and Python"
> > +HOMEPAGE = "https://github.com/wjakob/pybind11"
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
> > +
> >  inherit pypi setuptools3
> > -require python-pybind11.inc
> > +
> > +SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
> > +SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.17.1
> >
> >
> > 
> >



-- 
Regards,
Andrey.
