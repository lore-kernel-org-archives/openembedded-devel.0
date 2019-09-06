Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id CA4B17F365
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 09:35:35 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id t50so5732247edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 02:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gluSXX7QFqz+qrJOSMIY4AufxxFiwaSdP9RWjeGroGE=;
	b=NCdMsrPi7VIUXrYYrL6eA23dqjIV6EvQVnwZIZazXZC5604NCoAf2wj8a7kBs1Hicn
	ihN62Hxj0oriLtOg/IOjgMhiJcdQ5QY4bDLCLKHkMWKYKFqUrBS7xsoD923EBg8/BmMv
	CEq5PPto+yrOCp/+gHuAOfpHkb6wMVqLMUx49OK0Me3Eljnsx2NJFLzci+VbTj3qzQi4
	N6ALIccQfLwPSc14c4zBaRYPN8vW0LV2q+++SFFVaj3mvbRsG76GiXAvdWxtfsveJKkq
	RHfz15pGdUiYeUJVDq8vLiVyS7SA31lGMbnLoObLvTXZbx2xVDEfNmC3Y4ZTxAGuX7cj
	Azuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gluSXX7QFqz+qrJOSMIY4AufxxFiwaSdP9RWjeGroGE=;
	b=f8vJOT0+rosyjePZODEYiFLmex0enA+45IjBNV+ax8Z03AJNuOCdjEMe8dMFAV9xss
	jWrpiJahvkU3pKlIq4rLQx2YCf0nboh/4ClQqLzP2tqceLcMAUwtySnUk8KeYUaHTAs4
	yaQFxOAFe1+xfhQ7gtzt3mTqZwI2+Q7TE9jSEb52Cko8lMAdQadOjM2iw749Obk3GQVd
	DqfE0ievwMGef5850StPvwRvOhAgBdubrp7DW5fv3F9vLONWXS7x9CIpkJ4VZZPwKpZs
	lKYapfeHG6ya0XPWt4u8gdM3jxoOR7IR98BgYcgW+AsR6VYSZoTf7Oc2EpH+BGbikgf9
	xCdQ==
X-Gm-Message-State: APjAAAXe3GZJ1OV8gm+zJNm3nkHGQfA/EY7oVSPEFG9qh7evkCK/ikz/
	kO3JOH9fpF2B12siykuJ4zk3bpFUWQBmGbF0Al4=
X-Google-Smtp-Source: APXvYqw4qHpNqzvmTS9zuvtjwELkZycw5FtXO+qMe/FOIyhTshNYkcamLaJpM/ZqL0Rydc8Xt8WiZRKq8qaxw6cgzpo=
X-Received: by 2002:a17:906:5606:: with SMTP id
	f6mr6495524ejq.110.1567762536189; 
	Fri, 06 Sep 2019 02:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <1567401728-113652-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1spnx4pPh5ObnVTyahxE6Z8y7GCkv3GC_oCwf-fL_eYu9A@mail.gmail.com>
In-Reply-To: <CAMKF1spnx4pPh5ObnVTyahxE6Z8y7GCkv3GC_oCwf-fL_eYu9A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Sep 2019 11:35:29 +0200
Message-ID: <CA+chaQdGBH3dr-S=T6o5ORbw4oJFsz6xkFJ39Vd10wrNCEb7dA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 06 Sep 2019 09:35:36 -0000
Content-Type: text/plain; charset="UTF-8"

This seems to be merged before python3-colorama was provided

On Wed, Sep 4, 2019 at 7:11 AM Khem Raj <raj.khem@gmail.com> wrote:

> 03:10:10 ERROR: Nothing RPROVIDES 'python3-colorama' (but
>
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-cmd2_0.9.16.bb
> RDEPENDS on or otherwise requires it)
> 03:10:10 ERROR: Nothing RPROVIDES 'python3-cmd2-dev' (but
>
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-cmd2_0.9.16.bb
> RDEPENDS on or otherwise requires it)
> 03:10:10 No eligible RPROVIDERs exist for 'python3-cmd2-dev'
> 03:10:11 ERROR: Nothing RPROVIDES 'python3-cmd2' (but
>
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-cmd2_0.9.16.bb
> RDEPENDS on or otherwise requires it)
> 03:10:11 No eligible RPROVIDERs exist for 'python3-cmd2'
>
> On Sun, Sep 1, 2019 at 10:23 PM Zheng Ruoqin
> <zhengrq.fnst@cn.fujitsu.com> wrote:
> >
> > Providing a python3 version of python-cmd2.
> >
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  .../recipes-devtools/python/python-cmd2.inc       | 13 +++++++++++++
> >  .../recipes-devtools/python/python-cmd2_0.9.16.bb | 15 ++-------------
> >  .../python/python3-cmd2_0.9.16.bb                 |  9 +++++++++
> >  3 files changed, 24 insertions(+), 13 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python-cmd2.inc
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-cmd2_0.9.16.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc
> b/meta-python/recipes-devtools/python/python-cmd2.inc
> > new file mode 100644
> > index 000000000..1a0be778b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-cmd2.inc
> > @@ -0,0 +1,13 @@
> > +SUMMARY = "Extra features for standard library's cmd module"
> > +HOMEPAGE = "http://packages.python.org/cmd2/"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
> > +
> > +SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
> > +SRC_URI[sha256sum] =
> "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
> > +
> > +inherit pypi
> > +
> > +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> > index 94db37a2d..17b6ae285 100644
> > --- a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> > +++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> > @@ -1,14 +1,5 @@
> > -SUMMARY = "Extra features for standard library's cmd module"
> > -HOMEPAGE = "http://packages.python.org/cmd2/"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
> > -
> > -SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
> > -SRC_URI[sha256sum] =
> "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
> > -
> > -inherit pypi setuptools
> > -
> > -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> > +inherit setuptools
> > +require python-cmd2.inc
> >
> >  RDEPENDS_${PN} += "\
> >      ${PYTHON_PN}-doctest \
> > @@ -21,5 +12,3 @@ RDEPENDS_${PN} += "\
> >      ${PYTHON_PN}-threading \
> >      ${PYTHON_PN}-textutils \
> >      "
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> > new file mode 100644
> > index 000000000..f5c5c7e1a
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> > @@ -0,0 +1,9 @@
> > +inherit setuptools3
> > +require python-cmd2.inc
> > +
> > +RDEPENDS_${PN} += "\
> > +    ${PYTHON_PN}-pyperclip \
> > +    ${PYTHON_PN}-colorama \
> > +    ${PYTHON_PN}-attrs \
> > +    ${PYTHON_PN}-wcwidth \
> > +    "
> > --
> > 2.17.1
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

