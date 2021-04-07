Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.553.1617837499278617657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 16:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TGJn+CXd;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id x27so9553qvd.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 16:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHV9FUHdl0uIz3xUJDY6HtIBm6qVidTK0NXY+MASPZc=;
        b=TGJn+CXdfvzwynli2leD+8yz0VNwN9Cx5ZhgS/8SJzgJ5uLr/EwcVCG5OwoBUiaIlu
         JLm5dAhpVknEGoBkYybyUInnKFiGLMHPCeoCBMCzUI+RA+Kf0rWyc5GHD0Mh+7gQcUFM
         T0mr8c0xKpKD9d+dE+sBIp+m5rNCmlmrtP2nkbytJwCDZNvRJfqGWsfBCkeHjzS2XWSI
         m8c8wGw75wSWnlVznk/0hdWZgrB6oG6DYe4ib5F6YvGyfIbeBYV8gzF1cUUy1rHp1U1e
         yQcyqrCuB1VKXf0a9ruFWpEuYfKhgkVKWU4rf4WR5iUJXc+CoYoix/fGXTNWo099a+9I
         Qkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHV9FUHdl0uIz3xUJDY6HtIBm6qVidTK0NXY+MASPZc=;
        b=iwaTtaQxzxBg3c/SCKKo+/yM12KxXFw3L2afhPO/vjh+6esP4uap9M1GhdaOvyvWaF
         d3jM0iUoGOtWWjYz8Jgz4/TU+zWvpLmmeHLDsjzHWzJbucv46UMLIL4bRUdIGMLOf7wA
         q/1HZQOC73KH6tfyen7wL8qrtzLDX4WSbbSRAyA3W1etdJ5wQaxla01KSahDefFOJ4hE
         cpSMSiZ+NlK/j1NL0Rz7wRmwZ3zk57qNMgP4P2xHz80sEegDP7w8aNloLddR8qioxnOg
         3r0e2e+z2jZgNSYfxbcIh0WUfg/qkSamy1fL9RXegANX0rvO9TMRn15pku9Swox2bcXo
         JPfA==
X-Gm-Message-State: AOAM531nBz/ELJN70Tj2cspiY3hL5fv2LzrdRn7BWdogYxHwyRb4hbpJ
	brwny6YCDwMw8g1x2fYjy5uDFLAs9c8hMMdCklU=
X-Google-Smtp-Source: ABdhPJxl8+UOODjyfU4R1wf4xHxwsPB+ImpVrDTfVVbgTjbyrXsYqUEccqFImJjFvQRE6/N6A48rIVk6P5p3uXCgwto=
X-Received: by 2002:a05:6214:370:: with SMTP id t16mr5913986qvu.16.1617837498320;
 Wed, 07 Apr 2021 16:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210405213825.3478004-1-raj.khem@gmail.com> <ea15a645-1cb5-22a9-881a-aa06806f42e9@gmail.com>
In-Reply-To: <ea15a645-1cb5-22a9-881a-aa06806f42e9@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Apr 2021 16:17:52 -0700
Message-ID: <CAMKF1srmfP2V7i_+OmZLN+=+41QHhkuuM2V7wyO-7xfZn_q7TA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] iwd: Upgade to 1.13
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 4:16 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 4/5/21 2:38 PM, Khem Raj wrote:
> > Fix out of tree builds
> > Switch to tarball fetch
> I am seeing this error on Ubuntu 20.x
>
> checking for ell >= 0.39... no
> configure: error: Embedded Linux library >= 0.39 is required
>
> core master and hardknott are at 0.38
>
> https://errors.yoctoproject.org/Errors/Details/575735/
may be nudge RP to merge it.

yeah I should have waited for Oe-core to land the ell 0.39 patch which
is in master-next :(
>
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix out of tree builds and switch to tarball fetcher
> >
> >  ...p_srcdir-instead-of-abs_srcdir-for-e.patch | 35 +++++++++++++++++++
> >  .../iwd/{iwd_1.12.bb => iwd_1.13.bb}          |  6 ++--
> >  2 files changed, 38 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
> >  rename meta-oe/recipes-connectivity/iwd/{iwd_1.12.bb => iwd_1.13.bb} (85%)
> >
> > diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
> > new file mode 100644
> > index 0000000000..63d617f3e1
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
> > @@ -0,0 +1,35 @@
> > +From 0532cddcec9c3abff1f3bc22d2fa50df03d55d17 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 5 Apr 2021 14:11:40 -0700
> > +Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell sources
> > +
> > +this makes it build when build dir is outside of sources dir
> > +
> > +Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lists.01.org/message/SYX6Z7SUQHU7UWM6ECZTTJ6SPODIS6KB/]
> > +---
> > + Makefile.am | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -625,9 +625,10 @@ unit/tls-settings.8021x: unit/cert-ca.pe
> > + BUILT_SOURCES = $(ell_built_sources) src/builtin.h
> > +
> > + ell/shared: Makefile
> > ++    $(AM_V_at)$(MKDIR_P) ell
> > +     $(AM_V_GEN)for f in $(ell_shared) ; do \
> > +             if [ ! -f $$f ] ; then \
> > +-                    $(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
> > ++                    $(LN_S) -t ell -f $(abs_top_srcdir)/ell/$$f ; \
> > +             fi \
> > +     done > $@
> > +
> > +@@ -635,7 +636,7 @@ ell/internal: Makefile
> > +     $(AM_V_at)$(MKDIR_P) ell
> > +     $(AM_V_GEN)for f in $(ell_headers) $(ell_sources) ; do \
> > +             if [ ! -f $$f ] ; then \
> > +-                    $(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
> > ++                    $(LN_S) -t ell -f $(abs_top_srcdir)/ell/$$f ; \
> > +             fi \
> > +     done > $@
> > +
> > diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
> > similarity index 85%
> > rename from meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
> > rename to meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
> > index ccdc65ac6c..19d3a509ca 100644
> > --- a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
> > +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
> > @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> >
> >  DEPENDS = "ell"
> >
> > -SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
> > +SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
> > +           file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
> >            "
> > -SRCREV = "bde3e0f6e3364e9c884b6b93a944d8138345b8e5"
> > -S = "${WORKDIR}/git"
> > +SRC_URI[sha256sum] = "b005f7ed0f0a96a2c6181c44560fc868533a18e7034bd4cb43ea0d40c21b4e7a"
> >
> >  inherit autotools manpages pkgconfig python3native systemd
> >
> >
> > 
> >
>
