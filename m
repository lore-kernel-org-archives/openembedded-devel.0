Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.7276.1586164848608075404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g/bB/AC8;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id z7so13856005wmk.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LcPIFTkMRG3RJ22cVe8O6tEYZpzctQ79l/OYR6J4uqc=;
        b=g/bB/AC8ZCjQdIq5GpHrDKmM+FNIl+g9OOcosPftW+o0yVpKx6xNvR/P1NGBqPfp31
         L8zhbVKQDijF1LxdVhx6Jj7BwLYc+jnX4BEvd+pg/oW0hbEIMYREPBcSXRlmZFy3Ulu2
         6bFSjg5DLhmyNU9uZi/BBhVGbsPeU3vh+2xhJXtutZkugyR7ZoEs828FzOVisDY5YhBj
         tnVkmR9iS3Vo6BXD0G6701jJWj9um0at0lD7kIQzTjKzkt/vm9NRvqIVwt4EkLrz/mpR
         Y0OCfoq8hZUMcSBZzUrGyonJJPsCSmM4KsY4wnqppo0GCXw3RxAtriRETvKVHX5LPqrU
         2pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LcPIFTkMRG3RJ22cVe8O6tEYZpzctQ79l/OYR6J4uqc=;
        b=pDOZnthGAaVB37aRV9HvGehfGGgqHq+z6KKoGk7AJ9tTT0iCyV2VwTeZ2BrueKz28s
         uv2pOuzAV2aPYAgmV8dIMwtWUAnMeML6EEYz8C7Upl16n46RCMU6PdmeAXCr+gtq5FbT
         /nuN9RwYA4eLMi2SiDxjBGoXPXup5QwYvRErdWP2G+sJFYB/bOshc/NnGvCv+d9mwBuX
         0qLk2LxlHrKHHVd7gdbbjk0pgt0W9TCSFT401GIBpU1WqWa2yE5yAMTguveAmP/rrdX1
         ENbTSMu6u4ojGaN1lAS08H+crEL4lgSS86zOSCnHfclyElYwDyo1OxMUpP1dCcqo6sqD
         3gXQ==
X-Gm-Message-State: AGi0PuZulibtU+4CNgO4vpQi61tUEYxQ341TcXTE41qXvgiv+YcXuQJL
	BIi+BoYxOwCoC+ONWWoZPT3B8uzx54s=
X-Google-Smtp-Source: APiQypINOt3KI1Mz5VhlXIEIKe6/CYZFhuQYXdOQrBMF1p+GxTQGc2jzznKlcGLFYlKS9wNjrVtOQA==
X-Received: by 2002:a1c:e087:: with SMTP id x129mr8583260wmg.127.1586164846783;
        Mon, 06 Apr 2020 02:20:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:46 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/14] libsigc++-2.0: upgrade 2.10.2 -> 2.10.3
Date: Mon,  6 Apr 2020 11:20:24 +0200
Message-Id: <20200406092032.3574-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2020-03-25  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	2.10.3

2020-03-24  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	README: Describe building with Meson and Autotools

	and remove the description of the directory structure,
	which is not very useful.

2020-03-10  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	examples: Disable deprecated API when building with Meson

	Deprecated SIGCXX API is disabled when example programs are built
	with Autotools. Do the same when building with Meson.

2020-01-13  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	README: Describe building with Meson

2020-01-02  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	docs/reference/meson.build: Check if perl is found

	Don't use perl.path() when configuring Doxyfile, if perl is not found.
	Perl is not required, if build-documentation=false.
	Fixes #53

2019-12-30  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	meson.build: Change project name, sigc++ -> libsigc++

	Autotools make tarballs called libsigc++-x.y.z.tar.xz. No reason to
	change that. The leading "lib" is now also restored in some locations
	in the reference documentation.

2019-12-30  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	Update untracked/README

2019-12-29  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	meson.build: Check if .git is a directory or a file

	In a git worktree, .git is a regular file.

	See https://gitlab.gnome.org/GNOME/pangomm/merge_requests/8

2019-12-29  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	sigc++/meson.build: Library name is sigc-2.0

	Pointed out by Chun-wei Fan in PR #51.

2019-12-29  Chun-wei Fan  <fanchunwei@src.gnome.org>

	NMake Makefiles: Separate outdir by toolset version

	This is to reduce the likelihood of accidently mixing DLLs that are
	linked with different CRTs in the build tree.

	Also clean up rules a bit.

2019-12-29  Chun-wei Fan  <fanchunwei@src.gnome.org>

	build: Support NMake builds from Meson tarballs

	This adds inference rules to the NMake Makefiles to also look for the
	sources that are in untracked/, and to ensure that the generated MSVC
	build files (sigc++-config.h and sigc.rc) are copied into
	untracked/MSVC_NMake, so that they can be built properly even with
	NMake.

2019-12-29  Chun-wei Fan  <fanchunwei@src.gnome.org>

	meson: Build Windows .rc files on Windows

	This ensures that on Windows, the version info resources are indeed
	linked into the libsigc++ DLL.

2019-12-29  Chun-wei Fan  <fanchunwei@src.gnome.org>

	meson/Windows: Fix builds when builddir is a subdir of source tree

	It appears that Meson did not construct the paths properly for
	shutil.copy2() when building in a build directory that is a
	subdirectory of the sources, when using meson.current_build_dir(),
	possibly due how path separators are handled.

	Fix this by constructing the paths using project_build_root / 'MSVC_NMake'.

2019-12-29  Chun-wei Fan  <fanchunwei@src.gnome.org>

	meson.build: Fix 'meson dist' on Windows

	Since we are assured that we are using Python 3.x on when we run Meson, we
	do not really need to look for the 'python3' executable, but we could
	just use whatever Python interpreter that is used to run Meson.

	This will fix situations where it is commonly the case where we may have
	multiple Python 3.x installations on Windows (www.python.org, and those
	from Cygwin/mingw-w64), so that Meson really uses one and only one
	Python installation to run everything that is Python-related, which will
	thus fix '[meson|ninja] dist' on Visual Studio builds.

2019-12-29  Chun-wei Fan  <fanchunwei@src.gnome.org>

	Meson/MSVC: Support builds directly from GIT checkouts

	It appears that if one uses the m4 that is given by mingw-w64 (and
	perhaps Cygwin), that m4 is enough to generate the sources and headers
	that we need for the build.

	So, remove the lines saying building directly from GIT checkouts are not
	supported.

2019-12-24  Chun-wei Fan  <fanchunwei@src.gnome.org>

	meson: Ensure symbols are exported on MSVC builds

	Make sure the correct build macros are specified when building
	libsigc++, so that:

	-The symbols are properly exported
	-We do not break builds as a result of unecesary warnings

2019-12-24  Chun-wei Fan  <fanchunwei@src.gnome.org>

	meson: Relax MSVC version requirement to 2015

	libsigc++ requires a C++-11-compliant compiler, so we can just make the
	build look for Visual Studio 2015 instead of Visual Studio 2017 15.7.

	Visual Studio 2013 also works, but since it will spew out loads of
	warnings and the latest C++-11 version of glibmm is not buildable with
	Visual Studio 2013, let's just require Visual Studio 2015.

2019-12-24  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	Add support for building libsigc++-2.0 with Meson

	libsigc++-2.0 can be built with either Autotools or Meson.

2019-12-10  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	Make libsigc_manual.xml valid

	Fix errors reported by "xmllint --postvalid".

2019-07-03  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	tests/test_track_obj: Fix for clang++

	clang++ complains if private members are unused, so make them protected.

	error: private field 'bar_' is not used [-Werror,-Wunused-private-field]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libsigc++-2.0_2.10.2.bb => libsigc++-2.0_2.10.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.2.bb => libsigc++-2.0_2.10.3.bb} (77%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.2.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.3.bb
similarity index 77%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.2.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.3.bb
index 0e5b9ceeb..e6129e246 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.2.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.10/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "1b067bfae0b502e6a5127336cb09d2dd"
-SRC_URI[sha256sum] = "b1ca0253379596f9c19f070c83d362b12dfd39c0a3ea1dd813e8e21c1a097a98"
+SRC_URI[md5sum] = "ea68c7afc23a4b89a2dfa78344460785"
+SRC_URI[sha256sum] = "0b68dfc6313c6cc90ac989c6d722a1bf0585ad13846e79746aa87cb265904786"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.21.1

