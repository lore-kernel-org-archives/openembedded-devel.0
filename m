Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1040C7FCE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 19:26:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k40so3727505qtk.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 11:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RkdvS03mcar+g9jkwvzHaLu0DvOvE8VdiT1bh/U6LMs=;
	b=EFevan2MRXDSzwaz6t6Lyta+E7kcpYy6GW4QJnEvq514x/MjymcsxjCSD8X+oROyDl
	URcFLBO1fFlOWzVLMaz8og3A/28opGQ5Wk1rc8RGhxVHVw4BlUx3QErPWzt+oC2KqOGG
	lOHo3Uz6GSZW5iYBfbOWMST/Jwk92nAr7Y6O1JaA5QKhrZT5GtEha0tUqG+vxBMHoFiU
	ODWtNquWEecLmqOSX18p/Eny+Rf9rvGyzT3NfSZHBJVrlaAhONfQP+JGvhgeNBBBkJr9
	w5Um8XAo9IiAi/r8ROiNfuC/jqmKYwJZ8kh03Zk2esoGuRqamP/zULogkdffBWXhpnpp
	w6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RkdvS03mcar+g9jkwvzHaLu0DvOvE8VdiT1bh/U6LMs=;
	b=Yz94wKQWOhfWsyLG2sSonKh5YRwdU6enhQNl8c43lvGCJN9gop8otN7DUw5FUeJDpW
	Hh9evZSUB9S7gao15c6InOTRdx1Len1a7colC5B9KqSjIMAu01yDr3/SxfaPIvSqGyw7
	LP04RWXNY+23P07utsRr5c2CtRp8lsJjGJQTq6+ASk/AmM1Wj306BreVB3LZhovm4dfB
	uKy+IXfCJXDN3pBHoXBxpLaYTSu4JAan0JbtDtPzi0/dHYgfrIsgpXRbmoR+pLCSEI2L
	GpbbKLy9qjys5Dnm5IEGTkBgL+ieiIxX6nyEUszs6EikrHJaqJJaREKq8qUYAx1occHv
	YqCQ==
X-Gm-Message-State: APjAAAVSwiM5Sg2xmmoH1UvaHnJHT22Ha30O+WciUTkWevuDIMhodEyO
	va8xwnf/1R9x1MiiVhK0to+R00aX+tEWQuck1a8=
X-Google-Smtp-Source: APXvYqwWpgqpqqavnLsUZQ5yRf0VpoCyCBATSmayHg467lVF/OPcdWKVWOK3V75kLjYXj+Phz09idMa6FS9WaGQtquA=
X-Received: by 2002:aed:2c03:: with SMTP id f3mr4837572qtd.80.1578511606551;
	Wed, 08 Jan 2020 11:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20200108171110.24095-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200108171110.24095-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2020 11:26:20 -0800
Message-ID: <CAMKF1srYoEatSNts-ryt2r0yBJdqC9_+YoDmdceN670g8DJ8Dg@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
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
X-List-Received-Date: Wed, 08 Jan 2020 19:26:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 8, 2020 at 9:11 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> - build failure with boost 1.71
> - bad installation of header files correct version on some OSes.
> - fix version minor number
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../websocketpp/websocketpp-0.8.1/771.patch   | 22 ++++++++++++++
>  .../websocketpp/websocketpp-0.8.1/842.patch   | 30 +++++++++++++++++++
>  .../websocketpp/websocketpp-0.8.1/855.patch   | 23 ++++++++++++++
>  .../websocketpp/websocketpp_0.8.1.bb          |  5 ++++
>  4 files changed, 80 insertions(+)
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
>
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> new file mode 100644
> index 000000000..bc65efb7d
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
> @@ -0,0 +1,22 @@
> +From 4bccfb04a264704ec9b80ba332ee1cf113ce7f1b Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
> +Date: Thu, 1 Nov 2018 20:58:10 +0100
> +Subject: [PATCH] Update version number in CMakeLists.txt to 0.8.1
> +
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 2786aba9..2d13117b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -24,7 +24,7 @@ endif ()
> + ############ Project name and version
> + set (WEBSOCKETPP_MAJOR_VERSION 0)
> + set (WEBSOCKETPP_MINOR_VERSION 8)
> +-set (WEBSOCKETPP_PATCH_VERSION 0)
> ++set (WEBSOCKETPP_PATCH_VERSION 1)
> + set (WEBSOCKETPP_VERSION ${WEBSOCKETPP_MAJOR_VERSION}.${WEBSOCKETPP_MINOR_VERSION}.${WEBSOCKETPP_PATCH_VERSION})
> +
> + if(POLICY CMP0048)
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> new file mode 100644
> index 000000000..c3651e94a
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
> @@ -0,0 +1,30 @@
> +From 7f7e2be01b4fa6580ce27f668e61adf37853ad67 Mon Sep 17 00:00:00 2001
> +From: Schrijvers Luc <begasus@gmail.com>
> +Date: Wed, 18 Sep 2019 11:35:43 +0200
> +Subject: [PATCH] Fix "include" directory installation. the variable
> + INSTALL_INCLUDE_DIR already exists, and defaults to include if not
> + specificied otherwise. Using it allows people to customize the installation
> + from outside, fixing issues with other OS like Haiku
> +
> +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> +---
> + cmake/CMakeHelpers.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cmake/CMakeHelpers.cmake b/cmake/CMakeHelpers.cmake
> +index 1478f4b..f603632 100644
> +--- a/cmake/CMakeHelpers.cmake
> ++++ b/cmake/CMakeHelpers.cmake
> +@@ -80,7 +80,7 @@ macro (final_target)
> +     endif ()
> +
> +     install (DIRECTORY ${CMAKE_SOURCE_DIR}/${TARGET_NAME}
> +-             DESTINATION include/
> ++             DESTINATION ${INSTALL_INCLUDE_DIR}/
> +              FILES_MATCHING PATTERN "*.hpp*")
> + endmacro ()
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> new file mode 100644
> index 000000000..e44a21c9f
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
> @@ -0,0 +1,23 @@
> +From 3590d77bb9753fbbf076028e2395182ced6466ba Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Wed, 8 Jan 2020 17:59:48 +0100
> +Subject: [PATCH] Fix cmake find boost with version >= 1.71
> +
> +For some reasons "system;thread;random;unit_test_framework" was seen as a single module, because of the quotes.
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 2d13117b..9a46bc10 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -211,7 +211,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
> +     set (Boost_USE_MULTITHREADED TRUE)
> +     set (Boost_ADDITIONAL_VERSIONS "1.39.0" "1.40.0" "1.41.0" "1.42.0" "1.43.0" "1.44.0" "1.46.1") # todo: someone who knows better spesify these!
> +
> +-    find_package (Boost 1.39.0 COMPONENTS "${WEBSOCKETPP_BOOST_LIBS}")
> ++    find_package (Boost 1.39.0 COMPONENTS ${WEBSOCKETPP_BOOST_LIBS})
> +
> +     if (Boost_FOUND)
> +         # Boost is a project wide global dependency.
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> index 05f14d2f4..ba3b5a1b0 100644
> --- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
> @@ -9,8 +9,13 @@ SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
>             file://0001-Replace-make_shared-with-new-in-some-cases.patch \
>             file://0002-Fix-missed-entries-fix-testing.patch \
>             file://0001-cmake-Use-GNUInstallDirs.patch \
> +           file://842.patch \
> +           file://771.patch \
> +           file://855.patch \
>            "
>

I think it will be good if the patches were with 'Upstream-Status: 1
field present in patch header, this helps in tracking them in future.

> +EXTRA_OECMAKE = "-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON"
> +

These options should be better as packageconfigs and we can turn tests
on when ptest feature is
enabled.

Also examples, perhaps should be packages into a separate output package.

>  # tag 0.8.1
>  SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

