Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.5067.1614439520299983824
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gskU4bVs;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id z190so12228282qka.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Feb 2021 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rc8QklT23GLUNDZKu+epiQXbSaJho6nm3f7dApaBwxE=;
        b=gskU4bVstBxIxkEjFWsbc8QfoiSbjEJ7k/KRqxnrZaGan4VsPJF2KYBGhdG5R+6I93
         jry/98ieCSkQY2jTVICfzEbobph/p9Z4yrCG5X9+Ev4VLIPJvgKSxNrfN1ZWdUcCgMX/
         utZ/pURR1TXAdKysrWWmN9MfF/Odqe8M2Qp2/ZuQ+IB4BT0t/NDR0Jg2YLr5lr2DvBbI
         i4JoY46cK7/bQwr1XGrG+Uvyr0cQJR2IFhujpQewD/R/ba5VMURRUpCY25PG5WPexyfy
         m28t1qsuE2QjsxFI3VMsdC2wkD1C9DmsdWS2Zj9YZ9qqlAQKw/se9EiiVAmWem/Mic7g
         iqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rc8QklT23GLUNDZKu+epiQXbSaJho6nm3f7dApaBwxE=;
        b=KFv+Fb8vgZcQV+A8Ai73CQ4lCflagzyQwkVF6NhOMVHiktTWzjdSmwZFc8InoA1ydZ
         oBq0QfcoN4GP0Io9VbJoJZM3yQtVDOc9g6ZKnXREsgW7knd4sYACFEkMuWc/RkvkiQDt
         /wQHArVyEANxGyNUiRS4/hlFzFVpsZ6HH8GCtkTE5KRy5KH6hk9+qKgZ2SE6ShS7G489
         DfF2axGvTAmJ9ws7NCRMA203mDwo+Taw3YeUdxIadIL1KY9jbN+YW+svjMsyFa/PgeZV
         UWuWcuFhiDuRZJRNg4YCm+VKc/BJwKeqTNHbc1TozzkMqKyvZfUNtoE5H3Cf8VD1pK2j
         4JGQ==
X-Gm-Message-State: AOAM532H3C0idUUpvweRx83Mwf0WbdSPtN1u4uxlV7v7DWc23MB7OMiN
	NyRqIjomKUApXzQqZvQhYeFVdf8B+V5iAF6vx9OjbWLo8fI=
X-Google-Smtp-Source: ABdhPJxA7R1RAo+GiKwu0lO28iIiQTFakPcEdA8/JMWOZU7v2VVzwAGMhjSqaAma3H5PuFu0OuypIDKTGVU4TXUJIps=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr1150001qka.119.1614439519183;
 Sat, 27 Feb 2021 07:25:19 -0800 (PST)
MIME-Version: 1.0
References: <166650501510A6E8.6890@lists.openembedded.org> <168f0c44-2ca5-1d5f-d6c9-df35bcd2e8e0@windriver.com>
In-Reply-To: <168f0c44-2ca5-1d5f-d6c9-df35bcd2e8e0@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 27 Feb 2021 07:24:53 -0800
Message-ID: <CAMKF1spZANnZBrPgZ3s9utttRh6YomFymRYBUwY0=Zvvckt8YQ@mail.gmail.com>
Subject: Re: [oe][PATCH] lmbench: Install cache command and fix typos in manual page
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Yanfei

Please update your copy of master
Its already applied in master. I usually answer if there is something
wrong with the patch.

On Sat, Feb 27, 2021 at 2:18 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> Ping.
>
> Yanfei
>
> On 2/23/21 3:36 PM, Xu, Yanfei wrote:
> > From: Yanfei Xu <yanfei.xu@windriver.com>
> >
> > Cache command was omitted when install, now add it.
> > Fix a few typos in lat_unix_connect manual page.
> >
> > Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > ---
> >   ...ypos-in-lat_unix_connect-manual-page.patch | 30 +++++++++++++++++++
> >   .../lmbench/lmbench_3.0-a9.bb                 |  2 ++
> >   2 files changed, 32 insertions(+)
> >   create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
> >
> > diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
> > new file mode 100644
> > index 000000000..d49dac5b2
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
> > @@ -0,0 +1,30 @@
> > +From 9bf2b363c5173c03adecf366f116415dbc559017 Mon Sep 17 00:00:00 2001
> > +From: Yanfei Xu <yanfei.xu@windriver.com>
> > +Date: Tue, 23 Feb 2021 10:54:26 +0800
> > +Subject: [PATCH 1/2] doc: Fix typos in lat_unix_connect manual page
> > +
> > +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > +---
> > + doc/lat_unix_connect.8 | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/doc/lat_unix_connect.8 b/doc/lat_unix_connect.8
> > +index b42e9a4..5ab1a51 100644
> > +--- a/doc/lat_unix_connect.8
> > ++++ b/doc/lat_unix_connect.8
> > +@@ -25,9 +25,9 @@ is a client/server program that measures interprocess
> > + connection latencies.   The benchmark times the creation and connection of
> > + an AF_UNIX socket to a local server.
> > + .LP
> > +-.B lat_connect
> > +-has three forms of usage: as a server (-s), as a client (lat_connect),
> > +-and as a shutdown (lat_connect -S).
> > ++.B lat_unix_connect
> > ++has three forms of usage: as a server (-s), as a client (lat_unix_connect),
> > ++and as a shutdown (lat_unix_connect -S).
> > + .SH OUTPUT
> > + The reported time is in microseconds per connection.
> > + Output format is like so
> > +--
> > +2.27.0
> > +
> > diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > index 21e81ecf2..e9d1067d4 100644
> > --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > @@ -29,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
> >              file://0001-lmbench-Point-webpage-lm-to-target-directory.patch \
> >              file://0001-doc-Fix-typos-in-manual-pages.patch \
> >              file://0001-lat_fifo-Fix-cleanup-sequence.patch \
> > +           file://0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch \
> >              "
> >   SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
> >   SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
> > @@ -73,6 +74,7 @@ do_install () {
> >               -C src install
> >       mv ${D}${bindir}/line ${D}${bindir}/lm_line
> >       install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
> > +    install -m 0755 ${S}/bin/${TARGET_SYS}/cache ${D}${bindir}/
> >       sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${BPN},;' \
> >              -e 's,^CONFIG=.*$,CONFIG=`$SCRIPTSDIR/config`,;' \
> >              ${D}${bindir}/lmbench-run
> >
> >
> >
> >
> >
>
> 
>
