Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id B6B976BBE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 18:52:43 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id f82so23768694ioa.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uyCmPAfa5nq1exFZFWUbo2ihDHY/8iBlpBXuL8K1AhA=;
	b=mnPDTK7s0A+0+mi15WaxCbBbeO5as6E4DNf6qF5nDdgyf2g19VU2z6O1hrSlgdUFmD
	cA4noErBNBFzNzCReSk+bRWo2QSqOudJ1qGwUulFKZkM5WChCRFmY/3yovoUG31agNND
	baPMh5VuizUsmqs79srquvHsgqGCWDTsNnLWaRPewlHeXMZq95AuR8RncyT8Fjsiin2E
	vGe86Axurv9KfkCzsBH/DKE5XAINkVaiI1ihRY9PjlT/BKqf+5AZrKGXWNbmbr73tBy+
	cL8Cp++o2toAGROhzjXjzleBkl/UvOOqt+acfWUAXKVmuI/uSCO4RgFZFUNUbUKQmmPJ
	eWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=uyCmPAfa5nq1exFZFWUbo2ihDHY/8iBlpBXuL8K1AhA=;
	b=BVzc41ErYnDWbW8Dn4wubbdSnla+0fYAMTiSHIz1coXXF16+fwcdSeyPy+a5I4QGwP
	8uqXizzU0qdQOk/MAebJbkBEjKFka0FW7kIkT96O0utvNPVu4sUYDonMWLRm+jcaTLnt
	KhoExU6Lbvv7Jcp1bxXOnsw0t5nP9W6dFWxjCc+wlAUf0Q9uG6wm1uaVKizgrF/A/gpD
	U96Zx4aFXRNCnHQW+3c0TZujhoCxi/n2te0gVl+NasLsWR2Ewy8lv+qizr3YJb57m0nz
	hp6/lR4bL/n/lnPdZYcQOEfrVUaOyFooSldSIu56ifHzXEJPc8OggHS2Dfswm/uITZdD
	awWw==
X-Gm-Message-State: APjAAAX/P1pSVB2GJTMTJQ5XWmslMRwD8CgixOi1CHb+WEcfGv1+irHk
	OtjFUMdUkXImcPWkf3lWtcdadJmV0eY=
X-Google-Smtp-Source: APXvYqz+cSR3US7ilLzUEL82U3krRjrFHcwa2e6vGHmqOwTDetIBNVN65KD17IwMmC1B+rlAOS9qNg==
X-Received: by 2002:a5e:d616:: with SMTP id w22mr3639021iom.57.1576090363910; 
	Wed, 11 Dec 2019 10:52:43 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:89f0:29a1:7fec:2c50?
	([2601:646:9200:4e0:89f0:29a1:7fec:2c50])
	by smtp.gmail.com with ESMTPSA id a7sm392260iod.61.2019.12.11.10.52.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Dec 2019 10:52:43 -0800 (PST)
To: kai.kang@windriver.com, mhalstead@linuxfoundation.org,
	openembedded-devel@lists.openembedded.org
References: <20191211091036.6601-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6fa9685b-e063-a70e-4046-0985e61e82ec@gmail.com>
Date: Wed, 11 Dec 2019 10:52:42 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191211091036.6601-1-kai.kang@windriver.com>
Subject: Re: [meta-oe][Patch] fltk: fix build error when enable package config examples
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
X-List-Received-Date: Wed, 11 Dec 2019 18:52:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

somehow patches from you never get into patchwork. I wonder why ?
adding Michael as well

On 12/11/19 1:10 AM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Backport patch to fix fltk build error when enable package config
> 'examples'. Drop the useless parts such as .gitignore and Makefile
> from the patch.
> 
> fltk-native is also required by package config 'examples'.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-oe/recipes-support/fltk/fltk.bb          |   7 +-
>   ...-when-enable-package-config-examples.patch | 182 ++++++++++++++++++
>   2 files changed, 187 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
> 
> diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
> index 7ad4ac70a..0d033f361 100644
> --- a/meta-oe/recipes-support/fltk/fltk.bb
> +++ b/meta-oe/recipes-support/fltk/fltk.bb
> @@ -5,7 +5,10 @@ DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
>   inherit features_check binconfig lib_package gtk-icon-cache mime
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> -SRC_URI += "file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch"
> +SRC_URI += " \
> +    file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch \
> +    file://0004-Fix-build-error-when-enable-package-config-examples.patch \
> +"
>   
>   EXTRA_OECMAKE = " \
>       -DOPTION_BUILD_SHARED_LIBS=ON \
> @@ -17,7 +20,7 @@ EXTRA_OECMAKE = " \
>   
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>   
> -PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,"
> +PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,fltk-native"
>   PACKAGECONFIG[cairo] = "-DOPTION_CAIRO=ON,-DOPTION_CAIRO=OFF,cairo"
>   PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
>   PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
> diff --git a/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch b/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
> new file mode 100644
> index 000000000..974c02fe6
> --- /dev/null
> +++ b/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
> @@ -0,0 +1,182 @@
> +Fix build error when enable package config examples.
> +
> +Upstream-Status: Backport [https://github.com/fltk/fltk/commit/16774dd]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +
> +From 16774ddc4e000c89e560fde0ced8be9814ef041e Mon Sep 17 00:00:00 2001
> +From: Albrecht Schlosser <albrechts.fltk@online.de>
> +Date: Wed, 8 Feb 2017 02:06:52 +0000
> +Subject: [PATCH] Rename test/help demo program to test/help_dialog.
> +
> +This change avoids a name conflict with CMake's auto-generated target 'help'
> +for "Unix Makefiles", "Ninja", and supposedly other generators as well.
> +
> +
> +git-svn-id: file:///fltk/svn/fltk/branches/branch-1.4@12171 ea41ed52-d2ee-0310-a9c1-e6b18d33e121
> +---
> + CMake/macros.cmake                        |  5 -----
> + documentation/src/examples.dox            |  8 +++----
> + test/CMakeLists.txt                       | 27 +++++++++++++++++++----
> + test/demo.menu                            |  2 +-
> + test/{help.cxx => help_dialog.cxx}        |  6 ++---
> + test/{help-test.html => help_dialog.html} |  0
> + 6 files changed, 31 insertions(+), 17 deletions(-)
> + rename test/{help.cxx => help_dialog.cxx} (88%)
> + rename test/{help-test.html => help_dialog.html} (100%)
> +
> +diff --git a/CMake/macros.cmake b/CMake/macros.cmake
> +index 5b0d0fa..7134fcb 100644
> +--- a/CMake/macros.cmake
> ++++ b/CMake/macros.cmake
> +@@ -90,11 +90,6 @@ function(CREATE_EXAMPLE NAME SOURCES LIBRARIES)
> +
> +     set (tname ${NAME})		# target name
> +
> +-    # rename reserved target name "help" (CMake 2.8.12 and later)
> +-    if (${tname} MATCHES "^help$")
> +-        set (tname "test_help")
> +-    endif (${tname} MATCHES "^help$")
> +-
> +     foreach(src ${SOURCES})
> +         if ("${src}" MATCHES "\\.fl$")
> +             list(APPEND flsrcs ${src})
> +diff --git a/documentation/src/examples.dox b/documentation/src/examples.dox
> +index 5105b7b..7961b02 100644
> +--- a/documentation/src/examples.dox
> ++++ b/documentation/src/examples.dox
> +@@ -60,7 +60,7 @@ you build FLTK, unlike those in the 'test' directory shown below.
> + </tr>
> + <tr>
> + <td> \ref examples_hello           </td>
> +-<td> \ref examples_help            </td>
> ++<td> \ref examples_help_dialog     </td>
> + <td> \ref examples_iconize         </td>
> + <td> \ref examples_image           </td>
> + <td> \ref examples_inactive        </td>
> +@@ -326,13 +326,13 @@ easily under FLTK.
> + tiny demo shows how little is needed to get a functioning application
> + running with FLTK. Quite impressive, I'd say.
> +
> +-\subsection examples_help help
> ++\subsection examples_help_dialog help_dialog
> +
> + \par
> +-\c help displays the built-in FLTK help browser. The
> ++\c help_dialog displays the built-in FLTK help browser. The
> + Fl_Help_Dialog understands a subset of html and renders
> + various image formats. This widget makes it easy to provide help
> +-pages to the user without depending on the operating system's
> ++pages to the user without depending on the operating system's
> + html browser.
> +
> + \subsection examples_iconize iconize
> +diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
> +index 22ec9ab..4caffa5 100644
> +--- a/test/CMakeLists.txt
> ++++ b/test/CMakeLists.txt
> +@@ -1,3 +1,22 @@
> ++#
> ++# "$Id$"
> ++#
> ++# CMakeLists.txt used to build test and demo apps by the CMake build system
> ++#
> ++# Copyright 2004-2017 by Bill Spitzak and others.
> ++#
> ++# This library is free software. Distribution and use rights are outlined in
> ++# the file "COPYING" which should have been included with this file.  If this
> ++# file is missing or damaged, see the license at:
> ++#
> ++#     http://www.fltk.org/COPYING.php
> ++#
> ++# Please report all bugs and problems on the following page:
> ++#
> ++#     http://www.fltk.org/str.php
> ++#
> ++#######################################################################
> ++
> + set(EXECUTABLE_OUTPUT_PATH ${FLTK_BINARY_DIR}/bin/examples)
> +
> + #######################################################################
> +@@ -64,7 +83,7 @@ CREATE_EXAMPLE(file_chooser file_chooser.cxx "fltk;fltk_images")
> + CREATE_EXAMPLE(fonts fonts.cxx fltk)
> + CREATE_EXAMPLE(forms forms.cxx "fltk;fltk_forms")
> + CREATE_EXAMPLE(hello hello.cxx fltk)
> +-CREATE_EXAMPLE(help help.cxx "fltk;fltk_images")
> ++CREATE_EXAMPLE(help_dialog help_dialog.cxx "fltk;fltk_images")
> + CREATE_EXAMPLE(icon icon.cxx fltk)
> + CREATE_EXAMPLE(iconize iconize.cxx fltk)
> + CREATE_EXAMPLE(image image.cxx fltk)
> +@@ -134,7 +153,7 @@ endif(FLTK_HAVE_CAIRO)
> + # Note: this is incomplete as of 11 Feb 2015
> + # Todo: currently all files are copied, but some of them need configuration:
> + # - demo.menu: fluid can't be started (wrong path)
> +-# - demo.menu: help (help-test.html) can't find its images (not copied)
> ++# - demo.menu: help_dialog (help_dialog.html) can't find its images (not copied)
> + # - maybe more ...
> +
> + # prepare for a "better" test file installation path
> +@@ -149,11 +168,11 @@ configure_file(demo.menu ${TESTFILE_PATH}/demo.menu COPYONLY)
> +
> + # use target directory only to avoid redundancy
> + configure_file(rgb.txt ${TESTFILE_PATH} COPYONLY)
> +-configure_file(help-test.html ${TESTFILE_PATH} COPYONLY)
> ++configure_file(help_dialog.html ${TESTFILE_PATH} COPYONLY)
> + configure_file(browser.cxx ${TESTFILE_PATH} COPYONLY)
> + configure_file(editor.cxx ${TESTFILE_PATH} COPYONLY)
> + if(APPLE AND NOT OPTION_APPLE_X11)
> +     configure_file(browser.cxx "${TESTFILE_PATH}/browser.app/Contents/Resources/browser.cxx" COPYONLY)
> +     configure_file(rgb.txt ${TESTFILE_PATH}/colbrowser.app/Contents/Resources/rgb.txt COPYONLY)
> +-    configure_file(help-test.html ${TESTFILE_PATH}/help.app/Contents/Resources/help-test.html COPYONLY)
> ++    configure_file(help_dialog.html ${TESTFILE_PATH}/help_dialog.app/Contents/Resources/help_dialog.html COPYONLY)
> + endif(APPLE AND NOT OPTION_APPLE_X11)
> +diff --git a/test/demo.menu b/test/demo.menu
> +index 337a71c..97e522a 100644
> +--- a/test/demo.menu
> ++++ b/test/demo.menu
> +@@ -77,7 +77,7 @@
> + 	@o:Font Tests...:@of
> + 		@of:Fonts:fonts
> + 		@of:UTF-8:utf8
> +-	@o:HelpDialog:help
> ++	@o:HelpDialog:help_dialog
> + 	@o:Input Choice:input_choice
> + 	@o:Preferences:preferences
> + 	@o:Threading:threads
> +diff --git a/test/help.cxx b/test/help_dialog.cxx
> +similarity index 88%
> +rename from test/help.cxx
> +rename to test/help_dialog.cxx
> +index f5c51d6..7866641 100644
> +--- a/test/help.cxx
> ++++ b/test/help_dialog.cxx
> +@@ -3,7 +3,7 @@
> + //
> + // Fl_Help_Dialog test program.
> + //
> +-// Copyright 1999-2010 by Easy Software Products.
> ++// Copyright 2011-2017 by Bill Spitzak and others.
> + //
> + // This library is free software. Distribution and use rights are outlined in
> + // the file "COPYING" which should have been included with this file.  If this
> +@@ -46,13 +46,13 @@ main(int  argc,			// I - Number of command-line arguments
> +     strcpy(buf, argv[0]);
> +     char *slash = strrchr(buf, '/');
> +     if (slash)
> +-      strcpy(slash, "/../Resources/help-test.html");
> ++      strcpy(slash, "/../Resources/help_dialog.html");
> +     help->load(buf);
> +
> + #else
> +
> +   if (argc <= 1)
> +-    help->load("help-test.html");
> ++    help->load("help_dialog.html");
> +   else
> +     help->load(argv[1]);
> +
> +diff --git a/test/help-test.html b/test/help_dialog.html
> +similarity index 100%
> +rename from test/help-test.html
> +rename to test/help_dialog.html
> 


