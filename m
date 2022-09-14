Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2703C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 15:39:49 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.889.1663169979931152501
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WH7MnhjK;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-12803ac8113so42005513fac.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aMSGdbGeCrv07wh6BT9NBcGvYuYGRhgALcfO6frwi/M=;
        b=WH7MnhjKe7XaUjKqb1qOngYpclbhfED1/Z9dlzI6D223yvrcBWhD0gB79EBPDns2eX
         v/TH8Ghnf6pHb9FzOpTd75e3sdmcfKWH7nM67/Z4iXSCip85kKphLoi+l8SHMFMRDzX5
         IN67OPboXBYZtQ+grUC3ffUWO6EP1/GhiRTRLq8Ue/kb3Nb5L/8fQTYN9T7rQSixO8Mg
         67sdNsMtxLshzqszAHV46JgElz0grLUJTh7GjBv5iAJduqEFtEf0bpUglnddiRB3x+Og
         BBJFIYkkWDrTKYmj31n3uPm4kwycq8wrKUsO6xJ+VIkGMCTWPWjbwLG4QuTKIT3imxXA
         FPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aMSGdbGeCrv07wh6BT9NBcGvYuYGRhgALcfO6frwi/M=;
        b=qXn9IEsjSbMMk9bSWLp+2gyn+sSM8GtPTc1Dj4yPC53tNC4t7SEdb9vD/YDounwngA
         CkXn3AFBvTNDbtvqb5gneoP4oPYSNkETz+2NRgdTLNB3dbL5h2l9JtXhc+qQg3HlhFGW
         RznzhSrqLoUFKk0yodBN/jrDDxPOOCLpO4yqhMUjfVpQWbTDb8YD6rgxxNC2NTjLlQZG
         JRSVQm9n5HqVksqtfcmxuW+FXI+PEfRgWHcYI5VOZSSnJc95JVa+HXEywoyPG/M4Cf5B
         WJGuc4C5hG2IijAXVxNwaPyyJUXOp4+k/8pamhr9wfvp9tDOMr3xGhPYV+jXHJ3GwpCO
         uA0w==
X-Gm-Message-State: ACgBeo1W0cNvnSUjPjZSmPHoksvd2VeaUtdyNA+g/VjHsmlzMNrCtMzu
	niHEcrbJOb7Gh/8cgyC8NuPFPp6rWORrhXl/y8A=
X-Google-Smtp-Source: 
 AA6agR6c6QwiFdA1EVF8/sfPSz9Be/AFg4cL7tVC6ods1bFGwhxmWtC9GYcS9uMmJgAMuPgpV1KpBRldOgyAN0Zh7p0=
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id
 t34-20020a056870f22200b0010b732618c2mr2563625oao.55.1663169979127; Wed, 14
 Sep 2022 08:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220914120316.551377-1-alex@linutronix.de>
 <20220914120316.551377-8-alex@linutronix.de>
In-Reply-To: <20220914120316.551377-8-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Sep 2022 08:39:13 -0700
Message-ID: 
 <CAMKF1srODCYhLrzYWBTrCwB9Y3UuOo0OMWYrShorg7J=2yJGYw@mail.gmail.com>
Subject: Re: [oe] [PATCH 8/8] sip3: remove the recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 15:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98807

Thanks for the series.  I do see this package is still actively developed see
https://www.riverbankcomputing.com/news/SIP_v6.6.2_Released and pypi
https://pypi.org/project/sip/

On Wed, Sep 14, 2022 at 5:03 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> It is not compatible with python 3.11, and all
> development has ceased:
> https://riverbankcomputing.com/software/sip/download
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 -
>  meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  | 40 -------------------
>  2 files changed, 41 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 756ba46e3..cc1c87712 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -301,7 +301,6 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
>      python3-distutils-extra \
>      python3-pycups \
>      rapidjson \
> -    sip3 \
>      squashfs-tools-ng \
>      uftrace \
>      unifex \
> diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> deleted file mode 100644
> index d6335585e..000000000
> --- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -SUMMARY = "SIP is a C++/Python Wrapper Generator"
> -HOMEPAGE = "https://riverbankcomputing.com/software/sip/"
> -SECTION = "devel"
> -LICENSE = "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
> -
> -SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
> -"
> -SRC_URI[md5sum] = "70adc0c9734e2d9dcd241d3f931dfc74"
> -SRC_URI[sha256sum] = "22ca9bcec5388114e40d4aafd7ccd0c4fe072297b628d0c5cdfa2f010c0bc7e7"
> -
> -inherit python3-dir python3native
> -
> -S = "${WORKDIR}/sip-${PV}"
> -
> -DEPENDS = "python3"
> -
> -PACKAGES += "python3-sip3"
> -
> -BBCLASSEXTEND = "native"
> -
> -CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
> -CONFIGURE_SYSROOT:class-native = "${STAGING_DIR_NATIVE}"
> -
> -do_configure:prepend() {
> -    echo "py_platform = linux" > sip.cfg
> -    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
> -    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
> -    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
> -    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
> -    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> -    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
> -}
> -
> -do_install() {
> -    oe_runmake install
> -}
> -
> -FILES:python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
> -FILES:${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98802): https://lists.openembedded.org/g/openembedded-devel/message/98802
> Mute This Topic: https://lists.openembedded.org/mt/93675939/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

