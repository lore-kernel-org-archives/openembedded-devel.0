Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B9F8F751F2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 07:34:38 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o13-v6so9287575wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 00:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0hXBcGh8xwNW0ZH7EpC+6S290VDuAB5nfp55rrvQb0A=;
	b=uqONXs3wLtYhlNM1CPkusftFtRLamPEcjP6woG2vxoefE4f8isxA94AKWYNaaRaV5O
	93K90sWs6neqdzhKGeGN1A8nYYTPAAazR1/ws2yffUr/euaLYa+LSk6anCW+jAH1pjin
	y1q3vkQS8nrETUh6Z2R8GiIlkOaRXQ78vYZTHR32l6Li+46PBNh+sV07/5qfl/Yc+7ts
	yF7m3P+r/NZEn2rzRouQuAj0VhBuS1mq7bGwRHAqoh1nm5w56LyRVUwyScNHj0cMBCpG
	9PWex6iyfJB2HEQQ3PcH9wnCZ2qIOGiEBRAa99dYEpvX88stYLZX1dhPR/rKxJFH5w8Z
	I/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0hXBcGh8xwNW0ZH7EpC+6S290VDuAB5nfp55rrvQb0A=;
	b=fV1WJgAJfN7br2baLdgLyeK1vE7RmF0JYx+z+2eXJkaGYEvw5seituMi6CsGN2oa/X
	oKh+/0AIL5Uy5GXoWlAXHhZC8TPKtIihwTYvd7wchwex7f62z9ezBhqlxkaGcC+R+VJV
	1FRdonwQcGXnhlL1R5DekuKEKgUmDY8UmAdeuTF2fVIHqofmXjn0Iv5Z6xtiBwcDyQmk
	zzE9lpOK2JeRxBqxThkdgduzROGCgh4YCef5ijgOidEjgad6CWIxvM6g3sMpxGNNJXom
	vTDsnLVBZwH6Y4/X6KBnZzRN6bBO946k86inobXr3Tc7iRFjmxL2cODrJ+TtgxJ5PWIT
	WL5w==
X-Gm-Message-State: APt69E3ZTj0p7CD3sJz7kurBvFRCAecmS3FS5UHczaMOeVwwdSkP03iZ
	6VIxXR9Y3WM044VhC6kihpJpSxuKoXxQZQYdv80=
X-Google-Smtp-Source: ADUXVKJ4tdfyf+eVipfK1oFwwrR0KnA7zdTA7XTHWeC4P54Xu75EB4QZQGpPBNIpjwnV2saryeDQdFrBsjNhqyNx+vA=
X-Received: by 2002:a1c:988d:: with SMTP id
	a135-v6mr5865449wme.79.1529220879312; 
	Sun, 17 Jun 2018 00:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180613063512.1755-1-raj.khem@gmail.com>
	<20180613063512.1755-4-raj.khem@gmail.com>
In-Reply-To: <20180613063512.1755-4-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Jun 2018 09:34:32 +0200
Message-ID: <CA+chaQc5cV4xR28z-ORZf2v7fPXMa2eTd6=q8U9BPJkj8jOw2w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 4/5] cpprest: Fix build with gcc-8
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
X-List-Received-Date: Sun, 17 Jun 2018 07:34:39 -0000
Content-Type: text/plain; charset="UTF-8"

I think you're missing '=' in -Wno-format-truncation (it's shown in the
error message, so I was always adding it with '=' as well, but it seems
that both work).

cpprest/2.10.2-r0/git/Release/src/utilities/asyncrt_utils.cpp:702:42:
error: '%s' directive output may be truncated writing up to 8 bytes into a
region of size between 1 and 65 [-Werror=format-truncation=]
         snprintf(output, sizeof(output), "%s%sZ", datetime_str, buf);
                                          ^~~~~~~                ~~~
cpprest/2.10.2-r0/git/Release/src/utilities/asyncrt_utils.cpp:702:17: note:
'snprintf' output between 2 and 74 bytes into a destination of size 65
         snprintf(output, sizeof(output), "%s%sZ", datetime_str, buf);
         ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Also can you please drop one of these? The one in meta-networking is still
failing

./meta-oe/recipes-support/cpprest
./meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
./meta-oe/recipes-support/cpprest/cpprest-2.10.2
./meta-networking/recipes-support/cpprest
./meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb
./meta-networking/recipes-support/cpprest/cpprest-2.10.2

Added in:
meta-oe:
commit 9eb8b9a2c416da018c4a8acb416ef38797436f50
Author:     Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
AuthorDate: Thu Apr 19 19:12:07 2018 +0200
Commit:     Armin Kuster <akuster808@gmail.com>
CommitDate: Tue May 1 18:17:02 2018 -0700

    cpprest: add new recipe based on Debian packaging

    Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
    Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com
>
    Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
    Signed-off-by: Armin Kuster <akuster808@gmail.com>

meta-networking:
commit 12e8c3ea698905e2ed0edd9b7f351a497a1bd68d
Author:     Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
AuthorDate: Sun Apr 29 20:02:06 2018 +0200
Commit:     Armin Kuster <akuster808@gmail.com>
CommitDate: Thu May 17 08:32:26 2018 -0700

    cpprest: add new recipe based on Debian packaging

    The patches were imported from the Debian repository
    (https://salsa.debian.org/debian/casablanca) as of commit id
5b58637016a569a5d54714bd151a800028f77532

    Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
    Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com
>
    Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
    Signed-off-by: Armin Kuster <akuster808@gmail.com>


On Wed, Jun 13, 2018 at 9:01 AM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-disable-more-Werror-warnings.patch   | 48 +++++++++++++++++++
>  .../recipes-support/cpprest/cpprest_2.10.2.bb |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
>
> diff --git
> a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
> b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
> new file mode 100644
> index 0000000000..febfd5bc96
> --- /dev/null
> +++
> b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
> @@ -0,0 +1,48 @@
> +From ee92f84a96a507b0a7a3c54929ce190ee28b4ecd Mon Sep 17 00:00:00 2001
> +From: Alexander Moriarty <amoriarty@fetchrobotics.com>
> +Date: Wed, 6 Jun 2018 10:38:43 -0700
> +Subject: [PATCH] disable more -Werror warnings
> +
> +gcc-8: -Wno-format-truncation
> +
> +clang-6: -Wdelete-non-virtual-dtor
> +clang-6: -Wunused-lambda-capture
> +
> +removed duplicated: -Wno-reorder
> +
> +This fixes #778
> +
> +Upstream-Status: Pending [
> https://github.com/Microsoft/cpprestsdk/pull/779]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Release/CMakeLists.txt | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
> +index 1267aff1..fb291ccd 100644
> +--- a/Release/CMakeLists.txt
> ++++ b/Release/CMakeLists.txt
> +@@ -166,12 +166,12 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-attributes
> -Wno-pointer-arith")
> +   elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
> +     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2
> -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs
> -Wpacked -Wredundant-decls)
> +-    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion
> -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts
> -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated
> -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage
> -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder
> -Wno-unused-local-typedefs)
> ++    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion
> -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts
> -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated
> -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage
> -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32
> -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor
> -Wno-unused-lambda-capture)
> +     set(WARNINGS ${WARNINGS} ${LINUX_SUPPRESSIONS})
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage
> -Wno-unneeded-internal-declaration")
> +   else()
> +     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2
> -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs
> -Wpacked -Wredundant-decls)
> +-    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion
> -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts
> -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated
> -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage
> -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder
> -Wno-unused-local-typedefs)
> ++    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion
> -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts
> -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated
> -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage
> -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32
> -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor
> -Wno-unused-lambda-capture)
> +     set(WARNINGS ${WARNINGS} ${OSX_SUPPRESSIONS})
> +
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++
> -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration")
> +@@ -184,7 +184,7 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
> + elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
> +   message("-- Setting gcc options")
> +
> +-  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual
> -Wconversion -Wformat=2 -Winit-self -Winvalid-pch
> -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked
> -Wredundant-decls -Wunreachable-code)
> ++  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual
> -Wconversion -Wformat=2 -Winit-self -Winvalid-pch
> -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked
> -Wredundant-decls -Wunreachable-code -Wno-format-truncation)
> +   set(LD_FLAGS "${LD_FLAGS} -Wl,-z,defs")
> +
> +   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11
> -fno-strict-aliasing")
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> index 1dbe093bee..fea5d4b2eb 100644
> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> @@ -9,6 +9,7 @@ SRC_URI = "git://
> github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
>             file://fix-cmake-install.patch \
>             file://0001-Fix-a-build-problem-on-Clang.patch;patchdir=.. \
>             file://0002-Define-virtual-destructor.patch;patchdir=.. \
> +           file://0001-disable-more-Werror-warnings.patch;patchdir=.. \
>             "
>
>  # tag 2.10.2
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

