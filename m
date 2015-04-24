Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6C742605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 12:42:15 +0000 (UTC)
Received: by widdi4 with SMTP id di4so20492768wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=3w0cXuTxSfrUgsisZ4n1VimqM8P9rLgih8B+1Ccmft8=;
	b=kNRRCamoRuWSpHYmvFeVGYk2Z28rilQuigY5Jx8uAOvKf+UK6KfA6shlGvPdioSuwQ
	dntZ3l3aHa1RC3V0+gfAp4VXOTyb51GxhknlgSVmbQX/qpg79UMn1SGgEkfWIA98OGc0
	k4bmL6xpS4FdppvD8jQ6yaSF32g1HkIemH58IIbMQpHLvhs8MG8jxrdaxOqJKubalrFR
	zS9+NPOBWnmXh5jDsSYvyDY/1dAwT0ekacpR33DSAjJMxt0SNJmfRzO5veGOHCw4PKGJ
	fBdUzhdquFbwlwXZ2zLiZ+8kCAp9sJG6YtxSkrnZDfU8T4QrQx4bD+U8SXrnbMB5nm2J
	x16A==
X-Received: by 10.194.23.66 with SMTP id k2mr15222811wjf.18.1429879336840;
	Fri, 24 Apr 2015 05:42:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id q4sm16772706wja.24.2015.04.24.05.42.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Apr 2015 05:42:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 Apr 2015 14:42:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150424124250.GB2353@jama>
References: <1429602522-22676-1-git-send-email-etienne.cordonnier@streamunlimited.com>
MIME-Version: 1.0
In-Reply-To: <1429602522-22676-1-git-send-email-etienne.cordonnier@streamunlimited.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-multimedia][PATCH] cdparanoia: add new recipe
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
X-List-Received-Date: Fri, 24 Apr 2015 12:42:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2015 at 09:48:42AM +0200, Etienne Cordonnier wrote:
> This library is required by the gstreamer plugin cdparanoia.
>=20
> Signed-off-by: Etienne Cordonnier <etienne.cordonnier@streamunlimited.com>
> ---
>  .../recipes-support/cdparanoia/cdparanoia_10.2.bb  |  25 +
>  ...0001-Use-DESTDIR-in-install-Makefile-rule.patch |  70 +++
>  .../0002-interface-remove-C-reserved-keyword.patch | 605 +++++++++++++++=
++++++
>  3 files changed, 700 insertions(+)
>  create mode 100644 meta-multimedia/recipes-support/cdparanoia/cdparanoia=
_10.2.bb
>  create mode 100644 meta-multimedia/recipes-support/cdparanoia/files/0001=
-Use-DESTDIR-in-install-Makefile-rule.patch
>  create mode 100644 meta-multimedia/recipes-support/cdparanoia/files/0002=
-interface-remove-C-reserved-keyword.patch
>=20
> diff --git a/meta-multimedia/recipes-support/cdparanoia/cdparanoia_10.2.b=
b b/meta-multimedia/recipes-support/cdparanoia/cdparanoia_10.2.bb
> new file mode 100644
> index 0000000..27321ac
> --- /dev/null
> +++ b/meta-multimedia/recipes-support/cdparanoia/cdparanoia_10.2.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "cdparanoia library"
> +DESCRIPTION =3D "library used to read audio CDs, which is able to perfor=
m \
> +error corrections, hence the name paranoia."
> +HOMEPAGE =3D "https://www.xiph.org/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING-LGPL;md5=3Dd370feaa1c9edcdbd29ca27e=
a3d2304d"
> +
> +SRC_URI =3D "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-II=
I-${PV}.src.tgz \
> +			file://0001-Use-DESTDIR-in-install-Makefile-rule.patch \
> +			file://0002-interface-remove-C-reserved-keyword.patch \
> +"
> +SRC_URI[md5sum] =3D "b304bbe8ab63373924a744eac9ebc652"
> +SRC_URI[sha256sum] =3D "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c=
50df902a55fe64df"
> +
> +# Uppercase letters are not allowed in the recipe name, thus the recipe =
can not be named cdparanoia-III and
> +# we need to add the path to the extracted sources explicitely:
> +S =3D "${WORKDIR}/cdparanoia-III-${PV}"
> +
> +# cdparanoia Makefile can not be used with several threads (because the =
static library target and the shared
> +# library target use object files which are compiled in the same directo=
ry, the object files are just removed
> +# between the compilation of those two targets)
> +PARALLEL_MAKE =3D ""
> +

This fails to install, I guess it's missing dependencies or autotools-broke=
nsep

ERROR: Function failed: do_install (log file is located at /home/jenkins/oe=
/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/cdparanoia/10.2-r0/t=
emp/log.do_install.11491)
NOTE: Running noexec task 28179 of 31883 (ID: 6626, /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-networking/recipes-support/traceroute/trace=
route_2.0.21.bb, do_build)
NOTE: Running task 28180 of 31883 (ID: 6627, /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2=
=2E0.21.bb, do_rm_work)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5e-oe-linux-gnueabi/cdparanoia/10.2-r0/temp/log.do_install.114=
91
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'co=
mmon-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_install
| NOTE: make DESTDIR=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5=
e-oe-linux-gnueabi/cdparanoia/10.2-r0/image install
| install -d -m 0755 /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-=
oe-linux-gnueabi/cdparanoia/10.2-r0/image/usr/bin
| install -m 755 /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/cdparanoia/10.2-r0/cdparanoia-III-10.2/cdparanoia /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/cdparanoia/10.2-=
r0/image/usr/bin
| install: cannot stat `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv=
5e-oe-linux-gnueabi/cdparanoia/10.2-r0/cdparanoia-III-10.2/cdparanoia': No =
such file or directory
| make: *** [install] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/cdparanoia/10.2-r0=
/temp/log.do_install.11491)
NOTE: recipe cdparanoia-10.2-r0: task do_install: Failed
ERROR: Task 7325 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-mu=
ltimedia/recipes-support/cdparanoia/cdparanoia_10.2.bb, do_install) failed =
with exit code '1'

> +inherit autotools
> diff --git a/meta-multimedia/recipes-support/cdparanoia/files/0001-Use-DE=
STDIR-in-install-Makefile-rule.patch b/meta-multimedia/recipes-support/cdpa=
ranoia/files/0001-Use-DESTDIR-in-install-Makefile-rule.patch
> new file mode 100644
> index 0000000..7b08300
> --- /dev/null
> +++ b/meta-multimedia/recipes-support/cdparanoia/files/0001-Use-DESTDIR-i=
n-install-Makefile-rule.patch
> @@ -0,0 +1,70 @@
> +From 97c06ae955b270851f4fd2396c715f9c76591f37 Mon Sep 17 00:00:00 2001
> +From: Etienne Cordonnier <etienne.cordonnier@streamunlimited.com>
> +Date: Thu, 2 Apr 2015 10:15:08 +0200
> +Subject: [PATCH] Use DESTDIR in "install" Makefile rule
> +
> +This change allows to perform installations in a sysroot folder, which i=
s required e.g. by
> +the recipes inheriting yocto autotool class, and is an autotool standard:
> +make install DESTDIR=3D~/mysysroot
> +
> +Upstream-Status: Inappropriate (the upstream project is dead)
> +
> +Signed-off-by: Etienne Cordonnier <etienne.cordonnier@streamunlimited.co=
m>
> +---
> + Makefile.in | 36 ++++++++++++++++++------------------
> + 1 file changed, 18 insertions(+), 18 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 3d235ad..df544c7 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -63,28 +63,28 @@ slib:
> + 	cd paranoia && $(MAKE) slib
> +=20
> + install:
> +-	$(INSTALL) -d -m 0755 $(BINDIR)
> +-	$(INSTALL) -m 755 $(srcdir)/cdparanoia $(BINDIR)
> +-	$(INSTALL) -d -m 0755 $(MANDIR)
> +-	$(INSTALL) -d -m 0755 $(MANDIR)/man1
> +-	$(INSTALL) -m 0644 $(srcdir)/cdparanoia.1 $(MANDIR)/man1
> +-	$(INSTALL) -d -m 0755 $(INCLUDEDIR)
> +-	$(INSTALL) -m 0644 $(srcdir)/paranoia/cdda_paranoia.h $(INCLUDEDIR)
> +-	$(INSTALL) -d -m 0755 $(LIBDIR)
> +-	$(INSTALL) -m 0644 $(srcdir)/paranoia/libcdda_paranoia.so.0.$(VERSION)=
 $(LIBDIR)
> +-	$(INSTALL) -m 0644 $(srcdir)/paranoia/libcdda_paranoia.a $(LIBDIR)
> +-	$(INSTALL) -m 0644 $(srcdir)/interface/cdda_interface.h $(INCLUDEDIR)
> +-	$(INSTALL) -m 0644 $(srcdir)/interface/libcdda_interface.so.0.$(VERSIO=
N) $(LIBDIR)
> +-	$(INSTALL) -m 0644 $(srcdir)/interface/libcdda_interface.a $(LIBDIR)
> +-	$(INSTALL) -m 0644 $(srcdir)/utils.h $(INCLUDEDIR)
> ++	$(INSTALL) -d -m 0755 $(DESTDIR)$(BINDIR)
> ++	$(INSTALL) -m 755 $(srcdir)/cdparanoia $(DESTDIR)$(BINDIR)
> ++	$(INSTALL) -d -m 0755 $(DESTDIR)$(MANDIR)
> ++	$(INSTALL) -d -m 0755 $(DESTDIR)$(MANDIR)/man1
> ++	$(INSTALL) -m 0644 $(srcdir)/cdparanoia.1 $(DESTDIR)$(MANDIR)/man1
> ++	$(INSTALL) -d -m 0755 $(DESTDIR)$(INCLUDEDIR)
> ++	$(INSTALL) -m 0644 $(srcdir)/paranoia/cdda_paranoia.h $(DESTDIR)$(INCL=
UDEDIR)
> ++	$(INSTALL) -d -m 0755 $(DESTDIR)$(LIBDIR)
> ++	$(INSTALL) -m 0644 $(srcdir)/paranoia/libcdda_paranoia.so.0.$(VERSION)=
 $(DESTDIR)$(LIBDIR)
> ++	$(INSTALL) -m 0644 $(srcdir)/paranoia/libcdda_paranoia.a $(DESTDIR)$(L=
IBDIR)
> ++	$(INSTALL) -m 0644 $(srcdir)/interface/cdda_interface.h $(DESTDIR)$(IN=
CLUDEDIR)
> ++	$(INSTALL) -m 0644 $(srcdir)/interface/libcdda_interface.so.0.$(VERSIO=
N) $(DESTDIR)$(LIBDIR)
> ++	$(INSTALL) -m 0644 $(srcdir)/interface/libcdda_interface.a $(DESTDIR)$=
(LIBDIR)
> ++	$(INSTALL) -m 0644 $(srcdir)/utils.h $(DESTDIR)$(INCLUDEDIR)
> + 	ln -fs libcdda_interface.so.0.$(VERSION) \
> +-		$(LIBDIR)/libcdda_interface.so.0
> ++		$(DESTDIR)$(LIBDIR)/libcdda_interface.so.0
> + 	ln -fs libcdda_interface.so.0.$(VERSION) \
> +-		$(LIBDIR)/libcdda_interface.so
> ++		$(DESTDIR)$(LIBDIR)/libcdda_interface.so
> + 	ln -fs libcdda_paranoia.so.0.$(VERSION) \
> +-		$(LIBDIR)/libcdda_paranoia.so.0
> ++		$(DESTDIR)$(LIBDIR)/libcdda_paranoia.so.0
> + 	ln -fs libcdda_paranoia.so.0.$(VERSION) \
> +-		$(LIBDIR)/libcdda_paranoia.so
> ++		$(DESTDIR)$(LIBDIR)/libcdda_paranoia.so
> +=20
> + cdparanoia:	$(OFILES) $(LIBDEP)
> + 		$(LD) $(CFLAGS) $(LDFLAGS) $(OFILES) \
> +--=20
> +1.9.1
> +
> diff --git a/meta-multimedia/recipes-support/cdparanoia/files/0002-interf=
ace-remove-C-reserved-keyword.patch b/meta-multimedia/recipes-support/cdpar=
anoia/files/0002-interface-remove-C-reserved-keyword.patch
> new file mode 100644
> index 0000000..a5600a1
> --- /dev/null
> +++ b/meta-multimedia/recipes-support/cdparanoia/files/0002-interface-rem=
ove-C-reserved-keyword.patch
> @@ -0,0 +1,605 @@
> +From 12ea28398f8e5d4a4a23c62d511fc4f53584e51d Mon Sep 17 00:00:00 2001
> +From: Etienne Cordonnier <etienne.cordonnier@streamunlimited.com>
> +Date: Tue, 7 Apr 2015 11:07:56 +0200
> +Subject: [PATCH] interface: remove C++ reserved keyword
> +
> +Because "private" was used in cdda_interface.h, this header file could n=
ot be
> +compiled in C++.
> +
> +Upstream-Status: Inappropriate (the upstream project is dead)
> +
> +Signed-off-by: Etienne Cordonnier <etienne.cordonnier@streamunlimited.co=
m>
> +---
> + interface/cdda_interface.h   |   2 +-
> + interface/cooked_interface.c |   8 +--
> + interface/interface.c        |   8 +--
> + interface/scan_devices.c     |  22 ++++----
> + interface/scsi_interface.c   | 128 +++++++++++++++++++++---------------=
-------
> + interface/test_interface.c   |   4 +-
> + 6 files changed, 86 insertions(+), 86 deletions(-)
> +
> +diff --git a/interface/cdda_interface.h b/interface/cdda_interface.h
> +index 8487cb7..b738825 100644
> +--- a/interface/cdda_interface.h
> ++++ b/interface/cdda_interface.h
> +@@ -84,7 +84,7 @@ typedef struct cdrom_drive{
> +   int is_atapi;
> +   int is_mmc;
> +=20
> +-  cdda_private_data_t *private;
> ++  cdda_private_data_t *priv; /* private is a C++ reserved keyword */
> +   void         *reserved;
> +   unsigned char inqbytes[4];
> +=20
> +diff --git a/interface/cooked_interface.c b/interface/cooked_interface.c
> +index de29055..ea9d0fc 100644
> +--- a/interface/cooked_interface.c
> ++++ b/interface/cooked_interface.c
> +@@ -13,13 +13,13 @@
> + static int timed_ioctl(cdrom_drive *d, int fd, int command, void *arg){
> +   struct timespec tv1;
> +   struct timespec tv2;
> +-  int ret1=3Dclock_gettime(d->private->clock,&tv1);
> ++  int ret1=3Dclock_gettime(d->priv->clock,&tv1);
> +   int ret2=3Dioctl(fd, command,arg);
> +-  int ret3=3Dclock_gettime(d->private->clock,&tv2);
> ++  int ret3=3Dclock_gettime(d->priv->clock,&tv2);
> +   if(ret1<0 || ret3<0){
> +-    d->private->last_milliseconds=3D-1;
> ++    d->priv->last_milliseconds=3D-1;
> +   }else{
> +-    d->private->last_milliseconds =3D (tv2.tv_sec-tv1.tv_sec)*1000. + (=
tv2.tv_nsec-tv1.tv_nsec)/1000000.;
> ++    d->priv->last_milliseconds =3D (tv2.tv_sec-tv1.tv_sec)*1000. + (tv2=
=2Etv_nsec-tv1.tv_nsec)/1000000.;
> +   }
> +   return ret2;
> + }
> +diff --git a/interface/interface.c b/interface/interface.c
> +index e8a90cd..526c2a9 100644
> +--- a/interface/interface.c
> ++++ b/interface/interface.c
> +@@ -39,9 +39,9 @@ int cdda_close(cdrom_drive *d){
> +     if(d->drive_model)free(d->drive_model);
> +     if(d->cdda_fd!=3D-1)close(d->cdda_fd);
> +     if(d->ioctl_fd!=3D-1 && d->ioctl_fd!=3Dd->cdda_fd)close(d->ioctl_fd=
);
> +-    if(d->private){
> +-      if(d->private->sg_hd)free(d->private->sg_hd);
> +-      free(d->private);
> ++    if(d->priv){
> ++      if(d->priv->sg_hd)free(d->priv->sg_hd);
> ++      free(d->priv);
> +     }
> +=20
> +     free(d);
> +@@ -127,7 +127,7 @@ long cdda_read_timed(cdrom_drive *d, void *buffer, l=
ong beginsector, long sector
> + 	}
> +       }=09
> +     }
> +-    if(ms)*ms=3Dd->private->last_milliseconds;
> ++    if(ms)*ms=3Dd->priv->last_milliseconds;
> +     return(sectors);
> +   }
> +  =20
> +diff --git a/interface/scan_devices.c b/interface/scan_devices.c
> +index fc58110..5f6c4e3 100644
> +--- a/interface/scan_devices.c
> ++++ b/interface/scan_devices.c
> +@@ -264,11 +264,11 @@ cdrom_drive *cdda_identify_cooked(const char *dev,=
 int messagedest,
> +   d->interface=3DCOOKED_IOCTL;
> +   d->bigendianp=3D-1; /* We don't know yet... */
> +   d->nsectors=3D-1;
> +-  d->private=3Dcalloc(1,sizeof(*d->private));
> ++  d->priv=3Dcalloc(1,sizeof(*d->priv));
> +   {
> +     /* goddamnit */
> +     struct timespec tv;
> +-    d->private->clock=3D(clock_gettime(CLOCK_MONOTONIC,&tv)<0?CLOCK_REA=
LTIME:CLOCK_MONOTONIC);
> ++    d->priv->clock=3D(clock_gettime(CLOCK_MONOTONIC,&tv)<0?CLOCK_REALTI=
ME:CLOCK_MONOTONIC);
> +   }
> +   idmessage(messagedest,messages,"\t\tCDROM sensed: %s\n",description);
> +   return(d);
> +@@ -674,15 +674,15 @@ cdrom_drive *cdda_identify_scsi(const char *generi=
c_device,
> +   d->bigendianp=3D-1; /* We don't know yet... */
> +   d->nsectors=3D-1;
> +   d->messagedest =3D messagedest;
> +-  d->private=3Dcalloc(1,sizeof(*d->private));
> ++  d->priv=3Dcalloc(1,sizeof(*d->priv));
> +   {
> +     /* goddamnit */
> +     struct timespec tv;
> +-    d->private->clock=3D(clock_gettime(CLOCK_MONOTONIC,&tv)<0?CLOCK_REA=
LTIME:CLOCK_MONOTONIC);
> ++    d->priv->clock=3D(clock_gettime(CLOCK_MONOTONIC,&tv)<0?CLOCK_REALTI=
ME:CLOCK_MONOTONIC);
> +   }
> +   if(use_sgio){
> +     d->interface=3DSGIO_SCSI;
> +-    d->private->sg_buffer=3D(unsigned char *)(d->private->sg_hd=3Dmallo=
c(MAX_BIG_BUFF_SIZE));
> ++    d->priv->sg_buffer=3D(unsigned char *)(d->priv->sg_hd=3Dmalloc(MAX_=
BIG_BUFF_SIZE));
> +     g_fd=3Dd->cdda_fd=3Ddup(d->ioctl_fd);
> +   }else{
> +     version=3Dverify_SG_version(d,messagedest,messages);
> +@@ -696,8 +696,8 @@ cdrom_drive *cdda_identify_scsi(const char *generic_=
device,
> +     }
> +=20
> +     /* malloc our big buffer for scsi commands */
> +-    d->private->sg_hd=3Dmalloc(MAX_BIG_BUFF_SIZE);
> +-    d->private->sg_buffer=3D((unsigned char *)d->private->sg_hd)+SG_OFF;
> ++    d->priv->sg_hd=3Dmalloc(MAX_BIG_BUFF_SIZE);
> ++    d->priv->sg_buffer=3D((unsigned char *)d->priv->sg_hd)+SG_OFF;
> +   }
> +=20
> +   {
> +@@ -772,9 +772,9 @@ cdda_identify_scsi_fail:
> +   if(i_fd!=3D-1)close(i_fd);
> +   if(g_fd!=3D-1)close(g_fd);
> +   if(d){
> +-    if(d->private){
> +-      if(d->private->sg_hd)free(d->private->sg_hd);
> +-      free(d->private);
> ++    if(d->priv){
> ++      if(d->priv->sg_hd)free(d->priv->sg_hd);
> ++      free(d->priv);
> +     }
> +     free(d);
> +   }
> +@@ -821,7 +821,7 @@ cdrom_drive *cdda_identify_test(const char *filename=
, int messagedest,
> +   d->interface=3DTEST_INTERFACE;
> +   d->bigendianp=3D-1; /* We don't know yet... */
> +   d->nsectors=3D-1;
> +-  d->private=3Dcalloc(1,sizeof(*d->private));
> ++  d->priv=3Dcalloc(1,sizeof(*d->priv));
> +   d->drive_model=3Dcopystring("File based test interface");
> +   idmessage(messagedest,messages,"\t\tCDROM sensed: %s\n",d->drive_mode=
l);
> +  =20
> +diff --git a/interface/scsi_interface.c b/interface/scsi_interface.c
> +index adbb9bf..75d90d4 100644
> +--- a/interface/scsi_interface.c
> ++++ b/interface/scsi_interface.c
> +@@ -15,13 +15,13 @@
> + static int timed_ioctl(cdrom_drive *d, int fd, int command, void *arg){
> +   struct timespec tv1;
> +   struct timespec tv2;
> +-  int ret1=3Dclock_gettime(d->private->clock,&tv1);
> ++  int ret1=3Dclock_gettime(d->priv->clock,&tv1);
> +   int ret2=3Dioctl(fd, command,arg);
> +-  int ret3=3Dclock_gettime(d->private->clock,&tv2);
> ++  int ret3=3Dclock_gettime(d->priv->clock,&tv2);
> +   if(ret1<0 || ret3<0){
> +-    d->private->last_milliseconds=3D-1;
> ++    d->priv->last_milliseconds=3D-1;
> +   }else{
> +-    d->private->last_milliseconds =3D (tv2.tv_sec-tv1.tv_sec)*1000. + (=
tv2.tv_nsec-tv1.tv_nsec)/1000000.;
> ++    d->priv->last_milliseconds =3D (tv2.tv_sec-tv1.tv_sec)*1000. + (tv2=
=2Etv_nsec-tv1.tv_nsec)/1000000.;
> +   }
> +   return ret2;
> + }
> +@@ -96,7 +96,7 @@ static void tweak_SG_buffer(cdrom_drive *d) {
> + static void clear_garbage(cdrom_drive *d){
> +   fd_set fdset;
> +   struct timeval tv;
> +-  struct sg_header *sg_hd=3Dd->private->sg_hd;
> ++  struct sg_header *sg_hd=3Dd->priv->sg_hd;
> +   int flag=3D0;
> +=20
> +   /* clear out any possibly preexisting garbage */
> +@@ -185,7 +185,7 @@ static int sg2_handle_scsi_cmd(cdrom_drive *d,
> +   struct timespec tv2;
> +   int tret1,tret2;
> +   int status =3D 0;
> +-  struct sg_header *sg_hd=3Dd->private->sg_hd;
> ++  struct sg_header *sg_hd=3Dd->priv->sg_hd;
> +   long writebytes=3DSG_OFF+cmd_len+in_size;
> +=20
> +   /* generic scsi device services */
> +@@ -195,7 +195,7 @@ static int sg2_handle_scsi_cmd(cdrom_drive *d,
> +=20
> +   memset(sg_hd,0,sizeof(sg_hd));=20
> +   memset(sense_buffer,0,SG_MAX_SENSE);=20
> +-  memcpy(d->private->sg_buffer,cmd,cmd_len+in_size);
> ++  memcpy(d->priv->sg_buffer,cmd,cmd_len+in_size);
> +   sg_hd->twelve_byte =3D cmd_len =3D=3D 12;
> +   sg_hd->result =3D 0;
> +   sg_hd->reply_len =3D SG_OFF + out_size;
> +@@ -209,7 +209,7 @@ static int sg2_handle_scsi_cmd(cdrom_drive *d,
> +      tell if the command failed.  Scared yet? */
> +=20
> +   if(bytecheck && out_size>in_size){
> +-    memset(d->private->sg_buffer+cmd_len+in_size,bytefill,out_size-in_s=
ize);=20
> ++    memset(d->priv->sg_buffer+cmd_len+in_size,bytefill,out_size-in_size=
);=20
> +     /* the size does not remove cmd_len due to the way the kernel
> +        driver copies buffers */
> +     writebytes+=3D(out_size-in_size);
> +@@ -243,7 +243,7 @@ static int sg2_handle_scsi_cmd(cdrom_drive *d,
> +   }
> +=20
> +   sigprocmask (SIG_BLOCK, &(d->sigset), NULL );
> +-  tret1=3Dclock_gettime(d->private->clock,&tv1); =20
> ++  tret1=3Dclock_gettime(d->priv->clock,&tv1); =20
> +   errno=3D0;
> +   status =3D write(d->cdda_fd, sg_hd, writebytes );
> +=20
> +@@ -289,7 +289,7 @@ static int sg2_handle_scsi_cmd(cdrom_drive *d,
> +     }
> +   }
> +=20
> +-  tret2=3Dclock_gettime(d->private->clock,&tv2); =20
> ++  tret2=3Dclock_gettime(d->priv->clock,&tv2); =20
> +   errno=3D0;
> +   status =3D read(d->cdda_fd, sg_hd, SG_OFF + out_size);
> +   sigprocmask ( SIG_UNBLOCK, &(d->sigset), NULL );
> +@@ -313,7 +313,7 @@ static int sg2_handle_scsi_cmd(cdrom_drive *d,
> +   if(bytecheck && in_size+cmd_len<out_size){
> +     long i,flag=3D0;
> +     for(i=3Din_size;i<out_size;i++)
> +-      if(d->private->sg_buffer[i]!=3Dbytefill){
> ++      if(d->priv->sg_buffer[i]!=3Dbytefill){
> + 	flag=3D1;
> + 	break;
> +       }
> +@@ -326,9 +326,9 @@ static int sg2_handle_scsi_cmd(cdrom_drive *d,
> +=20
> +   errno=3D0;
> +   if(tret1<0 || tret2<0){
> +-    d->private->last_milliseconds=3D-1;
> ++    d->priv->last_milliseconds=3D-1;
> +   }else{
> +-    d->private->last_milliseconds =3D (tv2.tv_sec-tv1.tv_sec)*1000 + (t=
v2.tv_nsec-tv1.tv_nsec)/1000000;
> ++    d->priv->last_milliseconds =3D (tv2.tv_sec-tv1.tv_sec)*1000 + (tv2.=
tv_nsec-tv1.tv_nsec)/1000000;
> +   }
> +   return(0);
> + }
> +@@ -347,7 +347,7 @@ static int sgio_handle_scsi_cmd(cdrom_drive *d,
> +=20
> +   memset(&hdr,0,sizeof(hdr));
> +   memset(sense,0,sizeof(sense));
> +-  memcpy(d->private->sg_buffer,cmd+cmd_len,in_size);
> ++  memcpy(d->priv->sg_buffer,cmd+cmd_len,in_size);
> +=20
> +   hdr.cmdp =3D cmd;
> +   hdr.cmd_len =3D cmd_len;
> +@@ -355,7 +355,7 @@ static int sgio_handle_scsi_cmd(cdrom_drive *d,
> +   hdr.mx_sb_len =3D SG_MAX_SENSE;
> +   hdr.timeout =3D 50000;
> +   hdr.interface_id =3D 'S';
> +-  hdr.dxferp =3D  d->private->sg_buffer;
> ++  hdr.dxferp =3D  d->priv->sg_buffer;
> +   hdr.flags =3D SG_FLAG_DIRECT_IO;  /* direct IO if we can get it */
> +=20
> +   /* scary buffer fill hack */
> +@@ -400,7 +400,7 @@ static int sgio_handle_scsi_cmd(cdrom_drive *d,
> +   if(bytecheck && in_size<out_size){
> +     long i,flag=3D0;
> +     for(i=3Din_size;i<out_size;i++)
> +-      if(d->private->sg_buffer[i]!=3Dbytefill){
> ++      if(d->priv->sg_buffer[i]!=3Dbytefill){
> + 	flag=3D1;
> + 	break;
> +       }
> +@@ -412,7 +412,7 @@ static int sgio_handle_scsi_cmd(cdrom_drive *d,
> +   }
> +=20
> +   /* Can't rely on .duration because we can't be certain kernel has HZ =
set to something useful */
> +-  /* d->private->last_milliseconds =3D hdr.duration; */
> ++  /* d->priv->last_milliseconds =3D hdr.duration; */
> +=20
> +   errno =3D 0;
> +   return 0;
> +@@ -445,9 +445,9 @@ static int test_unit_ready(cdrom_drive *d){
> +=20
> +   handle_scsi_cmd(d, cmd, 6, 0, 56, 0,0, sense);
> +=20
> +-  key =3D d->private->sg_buffer[2] & 0xf;
> +-  ASC =3D d->private->sg_buffer[12];
> +-  ASCQ =3D d->private->sg_buffer[13];
> ++  key =3D d->priv->sg_buffer[2] & 0xf;
> ++  ASC =3D d->priv->sg_buffer[12];
> ++  ASCQ =3D d->priv->sg_buffer[13];
> +  =20
> +   if(key =3D=3D 2 && ASC =3D=3D 4 && ASCQ =3D=3D 1) return 0;
> +   return 1;
> +@@ -492,7 +492,7 @@ static int mode_sense_atapi(cdrom_drive *d,int size,=
int page){
> +   if (handle_scsi_cmd (d, cmd, 10, 0, size+4,'\377',1,sense)) return(1);
> +=20
> +   {
> +-    unsigned char *b=3Dd->private->sg_buffer;
> ++    unsigned char *b=3Dd->priv->sg_buffer;
> +     if(b[0])return(1); /* Handles only up to 256 bytes */
> +     if(b[6])return(1); /* Handles only up to 256 bytes */
> +=20
> +@@ -604,8 +604,8 @@ static int mode_select(cdrom_drive *d,int density,in=
t secsize){
> + static unsigned int get_orig_sectorsize(cdrom_drive *d){
> +   if(mode_sense(d,12,0x01))return(-1);
> +=20
> +-  d->orgdens =3D d->private->sg_buffer[4];
> +-  return(d->orgsize =3D ((int)(d->private->sg_buffer[10])<<8)+d->privat=
e->sg_buffer[11]);
> ++  d->orgdens =3D d->priv->sg_buffer[4];
> ++  return(d->orgsize =3D ((int)(d->priv->sg_buffer[10])<<8)+d->priv->sg_=
buffer[11]);
> + }
> +=20
> + /* switch CDROM scsi drives to given sector size  */
> +@@ -664,8 +664,8 @@ static int scsi_read_toc (cdrom_drive *d){
> +     return(-4);
> +   }
> +=20
> +-  first=3Dd->private->sg_buffer[2];
> +-  last=3Dd->private->sg_buffer[3];
> ++  first=3Dd->priv->sg_buffer[2];
> ++  last=3Dd->priv->sg_buffer[3];
> +   tracks=3Dlast-first+1;
> +=20
> +   if (last > MAXTRK || first > MAXTRK || last<0 || first<0) {
> +@@ -683,7 +683,7 @@ static int scsi_read_toc (cdrom_drive *d){
> +       return(-5);
> +     }
> +     {
> +-      scsi_TOC *toc=3D(scsi_TOC *)(d->private->sg_buffer+4);
> ++      scsi_TOC *toc=3D(scsi_TOC *)(d->priv->sg_buffer+4);
> +=20
> +       d->disc_toc[i-first].bFlags=3Dtoc->bFlags;
> +       d->disc_toc[i-first].bTrack=3Di;
> +@@ -704,7 +704,7 @@ static int scsi_read_toc (cdrom_drive *d){
> +     return(-2);
> +   }
> +   {
> +-    scsi_TOC *toc=3D(scsi_TOC *)(d->private->sg_buffer+4);
> ++    scsi_TOC *toc=3D(scsi_TOC *)(d->priv->sg_buffer+4);
> +    =20
> +     d->disc_toc[i-first].bFlags=3Dtoc->bFlags;
> +     d->disc_toc[i-first].bTrack=3D0xAA;
> +@@ -738,7 +738,7 @@ static int scsi_read_toc2 (cdrom_drive *d){
> +   }
> +=20
> +   /* copy to our structure and convert start sector */
> +-  tracks =3D d->private->sg_buffer[1];
> ++  tracks =3D d->priv->sg_buffer[1];
> +   if (tracks > MAXTRK) {
> +     cderror(d,"003: CDROM reporting illegal number of tracks\n");
> +     return(-3);
> +@@ -754,33 +754,33 @@ static int scsi_read_toc2 (cdrom_drive *d){
> +       return(-5);
> +     }
> +    =20
> +-    d->disc_toc[i].bFlags =3D d->private->sg_buffer[10];
> ++    d->disc_toc[i].bFlags =3D d->priv->sg_buffer[10];
> +     d->disc_toc[i].bTrack =3D i + 1;
> +=20
> +     d->disc_toc[i].dwStartSector=3D d->adjust_ssize *=20
> +-	(((signed char)(d->private->sg_buffer[2])<<24) |=20
> +-	 (d->private->sg_buffer[3]<<16)|
> +-	 (d->private->sg_buffer[4]<<8)|
> +-	 (d->private->sg_buffer[5]));
> ++	(((signed char)(d->priv->sg_buffer[2])<<24) |=20
> ++	 (d->priv->sg_buffer[3]<<16)|
> ++	 (d->priv->sg_buffer[4]<<8)|
> ++	 (d->priv->sg_buffer[5]));
> +   }
> +=20
> +   d->disc_toc[i].bFlags =3D 0;
> +   d->disc_toc[i].bTrack =3D i + 1;
> +-  memcpy (&foo, d->private->sg_buffer+2, 4);
> +-  memcpy (&bar, d->private->sg_buffer+6, 4);
> ++  memcpy (&foo, d->priv->sg_buffer+2, 4);
> ++  memcpy (&bar, d->priv->sg_buffer+6, 4);
> +   d->disc_toc[i].dwStartSector =3D d->adjust_ssize * (be32_to_cpu(foo) +
> + 						    be32_to_cpu(bar));
> +=20
> +   d->disc_toc[i].dwStartSector=3D d->adjust_ssize *=20
> +-    ((((signed char)(d->private->sg_buffer[2])<<24) |=20
> +-      (d->private->sg_buffer[3]<<16)|
> +-      (d->private->sg_buffer[4]<<8)|
> +-      (d->private->sg_buffer[5]))+
> ++    ((((signed char)(d->priv->sg_buffer[2])<<24) |=20
> ++      (d->priv->sg_buffer[3]<<16)|
> ++      (d->priv->sg_buffer[4]<<8)|
> ++      (d->priv->sg_buffer[5]))+
> +     =20
> +-     ((((signed char)(d->private->sg_buffer[6])<<24) |=20
> +-       (d->private->sg_buffer[7]<<16)|
> +-       (d->private->sg_buffer[8]<<8)|
> +-       (d->private->sg_buffer[9]))));
> ++     ((((signed char)(d->priv->sg_buffer[6])<<24) |=20
> ++       (d->priv->sg_buffer[7]<<16)|
> ++       (d->priv->sg_buffer[8]<<8)|
> ++       (d->priv->sg_buffer[9]))));
> +=20
> +=20
> +   d->cd_extra =3D FixupTOC(d,tracks+1);
> +@@ -817,7 +817,7 @@ static int i_read_28 (cdrom_drive *d, void *p, long =
begin, long sectors, unsigne
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,10,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -836,7 +836,7 @@ static int i_read_A8 (cdrom_drive *d, void *p, long =
begin, long sectors, unsigne
> +   cmd[9] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -854,7 +854,7 @@ static int i_read_D4_10 (cdrom_drive *d, void *p, lo=
ng begin, long sectors, unsi
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,10,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -872,7 +872,7 @@ static int i_read_D4_12 (cdrom_drive *d, void *p, lo=
ng begin, long sectors, unsi
> +   cmd[9] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -890,7 +890,7 @@ static int i_read_D5 (cdrom_drive *d, void *p, long =
begin, long sectors, unsigne
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,10,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -908,7 +908,7 @@ static int i_read_D8 (cdrom_drive *d, void *p, long =
begin, long sectors, unsigne
> +   cmd[9] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -922,7 +922,7 @@ static int i_read_mmc (cdrom_drive *d, void *p, long=
 begin, long sectors, unsign
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -936,7 +936,7 @@ static int i_read_mmcB (cdrom_drive *d, void *p, lon=
g begin, long sectors, unsig
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -950,7 +950,7 @@ static int i_read_mmc2 (cdrom_drive *d, void *p, lon=
g begin, long sectors, unsig
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -964,7 +964,7 @@ static int i_read_mmc2B (cdrom_drive *d, void *p, lo=
ng begin, long sectors, unsi
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -978,7 +978,7 @@ static int i_read_mmc3 (cdrom_drive *d, void *p, lon=
g begin, long sectors, unsig
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -992,7 +992,7 @@ static int i_read_mmc3B (cdrom_drive *d, void *p, lo=
ng begin, long sectors, unsi
> +   cmd[8] =3D sectors;
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -1026,7 +1026,7 @@ static int i_read_msf (cdrom_drive *d, void *p, lo=
ng begin, long sectors, unsign
> +=20
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -1039,7 +1039,7 @@ static int i_read_msf2 (cdrom_drive *d, void *p, l=
ong begin, long sectors, unsig
> +=20
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -1052,7 +1052,7 @@ static int i_read_msf3 (cdrom_drive *d, void *p, l=
ong begin, long sectors, unsig
> +  =20
> +   if((ret=3Dhandle_scsi_cmd(d,cmd,12,0,sectors * CD_FRAMESIZE_RAW,'\177=
',1,sense)))
> +     return(ret);
> +-  if(p)memcpy(p,d->private->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> ++  if(p)memcpy(p,d->priv->sg_buffer,sectors*CD_FRAMESIZE_RAW);
> +   return(0);
> + }
> +=20
> +@@ -1275,7 +1275,7 @@ long scsi_read_msf3 (cdrom_drive *d, void *p, long=
 begin,
> + static int count_2352_bytes(cdrom_drive *d){
> +   long i;
> +   for(i=3D2351;i>=3D0;i--)
> +-    if(d->private->sg_buffer[i]!=3D(unsigned char)'\177')
> ++    if(d->priv->sg_buffer[i]!=3D(unsigned char)'\177')
> +       return(((i+3)>>2)<<2);
> +=20
> +   return(0);
> +@@ -1284,7 +1284,7 @@ static int count_2352_bytes(cdrom_drive *d){
> + static int verify_nonzero(cdrom_drive *d){
> +   long i,flag=3D0;
> +   for(i=3D0;i<2352;i++)
> +-    if(d->private->sg_buffer[i]!=3D0){
> ++    if(d->priv->sg_buffer[i]!=3D0){
> +       flag=3D1;
> +       break;
> +     }
> +@@ -1625,7 +1625,7 @@ static int check_mmc(cdrom_drive *d){
> +   d->is_mmc=3D0;
> +   if(mode_sense(d,22,0x2A)=3D=3D0){
> +  =20
> +-    b=3Dd->private->sg_buffer;
> ++    b=3Dd->priv->sg_buffer;
> +     b+=3Db[3]+4;
> +    =20
> +     if((b[0]&0x3F)=3D=3D0x2A){
> +@@ -1673,7 +1673,7 @@ unsigned char *scsi_inquiry(cdrom_drive *d){
> +     cderror(d,"008: Unable to identify CDROM model\n");
> +     return(NULL);
> +   }
> +-  return (d->private->sg_buffer);
> ++  return (d->priv->sg_buffer);
> + }
> +=20
> + int scsi_init_drive(cdrom_drive *d){
> +@@ -1742,8 +1742,8 @@ int scsi_init_drive(cdrom_drive *d){
> +   check_cache(d);
> +=20
> +   d->error_retry=3D1;
> +-  d->private->sg_hd=3Drealloc(d->private->sg_hd,d->nsectors*CD_FRAMESIZ=
E_RAW + SG_OFF + 128);
> +-  d->private->sg_buffer=3D((unsigned char *)d->private->sg_hd)+SG_OFF;
> ++  d->priv->sg_hd=3Drealloc(d->priv->sg_hd,d->nsectors*CD_FRAMESIZE_RAW =
+ SG_OFF + 128);
> ++  d->priv->sg_buffer=3D((unsigned char *)d->priv->sg_hd)+SG_OFF;
> +   d->report_all=3D1;
> +   return(0);
> + }
> +diff --git a/interface/test_interface.c b/interface/test_interface.c
> +index 11bec25..e1cefaa 100644
> +--- a/interface/test_interface.c
> ++++ b/interface/test_interface.c
> +@@ -66,9 +66,9 @@ static long test_read(cdrom_drive *d, void *p, long be=
gin, long sectors){
> +   if(!fd)fd=3Dfdopen(d->cdda_fd,"r");
> +=20
> +   if(begin<lastread)
> +-    d->private->last_milliseconds=3D20;
> ++    d->priv->last_milliseconds=3D20;
> +   else
> +-    d->private->last_milliseconds=3Dsectors;
> ++    d->priv->last_milliseconds=3Dsectors;
> +=20
> + #ifdef CDDA_TEST_UNDERRUN
> +   sectors-=3D1;
> +--=20
> +1.9.1
> +
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

