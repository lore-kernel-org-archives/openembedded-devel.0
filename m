Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 060C673CA7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 20:25:25 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BEE44D40815
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 22:25:24 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 28151D4080B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 22:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (x5ce107db.dyn.telefonica.de
	[92.225.7.219]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 22:25:21 +0200 (CEST)
Date: Mon, 30 Mar 2015 22:25:08 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150330202507.GA22676@mail.itconsulting-heinold.de>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
MIME-Version: 1.0
In-Reply-To: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-List-Received-Date: Mon, 30 Mar 2015 20:25:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2015 at 04:06:11PM -0300, Hugo Vasconcelos Saldanha wrote:
> Cacao uses an internal version of bdwgc that was being installed
> (headers, libs, etc.) together with the JVM, unnecessarily conflicting
> with original bwdgc package.
> 
> A patch from Gentoo is applied so the system's bdwgc is used instead.
> 
> Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
> ---
>  .../cacao/cacao-1.6.1/system-boehm-gc.patch        | 47 ++++++++++++++++++++++
>  recipes-core/cacao/cacao_1.6.1.bb                  |  8 ++--
>  2 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-core/cacao/cacao-1.6.1/system-boehm-gc.patch
> 
> diff --git a/recipes-core/cacao/cacao-1.6.1/system-boehm-gc.patch b/recipes-core/cacao/cacao-1.6.1/system-boehm-gc.patch
> new file mode 100644
> index 0000000..27b6258
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
> +-	boehm-gc
> +-
> + GC_FILE = \
> + 	gc-boehm.cpp
> + 
> +-GC_LIB = \
> +-	$(top_builddir)/src/mm/boehm-gc/libgc.la
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

Hm,

if I remember correctly, than the bdwgc inside cacao differs from upstream.

Bye Henning

