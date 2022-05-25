Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21E2C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 15:09:16 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.8039.1653491353068440500
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 08:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i4yL5m4g;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id c1so17597002qkf.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CiNMAxHjA5MQA4W8Ft1Y2EIkSXGOc7Cg92PdGV3Ybvg=;
        b=i4yL5m4gg5lNGwtSzBIUqjDaQPS/xc0WDppy66Vp9nFvcYOLxkSX0h+Oduqo+71rAz
         VZ5Yv89OdtjuQa1BQXMa2v973DnpFHf3c6qSj8DFOxWS4Bv89M0lRenK3VqreWyMT6+k
         I1xrmPFv0jijgoV0hMbWmybTbueTp6SKlXWe8nrAvdBeQVJZpZ/yGXDI0lTFe8ToWBpC
         yLfOjQrosnFuUqnniC+lPYNLuOJI9ocRTwsYqh8MP277I/qZs0n3axKEEoK92kpcByD9
         B2t3wvaEVin74cTdHABMdoMGtWcCYshoAQGp56MwMIns1qAaipj0IP9HgAIKdS0VkWeO
         lIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CiNMAxHjA5MQA4W8Ft1Y2EIkSXGOc7Cg92PdGV3Ybvg=;
        b=WAhUBdiGpJDvqucxWPFBpVOgHz/MtZ9pSTMN7H6Y/RkeCX52fqg1s7cKnKNPwwqJ/r
         +xKJNdSBw70KE9qwyKq12cg1ag/N/RR2zXegVSjpJk2torRC7Pl+PvQDaeGtDZ3xnsyW
         5JNFNFUXMAnwp+0T/htpuMFlrW1MQFQnD7h4KyZSUsqyZSK+h1ZS77Pr3mHuLyxn3C9h
         21cxaB+MbRZGSjbNjQR9lV++RfwmCgZcQbOiIbfBRPVI9X/Ito/lRxeSbUBaAeOun4kJ
         2JomlMrgRObN2faUoYg9Bm34O2V48mcxFtys1KXmlho77Z9inWa/+DJse0N4mKsZCxg+
         BAjA==
X-Gm-Message-State: AOAM5311/tPb+Vt3DcnDrM18oBh4j+Ichv7F/dBaFs1OWWgNgTlcsQ+W
	7SQlKg5uzSrNFiPxpQeW+/CyqMXi4cnIFy1iUgg=
X-Google-Smtp-Source: 
 ABdhPJw3X89fe6K93pp+76gQ/nJbCYGuo4Hb1xIIAVMohFJClj5Z14F1oUW5m6J8cG9b4jRuAFBNzPHQWleVKCNTWU4=
X-Received: by 2002:a37:660a:0:b0:6a3:4868:c730 with SMTP id
 a10-20020a37660a000000b006a34868c730mr18180763qkc.180.1653491351763; Wed, 25
 May 2022 08:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220524121153.1175133-1-ross.burton@arm.com>
 <20220524121153.1175133-5-ross.burton@arm.com>
 <CAMKF1soJ-jkyxf-uGNvWK4YANcoMdk-H5VHoHpOr3WXtuB4Z4w@mail.gmail.com>
 <62ECDE0E-7D6D-4C49-A07C-DA29DA148BA7@arm.com>
In-Reply-To: <62ECDE0E-7D6D-4C49-A07C-DA29DA148BA7@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2022 08:08:45 -0700
Message-ID: 
 <CAMKF1sp63nr3huSSjxGvYB1rOeuDu31VLuJLXiKqLT6VosyHMA@mail.gmail.com>
Subject: Re: [oe] [PATCH 5/7] python3-hatchling: add new recipe and build
 class
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 15:09:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97269

On Wed, May 25, 2022 at 3:37 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> Sorry, forgot to say that this series depends on a patch I=E2=80=99ve sen=
t for oe-core (to add pluggy-native).
>

yeah figured

> Ross
>
> > On 24 May 2022, at 21:32, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Its failing YP compat checks see
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1778
> >
> > On Tue, May 24, 2022 at 5:12 AM Ross Burton <ross.burton@arm.com> wrote=
:
> >>
> >> Hatchling is the build backend used by the Hatch tool.  Add the recipe
> >> and a pep517 build class.
> >>
> >> Signed-off-by: Ross Burton <ross.burton@arm.com>
> >> ---
> >> meta-python/classes/python_hatchling.bbclass  |  5 +++++
> >> .../packagegroups/packagegroup-meta-python.bb |  1 +
> >> .../python/python3-hatchling_1.3.0.bb         | 21 +++++++++++++++++++
> >> 3 files changed, 27 insertions(+)
> >> create mode 100644 meta-python/classes/python_hatchling.bbclass
> >> create mode 100644 meta-python/recipes-devtools/python/python3-hatchli=
ng_1.3.0.bb
> >>
> >> diff --git a/meta-python/classes/python_hatchling.bbclass b/meta-pytho=
n/classes/python_hatchling.bbclass
> >> new file mode 100644
> >> index 0000000000..b3cbe23601
> >> --- /dev/null
> >> +++ b/meta-python/classes/python_hatchling.bbclass
> >> @@ -0,0 +1,5 @@
> >> +inherit python_pep517 python3native python3-dir setuptools3-base
> >> +
> >> +DEPENDS +=3D "python3-hatchling-native"
> >> +
> >> +PEP517_BUILD_API =3D "hatchling.build"
> >> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-=
python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python=
.bb
> >> index 2fcf34260c..80ec0720fd 100644
> >> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
> >> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
> >> @@ -168,6 +168,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
> >>     python3-h11 \
> >>     python3-h2 \
> >>     python3-h5py \
> >> +    python3-hatchling \
> >>     python3-haversine \
> >>     python3-hpack \
> >>     python3-html2text \
> >> diff --git a/meta-python/recipes-devtools/python/python3-hatchling_1.3=
.0.bb b/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
> >> new file mode 100644
> >> index 0000000000..a6550a9732
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
> >> @@ -0,0 +1,21 @@
> >> +SUMMARY =3D "The extensible, standards compliant build backend used b=
y Hatch"
> >> +HOMEPAGE =3D "https://hatch.pypa.io/latest/"
> >> +LICENSE =3D "MIT"
> >> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcbe2fd33fc9297692812fc=
94b7d27fd9"
> >> +
> >> +inherit pypi python_hatchling
> >> +
> >> +DEPENDS +=3D "python3-pluggy-native python3-tomli-native python3-path=
spec-native python3-packaging-native python3-editables-native"
> >> +DEPENDS:remove:class-native =3D "python3-hatchling-native"
> >> +
> >> +SRC_URI[sha256sum] =3D "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a=
97f2b0040fdddc5b85e"
> >> +
> >> +# Until we have a proper tool to invoke PEP517 builds, hatchling can'=
t
> >> +# bootstrap itself automatically.
> >> +PEP517_BUILD_API =3D "hatchling.ouroboros"
> >> +
> >> +do_compile:prepend() {
> >> +    export PYTHONPATH=3Dsrc
> >> +}
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> --
> >> 2.25.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#97246): https://lists.openembedded.org/g/openembed=
ded-devel/message/97246
> >> Mute This Topic: https://lists.openembedded.org/mt/91309500/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

