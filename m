Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7E69E719D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:18:15 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id 84so26497774ybe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 03:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E2evcQ7Lwwec1bz1HoO/aU4ILXdW7HkDNyWxm12Qda8=;
	b=ga0r6dxQjTfyW9XCP7/CQpm4A+NOTMCxj+NDTkgWffa06SRWqZrByLWqPXMWxzm+zn
	0eQLtuUhU/F+Cl5RekdUAWdCOa3FpA/waIIHdvTJJH4TdJc9hvRpZhQkMIKEkXvlHdYT
	BK4uPd8L8FrXezpvVWY1D0LTl7cBDHxgSoF8ky0+ipnhxk4vBCnsxRfzuFozPgOq959N
	ZqsUCu81vCgcg6JSN6m01ZyDY4X+aCFRWzF5tXFkHjF+ps6oDeq6IfjHLLVN4+J3Bjmv
	orFDv97OqP70DVPuyS+nSOCSFs8+l1E6lntyHLWCkuNAqvoRvo+4wPXJvvhFU8H0IVL1
	LSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E2evcQ7Lwwec1bz1HoO/aU4ILXdW7HkDNyWxm12Qda8=;
	b=tBKk8Ql7qkjQ9RfQYklRNGesxw2XsfGDz4r2RrdLPWMS4jglIOo6Uy7PM3UJBVXzYo
	LlOdwytUUfL1IgosnUBnQmU7Y7h+UFAsMdknFlYleHZJ/So4//PIYF2zB3kM3ilpdj3C
	2Rxuy0nCw4m/Pw2lqZdhhv6rmlYQgtyqcEHbaJBLbAJpb8GiwkqSB0l0kS2dIMs4malL
	qpYZNDTKiTqF/5FnDEUnI3DtlWT3kP7QphwuB3tRzbUht5OCt1z5zvquwIInJclxB1wX
	9M4ly8Rv3dHdkEfB6YN2RUn/FLCFLEGJ9ZVZETJtDS33YdZPYGG5vlQ+frpSxbMRZbJb
	3GKQ==
X-Gm-Message-State: AIVw112iHZaDXn9IiWu8WYAzyzEdFSVpsMF+q82mRGO8XZk1263fHtCD
	62SmP29mxNesis48EAUjytsrQzo+6Q==
X-Received: by 10.37.195.196 with SMTP id t187mr13696998ybf.64.1499681896479; 
	Mon, 10 Jul 2017 03:18:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Mon, 10 Jul 2017 03:18:15 -0700 (PDT)
In-Reply-To: <20170708131744.33927-1-raj.khem@gmail.com>
References: <20170708131744.33927-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 10 Jul 2017 12:18:15 +0200
Message-ID: <CA+chaQfBTpaih-w2eUoZJsnOyUc6FoM8EAJYYXxue+bSLAM93g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/5] libdbus-c++: Fix build with gcc7 and unblacklist
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
X-List-Received-Date: Mon, 10 Jul 2017 10:18:15 -0000
Content-Type: text/plain; charset="UTF-8"

Unfortunately still fails:
http://errors.yoctoproject.org/Errors/Details/147042/

On Sat, Jul 8, 2017 at 3:17 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-pipe.c-Use-a-string-instead-of-char.patch | 27
> ++++++++++++++++++++++
>  meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 20 ++++++++--------
>  2 files changed, 36 insertions(+), 11 deletions(-)
>  create mode 100644 meta-oe/recipes-core/dbus/
> libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
>
> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-
> Use-a-string-instead-of-char.patch b/meta-oe/recipes-core/dbus/
> libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
> new file mode 100644
> index 000000000..6883f9a0b
> --- /dev/null
> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-
> Use-a-string-instead-of-char.patch
> @@ -0,0 +1,27 @@
> +From 6bcb58bd69c38b9200e8ec6c382247167571189d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 1 Jul 2017 16:44:15 -0700
> +Subject: [PATCH] pipe.c: Use a string instead of char
> +
> +Fixes
> +error: invalid conversion from 'char' to 'const void*' [-fpermissive]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/pipe.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/pipe.cpp b/src/pipe.cpp
> +index 45c2ba6..1303c2d 100644
> +--- a/src/pipe.cpp
> ++++ b/src/pipe.cpp
> +@@ -83,5 +83,5 @@ ssize_t Pipe::read(void *buffer, unsigned int &nbytes)
> + void Pipe::signal()
> + {
> +   // TODO: ignoring return of read/write generates warning; maybe
> relevant for eventloop work...
> +-  ::write(_fd_write, '\0', 1);
> ++  ::write(_fd_write, "", 1);
> + }
> +--
> +2.13.2
> +
> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
> b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
> index 4412716a6..4cc133301 100644
> --- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
> +++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
> @@ -6,15 +6,15 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  DEPENDS = "dbus expat glib-2.0 libpcre"
>
> -SRC_URI = "\
> -    ${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.tar.gz
> \
> -    file://fix-missing-unistd.h-include.patch \
> -    file://remove-CXX_FOR_BUILD-stuff.patch \
> -    file://0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
> \
> -    file://0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
> \
> -    file://0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
> \
> -    file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
> -"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.tar.gz
> \
> +           file://fix-missing-unistd.h-include.patch \
> +           file://remove-CXX_FOR_BUILD-stuff.patch \
> +           file://0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
> \
> +           file://0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
> \
> +           file://0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
> \
> +           file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
> +           file://0001-pipe.c-Use-a-string-instead-of-char.patch \
> +           "
>  SRC_URI[md5sum] = "e752116f523fa88ef041e63d3dee4de2"
>  SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695
> 543ee3fdf3d75cdc8225fd371385af4e61"
>
> @@ -27,5 +27,3 @@ PACKAGE_BEFORE_PN = "${PN}-tools"
>  FILES_${PN}-tools = "${bindir}"
>
>  BBCLASSEXTEND = "native"
> -
> -PNBLACKLIST[libdbus-c++] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe will
> be removed on 2017-09-01 unless the issue is fixed"
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

