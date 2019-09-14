Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2D57ED03
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2019 02:10:55 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id o12so36313557qtf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y9z9D4JifoPGFjB54fVcPbrA7lfx1+uXT58lH5f3yno=;
	b=U28pu+HAn0B1sl3so2w4edgTCNRa/aj3yin+gS1GNYnBaS2ygT96PIWUimflSj+8t3
	gYsN8rHIzpiYt2S1I24NHfMHYYRxh/7GbLZTBjfXDLvr9YIhygnEYXi3aYN6ziCXXj6a
	gna7ng7vyKr5F5Wjn9zULN91BpjhI7AMXjZ0bwKBTFtNFB6qtZlGWyt0yYAMJG4Co8GT
	Cwg/4z4QEd1kSPoNTH6Y4fycpUMzcuINyyzyU1yUQPC3G0tziuJKnwPbSKwaTfb2zRv5
	+ll5oJ9ci891BFH2WFAFt3/XR0VxnWu0Himr1jo8zUreffisvQj0faNPR9PqaktvUUeO
	na+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y9z9D4JifoPGFjB54fVcPbrA7lfx1+uXT58lH5f3yno=;
	b=neiQ0/3Czh9AVMSNMN/hYo/hsf3i0CfOY+kRdd6f/MyUUTB37SqmgsY/ImcMERIinG
	xmgyRaOn87KjLS0213wPI4V5iBvnZ9MEBC5t0t0jJKthtUHfM4cEx/hop+AHJlLY7SP3
	ZAvfkXxcvk5M8KE8lWGfaFOeN+/xW5x2ZsikIlw7Q1ipg2hk4AC7iOXOBthWliGoj47Q
	wFwfiubvE6cCAnpbF39mAsbRUzrEkt05Z2s3rvR0CIH9oL/vWlKrdsNySTEc/NxFLP8n
	tSftP9q9tDals7wRHRwBOLlvCVdLESpcbdCrJx3Zb1jr9x71siRZfgZnMvXtNzf4evt0
	qihg==
X-Gm-Message-State: APjAAAUDmt4VEoCum0ubIHgAHPh0wxw/W9K9jlfNvwRUnEN+iVZLnvVZ
	hF7PN3WQ/h4lZNrc2kEKW+xv2GrRiHCgxlnJx4i88tznL7U=
X-Google-Smtp-Source: APXvYqyM5nxHa3pBb1BkojwASCSCgQy8CyXn4nn8fkvI37MvTnkj5HZrH2cjXSNix52r19YN2+6gmNJtgDENPmrMYj4=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr6630726qtn.378.1568427055864; 
	Fri, 13 Sep 2019 19:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <1568406492-14968-1-git-send-email-trevor.gamblin@windriver.com>
	<27ad3481-48af-ab60-eb30-af3caedcabd1@windriver.com>
In-Reply-To: <27ad3481-48af-ab60-eb30-af3caedcabd1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 19:10:30 -0700
Message-ID: <CAMKF1so=PtOSQ2H1mtZRFaMda5H5sbcC4YVwZgDZR9-bPtLpQw@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] openjpeg: upgrade 2.3.0 -> 2.3.1
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
X-List-Received-Date: Sat, 14 Sep 2019 02:10:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ends up with packaging errors on qemumips

01:26:05 ERROR: openjpeg-2.3.1-r0 do_package: QA Issue: openjpeg:
Files/directories were installed but not shipped in any package:
01:26:05   /usr/lib/openjpeg-2.3
01:26:05   /usr/lib/openjpeg-2.3/OpenJPEGConfig.cmake
01:26:05   /usr/lib/openjpeg-2.3/OpenJPEGTargets.cmake
01:26:05   /usr/lib/openjpeg-2.3/OpenJPEGTargets-noconfig.cmake
01:26:05 Please set FILES such that these items are packaged.
Alternatively if they are unneeded, avoid installing them or delete
them within do_install.
01:26:05 openjpeg: 4 installed and not shipped files. [installed-vs-shipped=
]


On Fri, Sep 13, 2019 at 1:30 PM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> On 9/13/19 4:28 PM, Trevor Gamblin wrote:
>
> > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> >
> > Upgrading fixes CVE-2018-21010 and incorporates other bug fixes
> > from upstream.
> >
> > The source upgrade to 2.3.1 changed the way include directories are
> > identified, so the patch 0001-Ensure-cmake-files-are-installed-at-commo=
n-location.patch
> > is no longer needed to help poppler find cmake files.
> >
> > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > ---
> >   ...ke-files-are-installed-at-common-location.patch | 48 -------------=
---------
> >   .../{openjpeg_2.3.0.bb =3D> openjpeg_2.3.1.bb}       |  3 +-
> >   2 files changed, 1 insertion(+), 50 deletions(-)
> >   delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-En=
sure-cmake-files-are-installed-at-common-location.patch
> >   rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.0.bb =3D> open=
jpeg_2.3.1.bb} (79%)
> >
> > diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cma=
ke-files-are-installed-at-common-location.patch b/meta-oe/recipes-graphics/=
openjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.=
patch
> > deleted file mode 100644
> > index 5c5fe64..0000000
> > --- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-file=
s-are-installed-at-common-location.patch
> > +++ /dev/null
> > @@ -1,48 +0,0 @@
> > -From fe491c0919f5adc8d626cb98c5ec19d0b99dfe20 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > -Date: Thu, 27 Sep 2018 23:45:04 +0200
> > -Subject: [PATCH] Ensure cmake files are installed at common location
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -* Otherwise recent poppler is not able to find them
> > -* Include path needs adjustment with this change
> > -
> > -Upstream-Status: Inappropriate [Configuration]
> > -
> > -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ----
> > - CMakeLists.txt                | 2 +-
> > - cmake/OpenJPEGConfig.cmake.in | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index ff70a06f..23d2fac4 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -150,7 +150,7 @@ if(NOT OPENJPEG_INSTALL_PACKAGE_DIR)
> > -   # We could install *.cmake files in share/ however those files cont=
ains
> > -   # hardcoded path to libraries on a multi-arch system (fedora/debian=
) those
> > -   # path will be different (lib/i386-linux-gnu vs lib/x86_64-linux-gn=
u)
> > --  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/${OPE=
NJPEG_INSTALL_SUBDIR}")
> > -+  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/cmake=
/${OPENJPEG_INSTALL_SUBDIR}")
> > - endif()
> > -
> > - if (APPLE)
> > -diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmak=
e.in
> > -index b20294ca..6a2f4baf 100644
> > ---- a/cmake/OpenJPEGConfig.cmake.in
> > -+++ b/cmake/OpenJPEGConfig.cmake.in
> > -@@ -26,7 +26,7 @@ get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIS=
T_FILE}" PATH)
> > - if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
> > -   # This is an install tree
> > -   include(${SELF_DIR}/OpenJPEGTargets.cmake)
> > --  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../@OP=
ENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
> > -+  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../../=
@OPENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
> > -   set(OPENJPEG_INCLUDE_DIRS ${OPENJPEG_INCLUDE_ROOT})
> > -
> > - else()
> > ---
> > -2.14.4
> > -
> > diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta=
-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> > similarity index 79%
> > rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> > rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> > index d30ff48..7c92ebc 100644
> > --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> > +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> > @@ -7,10 +7,9 @@ DEPENDS =3D "libpng tiff lcms zlib"
> >
> >   SRC_URI =3D " \
> >       git://github.com/uclouvain/openjpeg.git \
> > -    file://0001-Ensure-cmake-files-are-installed-at-common-location.pa=
tch \
> >       file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.=
patch \
> >   "
> > -SRCREV =3D "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
> > +SRCREV =3D "57096325457f96d8cd07bd3af04fe81d7a2ba788"
> >   S =3D "${WORKDIR}/git"
> >
> >   inherit cmake
> Misunderstood the purpose of the cmake includes patch in the last
> version. Should build now (poppler build works for me).
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

