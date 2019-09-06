Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id DA8A17F3EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:11:05 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id x5so5727173qkh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TPKsc1cq21DACoi/AdlHIB4RzLCgZnw8b094ngCfB60=;
	b=NcxIcawAmOUrs/d566zox75ROpCPwt01Nm3Z5PHiPD4hX6cyeOcceKD2jz8cNujw78
	bdlTnF1pSPrNBjlVMDMNDLCq5lWoxACJ/CwLpjNkxuha/8DK/+QUcWlknwgesTy45hfF
	m/WqebZi3vnVNP7pOTAcSNjPBTaA7lJ4PG9pDMaQIJSRi1kOUxt0dfV2RI2dCS/jW9yT
	ytJ7+zIGuSQ/ZPEMHvivkQh89OGWiWhta7Yrg2yCZqSej7rVoUVjZL9hOd1GsHxSGwfN
	F+KqAaReK2jecHfTiK1iUh9x0djzSepKZpnAXUPPeOARw1KukcMf/iKbzfkmVIMtCgGh
	F/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TPKsc1cq21DACoi/AdlHIB4RzLCgZnw8b094ngCfB60=;
	b=nstFN6d4V3xg3GwaPLMZ9FvkCR78u88zS118T3wSNhstQSFpla+rQkwTKmT7rc/oYs
	ZRPTkFV9zgbkU1/K3sn7RscxvoJiVWxO6nRtGcKlRPsN8yx2Wo8t7uk657SDvpHuM1eG
	0Fu346wibjGAG1PPg75LX8RqFhcolvDixU/RqW1KRCuKBRQaR5kijcrDiK5Tmvwk/dyL
	PrxRd6qpBcHpwb0aNQC2feckOMw82wT2N2iFzuO1tr1hpQfea6FpL7K+gVIY/bG2Jxfm
	gCV1vkqFrTOeXkgip/Mg97vaxyxZ9gijhZeHykTni2m2idsV20n2Kq2CVVLGItkHx/Sc
	KP1Q==
X-Gm-Message-State: APjAAAXwu6LeKB64Tlex3kw0Swxr13dlAafcAn06DR7idPbKv6XTcKPs
	fJ+9718CBJGElrV1uBXqhhsHCkS7eY9OaBilKRk=
X-Google-Smtp-Source: APXvYqyNkf8j+RuisYqeGb15eBI9QJtrf9J8uN4jKheCVL5sZOjltZRBoEsKBbpBugU4JeWPfHWA/TzF8PvibuRMViI=
X-Received: by 2002:a37:e40b:: with SMTP id y11mr7407329qkf.9.1567779064901;
	Fri, 06 Sep 2019 07:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <1567401728-113652-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1spnx4pPh5ObnVTyahxE6Z8y7GCkv3GC_oCwf-fL_eYu9A@mail.gmail.com>
	<CA+chaQdGBH3dr-S=T6o5ORbw4oJFsz6xkFJ39Vd10wrNCEb7dA@mail.gmail.com>
In-Reply-To: <CA+chaQdGBH3dr-S=T6o5ORbw4oJFsz6xkFJ39Vd10wrNCEb7dA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 07:10:53 -0700
Message-ID: <CAMKF1sqHccaBZpMZNeGnNi+9TY3PZwvFobP-SAvLmpt_VYdfbg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-cmd2: Add python3 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2019 14:11:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 2:35 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> This seems to be merged before python3-colorama was provided
>

Yes since the build did not break and it escaped my Eye now I am waiting
for a fix before I blacklist it

>
> On Wed, Sep 4, 2019 at 7:11 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> 03:10:10 ERROR: Nothing RPROVIDES 'python3-colorama' (but
>>
>> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/
>> python3-cmd2_0.9.16.bb
>> RDEPENDS on or otherwise requires it)
>> 03:10:10 ERROR: Nothing RPROVIDES 'python3-cmd2-dev' (but
>>
>> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/
>> python3-cmd2_0.9.16.bb
>> RDEPENDS on or otherwise requires it)
>> 03:10:10 No eligible RPROVIDERs exist for 'python3-cmd2-dev'
>> 03:10:11 ERROR: Nothing RPROVIDES 'python3-cmd2' (but
>>
>> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/
>> python3-cmd2_0.9.16.bb
>> RDEPENDS on or otherwise requires it)
>> 03:10:11 No eligible RPROVIDERs exist for 'python3-cmd2'
>>
>> On Sun, Sep 1, 2019 at 10:23 PM Zheng Ruoqin
>> <zhengrq.fnst@cn.fujitsu.com> wrote:
>> >
>> > Providing a python3 version of python-cmd2.
>> >
>> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> > ---
>> >  .../recipes-devtools/python/python-cmd2.inc       | 13 +++++++++++++
>> >  .../recipes-devtools/python/python-cmd2_0.9.16.bb | 15 ++-------------
>> >  .../python/python3-cmd2_0.9.16.bb                 |  9 +++++++++
>> >  3 files changed, 24 insertions(+), 13 deletions(-)
>> >  create mode 100644 meta-python/recipes-devtools/python/python-cmd2.inc
>> >  create mode 100644 meta-python/recipes-devtools/python/
>> python3-cmd2_0.9.16.bb
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc
>> b/meta-python/recipes-devtools/python/python-cmd2.inc
>> > new file mode 100644
>> > index 000000000..1a0be778b
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python-cmd2.inc
>> > @@ -0,0 +1,13 @@
>> > +SUMMARY = "Extra features for standard library's cmd module"
>> > +HOMEPAGE = "http://packages.python.org/cmd2/"
>> > +LICENSE = "MIT"
>> > +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
>> > +
>> > +SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
>> > +SRC_URI[sha256sum] =
>> "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
>> > +
>> > +inherit pypi
>> > +
>> > +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>> > +
>> > +BBCLASSEXTEND = "native nativesdk"
>> > diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
>> b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
>> > index 94db37a2d..17b6ae285 100644
>> > --- a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
>> > +++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
>> > @@ -1,14 +1,5 @@
>> > -SUMMARY = "Extra features for standard library's cmd module"
>> > -HOMEPAGE = "http://packages.python.org/cmd2/"
>> > -LICENSE = "MIT"
>> > -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
>> > -
>> > -SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
>> > -SRC_URI[sha256sum] =
>> "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
>> > -
>> > -inherit pypi setuptools
>> > -
>> > -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>> > +inherit setuptools
>> > +require python-cmd2.inc
>> >
>> >  RDEPENDS_${PN} += "\
>> >      ${PYTHON_PN}-doctest \
>> > @@ -21,5 +12,3 @@ RDEPENDS_${PN} += "\
>> >      ${PYTHON_PN}-threading \
>> >      ${PYTHON_PN}-textutils \
>> >      "
>> > -
>> > -BBCLASSEXTEND = "native nativesdk"
>> > diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
>> b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
>> > new file mode 100644
>> > index 000000000..f5c5c7e1a
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
>> > @@ -0,0 +1,9 @@
>> > +inherit setuptools3
>> > +require python-cmd2.inc
>> > +
>> > +RDEPENDS_${PN} += "\
>> > +    ${PYTHON_PN}-pyperclip \
>> > +    ${PYTHON_PN}-colorama \
>> > +    ${PYTHON_PN}-attrs \
>> > +    ${PYTHON_PN}-wcwidth \
>> > +    "
>> > --
>> > 2.17.1
>> >
>> >
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

