Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id 697CE71E12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 08:37:15 +0000 (UTC)
Received: from nbhjo (36-225-57-150.dynamic-ip.hinet.net [36.225.57.150])
	by msfrf2603.sfr.fr (SMTP Server) with ESMTP id 2626A1C000421
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 09:37:14 +0100 (CET)
Received: from nbhjo (36-225-57-150.dynamic-ip.hinet.net
	[36.225.57.150])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2603.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 09:37:12 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
References: <1484831267-76876-1-git-send-email-herve.jourdain@neuf.fr>
	<CAMKF1spnG0SjdGk8rb8oR4G__vdj5xhdDdMTDw_bgtBkYr4W7A@mail.gmail.com>
In-Reply-To: <CAMKF1spnG0SjdGk8rb8oR4G__vdj5xhdDdMTDw_bgtBkYr4W7A@mail.gmail.com>
Date: Fri, 20 Jan 2017 09:37:06 +0100
Message-ID: <008f01d272f8$64cfc6c0$2e6f5440$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQIY1yKFu/CZdx0jMPjKqKBEIcNN5wN83tqWoJhaGLA=
X-sfr-mailing: LEGIT
Subject: Re: ***SPAM*** Re: [meta-qt5][PATCH] Minor improvements: configure complains it can't find oe-device-extra.pri, and add libxkbcommon in the dependencies
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
X-List-Received-Date: Fri, 20 Jan 2017 08:37:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi Khem,

It seems not, since I disabled X11. Only libxkbcommon is needed, and it
doesn't pull the whole X11 AFAIK.

Cheers,
Herve

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Khem
Raj
Sent: vendredi 20 janvier 2017 07:52
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: ***SPAM*** Re: [oe] [meta-qt5][PATCH] Minor improvements: configure
complains it can't find oe-device-extra.pri, and add libxkbcommon in the
dependencies

On Thu, Jan 19, 2017 at 5:07 AM, Herve Jourdain <herve.jourdain@neuf.fr>
wrote:
> During configure, it complains it can't find oe-device-extra.pri, but it
doesn't result in any error. Fix it, though, just in case.
> In qtwayland, xkb should be optional, but it's not for the moment, so add
it to the dependencies.

Does this also mean that now we need to enable x11 along with wayland for
distro features ?

>
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  recipes-qt/qt5/qtbase_git.bb    | 3 +++
>  recipes-qt/qt5/qtwayland_git.bb | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb 
> b/recipes-qt/qt5/qtbase_git.bb index 6541973..258c7ed 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -173,6 +173,9 @@ do_configure() {
>          ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
>      fi
>
> +    # Avoid qmake error "Cannot read
[...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
during configuration
> +    touch ${S}/mkspecs/oe-device-extra.pri
> +
>      ${S}/configure -v \
>          -opensource -confirm-license \
>          -sysroot ${STAGING_DIR_TARGET} \ diff --git 
> a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb 
> index e315924..51421d5 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = " \
>
>  #FIXME: xkb should be optional; we add it here to fix the build error
without it
>  #       (https://bugreports.qt.io/browse/QTBUG-54851)
> +DEPENDS += "libxkbcommon"
>  PACKAGECONFIG ?= " \
>      compositor-api \
>      wayland-egl \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


