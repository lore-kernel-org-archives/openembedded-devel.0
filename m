Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.20780.1602867357057557280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 09:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ybu3RdjX;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id j62so2027256qtd.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2020 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ubalmfCKJ1uqBAbBGvKWmOxFcYI+psAOxva+xD0JToM=;
        b=Ybu3RdjXRB37UzPC4rQyt9MJR4GOUKQQMHm3f3wELRqpXaGozb11I87RJaiiaMtc7H
         PJ1PWvSuW/pyHOu2ScbTq2YMqCGwz5k1UxgcHIOEAdScpALMKFS/oZ1LZ4EZEMF6VQxi
         r98zH9l6SaFVVHvBp+TMWAeVu9Pdh0Eu6uXrVCKiK2akVlytbs/osOgEMpL1F25G65S+
         lHsAyMy91wRLAdWobkhQ66W9f83DzdttxO1hMoyjbmzaJU6FWSnp8GEi/gG0muUXAzTr
         MIglq2/zvbMz/b8eB726/dmvKr7VZ1bPV0YbPG55xnPvZzA4cxodwB/Z/TVwcL0CrqoY
         ZYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ubalmfCKJ1uqBAbBGvKWmOxFcYI+psAOxva+xD0JToM=;
        b=Yf+cmgC13WYLSnBygYfgwgTdWmHr2rn3O+6IIvjad7LIhvvmsLfzDEqEvnAB1hBwVC
         zgfa4nOJMj0h6UL16ytWHlUzfnAU4JJaOztLVqB1CRjseTpFbgWXMTWcD4G1qWYtpj48
         9IxSXSqS5SLki7Mmyq8DxsJ0JlyXCB6WGh9rEgWFu1NOnMFqZBuzq6v1c9hL0EpFyQ8J
         cZK5nkXzHqb54LH3BTQMi3mcqKybOUmVRTOrt6UZMNr8hkR9X8z0+SKGzSsbf4yAHdn7
         7MouWaBL+BFiwtVzT7zaVRhsP8I/FEoiCHAbpL4LlQEw96REDqoHCJARYNfVKmJOvanb
         wYMw==
X-Gm-Message-State: AOAM530EDG4IoK84a9mcIwr6d39V/lb8iCewoMjK8GDd5VCYM5IB29zX
	A1slgrtSLhtOjtCGAKy6/AdC+OIAiGn8vkvHcus=
X-Google-Smtp-Source: ABdhPJwJa2VjdJqbH/MijoAvxky8DAb2XUJUSctQ2TkJ1MHMjCFinn0NlvW1Ru3wMDTQQXjkqHvrn3cicastyD3Aaf4=
X-Received: by 2002:ac8:5985:: with SMTP id e5mr4157541qte.88.1602867356104;
 Fri, 16 Oct 2020 09:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201016022206.489864-1-raj.khem@gmail.com> <743957163ca545a7a0b42d0da4b6149e@XBOX03.axis.com>
In-Reply-To: <743957163ca545a7a0b42d0da4b6149e@XBOX03.axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 16 Oct 2020 09:55:30 -0700
Message-ID: <CAMKF1so5=dq4LEYCmqbxjV8M=ue6G4_VxuKE7q605hDCtLSTFw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] samba,arptables,ncp: Use new license names in LIC_FILES_CHKSUM
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020 at 9:51 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 16 oktober 2020 04:22
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [oe] [meta-networking][PATCH 1/2] samba,arptables,ncp: Use new license names in LIC_FILES_CHKSUM
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-networking/recipes-connectivity/samba/samba_4.10.18.bb | 4 ++--
> >  meta-networking/recipes-support/arptables/arptables_git.bb  | 2 +-
> >  meta-networking/recipes-support/ncp/ncp_1.2.4.bb            | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> > index b5085c913b..cfbb113c7f 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> > @@ -3,8 +3,8 @@ SECTION = "console/network"
> >
> >  LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> > -                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
> > -                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
> > +                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0-only;md5=bfccfe952269fff2b407dd11f2f3083b \
> > +                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>
> Based on LICENSE above, that should rather be LGPL-3.0-or-later and
> GPL-2.0-or-later. The same also applies to libconfig-autoconf-perl,
> libfile-slurper-perl, libunix-statgrab and libtest-warnings-perl
> that you also sent patches for. That of course assumes those
> license files are added first...

right, I was just keeping is bug compatible. I think the patch to
rename these files in core perhaps should include these additional
files ofcourse if these
are specified by SPDX. For now these patches can be ignored. perhaps
once master is open for 3.3 we can redo them

>
> //Peter
>
> >
> >  SAMBA_MIRROR = "http://samba.org/samba/ftp"
> >  MIRRORS += "\
> > diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
> > index c02a19944d..5afec7663a 100644
> > --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> > +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Administration tool for arp packet filtering"
> >  SECTION = "net"
> >  LICENSE = "GPL-2.0"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> >  SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
> >  PV = "0.0.5+git${SRCPV}"
> >
> > diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > index f42223b1f8..a2f0ccc069 100644
> > --- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > @@ -4,7 +4,7 @@ security or integrity checking, no throttling, no features, except \
> >  one: you don't have to type the coordinates of your peer."
> >  HOMEPAGE = "http://www.fefe.de/ncp"
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> >  DEPENDS = "libowfat"
> >
> >  SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
> > --
> > 2.28.0
>
