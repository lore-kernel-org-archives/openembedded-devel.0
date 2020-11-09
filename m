Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.14876.1604942048545696192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=umrsoSnB;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id t11so9538127edj.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9hFqjvOe9N6B/9CDP6rMpu0TZi+j1x551ofH8BPuuRs=;
        b=umrsoSnBT1qCtVEqm92da+MAtcPzFQidqYOHFoc3NU3M+l0DRn2m8FUft+J1Po3kca
         SiReMK9Kt8xvQS8hwIgj40uJt+7/Wx996lvjA3MbNT/gFmifqTVgp1qws2p8eaTKJlT1
         Em2FAdhmN5k+wBE34qT8UwlUBbraTl3IG7aGn5Lh6sAV8s1TX1VjRseMWaqvJGsGZ//I
         bZWtCEXBnYvGIrSXSptMeNODUWEzoEBsmxt+tYy7HFmvOfab1I/x5T6zg3B3UW23pZWJ
         o46kXfZYGpBo74SoV7mB3hRTdifoDS9T1p7anueSs6cjKRX61uQwTLfzn8zusuy2nkn3
         qxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9hFqjvOe9N6B/9CDP6rMpu0TZi+j1x551ofH8BPuuRs=;
        b=V+Fj7gvh4u2PtejkQyfqCKVYhT3sW4LyAMgKuGuDINvss54BoA/gvUfmDvG+RJi0CI
         VyL7bYz0zFfxcqWKndWRMQpbpBZpjSY6aUfn2AyJOMvVG9MhF/OptAU8LlMccYrrBlo4
         nhhf0x3DVexWKWY3u6cFr4O1OVgmbqwrBtN6/JXWPdE3Lg3NQUqGxxgwBgMx0daopDem
         cRG8OHHcLKkO7PVf6kH5Z/YpExn58oCkbRjTDviW+839H6oqUPYPAsv4oem/CwDM3jcn
         VTpD363M8J7Onp8WUjEnY9txinSGkHFPri4n7Bh7CTbffZyiZIgAAxBy9wvYIRIaKm44
         zs7A==
X-Gm-Message-State: AOAM530qh32PtXnw+m5mVkiWrmqGblJ/KmilS3l6SZ+GfaElYLeuPz1M
	sSm9WZ0E8G4eGa5ohwP7EKu2a0Z+7GD26ebogRQ=
X-Google-Smtp-Source: ABdhPJzNLe0QNi02LLvj6E3d2Gr4kVbqGiGQyxJ8fAbr1BMAATaBoaUKmGWlnH2UbcgxGUkgVwx27T9zMnM+JvIfmts=
X-Received: by 2002:aa7:d48d:: with SMTP id b13mr15931020edr.264.1604942046904;
 Mon, 09 Nov 2020 09:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20201109165344.14981-1-greg@gpanders.com>
In-Reply-To: <20201109165344.14981-1-greg@gpanders.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 9 Nov 2020 18:13:55 +0100
Message-ID: <CA+chaQeHEc_MQTC7aHuDiTgs+v4T6vEzAuypDg72A3u6kR9M+A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Add suitesparse
To: Gregory Anders <greg@gpanders.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000097478805b3afb0c4"

--00000000000097478805b3afb0c4
Content-Type: text/plain; charset="UTF-8"

I don't have strong opinion, but when I was adding suitesparse to meta-ros
a while ago, it was a bit easier to build each library separately as in:
https://github.com/ros/meta-ros/commit/1242e0ce3c84a05363fc11244a8a6ac0e08de4e9
not sure if that changed between 5.4 and 5.8. It might be still useful to
package them separately.

If all works fine now with 5.8 I will be happy to drop it from meta-ros
once this is merged in meta-oe.

On Mon, Nov 9, 2020 at 5:54 PM Gregory Anders <greg@gpanders.com> wrote:

> ---
> SuiteSparse is a sparse matrix processing library. It is used by e.g.
> python3-cvxopt (which I am also submitting a patch for) to do things
> like convex optimization.
>
> This is my first submission to meta-openembedded, so please give me
> feedback if there is anything I can improve.
>
>  ...XXFLAGS-from-environment-in-Mongoose.patch | 43 +++++++++++
>  ...serve-links-when-installing-libmetis.patch | 22 ++++++
>  ...-Add-version-information-to-libmetis.patch | 49 ++++++++++++
>  .../suitesparse/suitesparse_5.8.1.bb          | 77 +++++++++++++++++++
>  4 files changed, 191 insertions(+)
>  create mode 100644
> meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
>  create mode 100644
> meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
>  create mode 100644
> meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
>  create mode 100644 meta-oe/recipes-devtools/suitesparse/
> suitesparse_5.8.1.bb
>
> diff --git
> a/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
> b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
> new file mode 100644
> index 000000000..c955b5fa7
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
> @@ -0,0 +1,43 @@
> +From 83628b471a1a79dae50bb158fca9448b668dd3a6 Mon Sep 17 00:00:00 2001
> +From: Gregory Anders <greg@gpanders.com>
> +Date: Wed, 21 Oct 2020 10:43:16 -0600
> +Subject: [PATCH] Preserve CXXFLAGS from environment in Mongoose
> +
> +This allows CXXFLAGS set in the environment to also be used in the CMake
> +build process, instead of overwriting them. This is useful in a cross
> +compile context where the CXXFLAGS variable might contain necessary
> +flags for cross compiling.
> +---
> + Mongoose/CMakeLists.txt | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Mongoose/CMakeLists.txt b/Mongoose/CMakeLists.txt
> +index 7e134ab..91a7f70 100644
> +--- a/Mongoose/CMakeLists.txt
> ++++ b/Mongoose/CMakeLists.txt
> +@@ -321,14 +321,14 @@ add_test(Unit_Test_EdgeSep
> ./tests/mongoose_unit_test_edgesep)
> + message(STATUS "CMAKE_CXX_COMPILER: " ${BoldBlue}
> ${CMAKE_CXX_COMPILER_ID} ${ColourReset})
> + if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR
> "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
> +     # using Clang
> +-    SET(CMAKE_CXX_FLAGS "-O3 -fwrapv")
> ++    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fwrapv")
> +     # Debug flags for Clang
> +     SET(CMAKE_CXX_FLAGS_DEBUG "--coverage -g -fwrapv")
> +     SET(CMAKE_C_FLAGS_DEBUG "--coverage -g")
> +     SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "--coverage -g")
> + elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
> +     # using GCC
> +-    SET(CMAKE_CXX_FLAGS "-O3 -fwrapv")
> ++    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fwrapv")
> +     # Debug flags for GCC
> +     if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.6")
> +         set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
> +@@ -339,7 +339,7 @@ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
> +     SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "-fprofile-arcs -ftest-coverage")
> + elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
> +     # using Intel C++
> +-    SET(CMAKE_CXX_FLAGS "-O3 -no-prec-div -xHOST -ipo -fwrapv")
> ++    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -no-prec-div -xHOST -ipo
> -fwrapv")
> +     # Debug flags for Intel
> +     SET(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -Wall -fwrapv")
> +     SET(CMAKE_C_FLAGS_DEBUG "-g -O0 -Wall")
> diff --git
> a/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
> b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
> new file mode 100644
> index 000000000..190eaf164
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
> @@ -0,0 +1,22 @@
> +From 31175fb408a4f5e85e39a9aabd4a29f9d9c1fe25 Mon Sep 17 00:00:00 2001
> +From: Gregory Anders <greg@gpanders.com>
> +Date: Wed, 21 Oct 2020 15:26:52 -0600
> +Subject: [PATCH] Preserve links when installing libmetis
> +
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 7631955..57fd022 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -76,7 +76,7 @@ ifeq (,$(MY_METIS_LIB))
> +       @mkdir -p $(INSTALL_LIB)
> +       @mkdir -p $(INSTALL_INCLUDE)
> +       @mkdir -p $(INSTALL_DOC)
> +-      - $(CP) lib/libmetis.* $(INSTALL_LIB)
> ++      - $(CP) -d lib/libmetis.* $(INSTALL_LIB)
> +       - $(CP) metis-5.1.0/manual/manual.pdf
> $(INSTALL_DOC)/METIS_manual.pdf
> +       - $(CP) metis-5.1.0/README.txt $(INSTALL_DOC)/METIS_README.txt
> +         # the following is needed only on the Mac, so *.dylib is
> hardcoded:
> diff --git
> a/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
> b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
> new file mode 100644
> index 000000000..dee6039a8
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
> @@ -0,0 +1,49 @@
> +From 11ab355fdda93b762fcc07ac3f7c6ab1be0a5f5a Mon Sep 17 00:00:00 2001
> +From: Gregory Anders <greg@gpanders.com>
> +Date: Wed, 21 Oct 2020 15:27:07 -0600
> +Subject: [PATCH] Add version information to libmetis
> +
> +---
> + metis-5.1.0/Makefile                | 8 ++++----
> + metis-5.1.0/libmetis/CMakeLists.txt | 1 +
> + 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/metis-5.1.0/Makefile b/metis-5.1.0/Makefile
> +index 9cc03b9..c445d85 100644
> +--- a/metis-5.1.0/Makefile
> ++++ b/metis-5.1.0/Makefile
> +@@ -18,8 +18,11 @@ systype = $(shell uname -s)
> +
> + BUILDDIR = build/$(systype)-$(cputype)
> +
> ++VERNUM=5.1.0
> ++PKGNAME=metis-$(VERNUM)
> ++
> + # Process configuration options.
> +-CONFIG_FLAGS =
> ++CONFIG_FLAGS = -DMETIS_VERSION=$(VERNUM)
> + ifeq ($(gklib_path), not-set)
> +     gklib_path = GKlib
> + endif
> +@@ -52,9 +55,6 @@ ifneq ($(cc), not-set)
> +     CONFIG_FLAGS += -DCMAKE_C_COMPILER=$(cc)
> + endif
> +
> +-VERNUM=5.1.0
> +-PKGNAME=metis-$(VERNUM)
> +-
> + JOBS ?= 1
> +
> + define run-config
> +diff --git a/metis-5.1.0/libmetis/CMakeLists.txt
> b/metis-5.1.0/libmetis/CMakeLists.txt
> +index 120e94d..11bde87 100644
> +--- a/metis-5.1.0/libmetis/CMakeLists.txt
> ++++ b/metis-5.1.0/libmetis/CMakeLists.txt
> +@@ -4,6 +4,7 @@ include_directories(.)
> + file(GLOB metis_sources *.c)
> + # Build libmetis.
> + add_library(metis ${METIS_LIBRARY_TYPE} ${GKlib_sources}
> ${metis_sources})
> ++set_target_properties(metis PROPERTIES VERSION ${METIS_VERSION})
> + if(UNIX)
> +   target_link_libraries(metis m)
> + endif()
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
> b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
> new file mode 100644
> index 000000000..af8b1f856
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
> @@ -0,0 +1,77 @@
> +LICENSE = "GPLv2 & GPLv3 & BSD-3-Clause & LGPL-2.0 & Apache-2.0"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=f9f2b9d61cb769a67c4cd079e1166de7"
> +SRC_URI = "git://
> github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
> +
>  file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
> +           file://0002-Preserve-links-when-installing-libmetis.patch \
> +           file://0003-Add-version-information-to-libmetis.patch \
> +           "
> +
> +SRC_URI[md5sum] = "c414679bbc9432a3def01b31ad921140"
> +SRC_URI[sha256sum] =
> "06726e471fbaa55f792578f9b4ab282ea9d008cf39ddcc3b42b73400acddef40"
> +
> +SRCREV = "v${PV}"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "cmake-native lapack gmp mpfr chrpath-native"
> +
> +PROVIDES = "mongoose graphblas"
> +RPROVIDES_${PN} = "mongoose graphblas"
> +
> +# The values of $CC, $CXX, and $LD that Bitbake uses have spaces in them
> which
> +# causes problems when the SuiteSparse Makefiles try to pass these values
> on
> +# the command line. To get around this problem, set these variables to
> only the
> +# program name and prepend the rest of the value onto the corresponding
> FLAGS
> +# variable.
> +CFLAGS_prepend := "${@" ".join(d.getVar('CC', True).split()[1:])} "
> +export CC := "${@d.getVar('CC', True).split()[0]}"
> +
> +CXXFLAGS_prepend := "${@" ".join(d.getVar('CXX', True).split()[1:])} "
> +export CXX := "${@d.getVar('CXX', True).split()[0]}"
> +
> +LDFLAGS_prepend := "${@" ".join(d.getVar('LD', True).split()[1:])} "
> +export LD := "${@d.getVar('LD', True).split()[0]}"
> +
> +export CMAKE_OPTIONS = " \
> +    -DCMAKE_INSTALL_PREFIX=${D}${prefix} \
> +    -DCMAKE_INSTALL_LIBDIR=${baselib} \
> +"
> +
> +do_compile () {
> +       oe_runmake library
> +}
> +
> +do_install () {
> +       oe_runmake prefix=${D}${prefix} INSTALL=${D}${prefix} install
> +
> +        # Remove runtime paths from shared libraries
> +        for file in ${D}${libdir}/*.so.*; do
> +            if [ ! -L "$file" ]; then
> +                chrpath -d "$file"
> +            fi
> +        done
> +}
> +
> +FILES_${PN} += " \
> +    ${libdir}/libmongoose.so.* \
> +    ${libdir}/libgraphblas.so.* \
> +    ${libdir}/libmetis.so.* \
> +    ${libdir}/libsuitesparseconfig.so.* \
> +    ${libdir}/libamd.so.* \
> +    ${libdir}/libbtf.so.* \
> +    ${libdir}/libcamd.so.* \
> +    ${libdir}/libccolamd.so.* \
> +    ${libdir}/libcolamd.so.* \
> +    ${libdir}/libcholmod.so.* \
> +    ${libdir}/libcxsparse.so.* \
> +    ${libdir}/libldl.so.* \
> +    ${libdir}/libklu.so.* \
> +    ${libdir}/libumfpack.so.* \
> +    ${libdir}/librbio.so.* \
> +    ${libdir}/libspqr.so.* \
> +    ${libdir}/libsliplu.so.* \
> +    ${bindir}/mongoose \
> +"
> +
> +FILES_${PN}-staticdev += "${libdir}/libmongoose.a"
> +FILES_${PN}-dev += "${includedir} ${libdir}/*.so"
> --
> 2.29.2
>
>
> 
>
>

--00000000000097478805b3afb0c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t have strong opinion, but when I was adding sui=
tesparse to meta-ros a while ago, it was a bit easier to build each library=
 separately as in:<div><a href=3D"https://github.com/ros/meta-ros/commit/12=
42e0ce3c84a05363fc11244a8a6ac0e08de4e9">https://github.com/ros/meta-ros/com=
mit/1242e0ce3c84a05363fc11244a8a6ac0e08de4e9</a><br></div><div>not sure if =
that changed between 5.4 and 5.8. It might be still useful to package them =
separately.</div><div><br></div><div>If all works fine now with 5.8 I will =
be happy to drop it from meta-ros once this is merged in meta-oe.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Nov 9, 2020 at 5:54 PM Gregory Anders &lt;<a href=3D"mailto:greg@gpande=
rs.com">greg@gpanders.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">---<br>
SuiteSparse is a sparse matrix processing library. It is used by e.g.=C2=
=A0 <br>
python3-cvxopt (which I am also submitting a patch for) to do things <br>
like convex optimization.<br>
<br>
This is my first submission to meta-openembedded, so please give me <br>
feedback if there is anything I can improve.<br>
<br>
=C2=A0...XXFLAGS-from-environment-in-Mongoose.patch | 43 +++++++++++<br>
=C2=A0...serve-links-when-installing-libmetis.patch | 22 ++++++<br>
=C2=A0...-Add-version-information-to-libmetis.patch | 49 ++++++++++++<br>
=C2=A0.../suitesparse/<a href=3D"http://suitesparse_5.8.1.bb" rel=3D"noref=
errer" target=3D"_blank">suitesparse_5.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 77 +++++++++++++++++++<br>
=C2=A04 files changed, 191 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/=
0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/=
0002-Preserve-links-when-installing-libmetis.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/=
0003-Add-version-information-to-libmetis.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/suitesparse/<a href=3D"h=
ttp://suitesparse_5.8.1.bb" rel=3D"noreferrer" target=3D"_blank">suitespars=
e_5.8.1.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserv=
e-CXXFLAGS-from-environment-in-Mongoose.patch b/meta-oe/recipes-devtools/su=
itesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.p=
atch<br>
new file mode 100644<br>
index 000000000..c955b5fa7<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFL=
AGS-from-environment-in-Mongoose.patch<br>
@@ -0,0 +1,43 @@<br>
+From 83628b471a1a79dae50bb158fca9448b668dd3a6 Mon Sep 17 00:00:00 2001<br=
>
+From: Gregory Anders &lt;<a href=3D"mailto:greg@gpanders.com" target=3D"_=
blank">greg@gpanders.com</a>&gt;<br>
+Date: Wed, 21 Oct 2020 10:43:16 -0600<br>
+Subject: [PATCH] Preserve CXXFLAGS from environment in Mongoose<br>
+<br>
+This allows CXXFLAGS set in the environment to also be used in the CMake<=
br>
+build process, instead of overwriting them. This is useful in a cross<br>
+compile context where the CXXFLAGS variable might contain necessary<br>
+flags for cross compiling.<br>
+---<br>
+ Mongoose/CMakeLists.txt | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/Mongoose/CMakeLists.txt b/Mongoose/CMakeLists.txt<br>
+index 7e134ab..91a7f70 100644<br>
+--- a/Mongoose/CMakeLists.txt<br>
++++ b/Mongoose/CMakeLists.txt<br>
+@@ -321,14 +321,14 @@ add_test(Unit_Test_EdgeSep ./tests/mongoose_unit_te=
st_edgesep)<br>
+ message(STATUS &quot;CMAKE_CXX_COMPILER: &quot; ${BoldBlue} ${CMAKE_CXX_=
COMPILER_ID} ${ColourReset})<br>
+ if (&quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL &quot;Clang&quot; OR &=
quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL &quot;AppleClang&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0# using Clang<br>
+-=C2=A0 =C2=A0 SET(CMAKE_CXX_FLAGS &quot;-O3 -fwrapv&quot;)<br>
++=C2=A0 =C2=A0 SET(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -O3 -fwrapv&q=
uot;)<br>
+=C2=A0 =C2=A0 =C2=A0# Debug flags for Clang<br>
+=C2=A0 =C2=A0 =C2=A0SET(CMAKE_CXX_FLAGS_DEBUG &quot;--coverage -g -fwrapv=
&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0SET(CMAKE_C_FLAGS_DEBUG &quot;--coverage -g&quot;)<br=
>
+=C2=A0 =C2=A0 =C2=A0SET(CMAKE_EXE_LINKER_FLAGS_DEBUG &quot;--coverage -g&=
quot;)<br>
+ elseif (&quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL &quot;GNU&quot;)<b=
r>
+=C2=A0 =C2=A0 =C2=A0# using GCC<br>
+-=C2=A0 =C2=A0 SET(CMAKE_CXX_FLAGS &quot;-O3 -fwrapv&quot;)<br>
++=C2=A0 =C2=A0 SET(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -O3 -fwrapv&q=
uot;)<br>
+=C2=A0 =C2=A0 =C2=A0# Debug flags for GCC<br>
+=C2=A0 =C2=A0 =C2=A0if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS &quot;4.6=
&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_F=
LAGS} -std=3Dc++0x&quot;)<br>
+@@ -339,7 +339,7 @@ elseif (&quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL=
 &quot;GNU&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0SET(CMAKE_EXE_LINKER_FLAGS_DEBUG &quot;-fprofile-arcs=
 -ftest-coverage&quot;)<br>
+ elseif (&quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL &quot;Intel&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0# using Intel C++<br>
+-=C2=A0 =C2=A0 SET(CMAKE_CXX_FLAGS &quot;-O3 -no-prec-div -xHOST -ipo -fw=
rapv&quot;)<br>
++=C2=A0 =C2=A0 SET(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -O3 -no-prec-=
div -xHOST -ipo -fwrapv&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0# Debug flags for Intel<br>
+=C2=A0 =C2=A0 =C2=A0SET(CMAKE_CXX_FLAGS_DEBUG &quot;-g -O0 -Wall -fwrapv&=
quot;)<br>
+=C2=A0 =C2=A0 =C2=A0SET(CMAKE_C_FLAGS_DEBUG &quot;-g -O0 -Wall&quot;)<br>
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserv=
e-links-when-installing-libmetis.patch b/meta-oe/recipes-devtools/suitespar=
se/suitesparse/0002-Preserve-links-when-installing-libmetis.patch<br>
new file mode 100644<br>
index 000000000..190eaf164<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links=
-when-installing-libmetis.patch<br>
@@ -0,0 +1,22 @@<br>
+From 31175fb408a4f5e85e39a9aabd4a29f9d9c1fe25 Mon Sep 17 00:00:00 2001<br=
>
+From: Gregory Anders &lt;<a href=3D"mailto:greg@gpanders.com" target=3D"_=
blank">greg@gpanders.com</a>&gt;<br>
+Date: Wed, 21 Oct 2020 15:26:52 -0600<br>
+Subject: [PATCH] Preserve links when installing libmetis<br>
+<br>
+---<br>
+ Makefile | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 7631955..57fd022 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -76,7 +76,7 @@ ifeq (,$(MY_METIS_LIB))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(INSTALL_LIB)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(INSTALL_INCLUDE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(INSTALL_DOC)<br>
+-=C2=A0 =C2=A0 =C2=A0 - $(CP) lib/libmetis.* $(INSTALL_LIB)<br>
++=C2=A0 =C2=A0 =C2=A0 - $(CP) -d lib/libmetis.* $(INSTALL_LIB)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0- $(CP) metis-5.1.0/manual/manual.pdf $(INSTAL=
L_DOC)/METIS_manual.pdf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0- $(CP) metis-5.1.0/README.txt $(INSTALL_DOC)/=
METIS_README.txt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the following is needed only on the M=
ac, so *.dylib is hardcoded:<br>
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-ver=
sion-information-to-libmetis.patch b/meta-oe/recipes-devtools/suitesparse/s=
uitesparse/0003-Add-version-information-to-libmetis.patch<br>
new file mode 100644<br>
index 000000000..dee6039a8<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-in=
formation-to-libmetis.patch<br>
@@ -0,0 +1,49 @@<br>
+From 11ab355fdda93b762fcc07ac3f7c6ab1be0a5f5a Mon Sep 17 00:00:00 2001<br=
>
+From: Gregory Anders &lt;<a href=3D"mailto:greg@gpanders.com" target=3D"_=
blank">greg@gpanders.com</a>&gt;<br>
+Date: Wed, 21 Oct 2020 15:27:07 -0600<br>
+Subject: [PATCH] Add version information to libmetis<br>
+<br>
+---<br>
+ metis-5.1.0/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 8 ++++----<br>
+ metis-5.1.0/libmetis/CMakeLists.txt | 1 +<br>
+ 2 files changed, 5 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/metis-5.1.0/Makefile b/metis-5.1.0/Makefile<br>
+index 9cc03b9..c445d85 100644<br>
+--- a/metis-5.1.0/Makefile<br>
++++ b/metis-5.1.0/Makefile<br>
+@@ -18,8 +18,11 @@ systype =3D $(shell uname -s)<br>
+ <br>
+ BUILDDIR =3D build/$(systype)-$(cputype)<br>
+ <br>
++VERNUM=3D5.1.0<br>
++PKGNAME=3Dmetis-$(VERNUM)<br>
++<br>
+ # Process configuration options.<br>
+-CONFIG_FLAGS =3D <br>
++CONFIG_FLAGS =3D -DMETIS_VERSION=3D$(VERNUM)<br>
+ ifeq ($(gklib_path), not-set)<br>
+=C2=A0 =C2=A0 =C2=A0gklib_path =3D GKlib<br>
+ endif<br>
+@@ -52,9 +55,6 @@ ifneq ($(cc), not-set)<br>
+=C2=A0 =C2=A0 =C2=A0CONFIG_FLAGS +=3D -DCMAKE_C_COMPILER=3D$(cc)<br>
+ endif<br>
+ <br>
+-VERNUM=3D5.1.0<br>
+-PKGNAME=3Dmetis-$(VERNUM)<br>
+-<br>
+ JOBS ?=3D 1<br>
+ <br>
+ define run-config<br>
+diff --git a/metis-5.1.0/libmetis/CMakeLists.txt b/metis-5.1.0/libmetis/C=
MakeLists.txt<br>
+index 120e94d..11bde87 100644<br>
+--- a/metis-5.1.0/libmetis/CMakeLists.txt<br>
++++ b/metis-5.1.0/libmetis/CMakeLists.txt<br>
+@@ -4,6 +4,7 @@ include_directories(.)<br>
+ file(GLOB metis_sources *.c)<br>
+ # Build libmetis.<br>
+ add_library(metis ${METIS_LIBRARY_TYPE} ${GKlib_sources} ${metis_sources=
})<br>
++set_target_properties(metis PROPERTIES VERSION ${METIS_VERSION})<br>
+ if(UNIX)<br>
+=C2=A0 =C2=A0target_link_libraries(metis m)<br>
+ endif()<br>
diff --git a/meta-oe/recipes-devtools/suitesparse/<a href=3D"http://suites=
parse_5.8.1.bb" rel=3D"noreferrer" target=3D"_blank">suitesparse_5.8.1.bb</=
a> b/meta-oe/recipes-devtools/suitesparse/<a href=3D"http://suitesparse_5.8=
.1.bb" rel=3D"noreferrer" target=3D"_blank">suitesparse_5.8.1.bb</a><br>
new file mode 100644<br>
index 000000000..af8b1f856<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/suitesparse/<a href=3D"http://suitesparse_5=
.8.1.bb" rel=3D"noreferrer" target=3D"_blank">suitesparse_5.8.1.bb</a><br>
@@ -0,0 +1,77 @@<br>
+LICENSE =3D &quot;GPLv2 &amp; GPLv3 &amp; BSD-3-Clause &amp; LGPL-2.0 &am=
p; Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Df9f2b9d61cb769a67c4cd=
079e1166de7&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/DrTimothyAldenDavis/=
SuiteSparse;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/DrTimothyAldenDavis/SuiteSparse;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Preserve-CXXFLAGS-fr=
om-environment-in-Mongoose.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Preserve-links-when-=
installing-libmetis.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Add-version-informat=
ion-to-libmetis.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;c414679bbc9432a3def01b31ad921140&quot;<br>
+SRC_URI[sha256sum] =3D &quot;06726e471fbaa55f792578f9b4ab282ea9d008cf39dd=
cc3b42b73400acddef40&quot;<br>
+<br>
+SRCREV =3D &quot;v${PV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+DEPENDS =3D &quot;cmake-native lapack gmp mpfr chrpath-native&quot;<br>
+<br>
+PROVIDES =3D &quot;mongoose graphblas&quot;<br>
+RPROVIDES_${PN} =3D &quot;mongoose graphblas&quot;<br>
+<br>
+# The values of $CC, $CXX, and $LD that Bitbake uses have spaces in them =
which<br>
+# causes problems when the SuiteSparse Makefiles try to pass these values=
 on<br>
+# the command line. To get around this problem, set these variables to on=
ly the<br>
+# program name and prepend the rest of the value onto the corresponding F=
LAGS<br>
+# variable.<br>
+CFLAGS_prepend :=3D &quot;${@&quot; &quot;.join(d.getVar(&#39;CC&#39;, Tr=
ue).split()[1:])} &quot;<br>
+export CC :=3D &quot;${@d.getVar(&#39;CC&#39;, True).split()[0]}&quot;<br=
>
+<br>
+CXXFLAGS_prepend :=3D &quot;${@&quot; &quot;.join(d.getVar(&#39;CXX&#39;,=
 True).split()[1:])} &quot;<br>
+export CXX :=3D &quot;${@d.getVar(&#39;CXX&#39;, True).split()[0]}&quot;<=
br>
+<br>
+LDFLAGS_prepend :=3D &quot;${@&quot; &quot;.join(d.getVar(&#39;LD&#39;, T=
rue).split()[1:])} &quot;<br>
+export LD :=3D &quot;${@d.getVar(&#39;LD&#39;, True).split()[0]}&quot;<br=
>
+<br>
+export CMAKE_OPTIONS =3D &quot; \<br>
+=C2=A0 =C2=A0 -DCMAKE_INSTALL_PREFIX=3D${D}${prefix} \<br>
+=C2=A0 =C2=A0 -DCMAKE_INSTALL_LIBDIR=3D${baselib} \<br>
+&quot;<br>
+<br>
+do_compile () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake library<br>
+}<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake prefix=3D${D}${prefix} INSTALL=3D${=
D}${prefix} install<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove runtime paths from shared libraries<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in ${D}${libdir}/*.so.*; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -L &quot;$file&quot; ]; =
then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chrpath -d &quot;=
$file&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+}<br>
+<br>
+FILES_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${libdir}/libmongoose.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libgraphblas.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libmetis.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libsuitesparseconfig.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libamd.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libbtf.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libcamd.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libccolamd.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libcolamd.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libcholmod.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libcxsparse.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libldl.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libklu.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libumfpack.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/librbio.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libspqr.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/libsliplu.so.* \<br>
+=C2=A0 =C2=A0 ${bindir}/mongoose \<br>
+&quot;<br>
+<br>
+FILES_${PN}-staticdev +=3D &quot;${libdir}/libmongoose.a&quot;<br>
+FILES_${PN}-dev +=3D &quot;${includedir} ${libdir}/*.so&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000097478805b3afb0c4--
