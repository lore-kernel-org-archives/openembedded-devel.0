Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqJN-0002Y9-1g
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:57:30 +0100
Received: by pzk12 with SMTP id 12so261104pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=gQwWrVi6iO6lg6TEhnlF+yonFrZf8Xl6rjZGkzq8TKY=;
	b=VFw/Wz7aHU5Usrd1yllMUlsPOX6hwCX+mVPnkCmUVyyri1WV+bTCVq0DAPx6KNtSRo
	VV1jdhe9eJQSfD9vuX4uUjauVWeiPGNYQf9ELvcxDhEiHFsONkM+pfeU4FFhbAiouIn2
	BHqnB6yh9ELWjGpfqaxGFAFx66XrRKBB0I/bs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=cpxkPzS7nA30ahzsbLsfDWm3ldkUcMfGQPhQcOAusTyter4J4JYAta1K6Cggtfjb5F
	4F3D40hzPjXBCmepwjfmBXUNB9otPclIOpSEJ8GlztFpwg7xT52ueT79sDeL0zHxK7Ny
	l9o6ujSZCYHnkH6oz1w45RswIRHySVvaw2YAY=
Received: by 10.142.13.16 with SMTP id 16mr917421wfm.373.1297896975996;
	Wed, 16 Feb 2011 14:56:15 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm59247wfl.11.2011.02.16.14.56.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:56:14 -0800 (PST)
Date: Wed, 16 Feb 2011 14:56:17 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216225617.GJ14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-4-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1297852433-31160-4-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 04/10] gnokii: remove old recipes
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
X-List-Received-Date: Wed, 16 Feb 2011 22:57:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/02/11 11:33), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/gnokii/gnokii/configure.patch |   21 ---------------------
>  recipes/gnokii/gnokii_0.6.14.bb       |   29 -----------------------------
>  recipes/gnokii/gnokii_0.6.4.bb        |   31 -------------------------------
>  3 files changed, 0 insertions(+), 81 deletions(-)
>  delete mode 100644 recipes/gnokii/gnokii/configure.patch
>  delete mode 100644 recipes/gnokii/gnokii_0.6.14.bb
>  delete mode 100644 recipes/gnokii/gnokii_0.6.4.bb
> 
> diff --git a/recipes/gnokii/gnokii/configure.patch b/recipes/gnokii/gnokii/configure.patch
> deleted file mode 100644
> index 0cc3cb4..0000000
> --- a/recipes/gnokii/gnokii/configure.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> ---- gnokii-0.6.4/configure.in.old	2005-01-09 20:15:53.000000000 +0000
> -+++ gnokii-0.6.4/configure.in	2005-01-09 20:15:55.000000000 +0000
> -@@ -379,11 +379,16 @@
> -       AC_MSG_WARN(Cannot find library libX11.)
> -       AC_MSG_WARN(Disabling xgnokii.)
> -    else
> -+      if test "x$x_libraries" != "x"; then
> -+          l_x_libraries="-L$x_libraries"
> -+      else
> -+          l_x_libraries=""
> -+      fi
> -       AC_CHECK_LIB(Xpm, XpmWriteFileFromXpmImage,
> --            [ XPM_CFLAGS="$XINCL" XPM_LIBS="-L$x_libraries -lXpm -lX11"
> -+            [ XPM_CFLAGS="$XINCL" XPM_LIBS="$l_x_libraries -lXpm -lX11"
> -               AC_DEFINE(XPM) ],
> -             AC_MSG_WARN(Cannot found library libXpm - disabling XPM support.),
> --            [ -L$x_libraries -lX11 ]
> -+            [ $l_x_libraries -lX11 ]
> -       )
> - 
> -       if test "x$PTHREAD_LIBS" = xerror; then
> diff --git a/recipes/gnokii/gnokii_0.6.14.bb b/recipes/gnokii/gnokii_0.6.14.bb
> deleted file mode 100644
> index f3e968a..0000000
> --- a/recipes/gnokii/gnokii_0.6.14.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -LICENSE = "GPL"
> -DESCRIPTION = "Cellphone tools and driver software"
> -SRC_URI = "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-${PV}.tar.bz2 \
> -	file://configure.patch"
> -
> -DEPENDS = "libxpm gtk+"
> -
> -inherit autotools pkgconfig
> -
> -PARALLEL_MAKE = ""
> -
> -PACKAGES += "libgnokii libgnokii-dev"
> -
> -FILES_${PN} = "${bindir} ${sbindir}"
> -FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> -	        /lib/*.a /lib/*.o ${datadir}/aclocal"
> -FILES_${PN}-dev = ""
> -FILES_libgnokii = "${libdir}/libgnokii.so.*"
> -
> -do_stage() {
> -	autotools_stage_includes
> -
> -	oe_libinstall -C common -so libgnokii ${STAGING_LIBDIR}
> -}
> -
> -
> -SRC_URI[md5sum] = "89449d613c7a7e765a0d8da57ef1bb88"
> -SRC_URI[sha256sum] = "cea63cddf79864d306198c7a84091af0b4685816b352ae253a3e2bfac5e67cb7"
> diff --git a/recipes/gnokii/gnokii_0.6.4.bb b/recipes/gnokii/gnokii_0.6.4.bb
> deleted file mode 100644
> index 2389980..0000000
> --- a/recipes/gnokii/gnokii_0.6.4.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -LICENSE = "GPL"
> -DESCRIPTION = "Cellphone tools and driver software"
> -SRC_URI = "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-${PV}.tar.bz2 \
> -	file://configure.patch"
> -
> -DEPENDS = "libxpm"
> -
> -inherit autotools pkgconfig
> -
> -PACKAGES += "libgnokii libgnokii-dev"
> -
> -FILES_${PN} = "${bindir} ${sbindir}"
> -FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> -	        /lib/*.a /lib/*.o ${datadir}/aclocal"
> -FILES_${PN}-dev = ""
> -FILES_libgnokii = "${libdir}/libgnokii.so.*"
> -
> -do_compile_prepend() {
> -	sed -i s:foo::g Makefile.global
> -}
> -
> -do_stage() {
> -	autotools_stage_includes
> -
> -	oe_libinstall -C common -so libgnokii ${STAGING_LIBDIR}
> -}
> -
> -
> -SRC_URI[md5sum] = "7f2a8cee97e62ebfa284363dc93b3178"
> -SRC_URI[sha256sum] = "9605f7aee1b8d58cac10dd514c2bdfa340089d85b149db828816d18ac3ebaff8"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


