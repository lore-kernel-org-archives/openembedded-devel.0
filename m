Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 083C47FE1C;
	Mon, 27 Jan 2020 20:09:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s144so221242wme.1;
	Mon, 27 Jan 2020 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Uy8Fg/zYYgydiIbdwMZioXc4oFkCGPyrohrsVMjoD8c=;
	b=i8JxSlmP1gNlZgy+ocLVUZZkR5Nrsshin7P4Uo3pzuthc7wpCzzO1UOhXK4/LrHW0/
	hUE1ocjKMziPd0dImS9TSiPbkBEwhE+0Pxx10jSy3rX0lGjazq03H9baHeoEhjb5tUfk
	/GXgJyzuicVsq0eQSpuT6bMAf7056QYCxkq95hXgsCSbP/CPZoby40oUZFqhdw9EzPk5
	THJLiGgxMeEKh4XCQAt2Z85FIXgEDcryrfcERclTHnmP2hOmc7ygjTfY+D0ZOR3/fCVT
	J87h7sp5WBSu+LqH05UzzKgNA/7d8XeuQaMnRKfGFtOWKLVvziKEIDuLrhlx4m1yxm7D
	E/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Uy8Fg/zYYgydiIbdwMZioXc4oFkCGPyrohrsVMjoD8c=;
	b=eYaryTDMIV4/KDEX2iuBUNfsZi71IQlI+Ae49mF/k2M6lSD9kY5jtqueOunzOyyAGb
	UvUYkcAjuiAZMZ2dLUI97iikGOQd78MdI/4FZQulfcXdJifO51sBN38BxNZFhCSRGyW9
	ihFbbsrxrtsG+mptxDKxnlZJZ/6o6wmlRnB83y1UozLSBiDHJXJyZgHO1nHYGDOsU1eq
	b0VBzBIAd2iuDd0XcFBDRKN7IGgR2sdo7Qajv/DReCii3nqjQcE5j43Ci0JS0o9gaQ/A
	6YowFbR1ZSJdOj23seycfT9a6yQzILZ9yim2xS5Xabq7c6cDYXUzIjq5olmsFQNyIav5
	5ZuQ==
X-Gm-Message-State: APjAAAVS+bzavrGdA9pXYjfy0QuEzBT7rZepTIHJ6V/I/rGz0X6JWgEZ
	d0nlOsQD8Gkmen/HUIAcbiWcg6piNQrl7SuBtnc=
X-Google-Smtp-Source: APXvYqzfgAq/3avLPtMYjN63Mn1WHqCxJT9eo8XSFtNGfc1AEVVa7fwEwqWxxe8ADDVy5qXQT32MmDn/qIk1+Weqe1M=
X-Received: by 2002:a05:600c:1003:: with SMTP id
	c3mr329121wmc.47.1580155765686; 
	Mon, 27 Jan 2020 12:09:25 -0800 (PST)
MIME-Version: 1.0
References: <158014867798.8755.9822262787436785196@git.openembedded.org>
	<20200127181118.90572232CAA@git.openembedded.org>
	<CALbNGRTW5YFAYAvL06gOY_s0M6XOLXRQvYRNB3F=sHa8PRp2fQ@mail.gmail.com>
In-Reply-To: <CALbNGRTW5YFAYAvL06gOY_s0M6XOLXRQvYRNB3F=sHa8PRp2fQ@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 21:09:14 +0100
Message-ID: <CAHtQpK65Zg2SC4CGWRsdL=N6gkAS30UBgb47P0YeEp2W=Oakdg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Mon, 27 Jan 2020 20:09:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 7:59 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Jan 27, 2020 at 7:11 PM <git@git.openembedded.org> wrote:
> >
> > This is an automated email from the git hooks/post-receive script.
> >
> > khem pushed a commit to branch master-next
> > in repository meta-openembedded.
> >
> > commit 60fb9cfa741849f43e5f234dd5a95ec2d6cb5e48
> > Author: Andrey Zhizhikin <andrey.z@gmail.com>
> > AuthorDate: Mon Jan 27 17:36:08 2020 +0000
> >
> >     libhugetlbfs: update recipe to use python3
> >
> >     Update recipe to use python3 since python2 is EOL and has been drop=
ped
> >     from OE-Core.
> >
> >     Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...page_setup_helper-use-python3-interpreter.patch | 29 ++++++++++++++=
++++++++
> >  .../libhugetlbfs/libhugetlbfs_git.bb               |  3 ++-
> >  2 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_pag=
e_setup_helper-use-python3-interpreter.patch b/meta-oe/recipes-benchmark/li=
bhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch
> > new file mode 100644
> > index 0000000..e45f283
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup=
_helper-use-python3-interpreter.patch
> > @@ -0,0 +1,29 @@
> > +From b77c61de4d88d2c6e5d31f4f5a5877cc4c61272e Mon Sep 17 00:00:00 2001
> > +From: Andrey Zhizhikin <andrey.z@gmail.com>
> > +Date: Mon, 27 Jan 2020 17:27:55 +0000
> > +Subject: [PATCH] huge_page_setup_helper: use python3 interpreter
> > +
> > +Setup helper script is already prepared to be used with python3, use t=
he
> > +interpreter explicitly. This removes dependency to python2 and will no=
t
> > +fail the QA check.
> > +
> > +Upstream-Status: Inappropriate [OE-specific]
> > +
> > +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > +---
> > + huge_page_setup_helper.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/huge_page_setup_helper.py b/huge_page_setup_helper.py
> > +index a9ba2bf..7ba0c92 100755
> > +--- a/huge_page_setup_helper.py
> > ++++ b/huge_page_setup_helper.py
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/python
> > ++#!/usr/bin/env python3
> > +
> > + #
> > + # Tool to set up Linux large page support with minimal effort
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb=
 b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > index f1a4efb..7f7f838 100644
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "LGPLv2.1"
> >  LIC_FILES_CHKSUM =3D "file://LGPL-2.1;md5=3D2d5025d4aa3495befef8f17206=
a5b0a1"
> >
> >  DEPENDS =3D "sysfsutils"
> > -RDEPENDS_${PN} +=3D "bash python python-io python-lang python-subproce=
ss python-resource"
> > +RDEPENDS_${PN} +=3D "bash python3 python3-core"
> Minor nit: python3 package is empty and does not create any rdepends
> so it can be removed.

Ups, did missed that one... Should I update the patch so this one
could be dropped? I understood it is already staged in -next.

>
> Andreas
> >  RDEPENDS_${PN}-tests +=3D "bash python3-core"
> >
> >  PV =3D "2.22"
> > @@ -25,6 +25,7 @@ SRC_URI =3D " \
> >      file://0005-Include-dirent.h-for-ino_t.patch \
> >      file://0006-include-limits.h-for-PATH_MAX.patch \
> >      file://0001-tests-add-explicit-permissions-to-open-call.patch \
> > +    file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
> >  "
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
> >
> > --
> > To stop receiving notification emails like this one, please contact
> > the administrator of this repository.
> > --
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits



--=20
Regards,
Andrey.

