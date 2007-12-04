Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1IzddU-0002Zy-LT
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2007 20:40:53 +0100
Received: by wa-out-1112.google.com with SMTP id l24so7098283waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2007 11:37:17 -0800 (PST)
Received: by 10.114.57.1 with SMTP id f1mr1173567waa.1196797037791;
	Tue, 04 Dec 2007 11:37:17 -0800 (PST)
Received: by 10.115.15.3 with HTTP; Tue, 4 Dec 2007 11:37:17 -0800 (PST)
Message-ID: <bdb0025f0712041137t3312e6b7l518ef813b9eab943@mail.gmail.com>
Date: Tue, 4 Dec 2007 16:37:17 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Iywhd-0003TY-4R@linuxtogo.org>
MIME-Version: 1.0
References: <E1Iywhd-0003TY-4R@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev directfb : Update include file paths so that directfb-examples builds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2007 19:40:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I didn't understand why to change the includedir and
internalincludedir of directfb...

The standard of directfb is includedir/directfb/ and changing it all
others packages that depends on directfb will break...

On Dec 2, 2007 6:50 PM, sakoman commit
<openembedded-commits@lists.openembedded.org> wrote:
> directfb : Update include file paths so that directfb-examples builds.
>
> Author: sakoman@gmail.com
> Branch: org.openembedded.dev
> Revision: b1610df18b4d8070f056d9621c7826cf30b62bca
> ViewMTN: http://monotone.openembedded.org/revision/info/b1610df18b4d8070f056d9621c7826cf30b62bca
> Files:
> 1
> packages/directfb/files/fix-configure-include-path.patch
> packages/directfb/directfb-examples_1.0.0.bb
> packages/directfb/directfb_1.1.0.bb
> Diffs:
>
> #
> # mt diff -r5c78b2077c12b748ddbcb3eac965642d2d89c95c -rb1610df18b4d8070f056d9621c7826cf30b62bca
> #
> #
> #
> # add_file "packages/directfb/files/fix-configure-include-path.patch"
> #  content [95a5712b69ed26362c0a8e8e8624e9b05fb506b2]
> #
> # patch "packages/directfb/directfb-examples_1.0.0.bb"
> #  from [88c9cc59f32b02ec4cd0c0f876b204399b265bdf]
> #    to [1905769a0ea0cc18c68ea7969adaa55fe65ad9aa]
> #
> # patch "packages/directfb/directfb_1.1.0.bb"
> #  from [c9da95fb956d450af0c360a3364023c960f9d1af]
> #    to [1af7bf22ffbfcbc869a08e6664c2dde2ff16c7d2]
> #
> ============================================================
> --- packages/directfb/files/fix-configure-include-path.patch    95a5712b69ed26362c0a8e8e8624e9b05fb506b2
> +++ packages/directfb/files/fix-configure-include-path.patch    95a5712b69ed26362c0a8e8e8624e9b05fb506b2
> @@ -0,0 +1,13 @@
> +--- DirectFB-1.1.0/configure.in-orig   2007-08-27 00:07:00.000000000 -0700
> ++++ DirectFB-1.1.0/configure.in        2007-11-26 12:05:52.000000000 -0800
> +@@ -1380,8 +1380,8 @@
> +
> + MODULEDIR=$libdir/$MODULEDIRNAME
> + DATADIR=$datadir/directfb-$VERSION
> +-INCLUDEDIR=$includedir/directfb
> +-INTERNALINCLUDEDIR=$includedir/directfb-internal
> ++INCLUDEDIR=$includedir/
> ++INTERNALINCLUDEDIR=$includedir/
> +
> + SOPATH=$libdir/libdirectfb-$LT_RELEASE.so.$LT_CURRENT
> + AC_SUBST(SOPATH)
> ============================================================
> --- packages/directfb/directfb-examples_1.0.0.bb        88c9cc59f32b02ec4cd0c0f876b204399b265bdf
> +++ packages/directfb/directfb-examples_1.0.0.bb        1905769a0ea0cc18c68ea7969adaa55fe65ad9aa
> @@ -1,10 +1,12 @@ LICENSE = "GPL"
>  DESCRIPTION = "DirectFB extra providers"
>  DEPENDS = "directfb"
>  SECTION = "libs"
>  LICENSE = "GPL"
>
> -SRC_URI = "http://www.directfb.org/downloads/Extras/DirectFB-extra-${PV}.tar.gz"
> -S = "${WORKDIR}/DirectFB-extra-${PV}"
> +SRC_URI = " \
> +           http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
> +          "
> +S = "${WORKDIR}/DirectFB-examples-${PV}"
>
>  inherit autotools
>
> ============================================================
> --- packages/directfb/directfb_1.1.0.bb c9da95fb956d450af0c360a3364023c960f9d1af
> +++ packages/directfb/directfb_1.1.0.bb 1af7bf22ffbfcbc869a08e6664c2dde2ff16c7d2
> @@ -10,12 +10,15 @@ RV = "1.1-0"
>  PR = "r1"
>  RV = "1.1-0"
>
> -SRC_URI = "http://www.directfb.org/download/DirectFB/DirectFB-${PV}.tar.gz \
> -           file://fix-pkgconfig-cflags.patch;patch=1 \
> -          file://fix-font-missing-char.patch;patch=1 \
> -           file://getpagesize.patch;patch=1 \
> -           file://fix-includes.patch;patch=1 \
> -          file://mkdfiff.patch;patch=1"
> +SRC_URI = " \
> +    http://www.directfb.org/download/DirectFB/DirectFB-${PV}.tar.gz \
> +    file://fix-configure-include-path.patch;patch=1 \
> +    file://fix-pkgconfig-cflags.patch;patch=1 \
> +    file://fix-font-missing-char.patch;patch=1 \
> +    file://getpagesize.patch;patch=1 \
> +    file://fix-includes.patch;patch=1 \
> +    file://mkdfiff.patch;patch=1 \
> +   "
>
>  S = "${WORKDIR}/DirectFB-${PV}"
>
> @@ -23,11 +26,12 @@ inherit autotools pkgconfig
>
>  inherit autotools pkgconfig
>
> -EXTRA_OECONF = "--with-gfxdrivers=none \
> +EXTRA_OECONF = " \
> +    --with-gfxdrivers=none \
>                 --enable-libmpeg3=no \
>                 --enable-freetype=yes \
>                 --enable-sdl=no \
> -               --enable-vnc=no \
> +               --enable-vnc=no \
>                 --disable-x11 \
>                 "
>
>
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


