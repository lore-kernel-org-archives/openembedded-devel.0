Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.8350.1622209174209962675
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 06:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T2BkLXms;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id h20so4063494qko.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 May 2021 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tRDVM8MBT2a+7ymj8NZEB8S12jPvjD4lcYthh1ZSj6s=;
        b=T2BkLXmsX7ugNJT2+JVRvsW+AZi42K4IqooTBMp6/GKfhhD2XSKoHtTwJzgTRpq9dj
         kXsaEaxnCMod0CRv5XJ9sP8c9jRaBA0EBwf4g/mTp2tIGst2LrWZxsNguf8fbOA+/81n
         vOAscrGNK6Xgd1D7ZrguKkbmzHrhEmkJRpLJCDZhuGDWD1DxFWibmnHglfyWH84nQ5ar
         ddrt8JuGVtsQF2p3UcKdsXSYgvR1WDH5H0uaEgvfzacMZ5tZxNUVCsoMNqxpND5YrfwX
         /4KsHipP723sW5LkHsnaWdqAygJcGFDdDnO4KLqM8IPezqC8Bay2pBROoJiHx5/OpdDu
         QNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRDVM8MBT2a+7ymj8NZEB8S12jPvjD4lcYthh1ZSj6s=;
        b=NePdOSVdweOzNI/5l91ttsyh28YeHNNTy0Q6gTnQsWDvpDqVsLOnhqEFgrhIvXJ9l6
         GeG5kMtTm1vidXbsCYPzcwgQNS/3FKgmHnwtWc4PH5CoxF6NyUfoiVgBhFKug5Tunkat
         6S1os5rVgZZdSZuiG74B5s8d4V6NgpFW6T4BOOPpTSJVrkBU7ojifBNfDpegqE1GApPA
         PD4Dv3MhXf16I7i4kd2+61ABTLCcnjQnYBptlUwgSl4KhsUTBld6bDKTAEW/rfa24msY
         n/zMTJUaEssVJwGK06Q53lfR3R5WbLSo41sRiyJf0vBx4XHEpChPZAWBVq1UkX98/Ygh
         HR5A==
X-Gm-Message-State: AOAM5333qnj8lXKPz93uXmTV4UjH/qXeZTeI2qp6MvDXsh84HeI7fOrw
	LRlKPZmAoizBVb+uirkSTKwm79sMuHs3SCzz0Dc=
X-Google-Smtp-Source: ABdhPJx1aGTuD+7Ab1UnCJx3U6BHSkecKpGIV1PRQe3px8X5/evoxCPVAfF0/kZSw9287Vd8cJ+5hJ29TUFGbdJlM5o=
X-Received: by 2002:a37:444a:: with SMTP id r71mr3775613qka.381.1622209173177;
 Fri, 28 May 2021 06:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210528003936.568907-1-raj.khem@gmail.com> <20210528003936.568907-2-raj.khem@gmail.com>
 <20210528082956.c6fvgcrkk5rvnd7m@jama>
In-Reply-To: <20210528082956.c6fvgcrkk5rvnd7m@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 28 May 2021 06:39:07 -0700
Message-ID: <CAMKF1soeeDwOAtMpyVZrNFDhsRRWJ6zhpkh3SXwfDBDw43Ttbw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] sdbus-cpp: Do not fetch googletest on the fly
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 28, 2021 at 1:29 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Thu, May 27, 2021 at 05:39:36PM -0700, Khem Raj wrote:
> > This package downloads code ( gtest ) post do_fetch task
> >
> > Now this is checked out by bitbake fetcher into decided source directory,
> > this ensures reproducibility
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fetch googletest via bitbake
> >
> >  ...-Do-not-download-gtest-automatically.patch | 44 +++++++++++++++++++
> >  .../recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb | 10 ++++-
> >  2 files changed, 52 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Do-not-download-gtest-automatically.patch
> >
> > diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> > index 98829765c2..91cf70c911 100644
> > --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> > +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
> >  inherit cmake pkgconfig systemd ptest
> >
> >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-external-libsystemd', 'with-builtin-libsystemd', d)} \
> > -                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
> > +                   ${@bb.utils.contains('PTEST_ENABLED', '0', 'with-tests', '', d)}"
>
> ^ is this change intentional?
>

Good catch !!

> >  PACKAGECONFIG[with-builtin-libsystemd] = ",,sdbus-c++-libsystemd,libcap"
> >  PACKAGECONFIG[with-external-libsystemd] = ",,systemd,libsystemd"
> >  PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${BPN}/tests,-DBUILD_TESTS=OFF"
