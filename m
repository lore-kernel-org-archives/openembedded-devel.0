Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7A27673C22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 00:46:23 +0000 (UTC)
Received: by iedm5 with SMTP id m5so3906092ied.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 17:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=omQTn6MZOnHVWAq5lsEKbYOgKN/sOw+skVmb8JkXdpA=;
	b=ArP7WH9nJCI+8AEbZb36ocFXNF4BG4GwVRNWZSjDU/dM5HI5z5gDeLtr/T0ylc9Dkm
	e1XWi/y7FLFSz1ZN5C/v2jL5bk9LAZ+20gC0SS36HoOfscvLAnTd2c8nIvKWT4aQabJq
	n20f1ntT4o95sv3pr1eCdDPVIgjvEwnAo+Yh4dy/jQB5AJV40JyqMI4D04+z6If4KR+y
	uPsrcCelScok6fEbb0gPiuSOMs1bm4ZOqemC29mfaTdc5dMaj2i46t9/FG6rd2XBcuJG
	ET2cm2zIJNLV5FH4y3K772Y26D98eCQdt89PEKi6Onv7zacEXELfBHpEdeoUgpnCHv/1
	2ZrQ==
MIME-Version: 1.0
X-Received: by 10.50.79.163 with SMTP id k3mr589951igx.30.1427762784957; Mon,
	30 Mar 2015 17:46:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 30 Mar 2015 17:46:24 -0700 (PDT)
In-Reply-To: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
Date: Mon, 30 Mar 2015 21:46:24 -0300
X-Google-Sender-Auth: fFRmtU1IeJYKZDEFyGGL8L9tKhU
Message-ID: <CAP9ODKpr0mxqDF3+ORP5Ee3=qr3rMhXgTGWyD4BPU-jgEcOJ3A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] cacao: fix problem with internal garbage collector
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Mar 2015 00:46:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 30, 2015 at 4:06 PM, Hugo Vasconcelos Saldanha
<hugo.saldanha@aker.com.br> wrote:
> Cacao uses an internal version of bdwgc that was being installed
> (headers, libs, etc.) together with the JVM, unnecessarily conflicting
> with original bwdgc package.
>
> A patch from Gentoo is applied so the system's bdwgc is used instead.
>
> Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>

Please add a patch description, signed-off-by and also Upstream-Status header.

> --- /dev/null
> +++ b/recipes-core/cacao/cacao-1.6.1/system-boehm-gc.patch
> @@ -0,0 +1,47 @@
> +diff --git a/configure.ac b/configure.ac
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -691,6 +691,8 @@
> +
> + AC_CHECK_ENABLE_PIC_ASM
> +
> ++PKG_CHECK_MODULES([BOEHM], bdw-gc,,AC_MSG_ERROR[boehm-gc not found])
> ++
> + dnl Define version numbers.
> + AC_VERSION_DETAIL
> + AC_VERSION_CONFIG
> +@@ -793,12 +795,6 @@
> + )
> +
> +
> +-dnl We only build the shared library objects but we use it as
> +-dnl noinst_LTLIBRARIES.
> +-ac_configure_args="$ac_configure_args --disable-static"
> +-AC_CONFIG_SUBDIRS(src/mm/boehm-gc)
> +-
> +-
> + AC_OUTPUT
> +
> +
> +diff --git a/src/mm/Makefile.am b/src/mm/Makefile.am
> +--- a/src/mm/Makefile.am
> ++++ b/src/mm/Makefile.am
> +@@ -35,14 +35,13 @@
> + endif
> +
> + if ENABLE_GC_BOEHM
> +-SUBDIRS = \
> +-      boehm-gc
> +-
> + GC_FILE = \
> +       gc-boehm.cpp
> +
> +-GC_LIB = \
> +-      $(top_builddir)/src/mm/boehm-gc/libgc.la
> ++AM_CPPFLAGS += $(BOEHM_CFLAGS)
> ++
> ++GC_LIB = $(BOEHM_LIBS)
> ++
> + endif
> +
> + if ENABLE_GC_CACAO
> diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
> index 9f07946..65aaf93 100644
> --- a/recipes-core/cacao/cacao_1.6.1.bb
> +++ b/recipes-core/cacao/cacao_1.6.1.bb
> @@ -4,14 +4,14 @@ LICENSE  = "GPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>  SECTION  = "interpreters"
>
> -DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native"
> +DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native bdwgc-native"
>  PROVIDES_class-native = "virtual/java-native"
>
> -DEPENDS = "zlib libtool classpath virtual/javac-native"
> -DEPENDS_${PN} = "classpath"
> +DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
>  RPROVIDES_${PN} = "java2-runtime"
>
> -SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.xz"
> +SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.xz \
> +           file://system-boehm-gc.patch"
>  SRC_URI[md5sum] = "2c18478404afd1cffdd15ad1e9d85a57"
>  SRC_URI[sha256sum] = "eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6971e12"
>
> --
> 2.3.4
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

