Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2WcL-0000dq-5H
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 00:38:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2012 15:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122820594"
Received: from unknown (HELO helios.localnet) ([10.252.123.82])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2012 15:29:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 23:29:29 +0000
Message-ID: <10009618.BkDii0CkQl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1330458726-7562-1-git-send-email-raj.khem@gmail.com>
References: <1330458726-7562-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-opie][PATCH] meta-opie: Fix quoting errors found by latest bitbake
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
X-List-Received-Date: Tue, 28 Feb 2012 23:38:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 February 2012 11:52:06 Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../opie-irdaapplet/opie-irdaapplet_git.bb         |    2 +-
>  recipes-opie/opie-reader/uqtreader_1.2.5.bb        |    2 +-
>  recipes-opie/opie-reader/uqtreader_git.bb          |    2 +-
>  recipes-qtopia/qpegps/qpegps.inc                   |    2 +-
>  recipes-qtopia/scummvm/scummvm_1.1.1.bb            |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb
> b/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb index
> 7af53fb..dffc2b9 100644
> --- a/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb
> +++ b/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb
> @@ -1,7 +1,7 @@
>  require ${PN}.inc
> 
>  PV = "${OPIE_GIT_PV}"
> -PR = r3
> +PR = "r3"
> 
>  SRC_URI = "${OPIE_GIT};protocol=git;subpath=core/applets/irdaapplet \
>             ${OPIE_GIT};protocol=git;subpath=pics \
> diff --git a/recipes-opie/opie-reader/uqtreader_1.2.5.bb
> b/recipes-opie/opie-reader/uqtreader_1.2.5.bb index ec70e15..73dfae4 100644
> --- a/recipes-opie/opie-reader/uqtreader_1.2.5.bb
> +++ b/recipes-opie/opie-reader/uqtreader_1.2.5.bb
> @@ -66,7 +66,7 @@ FILES_${PN}-codeclib = "${libdir}/libreader_codec.so.*"
>  FILES_${PN}-codec-aportis = "${libdir}/uqtreader/codecs/libAportis.so"
>  FILES_${PN}-codec-arrierego = "${libdir}/uqtreader/codecs/libArriereGo.so"
>  FILES_${PN}-codec-chm = "${libdir}/uqtreader/codecs/libCHM.so"
> -DEBIAN_NOAUTONAME_${PN}-codec-plucker = 1
> +DEBIAN_NOAUTONAME_${PN}-codec-plucker = "1"
>  FILES_${PN}-codec-plucker = "${libdir}/uqtreader/codecs/libPlucker.so
> ${libdir}/lib*plucker*.so.*
> ${libdir}/uqtreader/support/libpluckerdecompress.so" FILES_${PN}-codec-reb
> = "${libdir}/uqtreader/codecs/libReb.so"
>  FILES_${PN}-codec-weasel = "${libdir}/uqtreader/codecs/libWeasel.so"
> diff --git a/recipes-opie/opie-reader/uqtreader_git.bb
> b/recipes-opie/opie-reader/uqtreader_git.bb index ad6c223..019d8c0 100644
> --- a/recipes-opie/opie-reader/uqtreader_git.bb
> +++ b/recipes-opie/opie-reader/uqtreader_git.bb
> @@ -62,7 +62,7 @@ FILES_${PN}-codeclib = "${libdir}/libreader_codec.so.*"
>  FILES_${PN}-codec-aportis = "${libdir}/uqtreader/codecs/libAportis.so"
>  FILES_${PN}-codec-arrierego = "${libdir}/uqtreader/codecs/libArriereGo.so"
>  FILES_${PN}-codec-chm = "${libdir}/uqtreader/codecs/libCHM.so"
> -DEBIAN_NOAUTONAME_${PN}-codec-plucker = 1
> +DEBIAN_NOAUTONAME_${PN}-codec-plucker = "1"
>  FILES_${PN}-codec-plucker = "${libdir}/uqtreader/codecs/libPlucker.so
> ${libdir}/lib*plucker*.so.*
> ${libdir}/uqtreader/support/libpluckerdecompress.so" FILES_${PN}-codec-reb
> = "${libdir}/uqtreader/codecs/libReb.so"
>  FILES_${PN}-codec-weasel = "${libdir}/uqtreader/codecs/libWeasel.so"
> diff --git a/recipes-qtopia/qpegps/qpegps.inc
> b/recipes-qtopia/qpegps/qpegps.inc index 8292915..6dd0767 100644
> --- a/recipes-qtopia/qpegps/qpegps.inc
> +++ b/recipes-qtopia/qpegps/qpegps.inc
> @@ -18,7 +18,7 @@ inherit palmtop
>  QMAKE_PROFILES = "qpegps.pro"
>  EXTRA_QMAKEVARS_POST = "LIBS=-lqpe LIBS+=-lgps"
>  OE_QMAKE_CFLAGS += " -DQWS "
> -OE_QMAKE_LIBS_QT = ${QT_LIBRARY}
> +OE_QMAKE_LIBS_QT = "${QT_LIBRARY}"
> 
>  do_install() {
>          install -d ${D}${palmtopdir}/bin \
> diff --git a/recipes-qtopia/scummvm/scummvm_1.1.1.bb
> b/recipes-qtopia/scummvm/scummvm_1.1.1.bb index 90fc136..fba22d5 100644
> --- a/recipes-qtopia/scummvm/scummvm_1.1.1.bb
> +++ b/recipes-qtopia/scummvm/scummvm_1.1.1.bb
> @@ -15,7 +15,7 @@ SRC_URI_OVERRIDES_PACKAGE_ARCH = "1"
> 
>  # Make this a plugin enabled build. Bigger binary, less memory usage. Makes
> more games run on lower end platforms. # These plugins are not normal Linux
> shared libs so will fall foul of the sanity checker. -INSANE_SKIP_${PN} =
> True
> +INSANE_SKIP_${PN} = "1"
>  EXTRA_OECONF += " --enable-plugins --default-dynamic "
> 
>  # Workaround, because some env variables aren't recognised correctly

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


