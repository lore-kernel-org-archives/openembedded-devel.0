Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 14FBB7C4BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:59:39 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y4so845023qtc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XLvthqhdBL5J+8kqmrocHumze1bls7+HyJltJW/Ad68=;
	b=JfGA+y8rQKr0o6I9t3bL2Xdg48l6sqVQfV5XEpkWdn1WC1z/Dlz6HIj3ffTHU5pKZa
	ZpNhilUrbRHSA5uUN7GrI4022vh7QwWF41y6x+5+9wOa2GznwYMss/0JgnUfu0Jc+Ur0
	wyhJhD3iEg9C643ni8LTtZoHM3X5mk1IAcf68tKPAjuCKI+dsT4RnWz7+FKN+GC5A+oV
	zhJGQylJdcGw0onFisMkdCWm1tsJKiLdGmel/WIuDFYG+nHdTWK9S0KgKX3IR7xLK6VK
	1efLgY05YI6aqFU2etOHfSgY+ro6QGaVcPIGN6j3ZxD0BLC0Lr4vCBTtRJ0eO5O/9yYn
	Kiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XLvthqhdBL5J+8kqmrocHumze1bls7+HyJltJW/Ad68=;
	b=foMy2/E7okQyxroIBs5IB2VuxPG9GwI4wGlhvtHSa2nIohbmmYQDsJoLv6LqNJvuwL
	y4gfTYOiBgyFnRVQexS04D2X3ZpgXe8uY6168OU8LgfnkVv5V1nVEFuGPRe0HXQ1EjII
	UoHo+uROS7LyS0Xu3fpeMs+NAzv1YEXNZOpaF5TotKQaj5R56VZbBJvXaaKB9N+M7UQK
	98CylaaCYOZ6dpxOOejsL8AFESbDO/r/yYhchs3Bz+kMDDO4v+mpTtYJFDfJwCAiRbvN
	ShfiUW8uKV3jRuZQ7dNvrmP/WzYSi8qoNqKU6NELFdiED3JgDbX/1p6w1s4fKKlSp4Hr
	0Z8w==
X-Gm-Message-State: AHQUAuZhHqLtgUd2eNKSR3rTR0CpGzbdfHjsvXi9L0smoUBZ8iFbl77v
	TRE0EQJX4i1TUBqdsLv3k/hLacJeeJqU8JcWYe0=
X-Google-Smtp-Source: AHgI3IZXansjd2SY+FqJwXe35qvaRylTNDwwfs4arayzAW+xEFwhEbI+JHngHwvBu2OZKRK7C9F/PXpqK7cdhzzuFCM=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr12607198qtn.254.1549562380851;
	Thu, 07 Feb 2019 09:59:40 -0800 (PST)
MIME-Version: 1.0
References: <1549537201-4781-1-git-send-email-rbilovol@cisco.com>
	<9c35bb5b-c262-c482-8cb8-08bd76df1c43@cisco.com>
In-Reply-To: <9c35bb5b-c262-c482-8cb8-08bd76df1c43@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Feb 2019 09:59:14 -0800
Message-ID: <CAMKF1soVDFdftCQCJmU6TvwUJibQmSCLC1kTwCNBs5QLD=qtYA@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>,
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [meta-oe] [PATCH] rapidjson: fix cmake artifacts installation for non-default BASELIB case
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
X-List-Received-Date: Thu, 07 Feb 2019 17:59:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 7, 2019 at 9:31 AM Ruslan Bilovol <rbilovol@cisco.com> wrote:
>
> Hi Khem,
>
> I see you picked up this patch to master-next, but the patch's author
> is incorrect:
> https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=cf54629463841242ce1faa90f6ad4a2383df3b2c
>
> Could you please fix it?
>

sure


> This is the same issue we faced with oe-core mailing list, I remember
> Richard Purdie had some scripts to fix it automatically
>

I wonder why is this happening? May be Michael can help us understand,
why patchwork would feed a worng author or is it
some email client error somewhere?
> Thanks,
> Ruslan
>
> On 2/7/19 1:00 PM, Ruslan Bilovol wrote:
> > If BASELIB is set to non-default value (like lib64),
> > next 'installed but not shipped' issue happens:
> >    /usr/lib
> >    /usr/lib/cmake
> >    /usr/lib/pkgconfig
> >    /usr/lib/cmake/RapidJSON
> >    /usr/lib/cmake/RapidJSON/RapidJSONConfigVersion.cmake
> >    /usr/lib/cmake/RapidJSON/RapidJSONConfig.cmake
> >    /usr/lib/pkgconfig/RapidJSON.pc
> >
> > This is because rapidjson has library installation dir set
> > to 'lib' by default and hardcoded in another place.
> > Fix this by next changes:
> >   - set appropriate LIB_INSTALL_DIR
> >   - fix hardcoded 'lib' in CMAKECONFIG_INSTALL_DIR case
> >
> > Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> > ---
> >   ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 ++++++++++++++++++++++
> >   .../recipes-devtools/rapidjson/rapidjson_git.bb    |  5 +--
> >   2 files changed, 39 insertions(+), 2 deletions(-)
> >   create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> >
> > diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> > new file mode 100644
> > index 0000000..745f5d0
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
> > @@ -0,0 +1,36 @@
> > +From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001
> > +From: Ruslan Bilovol <rbilovol@cisco.com>
> > +Date: Thu, 24 Jan 2019 18:11:39 +0200
> > +Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
> > +
> > +Currently this path is hardcoded to lib/cmake.
> > +Some distributions have different library path (like lib64).
> > +So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR
> > +configurable and usable in such distros.
> > +
> > +Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9]
> > +
> > +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> > +---
> > + CMakeLists.txt | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 7c60407..0275672 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}ConfigVersion.cmake.in
> > +     ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake @ONLY)
> > +
> > + # ... for the install tree
> > +-SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )
> > ++SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )
> > + FILE( RELATIVE_PATH REL_INCLUDE_DIR
> > +-    "${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DIR}"
> > ++    "${CMAKECONFIG_INSTALL_DIR}"
> > +     "${CMAKE_INSTALL_PREFIX}/include" )
> > +
> > + SET( ${PROJECT_NAME}_INCLUDE_DIR "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INCLUDE_DIR}" )
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > index c90eab0..e3ed9c6 100644
> > --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > @@ -4,7 +4,8 @@ SECTION = "libs"
> >   LICENSE = "MIT"
> >   LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
> >
> > -SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
> > +SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
> > +           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
> >
> >   SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
> >
> > @@ -14,7 +15,7 @@ S = "${WORKDIR}/git"
> >
> >   inherit cmake
> >
> > -EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
> > +EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
> >
> >   # RapidJSON is a header-only C++ library, so the main package will be empty.
> >
> >

