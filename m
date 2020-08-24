Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.189955.1598249502425503239
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=WYPv5Z/L;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598249502; x=1629785502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=++Lc2vvU4bjNOSYAEWZsPdN41UAMCCOjrilo5I0WwNc=;
  b=WYPv5Z/LPeeKpq0rne+dr7sA3t7yRb6zv0cOGgTEwEcogUAL6emuR/3e
   t/nwKixHRrNTmuEHxBhgYm9TXLF+ajRiqYPKMQlBIvArHm+7MApPo2Lx7
   5gAZeZekOVpsNA7x6ibxbVDauA8WUeUM5p+3r+d+x5dFK2ytUzytQfp6A
   j91qK5dD+8GnyXw50lfActbBqvE/fU9Wv6yFBC/E5RUaCtn9lMfEvFxc1
   lcnvgm8xvmnqmRfx0O67weDPXos3UN0zjm0AqxKbZax7umdFPwc7yNWRr
   xwXaglZL/n08BWv1/YnIj3pTOPLXY1cW5FAFRMpbsTj0EiXeLTLuOKk7B
   g==;
IronPort-SDR: H4M0Ser2fWlAwHDC5Qpv+gpGfnsXexpgfgclAz/SRs4y2KR6TiHDtQMij3Ahd6TV5ZMWr3FP05
 LR8vQTwiFG4UsFwbqovzeKYimKthffgEBwV0LqxRCkDlDIJMnmycQvscVyRossqt+A2w2+xrQE
 5U7VKuDui3UFZfEXuBlrJm5a8mWZO8whAcrQP5SgnvuPGmKVA4I9m0ys1x4UV1qtD9di3V37Et
 8kYdElZfMYSql69pt7z0a9PRe+bTZJvZt8gDWuYVQgJhd4+AqNwu/il7pVhU9E6+XJlD8YeJbX
 3ww=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="2648870"
Date: Mon, 24 Aug 2020 08:11:39 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] liburing: add v0.7
Message-ID: <20200824061139.GC65616@pcleri>
References: <20200824060235.196568-1-richard.leitner@skidata.com>
 <CAMKF1sr022VGqvOj1SjBUofe_PGiTBNScXxv6rbip1P8BZjgDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr022VGqvOj1SjBUofe_PGiTBNScXxv6rbip1P8BZjgDg@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Aug 23, 2020 at 11:06:14PM -0700, Khem Raj wrote:
> On Sun, Aug 23, 2020 at 11:03 PM Richard Leitner
> <richard.leitner@skidata.com> wrote:
> >
> > Add initial support for liburing v0.7.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > ---
> >  .../recipes-support/liburing/liburing_git.bb  | 21 +++++++++++++++++++
> 
> better to embed the PV in recipe name, so call it liburing_0.7.bb

Ok. So we're using PV in the recipe name also for recipes where the
SRCREV is a git commit id?
Wasn't aware of that. Thanks.

> 
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/liburing/liburing_git.bb
> >
> > diff --git a/meta-oe/recipes-support/liburing/liburing_git.bb b/meta-oe/recipes-support/liburing/liburing_git.bb
> > new file mode 100644
> > index 000000000..87c919e13
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/liburing/liburing_git.bb
> > @@ -0,0 +1,21 @@
> > +SUMMARY = "This is the io_uring library, liburing."
> > +DESCRIPTION = "liburing provides helpers to setup and teardown io_uring \
> > +instances, and also a simplified interface for applications that don't need \
> > +(or want) to deal with the full kernel side implementation."
> > +HOMEPAGE = "https://github.com/axboe/liburing"
> > +BUGTRACKER = "https://github.com/axboe/liburing/issues"
> > +SECTION = "libs"
> > +
> > +LICENSE = "LGPLv2.1 | MIT"
> > +LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
> > +
> > +SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https;name=git"
> 
> No need of name=

Oh, you're right. Thanks. I'll send a v2 soon.

> 
> > +PV = "0.7"
> > +SRCREV_git = "45f0735219a615ae848033c47c7e2d85d101d43e"
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> > +
> > +do_install () {
> > +    oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> > +}
> > --
> > 2.28.0
> >

-- 
Richard Leitner
Hardware R&D / Senior Embedded Linux Engineer

SKIDATA | Driving Your Digital Future

SKIDATA GmbH
Untersbergstraße 40 | 5083 Grödig/Salzburg | Austria
[t] +43-6246-888-4245 | [m] +43-664-88616370
[w] www.skidata.com
