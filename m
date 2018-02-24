Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 70B2D78817
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 03:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C8A720B68;
	Sat, 24 Feb 2018 03:58:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id apqdQf73dcPQ; Sat, 24 Feb 2018 03:58:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7284920059;
	Sat, 24 Feb 2018 03:58:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D05611632C5; Fri, 23 Feb 2018 22:58:14 -0500 (EST)
Date: Fri, 23 Feb 2018 22:58:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
Message-ID: <20180224035814.GG2786@denix.org>
References: <1519071250-14245-1-git-send-email-carlos.rodriguez@ridgerun.com>
MIME-Version: 1.0
In-Reply-To: <1519071250-14245-1-git-send-email-carlos.rodriguez@ridgerun.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Sat, 24 Feb 2018 03:58:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 19, 2018 at 02:14:10PM -0600, Carlos Rodriguez wrote:
> GStreamer Daemon, also called gstd, is a GStreamer framework
> for controlling audio and video streaming using TCP connection
> messages. Qt applications, web interfaces, and GStreamer element
> test suites show different ways the framework can be utilized.
> GStreamer Daemon is gst-launch on steroids where you can create a
> GStreamer pipeline, play, pause, change speed, skip around, and
> even change element parameter settings all while the pipeline
> is active.
> 
> Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> ---
>  .../recipes-multimedia/gstreamer-1.0/gstd.inc      | 25 +++++++++
>  .../gstd/0001-gstd-yocto-compatibility.patch       | 63 ++++++++++++++++++++++
>  .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   |  3 ++
>  3 files changed, 91 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb

Why do you need to split it up into .bb and .inc?


> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
> new file mode 100644
> index 0000000..10ee5bc
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Gstreamer Daemon 1.0"
> +SUMMARY = "GStreamer framework for controlling audio and video streaming using TCP connection messages"

These 2 are backwards ^^^ - SUMMARY is short, DESCRIPTION is long.


> +HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
> +SECTION = "multimedia"
> +LICENSE = "GPLv2+"
> +
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
> +
> +SRCBRANCH ?= "master"
> +SRCREV = "097a086a8606dcb368c7d38c7ec4fefc2497401b"
> +SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \

Can you drop "git@" part?


> +	   file://0001-gstd-yocto-compatibility.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS = " \
> +	--disable-gtk-doc \
> +"
> +
> +inherit autotools pkgconfig gettext
> +
> +do_configure() {
> +${S}/autogen.sh
> +oe_runconf
> +}
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
> new file mode 100644
> index 0000000..ddc1831
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
> @@ -0,0 +1,63 @@
> +From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001
> +From: Carlos <carlos.rodriguez@ridgerun.com>
> +Date: Fri, 15 Dec 2017 10:14:05 -0600
> +Subject: [PATCH] gstd:yocto compatibility

Can this patch be upstreamed, especially since you own the upstream code?


> +---
> + autogen.sh                      | 8 +++++++-
> + docs/reference/gstd/Makefile.am | 2 +-
> + gstd/Makefile.am                | 2 +-
> + 3 files changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/autogen.sh b/autogen.sh
> +index 66dbd42..793ee2f 100755
> +--- a/autogen.sh
> ++++ b/autogen.sh
> +@@ -21,7 +21,11 @@
> + # ACLOCAL, AUTOPOINT and/or LIBTOOLIZE to the right versions, or leave them
> + # unset and get the defaults
> + 
> +-gtkdocize || exit 1
> ++test -n "$srcdir" || srcdir=`dirname "$0"`
> ++test -n "$srcdir" || srcdir=.
> ++
> ++olddir=`pwd`
> ++cd "$srcdir"
> + 
> + autoreconf --verbose --force --install || {
> +  echo 'autogen.sh failed';
> +@@ -31,3 +35,5 @@ autoreconf --verbose --force --install || {
> + echo
> + echo "Now run './configure' with your system settings followed by 'make' to compile this module."
> + echo
> ++
> ++cd "$olddir"
> +diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makefile.am
> +index f860fa1..153a13b 100644
> +--- a/docs/reference/gstd/Makefile.am
> ++++ b/docs/reference/gstd/Makefile.am
> +@@ -66,7 +66,7 @@ GTKDOC_LIBS=$(top_builddir)/gstd/libgstd-core.la
> + 
> + 
> + # This includes the standard gtk-doc make rules, copied by gtkdocize.
> +-include $(top_srcdir)/docs/gtk-doc.make
> ++# include $(top_srcdir)/docs/gtk-doc.make
> + 
> + # Comment this out if you want 'make check' to test you doc status
> + # and run some sanity checks
> +diff --git a/gstd/Makefile.am b/gstd/Makefile.am
> +index 13c551d..11fe202 100644
> +--- a/gstd/Makefile.am
> ++++ b/gstd/Makefile.am
> +@@ -49,7 +49,7 @@ bin_PROGRAMS = gstd
> + 
> + gstd_SOURCES = gstd.c
> + gstd_CFLAGS = $(GST_CFLAGS) $(GIO_CFLAGS) $(GJSON_CFLAGS)
> +-gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS) -Wl,-rpath -Wl,$(libdir)
> ++gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS)
> + gstd_LDADD = libgstd-core.la
> + 
> + gstdincludedir = $(includedir)/gstd
> +-- 
> +1.9.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> new file mode 100644
> index 0000000..94f6b57
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> @@ -0,0 +1,3 @@
> +require gstd.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

