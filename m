Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lu1LY-0005Bg-Ek
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 11:23:59 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lu1Hm-0004Jx-Ry
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 09:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 09:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 09:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Apr 2009 11:13:35 +0200
Message-ID: <gs48fv$uv$2@ger.gmane.org>
References: <1239317402-31917-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <1239317402-31917-1-git-send-email-raj.khem@gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] quilt-0.48: Add new version 0.48 of quilt.
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
X-List-Received-Date: Wed, 15 Apr 2009 09:23:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10-04-09 00:50, Khem Raj wrote:
> 	* Adds the latest release of quilt recipes.
> 	* Move PR out of quilt.inc into respective bb files.

Looks pretty OK to me.


> ---
>   conf/checksums.ini                     |    4 +
>   recipes/quilt/quilt-0.48/aclocal.patch |  126 ++++++++++++++++++++++++++++++++
>   recipes/quilt/quilt-0.48/install.patch |   13 +++
>   recipes/quilt/quilt-native_0.45.bb     |    1 +
>   recipes/quilt/quilt-native_0.46.bb     |    1 +
>   recipes/quilt/quilt-native_0.48.bb     |    1 +
>   recipes/quilt/quilt.inc                |    1 -
>   recipes/quilt/quilt_0.45.bb            |    1 +
>   recipes/quilt/quilt_0.46.bb            |    1 +
>   recipes/quilt/quilt_0.48.bb            |    1 +
>   10 files changed, 149 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/quilt/quilt-0.48/aclocal.patch
>   create mode 100644 recipes/quilt/quilt-0.48/install.patch
>   create mode 100644 recipes/quilt/quilt-native_0.48.bb
>   create mode 100644 recipes/quilt/quilt_0.48.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index c638792..3b0f1a5 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -19998,6 +19998,10 @@ sha256=de7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8
>   md5=4508546d1ed0257ef7c128b6121b7208
>   sha256=47bf030565bb462840db694acc183273455714028c74974c5b3a3bd4ad29ad89
>
> +[http://download.savannah.gnu.org/releases/quilt/quilt-0.48.tar.gz]
> +md5=f77adda60039ffa753f3c584a286f12b
> +sha256=73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc
> +
>   [http://download.savannah.nongnu.org/releases/qwo/qwo-0.4.tar.gz]
>   md5=72811b7d7fecfbdca45d5a74394daa4f
>   sha256=c3b9bffd3e27090d4c0623ef61f48257343d0f6ea1cf573f5296250ab7551e5d
> diff --git a/recipes/quilt/quilt-0.48/aclocal.patch b/recipes/quilt/quilt-0.48/aclocal.patch
> new file mode 100644
> index 0000000..1245f74
> --- /dev/null
> +++ b/recipes/quilt/quilt-0.48/aclocal.patch
> @@ -0,0 +1,126 @@
> +Add the aclocal.m4 as acinclude.m4
> +
> +Index: quilt-0.46/acinclude.m4
> +===================================================================
> +--- /dev/null
> ++++ quilt-0.46/acinclude.m4
> +@@ -0,0 +1,119 @@
> ++dnl Allow configure to specify a specific binary
> ++dnl 1: Environment variable
> ++dnl 2: binary name
> ++dnl 3: optional list of alternative binary names
> ++dnl 4: optional list of additional search directories
> ++AC_DEFUN([QUILT_COMPAT_PROG_PATH],[
> ++  m4_define([internal_$2_cmd],[esyscmd(ls compat/$2.in 2>/dev/null)])
> ++
> ++  AC_ARG_WITH($2, AC_HELP_STRING(
> ++    [--with-$2], [name of the $2 executable to use]
> ++                 m4_if(internal_$2_cmd,[],[],[ (use --without-$2
> ++                          to use an internal mechanism)])),
> ++  [
> ++    if test x"$withval" = xnone; then
> ++      AC_MSG_ERROR([Invalid configure argument.  use --without-$2])
> ++    fi
> ++    if test x"$withval" != xno; then
> ++      AC_MSG_CHECKING(for $2)
> ++      $1="$withval"
> ++      if test -e "$$1"; then
> ++	if test ! -f "$$1" -a ! -h "$$1" || test ! -x "$$1"; then
> ++	  AC_MSG_ERROR([$$1 is not an executable file])
> ++	fi
> ++      fi
> ++      AC_MSG_RESULT([$$1])
> ++      if test ! -e "$$1"; then
> ++        AC_MSG_WARN([$$1 does not exist])
> ++      fi
> ++      COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
> ++    fi
> ++  ],[
> ++    m4_if([$3],[],[
> ++      AC_PATH_PROG($1,$2,,$PATH:$4)
> ++    ],[
> ++      AC_PATH_PROGS($1,$3,,$PATH:$4)
> ++      if test -n "$$1" -a "`expr "$$1" : '.*/\([[^/]]*\)$'`" != "$2"; then
> ++	COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
> ++      fi
> ++    ])
> ++    m4_if([$4],[],[],[
> ++      if test -n "$$1"; then
> ++	as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++        for dir in "$4"; do
> ++          if test "`dirname $$1`" = "$dir"; then
> ++            COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
> ++	    break
> ++	  fi
> ++        done
> ++	IFS="$as_save_IFS"
> ++      fi
> ++    ])
> ++  ])
> ++  if test -z "$$1"; then
> ++    m4_if(internal_$2_cmd,[],[
> ++      AC_MSG_ERROR([Please specify the location of $2 with the option '--with-$2'])
> ++    ],[
> ++      AC_MSG_WARN([Using internal $2 mechanism.  Use option '--with-$2' to override])
> ++      COMPAT_PROGRAMS="$COMPAT_PROGRAMS $2"
> ++      $1=$2
> ++      INTERNAL_$1=1
> ++    ])
> ++  fi
> ++  AC_SUBST($1)
> ++])
> ++
> ++dnl Allow configure to specify a specific binary
> ++dnl This variant is for optional binaries.
> ++dnl 1: Environment variable
> ++dnl 2: binary name
> ++dnl 3: optional list of alternative binary names
> ++dnl 4: optional list of additional search directories
> ++AC_DEFUN([QUILT_COMPAT_PROG_PATH_OPT],[
> ++  AC_ARG_WITH($2, AC_HELP_STRING(
> ++    [--with-$2], [name of the $2 executable to use]),
> ++  [
> ++    if test x"$withval" != xno; then
> ++      AC_MSG_CHECKING(for $2)
> ++      $1="$withval"
> ++      if test -e "$$1"; then
> ++	if test ! -f "$$1" -a ! -h "$$1" || test ! -x "$$1"; then
> ++	  AC_MSG_ERROR([$$1 is not an executable file])
> ++	fi
> ++      fi
> ++      AC_MSG_RESULT([$$1])
> ++      if test ! -e "$$1"; then
> ++        AC_MSG_WARN([$$1 does not exist])
> ++      fi
> ++      COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
> ++    fi
> ++  ],[
> ++    m4_if([$3],[],[
> ++      AC_PATH_PROG($1,$2,,$PATH:$4)
> ++    ],[
> ++      AC_PATH_PROGS($1,$3,,$PATH:$4)
> ++      if test -n "$$1" -a "`expr "$$1" : '.*/\([[^/]]*\)$'`" != "$2"; then
> ++	COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
> ++      fi
> ++    ])
> ++    m4_if([$4],[],[],[
> ++      if test -n "$$1"; then
> ++	as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++        for dir in "$4"; do
> ++          if test "`dirname $$1`" = "$dir"; then
> ++            COMPAT_SYMLINKS="$COMPAT_SYMLINKS $2"
> ++	    break
> ++	  fi
> ++        done
> ++	IFS="$as_save_IFS"
> ++      fi
> ++    ])
> ++    if test -z "$$1"; then
> ++      AC_MSG_WARN([$2 not found, some optional functionalities will be missing])
> ++    fi
> ++  ])
> ++  if test -z "$$1"; then
> ++    $1=$2
> ++  fi
> ++  AC_SUBST($1)
> ++])
> diff --git a/recipes/quilt/quilt-0.48/install.patch b/recipes/quilt/quilt-0.48/install.patch
> new file mode 100644
> index 0000000..7970f11
> --- /dev/null
> +++ b/recipes/quilt/quilt-0.48/install.patch
> @@ -0,0 +1,13 @@
> +Index: quilt-0.48/Makefile.in
> +===================================================================
> +--- quilt-0.48.orig/Makefile.in	2009-01-31 09:09:47.000000000 -0800
> ++++ quilt-0.48/Makefile.in	2009-04-09 15:36:25.000000000 -0700
> +@@ -13,7 +13,7 @@
> + mandir :=	@mandir@
> + localedir :=	$(datadir)/locale
> + emacsdir :=	$(datadir)/emacs/site-lisp
> +-etcdir :=	$(subst /usr/etc,/etc,$(prefix)/etc)
> ++etcdir :=	@sysconfdir@
> +
> + INSTALL :=	@INSTALL@
> + POD2MAN :=	@POD2MAN@
> diff --git a/recipes/quilt/quilt-native_0.45.bb b/recipes/quilt/quilt-native_0.45.bb
> index 302df25..5fbaf5a 100644
> --- a/recipes/quilt/quilt-native_0.45.bb
> +++ b/recipes/quilt/quilt-native_0.45.bb
> @@ -1 +1,2 @@
>   require quilt-native.inc
> +PR = "r2"
> diff --git a/recipes/quilt/quilt-native_0.46.bb b/recipes/quilt/quilt-native_0.46.bb
> index 302df25..5fbaf5a 100644
> --- a/recipes/quilt/quilt-native_0.46.bb
> +++ b/recipes/quilt/quilt-native_0.46.bb
> @@ -1 +1,2 @@
>   require quilt-native.inc
> +PR = "r2"
> diff --git a/recipes/quilt/quilt-native_0.48.bb b/recipes/quilt/quilt-native_0.48.bb
> new file mode 100644
> index 0000000..302df25
> --- /dev/null
> +++ b/recipes/quilt/quilt-native_0.48.bb
> @@ -0,0 +1 @@
> +require quilt-native.inc
> diff --git a/recipes/quilt/quilt.inc b/recipes/quilt/quilt.inc
> index 33bc0f6..ce9679d 100644
> --- a/recipes/quilt/quilt.inc
> +++ b/recipes/quilt/quilt.inc
> @@ -2,7 +2,6 @@ DESCRIPTION = "Tool to work with series of patches."
>   HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
>   SECTION = "devel"
>   LICENSE = "GPL"
> -PR = "r2"
>
>   SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
>              file://install.patch;patch=1"
> diff --git a/recipes/quilt/quilt_0.45.bb b/recipes/quilt/quilt_0.45.bb
> index de38f64..99efa48 100644
> --- a/recipes/quilt/quilt_0.45.bb
> +++ b/recipes/quilt/quilt_0.45.bb
> @@ -1 +1,2 @@
>   require quilt-package.inc
> +PR = "r2"
> diff --git a/recipes/quilt/quilt_0.46.bb b/recipes/quilt/quilt_0.46.bb
> index de38f64..99efa48 100644
> --- a/recipes/quilt/quilt_0.46.bb
> +++ b/recipes/quilt/quilt_0.46.bb
> @@ -1 +1,2 @@
>   require quilt-package.inc
> +PR = "r2"
> diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
> new file mode 100644
> index 0000000..de38f64
> --- /dev/null
> +++ b/recipes/quilt/quilt_0.48.bb
> @@ -0,0 +1 @@
> +require quilt-package.inc




