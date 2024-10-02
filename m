Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1448CCF3197
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 06:18:22 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.1228.1727849894925193664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 23:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FTDK9od+;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fadc95ccfcso15628831fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 23:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727849893; x=1728454693; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cKJLwLIczDCGtJ3DmEGw4sV8cEYfQae6MIygcSgUAr0=;
        b=FTDK9od+pdJOi57w/50kWwY4Dpd4OE3Bv6SnsGu92gE5xh7BvSzSDS+KhuqsocNbiK
         W898sZkUeUMCzGy3eB1SMX6cWpqiycbvv2QKtKgO6TWws5K2EXapWxV/O6dfWjMVNrUb
         FKhBxB0e4f+AJpcSARFHS09/DjVDatCPe/qIgMDFtLvdH4SIozOAOqWR2q3ympOqbtpW
         rxKqq/427tK3819NvDU+J6KxpTHBlagd6rso+1eJgp6+e+T8BMEYM1o1U6sD7g9xhlQa
         Ok/Obz+9xPpQiW+RFSrVjXsViFshxqSqz9BptP2GFwmjgkarxrxOGPUd7fUSCMcZbOCY
         PmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727849893; x=1728454693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKJLwLIczDCGtJ3DmEGw4sV8cEYfQae6MIygcSgUAr0=;
        b=pCKe4AiCs8MDuq1dpq/OCq/UoMcRNmgg6dLKSPRifLbbJBd97M9pJpcrLaUAln7QDY
         QrnrPUkjKq952CiYXuY29HblRYatJZvN0qyo3byEU9uGos7wSzyEeH7Mk3YG3Dq9FFvn
         8Jjx/X+GNE0POz6wapIA5rqowO1mS3057dkVrJAHpZkTH/o8BjFEX1xUdUHUlfymCLDn
         0mDgnfW/6QLX2in0Vtfz3OR124DsZY2aYQRtpUn3i5/eAn+R85Eog7ladn4C7j67nFYi
         S3gmvtr9mL3Dsp0UaROMlJ6DtFNksc8OC0KUUtO75X5wIIGXfDykzdMPWeq0IaVdwaUu
         B9Cg==
X-Gm-Message-State: AOJu0Yx98wxW7aw3+xLoyvez3RQixrHYglHTJ89NreOVcMzuu+qtFJ2E
	8VxIAhoW114rxDPSgDvyWp/tlffQ/HnjHA3kEGXYo7zjcVhGtrzWxfLHE1psF4M=
X-Google-Smtp-Source: AGHT+IFuq6yH5JbJpCWvxBA8WzNmO8qJwI4O1oIMJblJAVjxiBcFixRb7ujAyiz1uBu8vw8Vdb2OIg==
X-Received: by 2002:a05:651c:1502:b0:2fa:ddb5:77f4 with SMTP id 38308e7fff4ca-2fae109929cmr11762541fa.38.1727849892311;
        Tue, 01 Oct 2024 23:18:12 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f9d46054casm19239581fa.98.2024.10.01.23.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 23:18:10 -0700 (PDT)
Date: Wed, 2 Oct 2024 09:18:06 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] python3-pefile: remove recipe
Message-ID: <Zvzlnt6-DovqseG9@nuoska>
References: <20241001141352.54484-1-mikko.rapeli@linaro.org>
 <CAMKF1so9hOSn2vrFFaBUEyfQBQfpm5AM-nyoUbjbKvoPempZ4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1so9hOSn2vrFFaBUEyfQBQfpm5AM-nyoUbjbKvoPempZ4A@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 06:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112640

Hi,

On Tue, Oct 01, 2024 at 09:24:35AM -0700, Khem Raj wrote:
> Hi Mikko,
> 
> I had a similar patch staged in master-next for a while, I have taken that one.

No problem. I need to remember to check master-next branches before submitting.

Cheers,

-Mikko

> On Tue, Oct 1, 2024 at 7:14 AM Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > It has been moved to oe-core.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  .../include/ptest-packagelists-meta-oe.inc    |  1 -
> >  .../python/python3-pefile/run-ptest           |  3 --
> >  .../python/python3-pefile_2024.8.26.bb        | 28 -------------------
> >  3 files changed, 32 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/python/python3-pefile/run-ptest
> >  delete mode 100644 meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
> >
> > diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > index f20eff219..ff48e9d14 100644
> > --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > @@ -36,7 +36,6 @@ PTESTS_FAST_META_OE = "\
> >      pegtl \
> >      protobuf \
> >      pv \
> > -    python3-pefile \
> >      sdbus-c++ \
> >      uthash \
> >      xmlsec1 \
> > diff --git a/meta-oe/recipes-devtools/python/python3-pefile/run-ptest b/meta-oe/recipes-devtools/python/python3-pefile/run-ptest
> > deleted file mode 100644
> > index 95ae72306..000000000
> > --- a/meta-oe/recipes-devtools/python/python3-pefile/run-ptest
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -#!/bin/sh
> > -
> > -pytest --automake --ignore=./tests/pefile_test.py
> > diff --git a/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb b/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
> > deleted file mode 100644
> > index 87e651d9d..000000000
> > --- a/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -SUMMARY = "Python PE parsing module"
> > -DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
> > -HOMEPAGE = "https://github.com/erocarrera/pefile"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=e34c75178086aca0a17551ffbacaca53"
> > -
> > -inherit setuptools3 ptest
> > -SRCREV = "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
> > -SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
> > -           file://run-ptest"
> > -S = "${WORKDIR}/git"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > -
> > -do_install_ptest() {
> > -   install -d ${D}${PTEST_PATH}/tests
> > -   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > -}
> > -
> > -RDEPENDS:${PN} += " \
> > -    python3-mmap \
> > -    python3-netclient \
> > -    python3-stringold \
> > -"
> > -RDEPENDS:${PN}-ptest += "\
> > -    python3-pytest \
> > -    python3-unittest-automake-output \
> > -"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112632): https://lists.openembedded.org/g/openembedded-devel/message/112632
> > Mute This Topic: https://lists.openembedded.org/mt/108759567/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

