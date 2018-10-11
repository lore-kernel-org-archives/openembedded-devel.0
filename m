Return-Path: <uvv.mail@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B105605C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 09:35:27 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id q40-v6so9068991qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=be6YuFSq4jC6RTtuwLZBAO6F2JCp2JVetQZsfEhO6Ao=;
	b=jbF9tOJjQCYACBKdGEI3JdhBQAS12H12dNTGS8Uwjy8NguUD62wsjTa5baUt4ISYQ1
	8J8di/ZIkRjLqpz28zVSkPrUKUo6ab9yiYM8qdT+ArfZk/oAyrNhwbHlMbzEoUziBzvj
	+6rn2MBUc1iceJxDeIIlW8voEyuugQrr/HRFfaViqJfu8lOhQagIOPmLkBZ8fxaJ4txy
	bW5I2mA5otFoZTsBeO596b+U2MpCBgoGYlztR+zObdDime+a0fhEwnf0e3hKqjTMNkn/
	5RBRm6Xvy5BOu3pl4Z4DzbPQrc/XjjK8Aq8tnoxs3+tKlBWbHoQ6FjN2mocgzEJTEzDa
	hjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=be6YuFSq4jC6RTtuwLZBAO6F2JCp2JVetQZsfEhO6Ao=;
	b=IXJOPO+cNp+PrAez8CmorTnHcelmoXrMVSvAWoYSYUtEoNMUGbJHXjYl4UcCrQOk/w
	9uOfllMs9mu4IDsQspUmg9ooDxIwA466vP1CLCYrvyVSKMuzE09tMydH/9MnStOXtf1/
	C8YGwrnhy5IjBUq8iWC8K9ebJ+QYo+HYd2h4cK4ZHFlR4+2CCfAZEIQbPvUrnWjAPB6e
	OsphBX+VZ9B9rAWm70IJdg696MNCZ5EqlUPR6QINwfDKTAjfpcn20h72K0M+2Pyrtd4L
	16yCO59jLqardxeovkNfL/S7IrVREzxamcHo1SbXgDdrLFpDFEfv8AUZCpRMU6nbqfxj
	FhMQ==
X-Gm-Message-State: ABuFfoiAbshbpOA9/PVC6SLg5dmrDOc3JtCSAlcE7tZtkER3oRac0qGo
	FsrV4LHAoAe7TEKcH8TDUq3RdiN6qQ6Ndd+THp8=
X-Google-Smtp-Source: ACcGV607fQprG86oNPACLgtcOyie6E4X2pl2cCKQtXNCQrixbKvRAeaPWroZjCRlLBmg5esVYIEA/Ihid593VAP43eM=
X-Received: by 2002:ac8:1b87:: with SMTP id z7-v6mr716168qtj.321.1539250527981;
	Thu, 11 Oct 2018 02:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20181011090824.21591-1-brgl@bgdev.pl>
In-Reply-To: <20181011090824.21591-1-brgl@bgdev.pl>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Thu, 11 Oct 2018 11:35:22 +0200
Message-ID: <CAKHfEahAUCUK5A1gZmou8arwovBgg0xbtipOmngcEV8wjgB-bA@mail.gmail.com>
To: brgl@bgdev.pl
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: lew@avast.com, bgolaszewski@baylibre.com,
	openembedded-devel@lists.openembedded.org,
	jan.kaisrlik@avast.com, karas@avast.com
Subject: Re: [meta-oe][PATCH] catch2: new package
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
X-List-Received-Date: Thu, 11 Oct 2018 09:35:27 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,
As I learned quite recently, you have to do the following for header-only
libraries:
RDEPENDS_${PN}-dev = ""
RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"

Regards,
Vyacheslav

On Thu, Oct 11, 2018 at 11:08 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Add a recipe for the catch2 testing framework. There's a bug upstream
> which makes it impossible to build with gcc7 so include a patch.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../0001-internal-fix-build-in-GCC-7.patch    | 35 +++++++++++++++++++
>  meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 25 +++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644
> meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
>  create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb
>
> diff --git
> a/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
> b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
> new file mode 100644
> index 000000000..606398afa
> --- /dev/null
> +++
> b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
> @@ -0,0 +1,35 @@
> +From 857bf7e83db330682a4c722d0b57be1e4481f4e2 Mon Sep 17 00:00:00 2001
> +From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +Date: Thu, 11 Oct 2018 09:44:24 +0200
> +Subject: [PATCH] internal: fix build in GCC 7
> +
> +The following error is emitted by gcc 7:
> +
> +include/internal/catch_tostring.cpp:217:21: error: comparison is always
> true due to limited range of data type [-Werror=type-limits]
> +|      } else if ('\0' <= value && value < ' ') {
> +|                 ~~~~~^~~~~~~~
> +| cc1plus: all warnings being treated as errors
> +
> +We can drop the first part of the if.
> +
> +Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +---
> + include/internal/catch_tostring.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/internal/catch_tostring.cpp
> b/include/internal/catch_tostring.cpp
> +index 4e0c027d..59cc8dec 100644
> +--- a/include/internal/catch_tostring.cpp
> ++++ b/include/internal/catch_tostring.cpp
> +@@ -214,7 +214,7 @@ std::string StringMaker<char>::convert(char value) {
> +         return "'\\n'";
> +     } else if (value == '\t') {
> +         return "'\\t'";
> +-    } else if ('\0' <= value && value < ' ') {
> ++    } else if (value < ' ') {
> +         return ::Catch::Detail::stringify(static_cast<unsigned
> int>(value));
> +     } else {
> +         char chstr[] = "' '";
> +--
> +2.19.1
> +
> diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> new file mode 100644
> index 000000000..ba14a362c
> --- /dev/null
> +++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "A modern, C++-native, header-only, test framework for
> unit-tests, \
> +TDD and BDD - using C++11, C++14, C++17 and later."
> +AUTHOR = "Phil Nash, Martin Horenovsky and others"
> +HOMEPAGE = "https://github.com/catchorg/Catch2"
> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> +
> +SRC_URI = "git://github.com/catchorg/Catch2.git \
> +           file://0001-internal-fix-build-in-GCC-7.patch"
> +SRCREV = "9e1bdca4667295fcb16265eae00efa8423f07007"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "python-native"
> +
> +inherit cmake python3native
> +
> +# Header-only library
> +ALLOW_EMPTY_${PN} = "1"
> +
> +do_install_append() {
> +    rm ${D}/usr/share/Catch2/lldbinit
> +    rm ${D}/usr/share/Catch2/gdbinit
> +    rmdir ${D}/usr/share/Catch2/
> +}
> --
> 2.19.1
>
> --

