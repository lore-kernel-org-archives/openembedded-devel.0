Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id C0E357FE30;
	Mon, 27 Jan 2020 20:26:26 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x1so10982761qkl.12;
	Mon, 27 Jan 2020 12:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s+bserySpKQX4pmvuavBob25hbl+fJ8zTWBCmBp0+30=;
	b=dKmutuDp4AaUuTjX7zCxfi7dzfUksn7wq9yJynt1bpBcUpxx7ymwbYqKAXeaTyDtOc
	qYsN2g+mDgjjO3sCC28x4H81DelGGWFW0nV4wekilpHGpG+QbdfuhcAjcVlXyawzD1CQ
	l1cG8H+Ypz29PQUyEvxUNcEfWvvkpc5iZRRGV0lGM3w6T0mPUra2EF8WqM2vNg/NTTdg
	tjr3vW/1lR7j+edFJrvCEVaFuDkvtZWD/T/4ElMFBPt02Vaj36arFEXsx+RLPr1+Q6Fq
	Z/mMFwy10ATBYAvN+mbWO+wmeXPJ80mLPuVgiXQ9iSbdSfgJrzJxhE+Ot6kD22cOsXVI
	MK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s+bserySpKQX4pmvuavBob25hbl+fJ8zTWBCmBp0+30=;
	b=N26S98CRdtWT4yztA/Ck9MO694YJGC1uWA/vfSK/cl3LnhG2lKxUvEVRhO4a5uYOhK
	usYfv1sQr8vON4FoTcM3javWKeeoHovSlzsB4E4v7skyFEefsQJcGLERfJUebz9gh51p
	z2nveJDWuHNj2cmgOpa1iaZPEf80tfJBmXketo19F7iriLozKeaRcAG48GMgA/MPep2K
	LyOurQ7iCLsIPBZYKSAHvEqGCXH/xSb3dSae8on0sTyamyLp+jmB7amrjn7nqx5M0Wap
	6fyPwLlbtKW4Pvj7gM8fYuMStcrQJw4JMBOdSPTn1sBu/zovA8srDA8lvIiU+YVrQFSw
	tCfg==
X-Gm-Message-State: APjAAAWKqjIEEMHQy9LoVqDdSCB+SS30HdSOtfmZnwfOIfpIEcWAs95S
	p+RxlATjP25PQlixxcAOtMOsJBLxsYManedOKhI=
X-Google-Smtp-Source: APXvYqzuATK9vDLRYJKvGsilm5srpP2QvTKMmQWdi5HvFK5MyG6O1BIgp2QmdkZyVO+WSBDeaCel1FFFC1naSeohGZg=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr19037430qkh.9.1580156787327; 
	Mon, 27 Jan 2020 12:26:27 -0800 (PST)
MIME-Version: 1.0
References: <158014867798.8755.9822262787436785196@git.openembedded.org>
	<20200127181118.90572232CAA@git.openembedded.org>
	<CALbNGRTW5YFAYAvL06gOY_s0M6XOLXRQvYRNB3F=sHa8PRp2fQ@mail.gmail.com>
	<CAHtQpK65Zg2SC4CGWRsdL=N6gkAS30UBgb47P0YeEp2W=Oakdg@mail.gmail.com>
In-Reply-To: <CAHtQpK65Zg2SC4CGWRsdL=N6gkAS30UBgb47P0YeEp2W=Oakdg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 12:26:00 -0800
Message-ID: <CAMKF1sp1FEjY8y=sTrU1DyJEZBk7agatcBq+93iPg0Y8D8N51g@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 03/03: libhugetlbfs: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 20:26:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 12:09 PM Andrey Zhizhikin <andrey.z@gmail.com> wrot=
e:
>
> On Mon, Jan 27, 2020 at 7:59 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Mon, Jan 27, 2020 at 7:11 PM <git@git.openembedded.org> wrote:
> > >
> > > This is an automated email from the git hooks/post-receive script.
> > >
> > > khem pushed a commit to branch master-next
> > > in repository meta-openembedded.
> > >
> > > commit 60fb9cfa741849f43e5f234dd5a95ec2d6cb5e48
> > > Author: Andrey Zhizhikin <andrey.z@gmail.com>
> > > AuthorDate: Mon Jan 27 17:36:08 2020 +0000
> > >
> > >     libhugetlbfs: update recipe to use python3
> > >
> > >     Update recipe to use python3 since python2 is EOL and has been dr=
opped
> > >     from OE-Core.
> > >
> > >     Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > >     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  ...page_setup_helper-use-python3-interpreter.patch | 29 ++++++++++++=
++++++++++
> > >  .../libhugetlbfs/libhugetlbfs_git.bb               |  3 ++-
> > >  2 files changed, 31 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_p=
age_setup_helper-use-python3-interpreter.patch b/meta-oe/recipes-benchmark/=
libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patc=
h
> > > new file mode 100644
> > > index 0000000..e45f283
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_set=
up_helper-use-python3-interpreter.patch
> > > @@ -0,0 +1,29 @@
> > > +From b77c61de4d88d2c6e5d31f4f5a5877cc4c61272e Mon Sep 17 00:00:00 20=
01
> > > +From: Andrey Zhizhikin <andrey.z@gmail.com>
> > > +Date: Mon, 27 Jan 2020 17:27:55 +0000
> > > +Subject: [PATCH] huge_page_setup_helper: use python3 interpreter
> > > +
> > > +Setup helper script is already prepared to be used with python3, use=
 the
> > > +interpreter explicitly. This removes dependency to python2 and will =
not
> > > +fail the QA check.
> > > +
> > > +Upstream-Status: Inappropriate [OE-specific]
> > > +
> > > +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > +---
> > > + huge_page_setup_helper.py | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/huge_page_setup_helper.py b/huge_page_setup_helper.py
> > > +index a9ba2bf..7ba0c92 100755
> > > +--- a/huge_page_setup_helper.py
> > > ++++ b/huge_page_setup_helper.py
> > > +@@ -1,4 +1,4 @@
> > > +-#!/usr/bin/python
> > > ++#!/usr/bin/env python3
> > > +
> > > + #
> > > + # Tool to set up Linux large page support with minimal effort
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.=
bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > index f1a4efb..7f7f838 100644
> > > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > @@ -4,7 +4,7 @@ LICENSE =3D "LGPLv2.1"
> > >  LIC_FILES_CHKSUM =3D "file://LGPL-2.1;md5=3D2d5025d4aa3495befef8f172=
06a5b0a1"
> > >
> > >  DEPENDS =3D "sysfsutils"
> > > -RDEPENDS_${PN} +=3D "bash python python-io python-lang python-subpro=
cess python-resource"
> > > +RDEPENDS_${PN} +=3D "bash python3 python3-core"
> > Minor nit: python3 package is empty and does not create any rdepends
> > so it can be removed.
>
> Ups, did missed that one... Should I update the patch so this one
> could be dropped? I understood it is already staged in -next.

next is rebased regularly, this is used for CI purposes, so please go
ahead and resend v2

>
> >
> > Andreas
> > >  RDEPENDS_${PN}-tests +=3D "bash python3-core"
> > >
> > >  PV =3D "2.22"
> > > @@ -25,6 +25,7 @@ SRC_URI =3D " \
> > >      file://0005-Include-dirent.h-for-ino_t.patch \
> > >      file://0006-include-limits.h-for-PATH_MAX.patch \
> > >      file://0001-tests-add-explicit-permissions-to-open-call.patch \
> > > +    file://0001-huge_page_setup_helper-use-python3-interpreter.patch=
 \
> > >  "
> > >
> > >  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
> > >
> > > --
> > > To stop receiving notification emails like this one, please contact
> > > the administrator of this repository.
> > > --
> > > _______________________________________________
> > > Openembedded-commits mailing list
> > > Openembedded-commits@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>
>
> --
> Regards,
> Andrey.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

