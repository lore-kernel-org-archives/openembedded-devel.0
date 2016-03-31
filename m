Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 13ACF60746
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 18:37:00 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p65so236962160wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=nerluwP07b0JZ6JxIvuC53dCUsNKr7wUoX+fGzWfuOw=;
	b=fAwtSYfAZaEUW7ERiGJ5urF+rOrej+XOOIRz06Zudj8eEKStsh4Fw8Ayv5Gr745ZkX
	BDuyL9cBFuDk+yNMlPNIZKEQft60AYJ/RWshY8hWFLm28Vdvjir94acRjtJODcA9cuo5
	Cppw91gyDvowFOA3+TUv1QPCFsrclhAIK+VC/ffRG0tG7yeidEInZE8SzQ0DIBbcnwZ2
	xA9SQRjAGdifo1AjX2P0ILBfUtRZhOU2si6JW49EiYkosoKcp7BQOsobtnI16y1fLq4L
	CHKz9/61qmvT6Sevqb6DXcqwVcrE3filthwwC4eLfUAo48zcjLP6F2IbQJMGh9vGiAZh
	rxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=nerluwP07b0JZ6JxIvuC53dCUsNKr7wUoX+fGzWfuOw=;
	b=iYanKULWt7qFRFg0zhk3SxUgC7m3V7mFp7J83Wg0wiIR8AZUQUQkzqTc2gqLbVwI8j
	oYy+JS93RKDiyFFNo9ErSpRL7O3ScQt4knhbJxXvV0JhDGJr2DH5yjOsJTYxuI5wx8Th
	y7YpB43Bhdf80bStJk1BRzB49WUb8srTZJ12+KWPZeEvBn03o0JpkUKFjx2OnudqzPa9
	Hjtmbk+cdoLvSZ0BjWnLdQXsbJ400TySVpwHhQnPqPV+UXZvXgjfGEmSGoihTBkwlkwo
	f/mhVy/xJPyv3nkLXNR8khK75dEezbyxflWDG20+mIEJZ66SuJj/CUQS07+2l0tEcTxg
	xbmw==
X-Gm-Message-State: AD7BkJKZhrmsYaXvSaQ41gD1B8Alps1BWs/JIWkNboDlfMgGlDtcbdgrwxI8VRc2cfG4lbi1bl5h7c2ChqNbXQ==
MIME-Version: 1.0
X-Received: by 10.28.0.148 with SMTP id 142mr4409860wma.72.1459449421153; Thu,
	31 Mar 2016 11:37:01 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Thu, 31 Mar 2016 11:37:01 -0700 (PDT)
In-Reply-To: <1459444671-7865-1-git-send-email-raj.khem@gmail.com>
References: <1459444671-7865-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 31 Mar 2016 11:37:01 -0700
Message-ID: <CAJ86T=XzXcGyjhydMXwXCaDoY1Lz9v4bHRQJrr6vwgAGek4B-g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libtinyxml2: Add packageconfig support
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
X-List-Received-Date: Thu, 31 Mar 2016 18:37:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 31, 2016 at 10:17 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Some package enquire using pkgconfig
>
> Change-Id: I4b7ac35930caf25b8ca04c3f5b34a193d4ed4a3d
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libtinyxml2/libtinyxml2/libtinyxml2.pc         | 10 +++++++++
>  .../recipes-support/libtinyxml2/libtinyxml2_git.bb | 26 +++++++++++++---------
>  2 files changed, 26 insertions(+), 10 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc b/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
> new file mode 100644
> index 0000000..ef155a1
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: TinyXml2
> +Description: simple, small, C++ XML parser
> +Version: 2.2.0
> +Libs: -L${libdir} -ltinyxml2
> +Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
> index 6ca6f7c..e1760e4 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
> @@ -6,9 +6,13 @@ SECTION = "libs"
>
>  SRCREV = "d211bb13512cf4edb408e2c4badbcf4100ce0fd0"
>
> -PV = "2.2.0+git${SRCPV}"
> +XML2VER = "2.2.0"
>
> -SRC_URI = "git://github.com/leethomason/tinyxml2.git"
> +PV = "${XML2VER}+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/leethomason/tinyxml2.git \
> +           file://libtinyxml2.pc \
> +          "
>
>  S = "${WORKDIR}/git"
>
> @@ -17,21 +21,23 @@ EXTRA_CXXFLAGS = "-I. -fPIC"
>  do_compile() {
>      ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxml2.o tinyxml2.cpp
>      ${CXX} ${CXXFLAGS} \
> -            -shared \
> -            -Wl,-soname,libtinyxml2.so.${PV} \
> -            -o libtinyxml2.so.${PV} \
> -            ${LDFLAGS} \
> -            tinyxml2.o
> +        -shared \
> +        -Wl,-soname,libtinyxml2.so.${XML2VER} \
> +        -o libtinyxml2.so.${XML2VER} \
> +        ${LDFLAGS} \
> +        tinyxml2.o
> +
>  }
>
>  do_install() {
>      install -d ${D}${libdir}
> -    install -m 0755 ${S}/libtinyxml2.so.${PV} ${D}${libdir}
> -    ln -sf libtinyxml2.so.${PV} ${D}${libdir}/libtinyxml2.so
> +    install -m 0644 ${S}/libtinyxml2.so.${XML2VER} ${D}${libdir}
> +    ln -sf libtinyxml2.so.${XML2VER} ${D}${libdir}/libtinyxml2.so
> +    ln -sf libtinyxml2.so.${XML2VER} ${D}${libdir}/libtinyxml2.so.2

Either set soname to libtinyxml2.so.2 or drop the libtinyxml2.so.2 symlink.

>
>      install -d ${D}${includedir}
>      install -m 0644 ${S}/tinyxml2.h ${D}${includedir}
> +    install -Dm644 ${WORKDIR}/libtinyxml2.pc ${D}${libdir}/pkgconfig/libtinyxml2.pc
>  }
>
>  BBCLASSEXTEND += "native"
> -
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

