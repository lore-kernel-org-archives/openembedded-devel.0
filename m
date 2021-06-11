Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.3766.1623381907348576895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uiab9wU4;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id c138so16776732qkg.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 20:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPmo1EMMYKTRQV62rU+uSTMdw572k3t/W1bgSA7MfnQ=;
        b=uiab9wU4r+blCXtQC6pqVmALG6g0q3oY8RY+GKwl/rIVHmV4EWrm/dZsYKBsw2c5SW
         POt4P7ixAw9Cc/T68I/rfR9tkdTXT/HpmDcj68+f3LGlNh9C8ECrZZV+LBxgydVcWylh
         CXcVIxC/gLAPCbEa0aMtsyKvxi/zA8teSADiQpikZMNcyvm9bHORifTpYq5LxgKICOmg
         /O59mefaSct18PaXswsB/5qIpa5dfvk9xsu2Ay2m/BoJRR8eFzzzk/H1f1nHUPlN27AS
         7fZqFb2MZHErPOevyBkz7r0ZeeKXu3Iz/owNVZUub0SLmlZbdAMXfLmjXtOCURvBvb1C
         822A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPmo1EMMYKTRQV62rU+uSTMdw572k3t/W1bgSA7MfnQ=;
        b=nYRJPKrZ3k4ob+zUiYJP6opi819ieICt+VkPcC5Gf3Fj3H9b06W8Ax4j9CYIHqNk3n
         /KsL4V3pqqPdu4NYqvacLc2M+BficRiph7f3p7Z5nOW7TO2fQftOaOQ3if1folgUYjKe
         vXQTu30/ZFs5IDApua9RT1m0icot/LCn3D1qQYtpFbcj4/pPMnrqlkRgU1DnvOtlY8bn
         6lxdHvOr5dPodi8gtFH1bZmc8R4kaFdTBob0m2XxpoRd+QiD4abpZwkfH1XlnHUMm4ie
         Emn6FsdnBsn3gOIrn3kEI3jIEZutbq4xnMDpwdNGOzeHEdHpIqTDXfQFtHWuqhC6MhSs
         Qvuw==
X-Gm-Message-State: AOAM533YBucMR8eGbzm3K/TKtQ9PLVBAeBYdzUAHrfqBDXV7POliMM5P
	4H7aQbbY3jvKzYeySe0aFhwjjlWzHgSaRcR0QIQ=
X-Google-Smtp-Source: ABdhPJyeCW+oSCr6l3dsqMz5ecICO15DfVrczfGdwJWMc6vw2eCkuBDvulKYViHBpRyPNg0cKA+UmImI7AzJ5TRM/FQ=
X-Received: by 2002:a37:bb82:: with SMTP id l124mr1860067qkf.119.1623381906270;
 Thu, 10 Jun 2021 20:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210106121440.84402-1-liezhi.yang@windriver.com> <f0c3e5e1-0baa-724f-9056-2a154d453e28@windriver.com>
In-Reply-To: <f0c3e5e1-0baa-724f-9056-2a154d453e28@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 10 Jun 2021 20:24:40 -0700
Message-ID: <CAMKF1so9_QYLytL+zUharedUbOs8tp=nvp5SLUP-ppsbFij-4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nspr: Fix build with nativesdk-gcc from buildtools-extended-tarball
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

can you check who is passing librt to it. It seems to be linking librt
from host in failing case. I wonder when using -lrt how does it work?
I guess it then links in nativesdk-glibc version but perhaps
gcc -v in failing link cmdline can reveal some more.

On Thu, Jun 10, 2021 at 8:13 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> ping.
>
> Thanks,
>
> On 1/6/21 8:14 PM, Robert Yang wrote:
> > Fixed when built with nativesdk-gcc from buildtools-extended-tarball:
> > $ bitbake nspr-native
> >
> > gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> > /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> > /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> > /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> > /path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > /lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
> >
> > Referred to:
> > https://github.com/linux-test-project/ltp/issues/255
> >
> > There should be a bug hidden in nativesdk-gcc or other toolchains, but it's
> > very had to figure it out. The quick workaround is using "-lpthread -lrt"
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >   ...ts-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch | 47 +++++++++++++++++++
> >   meta-oe/recipes-support/nspr/nspr_4.29.bb     |  1 +
> >   2 files changed, 48 insertions(+)
> >   create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
> >
> > diff --git a/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch b/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
> > new file mode 100644
> > index 000000000..c71871c34
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
> > @@ -0,0 +1,47 @@
> > +From 4441e9c15684623adb3d5cbd6c2f27c1f3d212ac Mon Sep 17 00:00:00 2001
> > +From: Robert Yang <liezhi.yang@windriver.com>
> > +Date: Tue, 29 Dec 2020 03:57:07 +0000
> > +Subject: [PATCH] nspr/pr/tests/Makefile.in: Add -lrt to EXTRA_LIBS
> > +
> > +Fixed when built with nativesdk-gcc from buildtools-extended-tarball:
> > +$ bitbake nspr-native
> > +
> > +gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> > +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> > +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> > +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> > +/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
> > +/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
> > +
> > +Referred to:
> > +https://github.com/linux-test-project/ltp/issues/255
> > +
> > +There should be a bug hidden in nativesdk-gcc or other toolchains, but it's
> > +very had to figure it out. The quick workaround is using "-lpthread -lrt"
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +---
> > + nspr/pr/tests/Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/pr/tests/Makefile.in b/pr/tests/Makefile.in
> > +index 2ccb992..45270e9 100644
> > +--- a/pr/tests/Makefile.in
> > ++++ b/pr/tests/Makefile.in
> > +@@ -274,7 +274,7 @@ endif # SunOS
> > + ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
> > +     LDOPTS += -Xlinker
> > +     ifeq ($(USE_PTHREADS),1)
> > +-        EXTRA_LIBS = -lpthread
> > ++        EXTRA_LIBS = -lpthread -lrt
> > +     endif
> > + endif
> > +
> > +--
> > +2.29.2
> > +
> > diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> > index 6307c159e..fa05bc022 100644
> > --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
> > +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> > @@ -13,6 +13,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
> >              file://0001-md-Fix-build-with-musl.patch \
> >              file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
> >              file://nspr.pc.in \
> > +           file://0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch \
> >   "
> >
> >   CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
> >
> >
> >
> > 
> >
