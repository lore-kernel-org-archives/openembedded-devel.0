Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 883587F977
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 06:56:40 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x21so1788354qto.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 23:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hnpjC+LAg70Fwx86GYRRIMUTi1vqGiU2TO0j+Za+OyY=;
	b=Kr1kdJ4F+w/35THiT/PxxSquhFHRDw3Vh84/BkekvgHXIN6aDmuthSPLKCKoW3Rlbd
	hZR3mUOFLyIcd/KZ2Nmvud3sc/RmVItNJo/QUz/A/Enh96Vu4MNrvjd1c7tt6pfeqImX
	2AbDyYnoqG04kr88BQKdd3Wx1jxt3LFS2ap9YOAXCq1qLWrzg6rEIOveEg0l4NaX6cvm
	nra5My7Y80Edi1m81B7dyVUSymHrNIcpVxxgZIzNL9Pb5cjZ5zzaSzgLAtNZjjrgl2fT
	qIBRKwSsAcvXX/hvM72mq8l2G65XS7jTETONfjEP1nD7x2ePKgPnzDZ2wWU1Lvg/fHux
	If0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hnpjC+LAg70Fwx86GYRRIMUTi1vqGiU2TO0j+Za+OyY=;
	b=iICqrEx3iskCH3uaxaLHAdZpJgoJDRiQ4NAXZyZoMM8Xgk5NRb8A57+oWhjtxYYp9s
	/Ybv3CgnDIK3DECHAjg8IBqEgrhAuCY+pCaC2lQ4zb+AtwJXX3N5wEpz5qwmjLbw3npD
	0ZhRnQP3ywA+n5bFYOPYwzsp12H6yfeJn3vJ58dRpVheuWhzrFCNeJzeUhjPaUz999mS
	JISlMviI+whD8Ph5k6Kt1xlfuztNS+XQx7mrg0kDPn4PHel0Q1C8wLxpSyno8yXhCVpG
	zYt83sP7DoKnXezfBZ9blLZgxIgHsOlI9uo4k7eH4okdNneGjhatK6NUnK/AgXj/pgtT
	E5gA==
X-Gm-Message-State: APjAAAX8YYohWOSukkIhhrWVbbJi25XzmRyxqhSUyAAPYTX4JUpZ1J8x
	Uue9dfeT9N0YGEKI//LW5Q1qNzADICjoCoL5zCAhkZG3PKVJLQ==
X-Google-Smtp-Source: APXvYqz8180XbaiI7cnNgy6GJen4h2DKvlTVbHmFO917OfhEobYgeRB1WRNzvoBbzqnbsfmh5HP+6+xt4BRFoC+gv0Y=
X-Received: by 2002:aed:2724:: with SMTP id n33mr3420113qtd.194.1572418601026; 
	Tue, 29 Oct 2019 23:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191029183123.1868-3-bunk@stusta.de>
In-Reply-To: <20191029183123.1868-3-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2019 07:56:14 +0100
Message-ID: <CAMKF1so_r3VT5XVGSJkYw0bQrnxtdTpdqBcMFtEKiyPbBnz+ew@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cgdb: Upgrade 0.6.8 -> 0.7.1
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
X-List-Received-Date: Wed, 30 Oct 2019 06:56:40 -0000
Content-Type: text/plain; charset="UTF-8"

fails on mips
https://errors.yoctoproject.org/Errors/Details/274947/

On Tue, Oct 29, 2019 at 7:32 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> Obsolete patch removed.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../cgdb/cgdb/remove-help2man.patch           | 47 -------------------
>  .../cgdb/{cgdb_0.6.8.bb => cgdb_0.7.1.bb}     |  8 ++--
>  2 files changed, 4 insertions(+), 51 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
>  rename meta-oe/recipes-devtools/cgdb/{cgdb_0.6.8.bb => cgdb_0.7.1.bb} (75%)
>
> diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch b/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
> deleted file mode 100644
> index 4358629b7..000000000
> --- a/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -Disable building manpages so that make install doesn't fail due to lack of help2man
> -
> -Upstream-Status: Inappropriate [config]
> -
> -Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ----
> - configure.ac    | 3 ---
> - doc/Makefile.am | 5 -----
> - 2 files changed, 8 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index ee7eca0..1f0d924 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -134,9 +134,6 @@ dnl check that the required tools are available to generate documentation
> - if test "$HAS_MAKEINFO" != "yes" ; then
> -       AC_MSG_ERROR([Please install makeinfo before installing])
> - fi
> --if test "$HAS_HELP2MAN" != "yes" ; then
> --      AC_MSG_ERROR([Please install help2man])
> --fi
> -
> - dnl Checking for log10 function in math - I would like to remove this
> - AC_CHECK_LIB(m, log10)
> -diff --git a/doc/Makefile.am b/doc/Makefile.am
> -index 60662f6..0ae0013 100644
> ---- a/doc/Makefile.am
> -+++ b/doc/Makefile.am
> -@@ -1,15 +1,10 @@
> - info_TEXINFOS = cgdb.texi
> - cgdb_TEXINFOS = gpl.texi
> -
> --dist_man_MANS = cgdb.1
> - EXTRA_DIST = cgdb.txt
> -
> - dist_pkgdata_DATA = cgdb.txt
> -
> --# generate the man page using help2man.
> --cgdb.1:
> --      help2man --output=$(top_srcdir)/doc/cgdb.1 $(top_builddir)/cgdb/cgdb$(EXEEXT)
> --
> - cgdb.txt: cgdb.texi $(srcdir)/version.texi $(cgdb_TEXINFOS)
> - TEXTS = cgdb.txt
> - text-am: $(TEXTS)
> ---
> -1.9.1
> -
> diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
> similarity index 75%
> rename from meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
> rename to meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
> index 74019fb62..c2315aeb2 100644
> --- a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
> +++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
> @@ -10,11 +10,11 @@ DEPENDS = "flex-native readline ncurses"
>  inherit autotools
>
>  SRC_URI = "http://cgdb.me/files/${BP}.tar.gz \
> -    file://remove-help2man.patch"
> -SRC_URI[md5sum] = "7bd38c79bf4d794d239928fef401fca3"
> -SRC_URI[sha256sum] = "be203e29be295097439ab67efe3dc8261f742c55ff3647718d67d52891f4cf41"
> +"
> +SRC_URI[md5sum] = "a104862ffd3145b076303992e9a3af26"
> +SRC_URI[sha256sum] = "bb723be58ec68cb59a598b8e24a31d10ef31e0e9c277a4de07b2f457fe7de198"
>
> -CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2"
> +CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2 ac_cv_file__proc_self_status=yes"
>  EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR} \
>      --with-ncurses=${STAGING_LIBDIR}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

