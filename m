Return-Path: <joe@deserted.net>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id AB5C06FB54
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 02:18:07 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tp5so6687839ieb.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 19:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=S47HfvWtRkC4m8F54fMxgdCmuKKl3EUvVB3JWmoPZoo=;
	b=SUHQ4xCfOSMulTyUp2tlDNTthesC5U0Btv5OC1Y4fJ79znJ7cz3zwBQHhGxGSF4gUW
	teZjFuoExwgU+O2v8I6iJXpn5tql+IMorSkf38zlb6JlUqx1YgbMYFE6v6sa+RbHNxOE
	Y7a9eKtHvwH+K9k7LBgchVoAz8o/+G/mTlEpPY0/eWFTbxygE82WJmdDmaRGfHokMt24
	QaB0klDfPuOy69iMYalyovB9JgJ26lZ+y50ikbKAXFXqNNBARY3CUL2u/Vt8TXtB1zs7
	HeDCJwMFLCJ/d8Z/qv92xkhwzwxWK1zf7+7dzP4BzcL1uZBcVeQD6WB62FHAPVeYK9QF
	9p3Q==
X-Gm-Message-State: ALoCoQlGo9p5BXOVZlRfM0zwJpInF5SfvB8jQ9bMNvo90EnUgAe3AJXGL4dgJB7wl5112EJ+znxF
MIME-Version: 1.0
X-Received: by 10.50.79.201 with SMTP id l9mr1104451igx.11.1401848288024; Tue,
	03 Jun 2014 19:18:08 -0700 (PDT)
Sender: joe@deserted.net
Received: by 10.42.81.130 with HTTP; Tue, 3 Jun 2014 19:18:07 -0700 (PDT)
In-Reply-To: <1401205819-21761-1-git-send-email-maxim.uvarov@linaro.org>
References: <1401205819-21761-1-git-send-email-maxim.uvarov@linaro.org>
Date: Tue, 3 Jun 2014 22:18:07 -0400
X-Google-Sender-Auth: GVaad73yd5mInCLMWT4vINarfMM
Message-ID: <CANBf+V1depAiMFbO_StvwWTGFzH=K-Co5UKN6Wu2VsnwLJLHtA@mail.gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] update snort to 2.9.6.0
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
X-List-Received-Date: Wed, 04 Jun 2014 02:18:07 -0000
Content-Type: text/plain; charset=UTF-8

Merged, thanks.
-J.

On Tue, May 27, 2014 at 11:50 AM, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> 1. looks like snort dropped reference to barnyard2. At least it's missing in configure.
> Also download link to barnyard2 is not available now. Drop this package.
> 2. update snort version from 2.9.4.6 to 2.9.6.0.
> 3. fix libdnet paths.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  .../barnyard2-1.8/barnyard2-cross-fix.patch        | 24 ----------------------
>  .../barnyard2/barnyard2_1.8.bb                     | 18 ----------------
>  .../snort/{snort_2.9.4.6.bb => snort_2.9.6.0.bb}   |  8 ++++----
>  3 files changed, 4 insertions(+), 46 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>  delete mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
>  rename meta-networking/recipes-connectivity/snort/{snort_2.9.4.6.bb => snort_2.9.6.0.bb} (89%)
>
> diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch b/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
> deleted file mode 100644
> index 7b5a60c..0000000
> --- a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: barnyard2-1.8/configure.in
> -===================================================================
> ---- barnyard2-1.8.orig/configure.in    2010-08-03 15:12:06.000000000 +0400
> -+++ barnyard2-1.8/configure.in 2010-08-03 15:13:46.000000000 +0400
> -@@ -73,7 +73,7 @@
> -     # libpcap doesn't even LOOK at the timeout you give it under Linux
> -     AC_DEFINE([PCAP_TIMEOUT_IGNORED],[1],[Define if pcap timeout is ignored])
> -     AC_SUBST(extra_incl)
> --    extra_incl="-I/usr/include/pcap"
> -+    extra_incl="-I=/usr/include/pcap"
> -     ;;
> -   *-hpux10*|*-hpux11*)
> -     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
> -@@ -230,7 +230,7 @@
> - # In case INADDR_NONE is not defined (like on Solaris)
> - have_inaddr_none="no"
> - AC_MSG_CHECKING([for INADDR_NONE])
> --AC_RUN_IFELSE(
> -+AC_COMPILE_IFELSE(
> - [AC_LANG_PROGRAM(
> - [[
> - #include <sys/types.h>
> diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
> deleted file mode 100644
> index 14acdac..0000000
> --- a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "Barnyard2 is a fork of the original barnyard project, designed specifically for Snort's new unified2 file format"
> -HOMEPAGE = "http://www.securixlive.com/barnyard2/"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> -DEPENDS = "libpcap"
> -
> -SRC_URI = " \
> -       http://www.securixlive.com/download/barnyard2/${BP}.tar.gz \
> -       file://barnyard2-cross-fix.patch \
> -       "
> -SRC_URI[md5sum] = "72fc6c490db6ea6a0f46c27d24998067"
> -SRC_URI[sha256sum] = "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF = "--enable-prelude --enable-gre --without-mysql"
> -
> -CONFFILES_${PN} = "${sysconfdir}/barnyard2.conf"
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> similarity index 89%
> rename from meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> rename to meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> index acb1b1a..aba2850 100644
> --- a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> @@ -13,8 +13,8 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
>              file://0001-libpcap-search-sysroot-for-headers.patch \
>  "
>
> -SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd"
> -SRC_URI[tarball.sha256sum] = "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc"
> +SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
> +SRC_URI[tarball.sha256sum] = "3cc6c8a9b52f4c863a5736a73b4012aff340b50b5e002771b04d4877f47cd19e"
>
>  inherit autotools  gettext  update-rc.d
>
> @@ -28,6 +28,8 @@ EXTRA_OECONF = " \
>         --enable-reload-error-restart \
>         --enable-targetbased \
>         --disable-static-daq \
> +       --with-dnet-includes=${STAGING_INCDIR} \
> +       --with-dnet-libraries=${STAGING_LIBDIR} \
>         "
>
>  do_install_append() {
> @@ -69,5 +71,3 @@ FILES_${PN}-dev += " \
>         ${libdir}/snort_dynamicrules/*.so \
>         ${prefix}/src/snort_dynamicsrc \
>         "
> -
> -RRECOMMENDS_${PN} += "barnyard2"
> --
> 1.8.5.1.163.gd7aced9
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

