Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OSQu0-0002aZ-7t
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 10:38:18 +0200
Received: by mail-bw0-f47.google.com with SMTP id 14so3349207bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=L4nMFv1ZH3ZwwLi9441rME9GlRE3P1nfYL/Fd0Pd0Dw=;
	b=bxCzXP4gRqJCPUSGOP2q+txtoiz9WpOOQoFPmMOR4PG4moByDzu0pgiay9htvlDxoG
	lOG6/gCIPF6P1mjff80bA1wnN/BQAQKyKJQqObY+dZqNgQJ/qN8ere0jzETlduX0P2ro
	A5PV8IlRnFpg5LEVWR0obgs4IORkj+0MEVNOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tYKeuFhJz8iNmgewRu9+dHkpUZCE4DgoEoDB6umgwIN3KIpkL6mW4XFt0G91aFJPEx
	gj7Ygu8xS1JhI00sA7v43ITsaCPyjvbZDlBKRjwTD9DiHWHOIQNe4u8b0qKj81+PF5f1
	IpmJBo+GV3+VpNbL4KS17QlL2E/yniUmfWR+M=
MIME-Version: 1.0
Received: by 10.204.162.138 with SMTP id v10mr1308250bkx.10.1277541219160; 
	Sat, 26 Jun 2010 01:33:39 -0700 (PDT)
Received: by 10.204.123.210 with HTTP; Sat, 26 Jun 2010 01:33:39 -0700 (PDT)
In-Reply-To: <1277468383-16679-5-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
	<1277468383-16679-5-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 26 Jun 2010 10:33:39 +0200
Message-ID: <AANLkTin7VyGfwah_fQiZB83OIu7tv5YTQOG8C-bLYtI9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/9] mesa-dri: remove old 7.0.3 and 6.5.2 relase using mesa-common-old.inc
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
X-List-Received-Date: Sat, 26 Jun 2010 08:38:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/25 Martin Jansa <martin.jansa@gmail.com>:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/mesa/files/fix-progs-makefile.patch | =A0 81 -----------------=
----------
> =A0recipes/mesa/files/mklib-cross.patch =A0 =A0 =A0 =A0| =A0 14 -----
> =A0recipes/mesa/files/mklib-rpath-link.patch =A0 | =A0 20 -------
> =A0recipes/mesa/mesa-common-old.inc =A0 =A0 =A0 =A0 =A0 =A0| =A0 15 -----
> =A0recipes/mesa/mesa-dri_6.5.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 44 ---=
-----------
> =A0recipes/mesa/mesa-dri_7.0.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 45 ---=
------------
> =A06 files changed, 0 insertions(+), 219 deletions(-)
> =A0delete mode 100644 recipes/mesa/files/fix-progs-makefile.patch
> =A0delete mode 100644 recipes/mesa/files/mklib-cross.patch
> =A0delete mode 100644 recipes/mesa/files/mklib-rpath-link.patch
> =A0delete mode 100644 recipes/mesa/mesa-common-old.inc
> =A0delete mode 100644 recipes/mesa/mesa-dri_6.5.2.bb
> =A0delete mode 100644 recipes/mesa/mesa-dri_7.0.3.bb
>
> diff --git a/recipes/mesa/files/fix-progs-makefile.patch b/recipes/mesa/f=
iles/fix-progs-makefile.patch
> deleted file mode 100644
> index f0a8293..0000000
> --- a/recipes/mesa/files/fix-progs-makefile.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From e03daf13a562414f07230c17998edd39564b5f1b Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Thu, 4 Mar 2010 14:16:27 +0100
> -Subject: [PATCH] fix libs
> -
> ----
> - progs/demos/Makefile =A0 | =A0 =A02 +-
> - progs/glsl/Makefile =A0 =A0| =A0 =A02 +-
> - progs/redbook/Makefile | =A0 =A02 +-
> - progs/samples/Makefile | =A0 =A02 +-
> - progs/xdemos/Makefile =A0| =A0 =A02 +-
> - 5 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/progs/demos/Makefile b/progs/demos/Makefile
> -index 5b1d2a0..121b862 100644
> ---- a/progs/demos/Makefile
> -+++ b/progs/demos/Makefile
> -@@ -8,7 +8,7 @@ INCDIR =3D $(TOP)/include
> - LIB_DEP =3D $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LI=
B_NAME) \
> - =A0 =A0 =A0 $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
> -
> --LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -=
l$(GL_LIB) \
> -+LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -=
l$(GL_LIB) -lstdc++ \
> - =A0 =A0 =A0 $(APP_LIB_DEPS)
> -
> - PROGS =3D \
> -diff --git a/progs/glsl/Makefile b/progs/glsl/Makefile
> -index 3b5a595..836c4ac 100644
> ---- a/progs/glsl/Makefile
> -+++ b/progs/glsl/Makefile
> -@@ -10,7 +10,7 @@ LIB_DEP =3D \
> - =A0 =A0 =A0 $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) \
> - =A0 =A0 =A0 $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
> -
> --LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) \
> -+LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -=
lstdc++ \
> - =A0 =A0 =A0 -l$(GL_LIB) $(APP_LIB_DEPS)
> -
> - # using : to avoid APP_CC pointing to CC loop
> -diff --git a/progs/redbook/Makefile b/progs/redbook/Makefile
> -index b41e488..95ed746 100644
> ---- a/progs/redbook/Makefile
> -+++ b/progs/redbook/Makefile
> -@@ -7,7 +7,7 @@ INCDIR =3D $(TOP)/include
> -
> - LIB_DEP =3D $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LI=
B_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
> -
> --LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -=
l$(GL_LIB) $(APP_LIB_DEPS)
> -+LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -=
l$(GL_LIB) -lstdc++ $(APP_LIB_DEPS)
> -
> - PROGS =3D aaindex \
> - =A0 =A0 =A0 aapoly \
> -diff --git a/progs/samples/Makefile b/progs/samples/Makefile
> -index 64fa47a..9f72c8b 100644
> ---- a/progs/samples/Makefile
> -+++ b/progs/samples/Makefile
> -@@ -7,7 +7,7 @@ INCDIR =3D $(TOP)/include
> -
> - LIB_DEP =3D $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LI=
B_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
> -
> --LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -=
l$(GL_LIB) $(APP_LIB_DEPS)
> -+LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -=
l$(GL_LIB) -lstdc++ $(APP_LIB_DEPS)
> -
> - PROGS =3D accum bitmap1 bitmap2 blendeq blendxor copy cursor depth eval=
 fog \
> - =A0 =A0 =A0 font line logo nurb olympic overlay point prim rgbtoppm qua=
d select \
> -diff --git a/progs/xdemos/Makefile b/progs/xdemos/Makefile
> -index f866a32..c0f4e06 100644
> ---- a/progs/xdemos/Makefile
> -+++ b/progs/xdemos/Makefile
> -@@ -11,7 +11,7 @@ LIB_DEP =3D $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME)
> - # Add X11 and pthread libs to satisfy GNU gold.
> - APP_LIB_DEPS +=3D -lX11 -lpthread
> -
> --LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) $(APP_LIB_DEPS)
> -+LIBS =3D -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) -lstdc++ $(APP_LIB_DEPS)
> -
> - PROGS =3D \
> - =A0 =A0 =A0 corender \
> ---
> -1.7.0
> -
> diff --git a/recipes/mesa/files/mklib-cross.patch b/recipes/mesa/files/mk=
lib-cross.patch
> deleted file mode 100644
> index fbe86e3..0000000
> --- a/recipes/mesa/files/mklib-cross.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> ---- s/bin/mklib~ =A0 =A0 =A0 2008-02-19 15:30:18.000000000 +0000
> -+++ s/bin/mklib =A0 =A0 =A0 =A02008-07-27 11:15:25.000000000 +0100
> -@@ -204,9 +204,9 @@
> - =A0 =A0 =A0 if [ "x$LINK" =3D "x" ] ; then
> - =A0 =A0 =A0 =A0 =A0 # -linker was not specified so set default link com=
mand now
> - =A0 =A0 =A0 =A0 =A0 =A0 if [ $CPLUSPLUS =3D 1 ] ; then
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3Dg++
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3D$CXX
> - =A0 =A0 =A0 =A0 =A0 =A0 else
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3Dgcc
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LINK=3D$CC
> - =A0 =A0 =A0 =A0 =A0 =A0 fi
> - =A0 =A0 =A0 fi
> -
> diff --git a/recipes/mesa/files/mklib-rpath-link.patch b/recipes/mesa/fil=
es/mklib-rpath-link.patch
> deleted file mode 100644
> index 07361f5..0000000
> --- a/recipes/mesa/files/mklib-rpath-link.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> ---- Mesa/bin/mklib.orig =A0 =A0 =A0 =A02006-06-04 20:56:22.000000000 -06=
00
> -+++ Mesa/bin/mklib =A0 =A0 2006-06-04 20:57:04.000000000 -0600
> -@@ -98,6 +98,9 @@
> - =A0 =A0 =A0 -L*)
> - =A0 =A0 =A0 =A0 =A0 DEPS=3D"$DEPS $1"
> - =A0 =A0 =A0 =A0 =A0 ;;
> -+ =A0 =A0 =A0-Wl*)
> -+ =A0 =A0 =A0 =A0 =A0DEPS=3D"$DEPS $1"
> -+ =A0 =A0 =A0 =A0 =A0;;
> - =A0 =A0 =A0 '-cplusplus')
> - =A0 =A0 =A0 =A0 =A0 CPLUSPLUS=3D1
> - =A0 =A0 =A0 =A0 =A0 ;;
> ---- Mesa/configs/default.orig =A02006-06-04 21:01:47.000000000 -0600
> -+++ Mesa/configs/default =A0 =A0 =A0 2006-06-04 21:01:16.000000000 -0600
> -@@ -71,4 +71,4 @@
> - GLU_LIB_DEPS =3D -L$(LIB_DIR) -l$(GL_LIB) -lm
> - GLUT_LIB_DEPS =3D -L$(LIB_DIR) -l$(GLU_LIB) -l$(GL_LIB) $(EXTRA_LIB_PAT=
H) -lX11 -lXmu -lXt -lXi -lm
> - GLW_LIB_DEPS =3D -L$(LIB_DIR) -l$(GL_LIB) $(EXTRA_LIB_PATH) -lXt -lX11
> --APP_LIB_DEPS =3D -L$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) -l=
m
> -+APP_LIB_DEPS =3D -L$(LIB_DIR) $(EXTRA_LIB_PATH) -l$(GLUT_LIB) -l$(GLU_L=
IB) -l$(GL_LIB) -lm
> diff --git a/recipes/mesa/mesa-common-old.inc b/recipes/mesa/mesa-common-=
old.inc
> deleted file mode 100644
> index 01f0adc..0000000
> --- a/recipes/mesa/mesa-common-old.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SECTION =3D "x11"
> -PE =3D "2"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 \
> - =A0 =A0 =A0 file://mklib-rpath-link.patch"
> -
> -S =3D "${WORKDIR}/Mesa-${PV}"
> -
> -PROVIDES =3D "virtual/libgl"
> -
> -LICENSE =3D "LGPL"
> -
> -INC_PR =3D "r3"
> -
> -DEPENDS =3D "makedepend-native xf86vidmodeproto glproto virtual/libx11 l=
ibxext libxxf86vm libxi libxmu libice"
> diff --git a/recipes/mesa/mesa-dri_6.5.2.bb b/recipes/mesa/mesa-dri_6.5.2=
.bb
> deleted file mode 100644
> index d8f9506..0000000
> --- a/recipes/mesa/mesa-dri_6.5.2.bb
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -include mesa-common-old.inc
> -
> -SRC_URI +=3D " file://mklib-cross.patch"
> -
> -FILESPATHPKG =3D. "mesa-${PV}:"
> -
> -PACKAGES_DYNAMIC =3D "mesa-dri-driver-*"
> -
> -PR =3D "${INC_PR}.1"
> -
> -DEPENDS +=3D "libdrm"
> -# DRI is useless without the kernel drivers
> -RRECOMMENDS_${PN} +=3D " kernel-module-drm kernel-module-radeon "
> -
> -do_configure() {
> - =A0 =A0 =A0 cd configs
> -
> - =A0 =A0 =A0 ln -sf linux-dri current
> - =A0 =A0 =A0 sed -e "s%CC *=3D *.*%CC =3D ${CC}%" -i current
> - =A0 =A0 =A0 sed -e "s%CXX *=3D *.*%CXX =3D ${CXX}%" -i current
> - =A0 =A0 =A0 sed -e "s%LD *=3D *.*%LD =3D ${LD}%" -i current
> - =A0 =A0 =A0 sed -e "s%OPT_FLAGS *=3D *.*%OPT_FLAGS =3D ${TARGET_CFLAGS}=
%" -i current
> - =A0 =A0 =A0 sed -e "s%X11_INCLUDES *=3D *.*%X11_INCLUDES =3D -I${STAGIN=
G_INCDIR}/X11%" -i current
> - =A0 =A0 =A0 sed -e "s%EXTRA_LIB_PATH *=3D *.*%EXTRA_LIB_PATH =3D ${LDFL=
AGS}%" -i current
> - =A0 =A0 =A0 sed -i s:\$\(CC\):gcc:g =A0../src/mesa/x86/Makefile
> - =A0 =A0 =A0 echo "SRC_DIRS =3D mesa" >> current
> - =A0 =A0 =A0 echo "DRI_DRIVER_INSTALL_DIR =3D ${D}${libdir}/dri" >> curr=
ent
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 oe_runmake -C src/mesa/drivers/dri install
> -}
> -
> -FILES_${PN}-dbg +=3D "${libdir}/dri/.debug"
> -
> -python populate_packages_prepend () {
> - =A0 =A0 =A0 =A0import re, os.path
> -
> - =A0 =A0 =A0 =A0do_split_packages(d, root=3Dbb.data.expand('${libdir}/dr=
i', d), file_regex=3D'(.*)_dri\.so', output_pattern=3D'mesa-dri-driver-%s',=
 description=3D'%s DRI driver', extra_depends=3D'')
> -}
> -
> -
> -SRC_URI[md5sum] =3D "e4d894181f1859651658b3704633e10d"
> -SRC_URI[sha256sum] =3D "137f50a30461d51eb9af5aac737bc788d536354cf47b2612=
9b97bde6e41fb85f"
> diff --git a/recipes/mesa/mesa-dri_7.0.3.bb b/recipes/mesa/mesa-dri_7.0.3=
.bb
> deleted file mode 100644
> index dcf6fd3..0000000
> --- a/recipes/mesa/mesa-dri_7.0.3.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -include mesa-common-old.inc
> -
> -# suppress mklib-rpath-link patch from mesa-common
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 file://m=
klib-cross.patch"
> -
> -FILESPATHPKG =3D. "mesa-${PV}:"
> -
> -PACKAGES_DYNAMIC =3D "mesa-dri-driver-*"
> -
> -PR =3D "${INC_PR}.1"
> -
> -DEPENDS +=3D "libdrm"
> -# DRI is useless without the kernel drivers
> -RRECOMMENDS_${PN} +=3D " kernel-module-drm kernel-module-radeon "
> -
> -do_configure() {
> - =A0 =A0 =A0 cd configs
> -
> - =A0 =A0 =A0 ln -sf linux-dri current
> - =A0 =A0 =A0 sed -e "s%CC *=3D *.*%CC =3D ${CC}%" -i current
> - =A0 =A0 =A0 sed -e "s%CXX *=3D *.*%CXX =3D ${CXX}%" -i current
> - =A0 =A0 =A0 sed -e "s%LD *=3D *.*%LD =3D ${LD}%" -i current
> - =A0 =A0 =A0 sed -e "s%OPT_FLAGS *=3D *.*%OPT_FLAGS =3D ${TARGET_CFLAGS}=
%" -i current
> - =A0 =A0 =A0 sed -e "s%X11_INCLUDES *=3D *.*%X11_INCLUDES =3D -I${STAGIN=
G_INCDIR}/X11%" -i current
> - =A0 =A0 =A0 sed -e "s%EXTRA_LIB_PATH *=3D *.*%EXTRA_LIB_PATH =3D ${LDFL=
AGS}%" -i current
> - =A0 =A0 =A0 sed -i s:\$\(CC\):gcc:g =A0../src/mesa/x86/Makefile
> - =A0 =A0 =A0 echo "SRC_DIRS =3D mesa" >> current
> - =A0 =A0 =A0 echo "DRI_DRIVER_INSTALL_DIR =3D ${D}${libdir}/dri" >> curr=
ent
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 oe_runmake -C src/mesa/drivers/dri install
> -}
> -
> -FILES_${PN}-dbg +=3D "${libdir}/dri/.debug"
> -
> -python populate_packages_prepend () {
> - =A0 =A0 =A0 =A0import re, os.path
> -
> - =A0 =A0 =A0 =A0do_split_packages(d, root=3Dbb.data.expand('${libdir}/dr=
i', d), file_regex=3D'(.*)_dri\.so', output_pattern=3D'mesa-dri-driver-%s',=
 description=3D'%s DRI driver', extra_depends=3D'')
> -}
> -
> -
> -SRC_URI[md5sum] =3D "e6e6379d7793af40a6bc3ce1bace572e"
> -SRC_URI[sha256sum] =3D "ebdf3448eac8abb56bbfc0b7c015efce8e5d88f10ee3123d=
cc62c1ff47b62d22"
> --
> 1.7.0.2
>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


