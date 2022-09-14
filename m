Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A49ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 17:01:20 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web08.2018.1663174870931627885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 10:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N5H7nOl0;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id p5so19042049ljc.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ujp+Tvmqz+kUL9RRXgO0VDnkCgHlATCm8uWis48Arbo=;
        b=N5H7nOl0AScD0hTDbNm1mMiaxsuQ5s2trIsEKKnC+Im503hOBcyoSA/o57cANiGgP8
         65M5XAhESb7oGueQdWzidCgcnmN+9mseKXhpVVPBk7onjI10StaAlZtTBV4IhJCG3SM4
         7ZLysaJbu9EfQcwCkbQk699/N9fg2x6xvLFvgDF60mNCYWx8AVJ5MRQ2bLRImh9mFMoy
         UYda1O+vhhlY1oFMjvrfkOfM4XfZzzj6cNAF7kjWQq3/lquvQckiqag4hnEong88wVpl
         E8bJgkC+Rb/wB/Ut1mKapYQ6VEAPmnMGj9LKLShzlHmvqFVRa4nVFC1RniLyLoWn4VUG
         41nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ujp+Tvmqz+kUL9RRXgO0VDnkCgHlATCm8uWis48Arbo=;
        b=UtAeVRIZh8q5CmNyUtexIE70CfAZiHNW46RtO++FcdVE8j25ThjECsKpmUiYW623ZN
         z4Us9LZ02PaAfa8RpnaskBgt7NWqbMKw8NBB6huv6bbZgMLGFBIYNhQOj9hP7yCZcuRg
         6ZnFddv5Rmd5CbmTWf/LbtPT0Ab75tgcB+OByN8I3QCMUnagvWn7kCmHRNdDV9IG2G9H
         3SndNyBz9DrXmcWap4QSoFiTZK7SoG1DEXzIWymNJch/f8kVU4YzG3GQr0q395sfxHYn
         m2ILHWSON11eeJwe68IGBOnNL5nJfNy7P+MdAplGVsLy6OrBeB/sNvQIQ5gRcNTMH/mG
         QNgg==
X-Gm-Message-State: ACgBeo2PjlijpWy08rhcEObg7gjKN9NVBtN6LNA9qpRM9hOP0rXsLcTP
	dMSKuwa/aC4qaFsl17/5oH9oQFFZ3R8UqezQfus=
X-Google-Smtp-Source: 
 AA6agR6KaU4L7wD89JBh3VrE478m5tHMNpE9WCn/YNrZ5IpgEmcAykGbkiSkJxEGkpH6rrLnX8DngHeZhaRU7+CAHJg=
X-Received: by 2002:a05:651c:104e:b0:26b:fceb:a526 with SMTP id
 x14-20020a05651c104e00b0026bfceba526mr5318916ljm.109.1663174868875; Wed, 14
 Sep 2022 10:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220914120316.551377-1-alex@linutronix.de>
 <20220914120316.551377-8-alex@linutronix.de>
 <CAMKF1srODCYhLrzYWBTrCwB9Y3UuOo0OMWYrShorg7J=2yJGYw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srODCYhLrzYWBTrCwB9Y3UuOo0OMWYrShorg7J=2yJGYw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 19:00:45 +0200
Message-ID: 
 <CANNYZj8XFcuLi9dFuH-Zexk6v-ppC7LL4rNaLCU-UrB8-cAajA@mail.gmail.com>
Subject: Re: [oe] [PATCH 8/8] sip3: remove the recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 17:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98808

Right, perhaps the existing v4 recipe could be transitioned out via
SKIP_RECIPE, but it shouldn't stay in meta-oe. There's no evidence of
active usage either, just 'fixes from Khem' in the history.

Alex

On Wed, 14 Sept 2022 at 17:39, Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks for the series.  I do see this package is still actively developed see
> https://www.riverbankcomputing.com/news/SIP_v6.6.2_Released and pypi
> https://pypi.org/project/sip/
>
> On Wed, Sep 14, 2022 at 5:03 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > It is not compatible with python 3.11, and all
> > development has ceased:
> > https://riverbankcomputing.com/software/sip/download
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../packagegroups/packagegroup-meta-oe.bb     |  1 -
> >  meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  | 40 -------------------
> >  2 files changed, 41 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index 756ba46e3..cc1c87712 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -301,7 +301,6 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
> >      python3-distutils-extra \
> >      python3-pycups \
> >      rapidjson \
> > -    sip3 \
> >      squashfs-tools-ng \
> >      uftrace \
> >      unifex \
> > diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> > deleted file mode 100644
> > index d6335585e..000000000
> > --- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -SUMMARY = "SIP is a C++/Python Wrapper Generator"
> > -HOMEPAGE = "https://riverbankcomputing.com/software/sip/"
> > -SECTION = "devel"
> > -LICENSE = "GPL-2.0-or-later"
> > -LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
> > -
> > -SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
> > -"
> > -SRC_URI[md5sum] = "70adc0c9734e2d9dcd241d3f931dfc74"
> > -SRC_URI[sha256sum] = "22ca9bcec5388114e40d4aafd7ccd0c4fe072297b628d0c5cdfa2f010c0bc7e7"
> > -
> > -inherit python3-dir python3native
> > -
> > -S = "${WORKDIR}/sip-${PV}"
> > -
> > -DEPENDS = "python3"
> > -
> > -PACKAGES += "python3-sip3"
> > -
> > -BBCLASSEXTEND = "native"
> > -
> > -CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
> > -CONFIGURE_SYSROOT:class-native = "${STAGING_DIR_NATIVE}"
> > -
> > -do_configure:prepend() {
> > -    echo "py_platform = linux" > sip.cfg
> > -    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
> > -    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
> > -    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
> > -    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
> > -    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> > -    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
> > -}
> > -
> > -do_install() {
> > -    oe_runmake install
> > -}
> > -
> > -FILES:python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
> > -FILES:${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#98802): https://lists.openembedded.org/g/openembedded-devel/message/98802
> > Mute This Topic: https://lists.openembedded.org/mt/93675939/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

