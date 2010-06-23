Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORTnc-0006R4-Jb
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:31:48 +0200
Received: by pvg3 with SMTP id 3so638286pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 10:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=5hB/N7vElmJGKu1lA6BQXmVBgcV5QDez0VO6bzTDs6w=;
	b=nzbVXxJKFSZ9adJJkRw0gU1cybyr/wqlPpclcmuIswqRx6pHpoMqLYN0xjKEZ2ypUc
	CKM+atwTaKcR6aan6nO2NfEEt9zXO+RJUR0b6CdlTCwRU0W+8SzgdG+HTAxwOutVlOJq
	UI9Ls8L0ccTNW0Wa/rxUIQaOXcYoWUXp4qgKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AUKIFEo8PwYX9autjlP45Ny16wPTRtil3xFodvQRhAYwBaREe9DkpfYwrRb2jZTVHs
	ARuqykmv7ck20KKCQj0sITuvXL9v0W3nO40gs4IVO/LI805CTBrmY/Fng/yPoMmxlmga
	F1ubZEjLKmqpTYeJFv1qKxdjA9TUJ96/aSLl4=
Received: by 10.114.188.16 with SMTP id l16mr7972479waf.87.1277314027140;
	Wed, 23 Jun 2010 10:27:07 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id h9sm44763037wal.12.2010.06.23.10.27.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 10:27:06 -0700 (PDT)
Date: Wed, 23 Jun 2010 10:28:13 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623172813.GF5535@gmail.com>
References: <4C213A4F.9070705@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4C213A4F.9070705@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Link with $ORIGIN, mangle only when that's too hard, get it all
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
X-List-Received-Date: Wed, 23 Jun 2010 17:31:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/06/10 15:33), Tom Rini wrote:
> The following changes relocatable.bbclass to an always for native
> (and disabled for cross) to an opt-in for hard to get right recipes.
> 
> With this, cross / native things like with $ORIGIN directly, for the
> common case.  We do this as an in addition to so that programs that
> run before install still work fine.  In addition doing this makes
> sure that the initial RPATH will be long enough, even in the cross
> case, that we can patch in a correct $ORIGIN[1].
> 
> Advantages? Less tasks, one less must have host utility (*cough*3rd
> party yum repos*cough*).  Having an exists but not right second
> known part of RPATH ensures cross recipes are now chrpath/patchelf
> patchable and gets us one step closer to pstaging being relocatable
> (will have to run some tests to look at the last corner cases).
> Disadvantages? One "ugly" escape sequence in bitbake.conf.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> index 4cf2b4c..e486e30 100644
> --- a/classes/cross.bbclass
> +++ b/classes/cross.bbclass
> @@ -1,6 +1,3 @@
> -# Disabled for now since the relocation paths are too long
> -#inherit relocatable
> -
>  # Cross packages are built indirectly via dependency,
>  # no need for them to be a direct target of 'world'
>  EXCLUDE_FROM_WORLD = "1"
> diff --git a/classes/native.bbclass b/classes/native.bbclass
> index 3437836..92f5f83 100644
> --- a/classes/native.bbclass
> +++ b/classes/native.bbclass
> @@ -1,6 +1,3 @@
> -# We want native packages to be relocatable
> -inherit relocatable
> -
>  # Native packages are built indirectly via dependency,
>  # no need for them to be a direct target of 'world'
>  EXCLUDE_FROM_WORLD = "1"
> diff --git a/classes/relocatable.bbclass b/classes/relocatable.bbclass
> index e4ababa..77b5f87 100644
> --- a/classes/relocatable.bbclass
> +++ b/classes/relocatable.bbclass
> @@ -1,4 +1,5 @@
>  SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess"
> +DEPENDS += "chrpath-native"
> 
>  CHRPATH_BIN ?= "chrpath"
>  PREPROCESS_RELOCATE_DIRS ?= ""
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index dfb3010..33ec459 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -83,7 +83,7 @@ def check_sanity(e):
>  	if not check_app_exists('${BUILD_PREFIX}g++', e.data):
>  		missing = missing + "C++ Compiler (${BUILD_PREFIX}g++),"
> 
> -	required_utilities = "patch help2man diffstat texi2html makeinfo
> cvs svn bzip2 tar gzip gawk md5sum chrpath"
> +	required_utilities = "patch help2man diffstat texi2html makeinfo
> cvs svn bzip2 tar gzip gawk md5sum"
> 
>  	# If we'll be running qemu, perform some sanity checks
>  	if data.getVar('ENABLE_BINARY_LOCALE_GENERATION', e.data, True):
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 397dbc2..46e6772 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -482,8 +482,9 @@ export CXXFLAGS = "${TARGET_CXXFLAGS}"
>  export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
>  export SDK_CXXFLAGS = "${SDK_CFLAGS} -fpermissive"
> 
> +export RELATIVERPATH = "${@base_path_relative(d.getVar('bindir',
> 1), d.getVar('STAGING_LIBDIR_NATIVE', 1))}"
>  export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
> -                        -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
> +                        -Wl,-rpath,\\\$\$ORIGIN/${RELATIVERPATH} -Wl,-O1 \
>                          -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
> 
>  export LDFLAGS = "${TARGET_LDFLAGS}"
> diff --git a/recipes/binutils/binutils.inc b/recipes/binutils/binutils.inc
> index a1866f3..3764f32 100644
> --- a/recipes/binutils/binutils.inc
> +++ b/recipes/binutils/binutils.inc
> @@ -5,7 +5,7 @@ LICENSE = "GPL"
> 
>  INC_PR = "r10"
> 
> -inherit autotools gettext
> +inherit autotools gettext relocatable
> 
>  PACKAGES += "${PN}-symlinks"
> 
> diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
> index 7aee542..d7e022d 100644
> --- a/recipes/gcc/gcc-common.inc
> +++ b/recipes/gcc/gcc-common.inc
> @@ -5,7 +5,7 @@ LICENSE = "GPL"
> 
>  NATIVEDEPS = ""
> 
> -inherit autotools gettext
> +inherit autotools gettext relocatable
> 
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
> 
> diff --git a/recipes/gdb/gdb.inc b/recipes/gdb/gdb.inc
> index 3500e1a..7cd47ed 100644
> --- a/recipes/gdb/gdb.inc
> +++ b/recipes/gdb/gdb.inc
> @@ -14,7 +14,7 @@ RRECOMMENDS_gdb_append_linux-uclibc = " uclibc-thread-db "
>  RRECOMMENDS_gdb_append_linux-uclibceabi = " uclibc-thread-db "
>  RRECOMMENDS_gdb_append_linux-spe = " uclibc-thread-db "
> 
> -inherit gettext
> +inherit gettext relocatable
> 
>  SRC_URI += "file://kill_arm_map_symbols.patch \
>              file://gdbserver-cflags-last.diff;striplevel=0"
> diff --git a/recipes/perl/perl-native_5.10.1.bb
> b/recipes/perl/perl-native_5.10.1.bb
> index 8bafff0..b210115 100644
> --- a/recipes/perl/perl-native_5.10.1.bb
> +++ b/recipes/perl/perl-native_5.10.1.bb
> @@ -23,7 +23,7 @@ SRC_URI[perl-5.10.1.sha256sum] =
> "cb7f26ea4b2b28d6644354d87a269d01cac1b635287dae
> 
>  S = "${WORKDIR}/perl-${PV}"
> 
> -inherit native
> +inherit native relocatable
> 
>  do_configure () {
>      ./Configure \
> diff --git a/recipes/perl/perl-native_5.8.8.bb
> b/recipes/perl/perl-native_5.8.8.bb
> index 336b419..7602d77 100644
> --- a/recipes/perl/perl-native_5.8.8.bb
> +++ b/recipes/perl/perl-native_5.8.8.bb
> @@ -20,7 +20,7 @@ SRC_URI =
> "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \
> 
>  S = "${WORKDIR}/perl-${PV}"
> 
> -inherit native
> +inherit native relocatable
> 
>  do_configure () {
>      ./Configure \
> 
> [1]: gcc/binutils/gdb are the hard ones as they re-run configure and
> lead to escape-hell and gcc has an extra layer of fun with mpfr +
> cc1 in libexec
> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


