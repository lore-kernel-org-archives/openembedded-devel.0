Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.11125.1594605857345983448
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tFSOI5ss;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id u8so5144361qvj.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=l4Pf5QRTsUBrSpSTDFMBuujH6CUViwUtUfWdj9iVWYg=;
        b=tFSOI5ssfphD65X3wdapKv6qxA+yRG2avk1N0yrZcpE7vhr5+MlYULTeifs5j5nca+
         uKT1u9F5+s5/PJXV4BVdGCldXien7xKNHHAY5NPRSfKwzrQqZnuF1ywlvsWmu5AN/9kF
         rzuQbkGNRqojxGq3S/I0c3Gex1PFfcVMXNQyuYpgs92mc8g59LKc1i9ZdURFPWTOlJgY
         Y66q/0Q2KI1YyLZJtOe7JIJ3pcEq2yFi0YJxaHut/9PqLkwDluw2cMZx6qnX07FbnLNz
         bglVLNvIxHqdDDwiOtubABKn48FeGghQBoDv/C+s5qH9rOMJtPRQfFoKeFUXzK+UnrkV
         5KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=l4Pf5QRTsUBrSpSTDFMBuujH6CUViwUtUfWdj9iVWYg=;
        b=PGmLrx1xoUsktSLwbi8y7qBGBZWbBge/6wMmvAQC3vbCcGJ/pg9jLgY8FsA5aMjqdE
         G8otmb9ERejywhpUsj5jN0kr+/IwBUDoyks7zXKJ1FKazFyGqWIe2bMW7IZ1HucnHNLf
         m0uHlsbH4jztuUsMhzz7T25G1mvgmcfCgf5FGaWb6qEGsyFb4pJdG7QWzy2Ky/IWgn9n
         saNR8XHYIyAjqp0NlhbmFwRvPUfsBN1xJcq6TidptapJarDr79jHo/AOq2PzNy4T6s5z
         NB9IWQAd/cUxEiyWRWCmzFb24LYOaNVnJ8GxJ6ZFCjPiLKx2JBLoVBeRyDC1jldmdZ3Y
         XlRQ==
X-Gm-Message-State: AOAM532Eze61GCaTd8Be00e8+U/Tpi8LxkzvMKYTgSg7Mqqf3QSsfq+D
	FiQYnxEToiZ8Ua/QTIPbzE4y9NPZo/GovfhaWe8=
X-Google-Smtp-Source: ABdhPJwLBnRT4DbSFO49dpbVber4SfnOozeTAW0PoSWGYAzhARy7NjL7n2SSU+/6GnCN3ZSZybukTS4vWEY8SNE3vBQ=
X-Received: by 2002:a0c:83a5:: with SMTP id k34mr77139457qva.130.1594605856432;
 Sun, 12 Jul 2020 19:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200710051601.11962-1-naveen.kumar.saini@intel.com> <c3dd7c20-08f3-a1b8-d0c2-3b2cf1a8da68@gmail.com>
In-Reply-To: <c3dd7c20-08f3-a1b8-d0c2-3b2cf1a8da68@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 12 Jul 2020 19:03:50 -0700
Message-ID: <CAMKF1spJ4=f=GnxVb1aJ2iZM1N952gNHMdDcwW7ZR-L39XZa7g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] safestringlib: add recipe
To: Naveen Saini <naveen.kumar.saini@intel.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to compile on non-x86 targets

https://errors.yoctoproject.org/Errors/Details/420545/
https://errors.yoctoproject.org/Errors/Details/420538/
https://errors.yoctoproject.org/Errors/Details/420536/

On Fri, Jul 10, 2020 at 11:35 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 7/9/20 10:16 PM, Naveen Saini wrote:
> > The Secure Development Lifecycle (SDL) recommends banning certain
> > C Library functions because they directly contribute to security
> > vulnerabilities such as buffer overflows.
> >
> > However routines for the manipulation of strings and memory buffers
> > are common in software and firmware, and are essential to accomplish
> > certain programming tasks.
> >
> > Safer replacements for these functions that avoid or prevent serious
> > security vulnerabilities (e.g. buffer overflows, string format attacks,
> > conversion overflows/underflows, etc.) are available in the SafeString Library.
> >
> > Ref:
> > https://github.com/intel/safestringlib
>
> We also carry recipe for safec https://github.com/rurban/safeclib
> is this a replacement in some sense ?
>
> >
> > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > ---
> >   .../safestringlib/safestringlib_git.bb        | 26 +++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >   create mode 100644 meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> >
> > diff --git a/meta-oe/recipes-support/safestringlib/safestringlib_git.bb b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> > new file mode 100644
> > index 000000000..3d54fc8d6
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> > @@ -0,0 +1,26 @@
> > +SUMMARY = "Safe string operations and memory routines"
> > +SECTION = "libs"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE&COPYING.txt;md5=edd6f8c4c1072d72645ae28cb04bdbce \
> > +                    file://LICENSE;md5=54f68ba2c33474320fcc46b1f2d01249"
> > +
> > +SRC_URI = "git://github.com/intel/safestringlib.git;protocol=https \
> > +        "
> > +
> > +PV = "1.0.0+git${SRCPV}"
> > +SRCREV = "245c4b8cff1d2e7338b7f3a82828fc8e72b29549"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit pkgconfig cmake
> > +
> > +do_install() {
> > +    install -d ${D}${libdir}
> > +    install -d ${D}${includedir}
> > +    install -m 0644 ${B}/libsafestring_shared.so ${D}${libdir}
> > +    install -m 0644 ${B}/libsafestring_static.a ${D}${libdir}
> > +    install -m 0644 ${S}/include/*.h ${D}${includedir}
> > +}
> > +
> > +SOLIBS = ".so"
> > +FILES_SOLIBSDEV = ""
> >
> >
> > 
> >
