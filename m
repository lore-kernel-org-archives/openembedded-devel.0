Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id F39867F829
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 10:41:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so2348522wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 02:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C06ZK8Ab/yjOPj2FUVQf0XuXbzxbt7AqnrfvSGiWPK4=;
	b=Of5rYDGr8Dgavm5XRCQt7Pw7sYK89vR6LhpEWaQnLSPIGdwQeDu1LsSFYLZNvT8Pml
	SL/8UcjSVNuwZRc+n1DC94rxbEPJmlrFzZSgHnU8wLjBnVMioAhNeh4YpS3CMxEbRqzx
	EZ6foS7reqEvt89AgpbC2NQ/qpKetDGWKMCkcfmZsYqC4N61WRFTTzbaHXGJObH8+nTc
	YVrxthvgfxiz5JuFB0eMrU4TKtGmq2WewtbFF4DMsq/P/K6N7GWsebRUvB83fwmXgWWP
	de1yoaELW/Y3XkEkufdqXLeZyf29YO3J4HDOj1mDG3PYFgs44vrf5KEG4Of/9ZkkDtVp
	4Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C06ZK8Ab/yjOPj2FUVQf0XuXbzxbt7AqnrfvSGiWPK4=;
	b=TciX05qJZp5rWOHBXBQcBP6j5fHuZY6eOA/937JCSei99WhjyZu4BVGALd8Nc8hWOS
	ACfqm4MaYZT/FyvsrSBAeki+lKtwIL2uH42M9Wj/eE8baCeU9Badswy7s0M6ixyBVDcH
	YHRNqoeYssZtVewWHcWl4rFYXFPQDmkJadSH81WJmN0zDnNRYj5V6T0wayItxH7ZCIGQ
	EHlGL+8UK7xqRx0of/crDLznTlFgMdyKfpTNnAjQBw4kN+gm4o+/rykz37VtP57oaeCL
	3sEmQG7rODSshOYwc5oa3siJjyN1/4HkEF9IA9WK7WNY/5V2QX8INE24o4ejwheT59Hi
	3vkQ==
X-Gm-Message-State: APjAAAVP/un0AcKwLfj+C+B4U8X0eugTugwW0dj5TMFkqBykoCZJqMVd
	PYb9yN0xu4WgZwDY/PZ/gFrO8SRGOtwWWXDvHH8=
X-Google-Smtp-Source: APXvYqwmLhvfPyTzB2u+EnTIdxPXnV1UlImw94JfSs7EvC9c61LeTMmK4SXeeIC/nxCBSwOEcfWhOdWvjmQ/0OnA08U=
X-Received: by 2002:a1c:3189:: with SMTP id x131mr3854226wmx.59.1578566477626; 
	Thu, 09 Jan 2020 02:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20200108171110.24095-1-costamagnagianfranco@yahoo.it>
	<CAMKF1srYoEatSNts-ryt2r0yBJdqC9_+YoDmdceN670g8DJ8Dg@mail.gmail.com>
In-Reply-To: <CAMKF1srYoEatSNts-ryt2r0yBJdqC9_+YoDmdceN670g8DJ8Dg@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 9 Jan 2020 11:41:06 +0100
Message-ID: <CAATN8PW1s7duw_j_AqQzp6rkSsfUbMrjXkmATAKt0Ymdsefx7A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] websocketpp: add various upstream accepted and proposed patches to fix various issues, including:
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
X-List-Received-Date: Thu, 09 Jan 2020 10:41:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hello, I sent a new version some seconds ago.

For the Upstream-Status, I would like to prefer avoiding doing that,
because I copy-paste the patches from my Debian packaging,
with no differences at all (and on the next upstream release they will be
all dropped), and the patch name is the PR number, because I just add them
via wget command, something like:
wget https://github.com/zaphoyd/websocketpp/pull/857.patch

the "tests" are just meant to see if everything builds fine with newer
toolchains (e.g. new boost version), while examples...
I don't plan to add them yet, unless somebody asks for them.

In any case, I prefer to add them in a subpackage, after patching the
upstream CMake system to install them into the filesystem, and after I do
that in Debian.

let me know if it sounds good for you!

G.


Il giorno mer 8 gen 2020 alle ore 20:26 Khem Raj <raj.khem@gmail.com> ha
scritto:

> On Wed, Jan 8, 2020 at 9:11 AM Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > - build failure with boost 1.71
> > - bad installation of header files correct version on some OSes.
> > - fix version minor number
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../websocketpp/websocketpp-0.8.1/771.patch   | 22 ++++++++++++++
> >  .../websocketpp/websocketpp-0.8.1/842.patch   | 30 +++++++++++++++++++
> >  .../websocketpp/websocketpp-0.8.1/855.patch   | 23 ++++++++++++++
> >  .../websocketpp/websocketpp_0.8.1.bb          |  5 ++++
> >  4 files changed, 80 insertions(+)
> >  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> >  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> >  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> >
> > diff --git
> a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> > new file mode 100644
> > index 000000000..bc65efb7d
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> > @@ -0,0 +1,22 @@
> > +From 4bccfb04a264704ec9b80ba332ee1cf113ce7f1b Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
> > +Date: Thu, 1 Nov 2018 20:58:10 +0100
> > +Subject: [PATCH] Update version number in CMakeLists.txt to 0.8.1
> > +
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 2786aba9..2d13117b 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -24,7 +24,7 @@ endif ()
> > + ############ Project name and version
> > + set (WEBSOCKETPP_MAJOR_VERSION 0)
> > + set (WEBSOCKETPP_MINOR_VERSION 8)
> > +-set (WEBSOCKETPP_PATCH_VERSION 0)
> > ++set (WEBSOCKETPP_PATCH_VERSION 1)
> > + set (WEBSOCKETPP_VERSION
> ${WEBSOCKETPP_MAJOR_VERSION}.${WEBSOCKETPP_MINOR_VERSION}.${WEBSOCKETPP_PATCH_VERSION})
> > +
> > + if(POLICY CMP0048)
> > diff --git
> a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> > new file mode 100644
> > index 000000000..c3651e94a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> > @@ -0,0 +1,30 @@
> > +From 7f7e2be01b4fa6580ce27f668e61adf37853ad67 Mon Sep 17 00:00:00 2001
> > +From: Schrijvers Luc <begasus@gmail.com>
> > +Date: Wed, 18 Sep 2019 11:35:43 +0200
> > +Subject: [PATCH] Fix "include" directory installation. the variable
> > + INSTALL_INCLUDE_DIR already exists, and defaults to include if not
> > + specificied otherwise. Using it allows people to customize the
> installation
> > + from outside, fixing issues with other OS like Haiku
> > +
> > +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > +Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > +---
> > + cmake/CMakeHelpers.cmake | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/cmake/CMakeHelpers.cmake b/cmake/CMakeHelpers.cmake
> > +index 1478f4b..f603632 100644
> > +--- a/cmake/CMakeHelpers.cmake
> > ++++ b/cmake/CMakeHelpers.cmake
> > +@@ -80,7 +80,7 @@ macro (final_target)
> > +     endif ()
> > +
> > +     install (DIRECTORY ${CMAKE_SOURCE_DIR}/${TARGET_NAME}
> > +-             DESTINATION include/
> > ++             DESTINATION ${INSTALL_INCLUDE_DIR}/
> > +              FILES_MATCHING PATTERN "*.hpp*")
> > + endmacro ()
> > +
> > +--
> > +2.17.1
> > +
> > diff --git
> a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> > new file mode 100644
> > index 000000000..e44a21c9f
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> > @@ -0,0 +1,23 @@
> > +From 3590d77bb9753fbbf076028e2395182ced6466ba Mon Sep 17 00:00:00 2001
> > +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > +Date: Wed, 8 Jan 2020 17:59:48 +0100
> > +Subject: [PATCH] Fix cmake find boost with version >= 1.71
> > +
> > +For some reasons "system;thread;random;unit_test_framework" was seen as
> a single module, because of the quotes.
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 2d13117b..9a46bc10 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -211,7 +211,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
> > +     set (Boost_USE_MULTITHREADED TRUE)
> > +     set (Boost_ADDITIONAL_VERSIONS "1.39.0" "1.40.0" "1.41.0" "1.42.0"
> "1.43.0" "1.44.0" "1.46.1") # todo: someone who knows better spesify these!
> > +
> > +-    find_package (Boost 1.39.0 COMPONENTS "${WEBSOCKETPP_BOOST_LIBS}")
> > ++    find_package (Boost 1.39.0 COMPONENTS ${WEBSOCKETPP_BOOST_LIBS})
> > +
> > +     if (Boost_FOUND)
> > +         # Boost is a project wide global dependency.
> > diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> > index 05f14d2f4..ba3b5a1b0 100644
> > --- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> > @@ -9,8 +9,13 @@ SRC_URI = "git://
> github.com/zaphoyd/websocketpp.git;protocol=https \
> >             file://0001-Replace-make_shared-with-new-in-some-cases.patch
> \
> >             file://0002-Fix-missed-entries-fix-testing.patch \
> >             file://0001-cmake-Use-GNUInstallDirs.patch \
> > +           file://842.patch \
> > +           file://771.patch \
> > +           file://855.patch \
> >            "
> >
>
> I think it will be good if the patches were with 'Upstream-Status: 1
> field present in patch header, this helps in tracking them in future.
>
> > +EXTRA_OECMAKE = "-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON"
> > +
>
> These options should be better as packageconfigs and we can turn tests
> on when ptest feature is
> enabled.
>
> Also examples, perhaps should be packages into a separate output package.
>
> >  # tag 0.8.1
> >  SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

