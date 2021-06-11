Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.5920.1623402260178574925
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jun 2021 02:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gC62d2R4;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id k11so28600998qkk.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bjy28MIcPdR4uOqstUidCMpj9lW3biHTYMX201He9sE=;
        b=gC62d2R4k6EiA77WEDiOM0xbTeF5gk4Mh5AtQ0GRIgM0In9oxYvo/QrypU7LCyAij4
         RKHpsgDwPPgYaVTgi9VjMUjaK213bjIAMOy7UG/kL8g9xZ044hq+SF1dkmHtyYhUxFUq
         Hndo32YPRDkPAkw2nHeYO1uiTsr/aXfYjhN1jbLPhhW2CHiiAt2L4FfbKP5/WMme2CE9
         jfy1t2dG2kdZizherepDIViRCBmJ9AXDCHRw2LI6aKhhqxmMOPrk3VSwP3r9OvRfM2y5
         MPdqw1jyp00o5dGcaryjOZVG7dh5pOLuXZYGmH2/SDGDoTdl6vjrk9e4Pso2ZvOQbURd
         RNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bjy28MIcPdR4uOqstUidCMpj9lW3biHTYMX201He9sE=;
        b=A+xa+ozyT3wLHgfEiajoCqzIgjc97jYLwaQR6jq7EM7KYNuWkY8i52A+zgH4bjB1WI
         8g/UcaSvMrWf3/vtbMS0sxX0izLyAx2VU2Gvym314Vqk2/kpXVL7HEWu9G7MakV9qdB7
         mQurqEVZZjv3QCBNWA42sH0DtRN4wbmmReiunIAowqHKve0JjzDiawQ8XSG6S84q/r1u
         h8sSEjETSO2TOeMf80Bidevr+E5L2Z9p0i0gK9iNB+LWJjuCyZocsCwVewe7JN4rOBa7
         Ior7IlfQRzPzvMm6iQTBkGIZNREY7QoXkbSNiUFxsFSFdn5kR25v1fruYmbDjZX4VnsU
         gQaA==
X-Gm-Message-State: AOAM530Bl9dv3HJq6vAyaZDnzqslo/YG+x8cQZnm97N/TNjp/mmGnE5a
	v6PxCsIuvyWof5qgnArDKJuG7qiL3WVfMyIXZjI=
X-Google-Smtp-Source: ABdhPJzeMjcOHNDXuLykVFQTdKQAUV6LF8AURPufXkeF383b94SceCqkCXPGessTA3Pw+MFopgqRO+tKDNCd8VxPGdY=
X-Received: by 2002:a37:855:: with SMTP id 82mr2807334qki.25.1623402259218;
 Fri, 11 Jun 2021 02:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <1684CA9392B80A90.9760@lists.openembedded.org> <2bb803e7-baec-2d98-b62c-f6a0173d970a@gmail.com>
In-Reply-To: <2bb803e7-baec-2d98-b62c-f6a0173d970a@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 11 Jun 2021 02:03:51 -0700
Message-ID: <CAMKF1spYSt4M=NemeQuB0bv9eV75EZ4tt-Eh0dJe-AmSZVnk-A@mail.gmail.com>
Subject: Re: [oe] dunfell merge request June 2
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

It should be upstream now sorry for delay,

On Thu, Jun 10, 2021 at 9:27 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 6/2/21 7:34 AM, Armin Kuster via lists.openembedded.org wrote:
> > The following changes since commit 11eae114522a6befa06c7f4021a83bc016133543:
> >
> >   linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/meta-openembedded dunfell-next
> >
> > for you to fetch changes up to c38d2a74f762a792046f3d3c377827b08aade513:
>
> Let me know if there are any issues with this merge request. I may have
> missed a response.
>
> -armin
> >
> >   dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45
> > -0700)
> >
> > ----------------------------------------------------------------
> > Alexander Vickberg (1):
> >       hostapd: fix building with CONFIG_TLS=internal
> >
> > Mikko Rapeli (1):
> >       ebtables: use bitbake optimization levels
> >
> > Sana Kazi (1):
> >       dnsmasq: Add fixes for CVEs reported for dnsmasq
> >
> > akash.hadke (1):
> >       opencv: Add fix for CVE-2019-5063 and CVE-2019-5064
> >
> > wangmy (8):
> >       exiv2: Fix CVE-2021-29457
> >       exiv2: Fix CVE-2021-29458
> >       exiv2: Fix CVE-2021-29463
> >       exiv2: Fix CVE-2021-3482
> >       exiv2: Fix CVE-2021-29464
> >       exiv2: Fix CVE-2021-29470
> >       exiv2: Fix CVE-2021-29473
> >       libsdl: Fix CVE-2019-13616
> >
> >  .../ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch     |  19 +
> >  meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb    |   1 +
> >  meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         |   7 +-
> >  .../recipes-support/dnsmasq/files/CVE-2020-25681.patch          | 370
> > ++++++++++++++++++
> >  .../recipes-support/dnsmasq/files/CVE-2020-25684.patch          |  98 +++++
> >  .../recipes-support/dnsmasq/files/CVE-2020-25685-1.patch        | 587
> > ++++++++++++++++++++++++++++
> >  .../recipes-support/dnsmasq/files/CVE-2020-25685-2.patch        | 175
> > +++++++++
> >  .../recipes-support/dnsmasq/files/CVE-2020-25686-1.patch        | 332
> > ++++++++++++++++
> >  .../recipes-support/dnsmasq/files/CVE-2020-25686-2.patch        |  63 +++
> >  .../hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch |  45 +++
> >  meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb             |   1 +
> >  .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch  |  27 ++
> >  meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                |   1 +
> >  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch        |  26 ++
> >  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch        |  37 ++
> >  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch        | 120
> > ++++++
> >  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch        |  72 ++++
> >  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch        |  32 ++
> >  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch        |  21 +
> >  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch         |  54 +++
> >  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   |   9 +-
> >  .../opencv/opencv/CVE-2019-5063_and_2019-5064.patch             |  78 ++++
> >  meta-oe/recipes-support/opencv/opencv_4.1.0.bb                  |   1 +
> >  23 files changed, 2174 insertions(+), 2 deletions(-)
> >  create mode 100644
> > meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
> >  create mode 100644
> > meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
> >  create mode 100644
> > meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
> >  create mode 100644
> > meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.patch
> >  create mode 100644
> > meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.patch
> >  create mode 100644
> > meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.patch
> >  create mode 100644
> > meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.patch
> >  create mode 100644
> > meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
> >  create mode 100644
> > meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
> >  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
> >  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
> >  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
> >  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
> >  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
> >  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
> >  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
> >  create mode 100644
> > meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
> >
> >
> > 
> >
>
