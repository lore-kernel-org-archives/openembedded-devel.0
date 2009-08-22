Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MeteV-0006Jr-UH
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 18:41:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 83F1651B1F2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 12:23:44 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10395-09 for <openembedded-devel@lists.openembedded.org>; 
	Sat, 22 Aug 2009 12:23:44 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5EFFE494472
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 12:23:44 -0400 (EDT)
Date: Sat, 22 Aug 2009 12:23:44 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247540261-4537-2-git-send-email-msmith@cbnco.com>
Message-ID: <Pine.LNX.4.64.0908221223240.3621@juice.ott.cti.com>
References: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
	<1247540261-4537-2-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/4] mesa-dri: set PACKAGE_ARCH to ${MACHINE}
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
X-List-Received-Date: Sat, 22 Aug 2009 16:41:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

OK to commit?

On Mon, 13 Jul 2009, Michael Smith wrote:

> ${MACHINE_DRI_MODULES} is passed to configure, so the package output
> depends on MACHINE. As foretold by commit f06119fc :)
> 
> Also switch to INC_PR and fix built of mesa-xprogs when prefix != /usr.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/mesa/mesa-common.inc |   10 +++++++++-
>  recipes/mesa/mesa-dri_7.2.bb |    7 +------
>  recipes/mesa/mesa-dri_7.4.bb |    7 +------
>  recipes/mesa/mesa-dri_git.bb |    3 +--
>  4 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/recipes/mesa/mesa-common.inc b/recipes/mesa/mesa-common.inc
> index 9cd10eb..4f18c2f 100644
> --- a/recipes/mesa/mesa-common.inc
> +++ b/recipes/mesa/mesa-common.inc
> @@ -4,6 +4,8 @@ DESCRIPTION = "An open source implementation of the OpenGL spec"
>  HOMEPAGE = "http://mesa3d.org"
>  LICENSE = "MIT"
>  
> +INC_PR = "r7"
> +
>  SRC_URI = "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 \
>             ${SOURCEFORGE_MIRROR}/mesa3d/MesaDemos-${PV}.tar.bz2 "
>  S = "${WORKDIR}/Mesa-${PV}"
> @@ -20,6 +22,9 @@ EXTRA_OECONF = "--enable-glu \
>  require mesa-tls.inc
>  EXTRA_OECONF += "${@get_tls_setting(bb, d)} "
>  
> +# Package contents vary according to ${MACHINE_DRI_MODULES}.
> +PACKAGE_ARCH = "${MACHINE}"
> +
>  PACKAGES =+ "libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
>  FILES_libgl = "${libdir}/libGL.so.*"
>  FILES_libglu = "${libdir}/libGLU.so.*"
> @@ -36,4 +41,7 @@ do_stage() {
>  		cp -pPr ${S}/include/GL/internal* ${STAGING_INCDIR}/GL/
>  }
>  
> -
> +do_install_append () {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/${bindir}
> +}
> diff --git a/recipes/mesa/mesa-dri_7.2.bb b/recipes/mesa/mesa-dri_7.2.bb
> index 296a254..9356843 100644
> --- a/recipes/mesa/mesa-dri_7.2.bb
> +++ b/recipes/mesa/mesa-dri_7.2.bb
> @@ -6,7 +6,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
>  DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
>  
>  PE = "1"
> -PR = "r6"
> +PR = "${INC_PR}.0"
>  
>  # most of our targets do not have DRI so will use mesa-xlib
>  DEFAULT_PREFERENCE = "-1"
> @@ -21,8 +21,3 @@ FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
>  FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
>  
>  EXTRA_OECONF += "--with-driver=dri --with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
> -
> -do_install_append () {
> -    install -d ${D}/usr/bin
> -    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
> -}
> diff --git a/recipes/mesa/mesa-dri_7.4.bb b/recipes/mesa/mesa-dri_7.4.bb
> index 296a254..9356843 100644
> --- a/recipes/mesa/mesa-dri_7.4.bb
> +++ b/recipes/mesa/mesa-dri_7.4.bb
> @@ -6,7 +6,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
>  DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
>  
>  PE = "1"
> -PR = "r6"
> +PR = "${INC_PR}.0"
>  
>  # most of our targets do not have DRI so will use mesa-xlib
>  DEFAULT_PREFERENCE = "-1"
> @@ -21,8 +21,3 @@ FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
>  FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
>  
>  EXTRA_OECONF += "--with-driver=dri --with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
> -
> -do_install_append () {
> -    install -d ${D}/usr/bin
> -    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
> -}
> diff --git a/recipes/mesa/mesa-dri_git.bb b/recipes/mesa/mesa-dri_git.bb
> index bca681c..4ca1b73 100644
> --- a/recipes/mesa/mesa-dri_git.bb
> +++ b/recipes/mesa/mesa-dri_git.bb
> @@ -6,7 +6,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
>  DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
>  
>  PV = "7.2+gitr${SRCREV}"
> -PR = "r1"
> +PR = "${INC_PR}.0"
>  PE = "1"
>  
>  DEFAULT_PREFERENCE = "-1"
> @@ -18,4 +18,3 @@ FILES_${PN} += "${libdir}/dri/*.so"
>  FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
>  
>  EXTRA_OECONF += "--with-driver=dri --with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
> -
> -- 
> 1.6.3
> 


