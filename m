Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C0AA575ABD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:25:45 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so127462763wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1pX2a3jg45w8lYvjQlIebBlNWh6lVz3Krb66Qc7I+bU=;
	b=fhvDt4fTjKAjGShQZ3xw5ATzz2TPWYOKY/oHPbcutGVbMyuU3Gq8YTUigY0xjx/DAF
	UWAPK8T6pu7/XOOxIfQI+IZslhhhKPYba31I6KZ0C95UEOd1S8q+t0/KLuIOVaMJlm8D
	xBvfpM6vhjh+1cm71Yc2fS5Zojz5vMDmVROArdVz0mf8dWTKFD2bokaM0sH7aFKbzOOt
	xAh7Z1iDH7duugLxSHJYt2JrBasAEUdloE80a009+hSB2fKPiKBOkbODMVyvz1Ie0lVm
	VIFGU/oXRZnFkijNK2Zdwd1FmVhdOym3iL0oybcutMz7iYmY4E7NzOJgnZc+RT+wf2Wm
	97kw==
MIME-Version: 1.0
X-Received: by 10.180.187.232 with SMTP id fv8mr2718515wic.28.1435134345459;
	Wed, 24 Jun 2015 01:25:45 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Wed, 24 Jun 2015 01:25:45 -0700 (PDT)
In-Reply-To: <1435123743-14401-1-git-send-email-biannm@cn.fujitsu.com>
References: <1435123743-14401-1-git-send-email-biannm@cn.fujitsu.com>
Date: Wed, 24 Jun 2015 10:25:45 +0200
Message-ID: <CA+chaQcV0WL+o6BUvkv0Cpx=v=Y7awy9Lsvn5Opq+ewhGnL+SA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-ruby][PATCH v2] imsettings: add new recipe
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
X-List-Received-Date: Wed, 24 Jun 2015 08:25:48 -0000
Content-Type: text/plain; charset=UTF-8

I've already merged this yesterday, please rebase and send fix as follow-up
patch.

Thanks for quick fix.

On Wed, Jun 24, 2015 at 7:29 AM, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

> imsettings is a delivery framework for general input-method configuration
>
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../imsettings/gtk-is-required-by-notify.patch     | 18 +++++++++++++
>  ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 21 +++++++++++++++
>  .../imsettings/imsettings_1.6.8.bb                 | 30
> ++++++++++++++++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644
> meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
>  create mode 100644
> meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
>  create mode 100644 meta-ruby/recipes-extended/imsettings/
> imsettings_1.6.8.bb
>
> diff --git
> a/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
> b/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
> new file mode 100644
> index 0000000..d42358d
> --- /dev/null
> +++
> b/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
> @@ -0,0 +1,18 @@
> +gtk+ is required by linnotify. So make sure gtk be linked before libnotify
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp imsettings-1.6.7.orig/configure.ac imsettings-1.6.7/
> configure.ac
> +--- imsettings-1.6.7.orig/configure.ac 2013-11-26 16:09:09.000000000
> +0800
> ++++ imsettings-1.6.7/configure.ac      2014-12-30 11:27:44.370003209
> +0800
> +@@ -93,8 +93,8 @@ PKG_CHECK_MODULES(LIBNOTIFY, libnotify,
> +               has_old_libnotify=yes
> +               PKG_CHECK_MODULES(GTK, gtk+-2.0 >= $GTK_REQUIRED)
> +               AC_DEFINE(HAS_OLD_LIBNOTIFY,, [Using older libnotify])
> +-              IMDAEMON_CFLAGS="$GTK_CFLAGS $LIBNOTIFY_OLD_CFLAGS"
> +-              IMDAEMON_LIBS="$GTK_LIBS $LIBNOTIFY_OLD_LIBS"],[
> ++              IMDAEMON_CFLAGS="$LIBNOTIFY_OLD_CFLAGS $GTK_CFLAGS"
> ++              IMDAEMON_LIBS="$LIBNOTIFY_OLD_LIBS $GTK_LIBS"],[
> +               has_old_libnotify=no
> +               IMDAEMON_CFLAGS="$LIBNOTIFY_CFLAGS"
> +               IMDAEMON_LIBS="$LIBNOTIFY_LIBS"])
> diff --git
> a/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
> b/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
> new file mode 100644
> index 0000000..9e31847
> --- /dev/null
> +++
> b/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
> @@ -0,0 +1,21 @@
> +multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
> +It will cause configure error as follow.
> +
> +  aclocal: error: non-option arguments are not accepted: '\'.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp imsettings-1.6.8.orig/Makefile.am imsettings-1.6.8/Makefile.am
> +--- imsettings-1.6.8.orig/Makefile.am  2013-02-08 11:33:59.000000000 +0900
> ++++ imsettings-1.6.8/Makefile.am       2015-06-24 14:15:32.070000007 +0900
> +@@ -1,9 +1,7 @@
> + NULL =
> + SUBDIRS = data imsettings imsettings-daemon backends utils po tests docs
> +
> +-ACLOCAL_AMFLAGS =                     \
> +-      -I m4macros                     \
> +-      $(NULL)
> ++ACLOCAL_AMFLAGS = -I m4macros $(NULL)
> +
> + CONFIGURE_DEPENDENCIES =              \
> +       requires                        \
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> new file mode 100644
> index 0000000..64a229b
> --- /dev/null
> +++ b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Delivery framework for general Input Method configuration"
> +DESCRIPTION = "IMSettings is a framework that delivers Input Method \
> +settings and applies the changes so they take effect \
> +immediately without any need to restart applications \
> +or the desktop. \
> +This package contains the core DBus services and some utilities."
> +HOMEPAGE = "http://code.google.com/p/imsettings/"
> +SECTION = "Applications/System"
> +
> +inherit autotools gtk-doc
> +
> +SRC_URI = "
> https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
> +           file://gtk-is-required-by-notify.patch \
> +
>  file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
> +
> +SRC_URI[md5sum] = "c31429f1d60e36d7f811f871c75b6c41"
> +SRC_URI[sha256sum] =
> "2620ffbf9a6dc842dbf994b4773d4fe355eb77076ccf33f726ba63f16c0d08ba"
> +
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
> +                --disable-static \
> +               "
> +
> +DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim"
> +
> +RDEPENDS_${PN} += "bash"
> +
> +FILES_${PN} += "${datadir}/dbus-1/*"
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

