Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58B857FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 12:39:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 20so1817418wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 04:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OInAxaRNwaYYR0ZRBH7Yor9kuBIm4+eAx9kudUkeeE8=;
	b=SRxAGX4bwFbpgyKVoYiTzPOTiOpB2Is2cSZ2Q62SlGReNmczfL1uOC9MSq/mhXZ6Tx
	xBnYj3FtQlsv10hfdBYrds1zcLZg7xKR5tFhNRkv8G+hXhRyQ/tnMZZFgH8IwbKnUwTA
	k/7b7tctGjDziHyT+Q557wfHutqAUwgqYIealIJW2mGD1hoEOWa4BPpesMFKG4JFtub5
	KgxaM61WJ1Lp9L/jgPnF3Nhv4e343LqfkcLGB0PQA69QuW66dBeONJvkf6NeNJC9CXSi
	cIlx3PujcxpYezP3z2HPN/95qtyUlLfjXw+x0LmSKEdfHjKbOyoyaQjCjgBKiFlI/Tki
	s8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OInAxaRNwaYYR0ZRBH7Yor9kuBIm4+eAx9kudUkeeE8=;
	b=UZGCuO+bzMvyYk5s56l8P2IBHj1TXToC6uGCigTD/rs3USzaTwGZpY2mtwEA74vmNU
	ixO/kkvYHq58ICdSJNNr5UL3FZY7kPf7H+RCt0OymtrVSC+3eh+pOFcQUPFme+c0inls
	RdofMxm+D10bPMLKZDOr4rWjoYcU4MV3M+32IA6X5uONtc1xcvOI8Ucdw11J1nB8k/JD
	nVxmtcWhnfjMb2ijhl2FhDAx3iwk1grYiWv7h3yVPMuwpmMjKiadk0Mp8Y9hTxgC7pNn
	M2T5oWFvWF7Z2d4rorSaTWz6aI1ibfjHwHQl3Se45SlAv3crluP37x0/SlRaC7BUuJf2
	zBpg==
X-Gm-Message-State: APjAAAVoCoeDyjlmQagqFt/uTfiD/ah4f46CHoiJUizOwO1IPWL3SSrp
	MHUom27ecBLgwZo0p2U/RrgC5Hn1DTUcSPYFes8=
X-Google-Smtp-Source: APXvYqy6Al+sSZIrEHuS00JlpRJiZ03Rnz2Te2WPI0+4wRm0rsy1Oo60WbvqUSCgDmV3x7VOd95rEYHefRC5D/yTw08=
X-Received: by 2002:a1c:730b:: with SMTP id d11mr4366254wmb.30.1578659963898; 
	Fri, 10 Jan 2020 04:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20200108171110.24095-1-costamagnagianfranco@yahoo.it>
	<CAMKF1srYoEatSNts-ryt2r0yBJdqC9_+YoDmdceN670g8DJ8Dg@mail.gmail.com>
	<CAATN8PW1s7duw_j_AqQzp6rkSsfUbMrjXkmATAKt0Ymdsefx7A@mail.gmail.com>
	<CAMKF1srgiDoYuRL35d1QbaxswmsHp+S2E+p4Gq9z+-Wf0b=iHg@mail.gmail.com>
In-Reply-To: <CAMKF1srgiDoYuRL35d1QbaxswmsHp+S2E+p4Gq9z+-Wf0b=iHg@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Fri, 10 Jan 2020 13:39:12 +0100
Message-ID: <CAATN8PU+v9PO3cVjTh=6qH5D4gWPaH423rtK4sJJRDvZS8fB1Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 10 Jan 2020 12:39:23 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

Il giorno gio 9 gen 2020 alle ore 18:19 Khem Raj <raj.khem@gmail.com> ha
scritto:

> On Thu, Jan 9, 2020 at 2:41 AM Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Hello, I sent a new version some seconds ago.
> >
> > For the Upstream-Status, I would like to prefer avoiding doing that,
> because I copy-paste the patches from my Debian packaging,
>
> if they are verbatim copy them perhaps they should be using wget
> fetcher and not stored locally, so then they will be checksummed for
> any changes from upstream as well as they will get url location for
> patches for OE in metadata its
> good to have the patch header as per
>
>
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
>
> we are trying to nudge us to have this info in patch headers to make
> it easy for future reference.
>
>
unfortunately, with a push -f, or a subsequent commit, the upstream PR
might change hash, and that would break a lot things for the end user on
stable branches.
I prefer to cherry-pick and manually download patches, test them, and in
case they are updated upstream, don't care too much, unless
somebody pings me.

In any case on the next upstream release they will be part of the codebase,
so they will go away in any case
(and the PR comes from myself, so I know if somebody asks me for changes)


> > with no differences at all (and on the next upstream release they will
> be all dropped), and the patch name is the PR number, because I just add
> them via wget command, something like:
> > wget https://github.com/zaphoyd/websocketpp/pull/857.patch
> >
> > the "tests" are just meant to see if everything builds fine with newer
> toolchains (e.g. new boost version), while examples...
> > I don't plan to add them yet, unless somebody asks for them.
> >
> > In any case, I prefer to add them in a subpackage, after patching the
> upstream CMake system to install them into the filesystem, and after I do
> that in Debian.
> >
>
> I see this is WIP which is ok we can wait.
>
>
I noticed I was already installing the examples in the debian packaging
(under websocketpp-doc subpackage), so I sent a new PR to copy them in a
similar location.

Thanks

Gianfranco


> > let me know if it sounds good for you!
> >
> > G.
> >
> >
> > Il giorno mer 8 gen 2020 alle ore 20:26 Khem Raj <raj.khem@gmail.com>
> ha scritto:
> >>
> >> On Wed, Jan 8, 2020 at 9:11 AM Gianfranco Costamagna
> >> <costamagna.gianfranco@gmail.com> wrote:
> >> >
> >> > - build failure with boost 1.71
> >> > - bad installation of header files correct version on some OSes.
> >> > - fix version minor number
> >> >
> >> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> >> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> >> > ---
> >> >  .../websocketpp/websocketpp-0.8.1/771.patch   | 22 ++++++++++++++
> >> >  .../websocketpp/websocketpp-0.8.1/842.patch   | 30
> +++++++++++++++++++
> >> >  .../websocketpp/websocketpp-0.8.1/855.patch   | 23 ++++++++++++++
> >> >  .../websocketpp/websocketpp_0.8.1.bb          |  5 ++++
> >> >  4 files changed, 80 insertions(+)
> >> >  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> >> >  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> >> >  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> >> >
> >> > diff --git
> a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> >> > new file mode 100644
> >> > index 000000000..bc65efb7d
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> >> > @@ -0,0 +1,22 @@
> >> > +From 4bccfb04a264704ec9b80ba332ee1cf113ce7f1b Mon Sep 17 00:00:00
> 2001
> >> > +From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
> >> > +Date: Thu, 1 Nov 2018 20:58:10 +0100
> >> > +Subject: [PATCH] Update version number in CMakeLists.txt to 0.8.1
> >> > +
> >> > +---
> >> > + CMakeLists.txt | 2 +-
> >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > +
> >> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> >> > +index 2786aba9..2d13117b 100644
> >> > +--- a/CMakeLists.txt
> >> > ++++ b/CMakeLists.txt
> >> > +@@ -24,7 +24,7 @@ endif ()
> >> > + ############ Project name and version
> >> > + set (WEBSOCKETPP_MAJOR_VERSION 0)
> >> > + set (WEBSOCKETPP_MINOR_VERSION 8)
> >> > +-set (WEBSOCKETPP_PATCH_VERSION 0)
> >> > ++set (WEBSOCKETPP_PATCH_VERSION 1)
> >> > + set (WEBSOCKETPP_VERSION
> ${WEBSOCKETPP_MAJOR_VERSION}.${WEBSOCKETPP_MINOR_VERSION}.${WEBSOCKETPP_PATCH_VERSION})
> >> > +
> >> > + if(POLICY CMP0048)
> >> > diff --git
> a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> >> > new file mode 100644
> >> > index 000000000..c3651e94a
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> >> > @@ -0,0 +1,30 @@
> >> > +From 7f7e2be01b4fa6580ce27f668e61adf37853ad67 Mon Sep 17 00:00:00
> 2001
> >> > +From: Schrijvers Luc <begasus@gmail.com>
> >> > +Date: Wed, 18 Sep 2019 11:35:43 +0200
> >> > +Subject: [PATCH] Fix "include" directory installation. the variable
> >> > + INSTALL_INCLUDE_DIR already exists, and defaults to include if not
> >> > + specificied otherwise. Using it allows people to customize the
> installation
> >> > + from outside, fixing issues with other OS like Haiku
> >> > +
> >> > +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> >> > +Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> >> > +---
> >> > + cmake/CMakeHelpers.cmake | 2 +-
> >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > +
> >> > +diff --git a/cmake/CMakeHelpers.cmake b/cmake/CMakeHelpers.cmake
> >> > +index 1478f4b..f603632 100644
> >> > +--- a/cmake/CMakeHelpers.cmake
> >> > ++++ b/cmake/CMakeHelpers.cmake
> >> > +@@ -80,7 +80,7 @@ macro (final_target)
> >> > +     endif ()
> >> > +
> >> > +     install (DIRECTORY ${CMAKE_SOURCE_DIR}/${TARGET_NAME}
> >> > +-             DESTINATION include/
> >> > ++             DESTINATION ${INSTALL_INCLUDE_DIR}/
> >> > +              FILES_MATCHING PATTERN "*.hpp*")
> >> > + endmacro ()
> >> > +
> >> > +--
> >> > +2.17.1
> >> > +
> >> > diff --git
> a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> >> > new file mode 100644
> >> > index 000000000..e44a21c9f
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> >> > @@ -0,0 +1,23 @@
> >> > +From 3590d77bb9753fbbf076028e2395182ced6466ba Mon Sep 17 00:00:00
> 2001
> >> > +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> >> > +Date: Wed, 8 Jan 2020 17:59:48 +0100
> >> > +Subject: [PATCH] Fix cmake find boost with version >= 1.71
> >> > +
> >> > +For some reasons "system;thread;random;unit_test_framework" was seen
> as a single module, because of the quotes.
> >> > +---
> >> > + CMakeLists.txt | 2 +-
> >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > +
> >> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> >> > +index 2d13117b..9a46bc10 100644
> >> > +--- a/CMakeLists.txt
> >> > ++++ b/CMakeLists.txt
> >> > +@@ -211,7 +211,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
> >> > +     set (Boost_USE_MULTITHREADED TRUE)
> >> > +     set (Boost_ADDITIONAL_VERSIONS "1.39.0" "1.40.0" "1.41.0"
> "1.42.0" "1.43.0" "1.44.0" "1.46.1") # todo: someone who knows better
> spesify these!
> >> > +
> >> > +-    find_package (Boost 1.39.0 COMPONENTS
> "${WEBSOCKETPP_BOOST_LIBS}")
> >> > ++    find_package (Boost 1.39.0 COMPONENTS ${WEBSOCKETPP_BOOST_LIBS})
> >> > +
> >> > +     if (Boost_FOUND)
> >> > +         # Boost is a project wide global dependency.
> >> > diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> >> > index 05f14d2f4..ba3b5a1b0 100644
> >> > --- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> >> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> >> > @@ -9,8 +9,13 @@ SRC_URI = "git://
> github.com/zaphoyd/websocketpp.git;protocol=https \
> >> >
>  file://0001-Replace-make_shared-with-new-in-some-cases.patch \
> >> >             file://0002-Fix-missed-entries-fix-testing.patch \
> >> >             file://0001-cmake-Use-GNUInstallDirs.patch \
> >> > +           file://842.patch \
> >> > +           file://771.patch \
> >> > +           file://855.patch \
> >> >            "
> >> >
> >>
> >> I think it will be good if the patches were with 'Upstream-Status: 1
> >> field present in patch header, this helps in tracking them in future.
> >>
> >> > +EXTRA_OECMAKE = "-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON"
> >> > +
> >>
> >> These options should be better as packageconfigs and we can turn tests
> >> on when ptest feature is
> >> enabled.
> >>
> >> Also examples, perhaps should be packages into a separate output
> package.
> >>
> >> >  # tag 0.8.1
> >> >  SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
> >> >
> >> > --
> >> > 2.17.1
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

