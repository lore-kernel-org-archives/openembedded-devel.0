Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.8395.1587828823351277890
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 08:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YcKl9lG1;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id o10so10544450qtr.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9oTedK/7T26CRTETcY4/vZJw2BXyw1MN4NSJ7UPUjY=;
        b=YcKl9lG1YSddWfQFN94cOEKQOLNQCuUuyKnDGslhSpHsmWudiOUoLNZakxTh803XXt
         AR3hGNT7AWaINF8SKdhzJpqxOECLOh+F+IUbczpwfn35kyBEIR/bjZlYEu5mZuhbAkSH
         iQJBhY0mnQJnm+gHMWTPOYF94Q9A22f1bimLh2g/Fkpp5DGaU0+5+h/dF4xmEfnpNzkV
         QcKKCpI0WFECe3D9Ax1ua0X00NyrvZlffEosppoajMmCAxa2lDXtbPer+9oIxHm8T4bk
         3NdfgnfYExi2unpydQ2vH50nUtnGIXWlP4F8xx+NAj4XHKgs4eak5l9YVulLcNX1XNrv
         Fxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9oTedK/7T26CRTETcY4/vZJw2BXyw1MN4NSJ7UPUjY=;
        b=SfoeFc7ofRXmrxQkIN9s45Fkcyl5lBebZCh+9ajbC9bgaEiWAoVcgXtH2ExlR/KcYc
         ZDqqZcH5+OsvNcnPH3/Aqp28FO5BVriX/IExUVbOzABVtY5R7QLaMWWSGx3vqAf1ov/i
         WUOtkhQGtlAEqXiq7vLBuh7QGQqdD3BBbreLNFn9PG83VLTVRD2nxANuxJnMzmJAufgx
         HpUNF1RhyLu74PoV+vbuuTaczB2TRKuShFgY2cqWcDHaicGxu+WGncmBByJIXF//yqZf
         Lhk+e7ikRMwgyKTBMFmAR0IbN4ac8djAK2XKICN6wRpsrVRDgNn5i9rRR3maW9dMgTdb
         epAw==
X-Gm-Message-State: AGi0PuZKvW1Yi11SjJ8jCJs09mM9iGm69hKeIBAIMlshRZNR/iZ+0avf
	4gmnrlyuzRfRGeHMYzRVucUKzQMp5sLcEp0QBBWkwMtX
X-Google-Smtp-Source: APiQypIOavHuRKiDxbFfrmBdpdttSLG9QkYvuqvhBHWQ9jRD68UNixXe7M1j/K2vmkIhOoa+FlzxkkW8jss2d3kkD9s=
X-Received: by 2002:ac8:668b:: with SMTP id d11mr14776134qtp.285.1587828822096;
 Sat, 25 Apr 2020 08:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200422200630.79513-1-mcampbell@izotope.com> <e4ac0a4da76740ed8a6919b6018cd2cc@XBOX03.axis.com>
In-Reply-To: <e4ac0a4da76740ed8a6919b6018cd2cc@XBOX03.axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 25 Apr 2020 08:33:16 -0700
Message-ID: <CAMKF1sowV6rYshjjYxPsHDOwB7+nK3i2smSZ9cbgSBoj+vQaGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Matt Campbell <Mcampbell@izotope.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 24, 2020 at 12:31 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Matt Campbell
> > Sent: den 22 april 2020 22:07
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Matthew Campbell <mcampbell@izotope.com>
> > Subject: [oe] [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
> >
> > Changes from v1:
> > Fix formatting of patch
>
> The above should go below the --- line below as it relates to the
> review process rather than the change itself.
>

right, this time I fixed the commit msg before picking it up.

> //Peter
>
> > Signed-off-by: Matthew Campbell <mcampbell@izotope.com>
> > ---
> >  ...bus-c++-tools-native_0.8.1.bb => sdbus-c++-tools_0.8.1.bb} | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools-native_0.8.1.bb
> > => sdbus-c++-tools_0.8.1.bb} (89%)
> >
> > diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-
> > native_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > similarity index 89%
> > rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-
> > native_0.8.1.bb
> > rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > index e18b9903d..9eaec0f2a 100644
> > --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
> > +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION = "Native interface code generator for
> > development with sdbus-c++"
> >  LICENSE = "LGPLv2.1"
> >  LIC_FILES_CHKSUM =
> > "file://${S}/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
> >
> > -inherit cmake native
> > +inherit cmake
> >
> >  DEPENDS += "expat"
> >
> > @@ -12,3 +12,5 @@ SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
> >  SRC_URI = "git://github.com/Kistler-Group/sdbus-
> > cpp.git;protocol=https;branch=master;subpath=tools"
> >
> >  S = "${WORKDIR}/tools"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.20.1
>
> 
