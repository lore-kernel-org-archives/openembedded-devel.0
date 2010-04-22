Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O4yBe-0003hv-9U for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 17:19:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O4y87-0001r6-SH for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 17:15:51 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 17:15:51 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 17:15:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 22 Apr 2010 17:15:41 +0200
Message-ID: <hqpp6t$s3k$1@dough.gmane.org>
References: <1271948430-30162-1-git-send-email-ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1271948430-30162-1-git-send-email-ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-2.6.4: make Modules/_ctypes/libffi configure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Apr 2010 15:19:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

You forgot to bump PR, so this change won't get pickup by the package
manager

On 22-04-10 17:00, Antonio Ospite wrote:
> This fixes configure issues with recent autoconf, e.g:
>   autoreconf: Entering directory `Modules/_ctypes/libffi'
>   autoreconf: configure.ac: not using Gettext
>   autoreconf: running: aclocal --force
>   configure.ac:26: error: m4_copy: won't overwrite defined macro: \
>       _AC_ARG_VAR_PRECIOUS
>   configure.ac:26: the top level
> 
> It also adjustes Makefile.am to take into account the fact that python ships
> incomplete source from libffi.
> 
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>  .../06-ctypes-libffi-fix-configure.patch           |   51 ++++++++++++++++++++
>  recipes/python/python-native_2.6.4.bb              |    1 +
>  recipes/python/python_2.6.4.bb                     |    1 +
>  3 files changed, 53 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
> 
> diff --git a/recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch b/recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
> new file mode 100644
> index 0000000..3773791
> --- /dev/null
> +++ b/recipes/python/python-2.6.4/06-ctypes-libffi-fix-configure.patch
> @@ -0,0 +1,51 @@
> +This fixes configure issues with recent autoconf, e.g:
> +  autoreconf: Entering directory `Modules/_ctypes/libffi'
> +  autoreconf: configure.ac: not using Gettext
> +  autoreconf: running: aclocal --force
> +  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
> +  configure.ac:26: the top level
> +
> +The problem is still present in python-2.6.5 but fixed in python-svn.
> +
> +diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac Python-2.6.4/Modules/_ctypes/libffi/configure.ac
> +--- Python-2.6.4.orig//Modules/_ctypes/libffi/configure.ac      2009-04-28 22:01:18.000000000 +0200
> ++++ Python-2.6.4/Modules/_ctypes/libffi/configure.ac    2010-04-20 22:46:02.000000000 +0200
> +@@ -23,6 +23,7 @@ AM_INIT_AUTOMAKE
> + m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
> + m4_define([_AC_ARG_VAR_PRECIOUS],[])
> + AC_PROG_CC
> ++m4_undefine([_AC_ARG_VAR_PRECIOUS])
> + m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
> + 
> + AC_SUBST(CFLAGS)
> +@@ -366,7 +367,7 @@ test -d src/$TARGETDIR || mkdir src/$TAR
> + 
> + AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
> + 
> +-AC_CONFIG_FILES(include/ffi.h)
> ++AC_CONFIG_FILES(include/ffi.h include/Makefile Makefile)
> + 
> + AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
> + 
> +diff -pruN Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am Python-2.6.4/Modules/_ctypes/libffi/Makefile.am
> +--- Python-2.6.4.orig//Modules/_ctypes/libffi/Makefile.am       2008-03-04 21:09:11.000000000 +0100
> ++++ Python-2.6.4/Modules/_ctypes/libffi/Makefile.am     2010-04-20 22:54:03.000000000 +0200
> +@@ -2,7 +2,7 @@
> + 
> + AUTOMAKE_OPTIONS = foreign subdir-objects
> + 
> +-SUBDIRS = include testsuite man
> ++SUBDIRS = include
> + 
> + EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
> +        src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
> +@@ -32,8 +32,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
> +        src/frv/ffi.c src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
> +        libtool-version ChangeLog.libffi
> + 
> +-info_TEXINFOS = doc/libffi.texi
> +-
> + ## ################################################################
> + 
> + ##
> +
> diff --git a/recipes/python/python-native_2.6.4.bb b/recipes/python/python-native_2.6.4.bb
> index ca65057..87a74de 100644
> --- a/recipes/python/python-native_2.6.4.bb
> +++ b/recipes/python/python-native_2.6.4.bb
> @@ -7,6 +7,7 @@ SRC_URI = "\
>    file://00-fix-bindir-libdir-for-cross.patch;patch=1 \
>    file://04-default-is-optimized.patch;patch=1 \
>    file://05-enable-ctypes-cross-build.patch;patch=1 \
> +  file://06-ctypes-libffi-fix-configure.patch;patch=1 \
>    file://10-distutils-fix-swig-parameter.patch;patch=1 \
>    file://11-distutils-never-modify-shebang-line.patch;patch=1 \
>    file://12-distutils-prefix-is-inside-staging-area.patch;patch=1 \
> diff --git a/recipes/python/python_2.6.4.bb b/recipes/python/python_2.6.4.bb
> index 6d93c2c..e4bdd5e 100644
> --- a/recipes/python/python_2.6.4.bb
> +++ b/recipes/python/python_2.6.4.bb
> @@ -13,6 +13,7 @@ SRC_URI = "\
>    file://03-fix-tkinter-detection.patch;patch=1 \
>    file://04-default-is-optimized.patch;patch=1 \
>    file://05-enable-ctypes-cross-build.patch;patch=1 \
> +  file://06-ctypes-libffi-fix-configure.patch;patch=1 \
>    file://99-ignore-optimization-flag.patch;patch=1 \
>    \
>  # not yet pushed forward

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL0GgcMkyGM64RGpERAtu3AKCYOqwsH01MEAZEfI0eDOhE1YgbBACfSiee
3UMuHNieVNJp3EUrTFlVmGE=
=bKKP
-----END PGP SIGNATURE-----



