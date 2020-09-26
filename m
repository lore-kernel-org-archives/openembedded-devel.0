Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.2813.1601164239611410665
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2020 16:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TMl4pVfh;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id j3so3545711qvi.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 16:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CxoLnAk9iHJEnzwSvdOyqSSxweqR09MPuPSWVKpLgm4=;
        b=TMl4pVfhQptxphTArZTU+cOBA6luJkzYi0EW975xiszqPlGZsBLQ2cQRu7EeXoqHmV
         RV7Nnup6dwMgCcvYHSo+NISNtl+PSLvqeYcbtJJyCK7lpjO4PihvJfatWSfAZyWiqlwt
         QJFoEXwNPy2pBNz0SnaVAdfLnn0ma8uibBEhVVa0RUa3RMHi8me1p9E0gXD3qq7i3KY+
         yGHLAkAculw1N3bkKxBz3n+WOHmpLPhISqmV2t7BXPPiWo8rFsNXH8YHjcw9gWLBH4Fd
         /2PgmKeA8anjELoBuJYoo2arzm1qCsAEwfyGuB+adxmCxxPT/sty3JQcKZOjYY3yC15a
         xkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CxoLnAk9iHJEnzwSvdOyqSSxweqR09MPuPSWVKpLgm4=;
        b=h3QT+G5nasXtplythfSVrIUa4rLMyzNcBqysPQdNgVvRyQZXYKxY1ovmJjdmwxdiIv
         9R4m0ShW9Q3ab7Rl7k+EJ/gEIwXSYqdLd5r1ELPREdyi2kwnMyEDK+G+QTs0UzDX37Ho
         zGOye737cGAk/b68PHeFE/9E3Q+T9bor5Z1B0xWfnSqVYtLzuJ2L4plYY2THbNcyaxDU
         CyBGkadJlEEJBXowZ4Vhxa3Gzr/ASgs6e74qIXfkHeecs85lKaZHT2ufCwlzB1X71T2O
         esJ0FO30IOvp2/1TvC8kddscES9bjW1JmaUCxxzDjXXihkHc9rCWb6ZGRN2MUSvliW6l
         E6jQ==
X-Gm-Message-State: AOAM531BjJO2nz9gwf/n+wU7NWobvkhJPNddQj1Ull6dshi8AGYXgAHn
	2dokFwZUJfBhSJdpfURdrgqRPTsnbIGqVVsEwtY=
X-Google-Smtp-Source: ABdhPJydf+3mx5kfdML924JB3/eIdwJvCC3KgAvY4yzvHR74OCRha0wvUz3dcdACSC+U2epg1HaAfbf7iXM0Ii2Aprk=
X-Received: by 2002:a0c:8f02:: with SMTP id z2mr5543822qvd.21.1601164238640;
 Sat, 26 Sep 2020 16:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200925212051.18414-1-akuster808@gmail.com> <CAMKF1sq_NeerBCsR1LKAMA0QMFtSWrZRm9czC8ALNSh8Xuk02Q@mail.gmail.com>
 <CAMKF1so9SbeLv81oU20aE4RGvS9hx93YWNt0khUrSwRGOEzvGg@mail.gmail.com>
In-Reply-To: <CAMKF1so9SbeLv81oU20aE4RGvS9hx93YWNt0khUrSwRGOEzvGg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 26 Sep 2020 16:50:12 -0700
Message-ID: <CAMKF1so_BwsogCXeAZ+GG12F8+SGpE6haTjohgXwNFffe8NcYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmocka: add recipe
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster@mvista.com>
Content-Type: text/plain; charset="UTF-8"

fails on musl too
https://errors.yoctoproject.org/Errors/Details/500726/

On Sat, Sep 26, 2020 at 7:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Now this recipe is added I wonder if libldb and samba can use this
> copy instead of their internal version ?
>
> On Fri, Sep 25, 2020 at 5:07 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Can you add it to appropriate packagegroups too for testing purposes
> >
> > On Fri, Sep 25, 2020 at 2:20 PM akuster <akuster808@gmail.com> wrote:
> > >
> > > From: Armin Kuster <akuster@mvista.com>
> > >
> > > includes ptest and bundling of examples that can be used for testing
> > >
> > > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > > ---
> > >  meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb | 37 +++++++++++++++++++++
> > >  meta-oe/recipes-test/cmocka/files/run-ptest | 10 ++++++
> > >  2 files changed, 47 insertions(+)
> > >  create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> > >  create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest
> > >
> > > diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> > > new file mode 100644
> > > index 0000000000..6125d116cd
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> > > @@ -0,0 +1,37 @@
> > > +DESCRIPTION = "cmocka is an elegant unit testing framework for C with support for mock \
> > > +objects. It only requires the standard C library, works on a range of computing \
> > > +platforms (including embedded) and with different compilers."
> > > +HOMEPAGE = "https://cmocka.org/"
> > > +
> > > +LICENSE = "Apache-2.0"
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > > +
> > > +SRCREV = "56eb3a183fc222120f86d0c54fd033992c30135e"
> > > +SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git \
> > > +           file://run-ptest "
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +inherit cmake ptest
> > > +
> > > +EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
> > > +
> > > +do_install_append () {
> > > +    install -d ${D}${datadir}/${BPN}/example
> > > +    install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
> > > +    install -d ${D}${datadir}/${BPN}/example/mock/uptime
> > > +
> > > +    install -m 0755 ${B}/example/*_test ${D}/${datadir}/${BPN}/example
> > > +    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
> > > +    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
> > > +    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
> > > +}
> > > +
> > > +do_install_ptest () {
> > > +    install -d ${D}${PTEST_PATH}/tests
> > > +    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> > > +}
> > > +
> > > +PACKAGE_BEFORE_PN += "${PN}-examples"
> > > +
> > > +FILES_${PN}-examples = "${datadir}/${BPN}/example"
> > > diff --git a/meta-oe/recipes-test/cmocka/files/run-ptest b/meta-oe/recipes-test/cmocka/files/run-ptest
> > > new file mode 100644
> > > index 0000000000..48b9cd9fc5
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-test/cmocka/files/run-ptest
> > > @@ -0,0 +1,10 @@
> > > +#!/bin/sh
> > > +
> > > +cd tests
> > > +for i in `ls *`; do
> > > +   if [ ./$i ] ; then
> > > +       echo "PASS: $i"
> > > +   else
> > > +       echo "FAIL: $i"
> > > +   fi
> > > +done
> > > --
> > > 2.17.1
> > >
> > >
> > > 
> > >
