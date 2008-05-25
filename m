Received: from [80.243.163.21] (helo=smtpgw01.world4you.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <treitmayr@devbase.at>) id 1K0EYk-0006DH-B7
	for openembedded-devel@openembedded.org; Sun, 25 May 2008 13:38:42 +0200
Received: from [85.127.157.54] (helo=[192.168.1.76])
	by smtpgw01.world4you.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.67) (envelope-from <treitmayr@devbase.at>)
	id 1K0EVd-0007LK-Ep
	for openembedded-devel@openembedded.org; Sun, 25 May 2008 13:35:34 +0200
From: Thomas Reitmayr <treitmayr@devbase.at>
To: openembedded-devel@openembedded.org
In-Reply-To: <1211714256.6764.5.camel@localhost>
References: <1211714256.6764.5.camel@localhost>
Date: Sun, 25 May 2008 13:35:29 +0200
Message-Id: <1211715329.6764.8.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
X-SA-Exim-Connect-IP: 85.127.157.54
X-SA-Exim-Mail-From: treitmayr@devbase.at
X-Spam-Checker-Version: SpamAssassin 3.2.4 (2008-01-01) on
	smtpgw01.world4you.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=6.0 tests=ALL_TRUSTED
	autolearn=disabled version=3.2.4
X-SA-Exim-Version: 4.2.1 (built Sun, 22 Apr 2007 12:05:39 +0200)
X-SA-Exim-Scanned: Yes (on smtpgw01.world4you.com)
Subject: Re: patch for speex_1.2-beta3.bb and linphone_1.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 25 May 2008 11:38:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

FYI, I created the Bugs 4307 and 4308 for tracking these issues.
-Thomas

Am Sonntag, den 25.05.2008, 13:17 +0200 schrieb Thomas Reitmayr:
> Hi,
> I noticed that linphone 1.6.0 does not build with the most recent speex
> library anymore. I found a gentoo patch from which the one below is
> derived. Also the speex recipe has to be modified in order to install
> the libspeexdsp library.
> Please review and apply if it looks ok.
> Regards,
> -Thomas
> 
> speex-bb.patch
> ==============
> #
> # old_revision [2d32c4a3ada0c940227e778e5080900811813513]
> #
> # patch "packages/speex/speex_1.2-beta3.bb"
> #  from [6319f43f5ea5d3f197ff50ea3901c6dc91a66773]
> #    to [00a36fc4859ab95fe4f001ba0afd29901a9c6dfc]
> #
> ============================================================
> --- packages/speex/speex_1.2-beta3.bb	6319f43f5ea5d3f197ff50ea3901c6dc91a66773
> +++ packages/speex/speex_1.2-beta3.bb	00a36fc4859ab95fe4f001ba0afd29901a9c6dfc
> @@ -1,9 +1,9 @@ DEPENDS = "libogg"
>  DESCRIPTION = "Speex is an Open Source/Free Software patent-free audio compression format designed for speech."
>  SECTION = "libs"
>  LICENSE = "BSD"
>  HOMEPAGE = "http://www.speex.org"
>  DEPENDS = "libogg"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2beta3.tar.gz"
>  S = "${WORKDIR}/${PN}-1.2beta3"
> @@ -37,6 +37,7 @@ do_stage() {
>  
>  do_stage() {
>  	oe_libinstall -C libspeex -so libspeex ${STAGING_LIBDIR}
> +	oe_libinstall -C libspeex -so libspeexdsp ${STAGING_LIBDIR}
>  	install -d ${STAGING_INCDIR}/speex
>  	install -m 0644 include/speex/*.h ${STAGING_INCDIR}/speex
>  	install -m 0644 speex.m4 ${STAGING_DATADIR}/aclocal/
> ============================================================
> 
> 
> linphone-1.6.0.patch
> ====================
> diff -Nur packages/linphone/files/config-mediastreamer.patch packages/linphone-new/files/config-mediastreamer.patch
> --- packages/linphone/files/config-mediastreamer.patch	1970-01-01 01:00:00.000000000 +0100
> +++ packages/linphone-new/files/config-mediastreamer.patch	2008-05-25 12:34:44.000000000 +0200
> @@ -0,0 +1,29 @@
> +--- linphone-1.6.0/mediastreamer2/configure.ac.org	2008-05-25 12:25:03.000000000 +0200
> ++++ linphone-1.6.0/mediastreamer2/configure.ac	2008-05-25 12:26:20.000000000 +0200
> +@@ -258,9 +258,15 @@
> + 	[try_other_speex=yes]
> + )
> + PKG_CHECK_MODULES(SPEEX, speex >= 1.1.6, build_speex=yes)
> ++AM_CONDITIONAL(BUILD_SPEEX, test x$build_speex = xyes )
> ++
> + AC_SUBST(SPEEX_CFLAGS)
> + AC_SUBST(SPEEX_LIBS)
> +-AM_CONDITIONAL(BUILD_SPEEX, test x$build_speex = xyes )
> ++
> ++PKG_CHECK_MODULES(SPEEXDSP, speexdsp, build_speexdsp=yes, build_speexdsp=no)
> ++
> ++AC_SUBST(SPEEXDSP_CFLAGS)
> ++AC_SUBST(SPEEXDSP_LIBS)
> + 
> + dnl check for gsm
> + AC_ARG_WITH( gsm,
> +--- linphone-1.6.0/mediastreamer2/src/Makefile.am.org	2008-05-25 12:29:41.000000000 +0200
> ++++ linphone-1.6.0/mediastreamer2/src/Makefile.am	2008-05-25 12:30:03.000000000 +0200
> +@@ -87,6 +87,7 @@
> + 				$(ALSA_LIBS) \
> + 				$(ARTS_LIBS) \
> + 				$(SPEEX_LIBS) \
> ++				$(SPEEXDSP_LIBS) \
> + 				$(GSM_LIBS) \
> + 				$(THEORA_LIBS)
> + 
> diff -Nur packages/linphone/linphone_1.6.0.bb packages/linphone-new/linphone_1.6.0.bb
> --- packages/linphone/linphone_1.6.0.bb	2008-05-25 12:54:35.000000000 +0200
> +++ packages/linphone-new/linphone_1.6.0.bb	2008-05-25 12:52:29.000000000 +0200
> @@ -18,10 +18,11 @@
>  
>  PROVIDES += "linphone linphonec liblinphone"
>  
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "http://download.savannah.nongnu.org/releases/linphone/1.6.x/sources/linphone-${PV}.tar.gz \
> -           http://download.devbase.at/voip/linphone-1.6.0-pl0.patch;patch=1"
> +           http://download.devbase.at/voip/linphone-1.6.0-pl0.patch;patch=1 \
> +           file://config-mediastreamer.patch;patch=1"
>  
>  S = "${WORKDIR}/linphone-${PV}"
>  
> ============================================================
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



