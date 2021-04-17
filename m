Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.377.1618677001422613691
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 09:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QbHLNPKH;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id er3so6434581qvb.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5e1CHKKlCxtiGcFwX5pa+dOflse2PWqezeXX1scDHU=;
        b=QbHLNPKHAfvYISKQ2XIvwXI66SRcrRVzdQahQFfmRB74roE7eNCncXj13p8UFdjNUj
         yLH4CuvAivZWPdNq7Zo2O0yASUiz2Xl4xepK/m1/g1Kduqd5mn65OtnkRpqsHxuInXlF
         jRjoyjsj5ejWBD5TsxydaSjdQ0ItlgAUicrX3XTxOVexPYfD9juCLAksqou31rnNgZHr
         UXa4cs0daJ/IJ/AKG0DajYDUbluxe6oGBdxLGzFAPvGr6qhijtZrKGjDdiUoBiH6I9v/
         Gws+dna/qs0HDCX4N8xGp4yZNvnG4pSInbCACsS4tgBqP/w06IvD9fFDUHhOgaf2laWS
         YC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5e1CHKKlCxtiGcFwX5pa+dOflse2PWqezeXX1scDHU=;
        b=hYlh6MH0P8aadhmsKdphFJ4iphuTgmrCNoV4JyNog+eXdStfOzFVDuoGiKhhiKK81v
         In+grHO+rmfo5ek0MAIPMqgSsEXpU5j2kMnHLDYaTIDonJH93R9X1qseM02iPc4e6sMQ
         BGpe1DFQu/xb9n6m+2F2Hr80iUgIwPFYnBr0DfYcN/YnNfEe4nT0Vj8XjrXm53zPFTYL
         GzbOOmJa37+BknLKnMPG8rGYdVvknYqCYc/mflkF+Cckpx0sfcIs3LZJK6JSLk2PjUd5
         xS0WiUNlyBS8dVGcgx5Dmg1MlVSe7Zd8jMUwqiiqmIpAEpqKcXb5HaCHhJA1oO427j+/
         gOKQ==
X-Gm-Message-State: AOAM53080LCkv8Aw4ViDL57RK6tB0uXwH2r2WuAHoJbAlsFx1I8Y/Sh/
	ymft+6gAT2AOLmFGppgDu6YcaShEBPcMtsZhYfo=
X-Google-Smtp-Source: ABdhPJxXZ9jxUPSC7akRfJHFJilcij9kA+iC4ooQYLYCLj3m2vaudO/EOYDtZzjNq19xNwCPQ5gBEz8EM7ODtK6Ale4=
X-Received: by 2002:ad4:42cf:: with SMTP id f15mr7376173qvr.50.1618677000426;
 Sat, 17 Apr 2021 09:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <16766BDD45432255.24242@lists.openembedded.org>
 <20210416233654.13300-1-yifan.yu@windriver.com> <c0776c8f-9ce6-7806-b77a-28e1327b3a58@windriver.com>
In-Reply-To: <c0776c8f-9ce6-7806-b77a-28e1327b3a58@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 17 Apr 2021 09:29:33 -0700
Message-ID: <CAMKF1soGec9=mOPkZ-Tq1rBFDTN44u+qaVN+T7ugjCwBiqb8Gw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] syslog-ng: Drop an obsolete patch to add --enable-libnet
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yi Fan Yu <yifan.yu@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 17, 2021 at 9:08 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2021-04-16 7:36 p.m., Yi Fan Yu wrote:
> > libnet is a dependency to --enable-spoof-source.
> >
> > The correct flag to enable/disable in ./configure
> > is --enable-spoof-source.
> >
> > Adjust PACKAGECONFIG accordingly.
> >
> > Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>
> These syslog-ng patches are in master now.
>
> Yi Fan please send a request to get them into hardknott.
> The old version has load of memory leaks so it's really not usable ...
>

they are still in master-next

> Armin, Khem,
> Did I miss an email about when y'all plan to declare hardknott released
> and will stop accepting most package uprevs?

I think Armin has final all on that.

>
> ../Randy
>
> > ---
> >   ...onfigure.ac-add-libnet-enable-option.patch | 77 -------------------
> >   .../recipes-support/syslog-ng/syslog-ng.inc   |  2 +-
> >   .../syslog-ng/syslog-ng_3.31.2.bb             |  1 -
> >   3 files changed, 1 insertion(+), 79 deletions(-)
> >   delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch
> >
> > diff --git a/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch b/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch
> > deleted file mode 100644
> > index c9eec65e8..000000000
> > --- a/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch
> > +++ /dev/null
> > @@ -1,77 +0,0 @@
> > -From 57b509adfb7c62bbf55ea1709aac3383cab660fa Mon Sep 17 00:00:00 2001
> > -From: Ming Liu <ming.liu@windriver.com>
> > -Date: Thu, 17 Jul 2014 05:37:08 -0400
> > -Subject: [PATCH] configure.ac: add libnet enable option
> > -
> > -This would avoid a implicit auto-detecting result
> > -
> > -Signed-off-by: Ming Liu <ming.liu@windriver.com>
> > -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > -
> > -Update for 3.24.1.
> > -Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > -
> > -Set it to default yes
> > -
> > -Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/3650]
> > -
> > -Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> > ----
> > - configure.ac | 35 ++++++++++++++++++++---------------
> > - 1 file changed, 20 insertions(+), 15 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 7aad75f..d575cba 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -144,6 +144,9 @@ AC_CONFIG_HEADERS(config.h)
> > - dnl ***************************************************************************
> > - dnl Arguments
> > -
> > -+AC_ARG_ENABLE(libnet,
> > -+              [  --enable-libnet      Enable libnet support (default: yes)],, enable_libnet="yes")
> > -+
> > - AC_ARG_WITH(libnet,
> > -    [  --with-libnet=path      use path to libnet-config script],
> > -    ,
> > -@@ -1073,23 +1076,25 @@ dnl ***************************************************************************
> > - dnl libnet headers/libraries
> > - dnl ***************************************************************************
> > - AC_MSG_CHECKING(for LIBNET)
> > --if test "x$with_libnet" = "x"; then
> > --        LIBNET_CONFIG="`which libnet-config`"
> > --else
> > --        LIBNET_CONFIG="$with_libnet/libnet-config"
> > --fi
> > -+if test "x$enable_libnet" = xyes; then
> > -+    if test "x$with_libnet" = "x"; then
> > -+            LIBNET_CONFIG="`which libnet-config`"
> > -+    else
> > -+            LIBNET_CONFIG="$with_libnet/libnet-config"
> > -+    fi
> > -
> > --if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
> > --        LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
> > --        LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
> > --        AC_MSG_RESULT(yes)
> > --dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can cause warning during build
> > --dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fix till
> > --        LIBNET_CFLAGS="$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
> > -+    if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
> > -+            LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
> > -+            LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
> > -+            AC_MSG_RESULT(yes)
> > -+    dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can cause warning during build
> > -+    dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fix till
> > -+            LIBNET_CFLAGS="$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
> > -
> > --else
> > --        LIBNET_LIBS=
> > --        AC_MSG_RESULT(no)
> > -+    else
> > -+            LIBNET_LIBS=
> > -+            AC_MSG_RESULT(no)
> > -+    fi
> > - fi
> > -
> > -
> > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > index e48e5d5e2..80c509973 100644
> > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > @@ -50,7 +50,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
> >   PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
> >   PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
> >   PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
> > -PACKAGECONFIG[libnet] = "--enable-libnet --with-libnet=${STAGING_BINDIR_CROSS},--disable-libnet,libnet,"
> > +PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
> >   PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
> >   PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
> >   PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
> > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> > index cbd218c95..5d2b7f77e 100644
> > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> > @@ -10,7 +10,6 @@ SRC_URI += "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.t
> >              file://syslog-ng-tmp.conf \
> >              file://syslog-ng.service-the-syslog-ng-service.patch \
> >              file://0002-scl-fix-wrong-ownership-during-installation.patch \
> > -           file://0004-configure.ac-add-libnet-enable-option.patch \
> >              file://0005-.py-s-python-python3-exclude-tests.patch \
> >              "
> >   SRC_URI[md5sum] = "69ef4dc5628d5e603e9e4a1b937592f8"
> >
> >
> >
> > 
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
