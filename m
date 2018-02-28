Return-Path: <akuster808@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id D30D3788C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:40:05 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id j7so2034190ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=zPIE7MZLUgGlIHovCob9sGQsLFIrLE/4o/qM5i/WiOA=;
	b=jzMbGBr6I2V5RLcMGs77cMmGwKHywyzqWWMRJxDcqa8SD4vVQ+bTIIy6RwZ0JpuDoS
	XZMEVj75h46TTSu7ZCFq2Y6kUnmpFH7V7QdhJ2ysmaGXt1cw9sCv0AENxntsw/TgEKw3
	SRVkndOr0Nxi8GZIC64Rw1kA3FGWsfMxeNXaBBKUneB55N8VEKnhh6Z+DnxZotPI7Dcv
	7G0WhVURtehtFJJw7i2WtNbYkjLXK1bkuQelmTYvoah4mw+rSZHC+aBsImRTi1/I0Klv
	w6os+9yUVTbKYFh1odr6vBuiuLUcFdw8GhgvPi/bMsnw2akUy+yM48ISrY5n9yoBup9o
	wxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zPIE7MZLUgGlIHovCob9sGQsLFIrLE/4o/qM5i/WiOA=;
	b=R7TjmCA1/wnQer3TYFGpgXJLQl2/dhefGP04dj6jbYUlw+LUjITVk9RKlakjg1BztQ
	azm/63jgvt4+boGZZpIAAX/kLEFsyX+29knd5kwwr4Q/4pWnfj1Y/+/ndsSC5keEwWRd
	SDZVcpaARnm10uN13ZUQlzzBjHx0prIylxkeRwNQ9mtN1yBMIiVDw0N7mzJ3+Q3O4KiR
	+3mBAziAhIH2NAgYoOol52keYpX1YGQ2K/wq4iqf+4NQ+g66EAqdrqf6IpEvSebNYybr
	wX3wp5Fu6ODenDJu3eYNIhfgNmxYKjN/byhNYL31dd4kL0wI/VJ2ACxflxZ+foF3fEDD
	8/gA==
X-Gm-Message-State: APf1xPD8WtloyCcq9WKvIu6ca6LNjZ2Urr/wzZwr0hYeQ4RvuzZfoIlD
	Sl03FjPdWgHfN+UP5VI4ZoM4PA==
X-Google-Smtp-Source: AG47ELsuBn/uKgDFnGehjow9T2bVkFMSNh3L7yhMIVsFAyQ8NPgkAS9kXnI8TC+JbAJEBSIPEE6TCA==
X-Received: by 10.36.94.65 with SMTP id h62mr20200174itb.144.1519796406451;
	Tue, 27 Feb 2018 21:40:06 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id i31sm578966iod.78.2018.02.27.21.40.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 21:40:06 -0800 (PST)
To: carlos.rodriguez@ridgerun.com
References: <1519774824-30065-1-git-send-email-carlos.rodriguez@ridgerun.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1711123d-03b8-bf6a-b66d-6a83fcaa0e4f@gmail.com>
Date: Tue, 27 Feb 2018 21:40:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519774824-30065-1-git-send-email-carlos.rodriguez@ridgerun.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v4] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Wed, 28 Feb 2018 05:40:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/27/2018 03:40 PM, Carlos Rodriguez wrote:
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
>  .../gstd/0001-gstd-yocto-compatibility.patch       | 63 ++++++++++++++=
++++++++
>  .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   | 27 ++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gs=
td/0001-gstd-yocto-compatibility.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gs=
td_1.0.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001=
-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstr=
eamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
> new file mode 100644
> index 0000000..ddc1831
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-y=
octo-compatibility.patch
> @@ -0,0 +1,63 @@
> +From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001=

> +From: Carlos <carlos.rodriguez@ridgerun.com>
> +Date: Fri, 15 Dec 2017 10:14:05 -0600
> +Subject: [PATCH] gstd:yocto compatibility

Missing Upstream-Status and Signed-off-by
> +
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
> + # ACLOCAL, AUTOPOINT and/or LIBTOOLIZE to the right versions, or leav=
e them
> + # unset and get the defaults
> +=20
> +-gtkdocize || exit 1
> ++test -n "$srcdir" || srcdir=3D`dirname "$0"`
> ++test -n "$srcdir" || srcdir=3D.
> ++
> ++olddir=3D`pwd`
> ++cd "$srcdir"
> +=20
> + autoreconf --verbose --force --install || {
> +  echo 'autogen.sh failed';
> +@@ -31,3 +35,5 @@ autoreconf --verbose --force --install || {
> + echo
> + echo "Now run './configure' with your system settings followed by 'ma=
ke' to compile this module."
> + echo
> ++
> ++cd "$olddir"
> +diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Mak=
efile.am
> +index f860fa1..153a13b 100644
> +--- a/docs/reference/gstd/Makefile.am
> ++++ b/docs/reference/gstd/Makefile.am
> +@@ -66,7 +66,7 @@ GTKDOC_LIBS=3D$(top_builddir)/gstd/libgstd-core.la
> +=20
> +=20
> + # This includes the standard gtk-doc make rules, copied by gtkdocize.=

> +-include $(top_srcdir)/docs/gtk-doc.make
> ++# include $(top_srcdir)/docs/gtk-doc.make
> +=20
> + # Comment this out if you want 'make check' to test you doc status
> + # and run some sanity checks
> +diff --git a/gstd/Makefile.am b/gstd/Makefile.am
> +index 13c551d..11fe202 100644
> +--- a/gstd/Makefile.am
> ++++ b/gstd/Makefile.am
> +@@ -49,7 +49,7 @@ bin_PROGRAMS =3D gstd
> +=20
> + gstd_SOURCES =3D gstd.c
> + gstd_CFLAGS =3D $(GST_CFLAGS) $(GIO_CFLAGS) $(GJSON_CFLAGS)
> +-gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS) -Wl,-rpath -Wl=
,$(libdir)
> ++gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS)
> + gstd_LDADD =3D libgstd-core.la
> +=20
> + gstdincludedir =3D $(includedir)/gstd
> +--=20
> +1.9.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.=
bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> new file mode 100644
> index 0000000..ae5a9c6
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Gstreamer Daemon 1.0"
> +DESCRIPTION =3D "GStreamer framework for controlling audio and video s=
treaming using TCP connection messages"
> +HOMEPAGE =3D "https://developer.ridgerun.com/wiki/index.php?title=3DGs=
td-1.0"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> +
> +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugi=
ns-bad gstreamer1.0-rtsp-server json-glib libdaemon"
> +
> +SRCBRANCH ?=3D "master"
> +SRCREV =3D "097a086a8606dcb368c7d38c7ec4fefc2497401b"
> +SRC_URI =3D "git://github.com/RidgeRun/gstd-1.x.git;protocol=3Dhttps;b=
ranch=3D${SRCBRANCH} \
> +	   file://0001-gstd-yocto-compatibility.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS =3D " \
> +	--disable-gtk-doc \
> +"
> +
> +inherit autotools pkgconfig gettext
> +
> +do_configure() {
> +${S}/autogen.sh
> +oe_runconf
missing proper spacing.

- Armin
> +}



