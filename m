Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.11668.1597378909892834936
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 21:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pQEiNLfW;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b79so7312304qkg.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1+Z+RiWKFG7pFy+1P0ZXjf2Q9WndZQf0y5HR11k8TM=;
        b=pQEiNLfWIqdrZ+YoEceozVKYeZ83qq5UfIIUDu902aRK07If+oqe28w0BEtsCK0AES
         OMbiyh8xQ8Cmr8lolMvWC4LTMGSg0Q+YYqIOzslwJcgewYmg+TMBZE7GY3E4TSLaujTn
         8R3zbvnfvWJkeJZiRmzFVDaPWVdUaox8RXeR8S/KWIpYvm5QIRCvCFMKPoFXYrof4P4U
         Kmi9hFOD9ZaUQKcLfappUvCSRGyY9MWXtXnPXYnLWpBxD62NCa0VgpnNCwn2dXs7pMLq
         qrPmZwqJivpeTW3qY5omieid5uVedEgLFDbyBxIqZM86drnlVcLJhI6vAnAPKx4aKows
         PjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1+Z+RiWKFG7pFy+1P0ZXjf2Q9WndZQf0y5HR11k8TM=;
        b=oNbx18Rtjs5NfH+L5ocgrkAKoZd0h52Lfmfp8ZPZnATYzAlQmzvvzpo9vgCM75trrs
         0Gz5XtY/M7zBEA8gcoeZ8BDMIPwc8UqFWbfjqMfV0fhtNSdU5gzzDalOPMGE40lPdn7g
         hl1W90nZLSfH1Kn/lTDQROh7yQ5ZIxQl4pOTc1m2/GbEjspoin0oKSwCh0SBvwUk0WvH
         BcZwt7Nn74MtUEvZemr/Nd1LsEx43OBa/Srp9ddUngGeyJ3Ze1DFvj+AbFeZUr/P8EaH
         q/a8UwiqZ9obkiuqJOm6xQLXvhdcyIfW8/m342iahASng1OXjbee+CbCmK8W9eGQShCD
         gXEg==
X-Gm-Message-State: AOAM531oAeBoWtHwNySu8K/fuft66XoLHxaK+fg4ZKJ0Y6hGMPccWBvZ
	7YvM561kdmsOVmqD8ZAnq4tjCCR15ThlRXBwmRdW1mnY
X-Google-Smtp-Source: ABdhPJyTqnr5Z9IU2pQxuqu/bWFsl8FretjbMMDXiWhpFtlCp9KmTMsPJANv5RiOLks4gPHkC/bgY1gtZZ5+EXpPsoU=
X-Received: by 2002:a37:7081:: with SMTP id l123mr427075qkc.225.1597378908760;
 Thu, 13 Aug 2020 21:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200812063711.2758315-1-raj.khem@gmail.com> <20200812063711.2758315-6-raj.khem@gmail.com>
 <788ba2642e9ffc12c44454664795d484395450b8.camel@intel.com>
In-Reply-To: <788ba2642e9ffc12c44454664795d484395450b8.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 Aug 2020 21:21:22 -0700
Message-ID: <CAMKF1sqhY1xG9YfBzOm72-RyEn2cmAnvtOig5gj_e0HaTz2fvQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][ 6/9] opencl-icd-loader: Update beyond 2020.06.16
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 13, 2020 at 9:10 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Tue, 2020-08-11 at 23:37 -0700, Khem Raj wrote:
> > License-Update: License is now apache-2.0 as per [1]
> >
> > Fixes build wih gcc10
> > Add new dependency on ocl-icd
>
> Why does it need to depend on ocl-icd?

It needs headers from it.

>
> Thanks,
>
> Anuj
>
> > Gather install artifacts from new locations
> >
> > [1]
> > https://github.com/KhronosGroup/OpenCL-ICD-Loader/commit/44f384ae624675d6b0b92ce39a97cb7f4899d92a
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../opencl/opencl-icd-loader_git.bb            | 18 ++++++++++----
> > ----
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
> > b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
> > index 7c49c8d552..3b9d050569 100644
> > --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
> > +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
> > @@ -1,24 +1,27 @@
> >  SUMMARY  = "OpenCL ICD Loader"
> >  DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
> > -LICENSE  = "Khronos"
> > -LIC_FILES_CHKSUM =
> > "file://LICENSE.txt;md5=ec724732ce73269486574c718ef0c79b"
> > +LICENSE  = "Apache-2.0"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> >  SECTION = "base"
> >
> > +DEPENDS += "opencl-headers ocl-icd"
> > +
> >  inherit pkgconfig cmake
> >
> >  S = "${WORKDIR}/git"
> > -SRCREV = "b342ff7b7f70a4b3f2cfc53215af8fa20adc3d86"
> > +PV = "2020.06.16+git${SRCPV}"
> > +SRCREV = "862eebe7ca733c398334a8db8481172a7d3a3c47"
> >  SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git"
> >
> >  do_install () {
> >       install -d ${D}${bindir}
> > -     install -m 0755 ${B}/bin/icd_loader_test ${D}${bindir}/
> > +     install -m 0755 ${B}/test/loader_test/icd_loader_test
> > ${D}${bindir}/
> >       chrpath -d ${D}${bindir}/icd_loader_test
> >       install -d ${D}${libdir}
> > -     install -m 0644 ${B}/lib/libIcdLog.so ${D}${libdir}/
> > -     install -m 0644 ${B}/lib/libOpenCLDriverStub.so ${D}${libdir}/
> > +     install -m 0644 ${B}/test/log/libIcdLog.so ${D}${libdir}/
> > +     install -m 0644 ${B}/test/driver_stub/libOpenCLDriverStub.so
> > ${D}${libdir}/
> >       chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
> > -     install -m 0644 ${B}/lib/libOpenCL.so.1.2 ${D}${libdir}/
> > +     install -m 0644 ${B}/libOpenCL.so.1.2 ${D}${libdir}/
> >       cd ${D}${libdir}
> >       ln -s libOpenCL.so.1.2 libOpenCL.so.1
> >       ln -s libOpenCL.so.1 libOpenCL.so
> > @@ -41,5 +44,4 @@ FILES_${PN}-dev = " \
> >  FILES_libicdlog = "${libdir}/libIcdLog.so"
> >  FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so"
> >
> > -DEPENDS = "opencl-headers"
> >  RDEPENDS_${PN} = "libicdlog"
> > 
