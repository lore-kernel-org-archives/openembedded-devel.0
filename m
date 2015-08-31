Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC4876EA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 17:58:39 +0000 (UTC)
Received: by wicjd9 with SMTP id jd9so7931469wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b/U+4kvynWGHnAjlH+rpOvDgcfGLVclf/Ywy3SaaONg=;
	b=AxbZyALXvAMZogBz3FFQ7qbskUnMpZhj4nwhN+ocdTrn4c1GCcW5Wck5SD/I2qgNpw
	iSDLXRqT1h/C0FqIgiU0Qcvli1/IXjwF3mSaB5N2RzZhSQv+dX6nS88wwP3rfKIszoXH
	uvWk4+ne06+7LHvcl/fhSgQ3WBx5lPK41ssZd7Qx5oInWdTmVeKqJ+Wv00MPMlgLqep0
	mA/6NDsJObBXDV07oM+OHkDs3+00cOG/PyGx00P49bX8LeHGdngiDPNc7S2zw/mHKrZf
	WphFx+iIi3IfOBsO7qZbN054xCp+4CT8vxn0aGjEnYVFYo49e04xiZRkzivkBHD1JJmA
	cSnQ==
X-Received: by 10.180.84.131 with SMTP id z3mr11747635wiy.9.1441043919840;
	Mon, 31 Aug 2015 10:58:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id c3sm23332237wja.3.2015.08.31.10.58.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 10:58:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 31 Aug 2015 19:58:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150831175844.GD2465@jama>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Mon, 31 Aug 2015 17:58:43 -0000
X-Groupsio-MsgNum: 57139
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline

--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2015 at 09:51:34AM +0800, Lei Maohui wrote:
> In oe-core,the parted is GPLv3,so add parted-1.8.6 which is not GPLv3.
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../parted-1.8.6/1000parted-1.8.6-warnings1.patch  | 11 ++++
>  .../1001parted-1.8.6-notransname1.patch            | 39 ++++++++++++++
>  .../1002parted-1.8.6-off-by-one1.patch             | 25 +++++++++
>  .../1003parted-1.8.6-primary-boundary1.patch       | 12 +++++
>  .../parted-1.8.6/1004parted-1.8.6-xvd1.patch       | 50 +++++++++++++++++
>  .../1005parted-1.8.6-devmapper-header1.patch       | 13 +++++
>  .../parted/parted-1.8.6/7000no_effect_macro1.patch | 11 ++++
>  .../parted/parted-1.8.6/ui.c-fix-build-error.patch | 26 +++++++++
>  meta-oe/recipes-extended/parted/parted_1.8.6.bb    | 62 ++++++++++++++++=
++++++
>  9 files changed, 249 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1000part=
ed-1.8.6-warnings1.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1001part=
ed-1.8.6-notransname1.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1002part=
ed-1.8.6-off-by-one1.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1003part=
ed-1.8.6-primary-boundary1.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1004part=
ed-1.8.6-xvd1.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/1005part=
ed-1.8.6-devmapper-header1.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/7000no_e=
ffect_macro1.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix=
-build-error.patch
>  create mode 100644 meta-oe/recipes-extended/parted/parted_1.8.6.bb

I cannot take this to meta-oe, because as soon as it's added there it
will be used by all DISTROs even those who don't mind having GPLv3
version.

Everybody would need to define PREFERRED_VERSION, because
DEFAULT_PREFERENCE is useless across different layers :/
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964

So this either has to be introduced in oe-core or in completely separate
layer which would be included only by those who cannot use GPLv3.

Regards,

>=20
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.=
6-warnings1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1000parted=
-1.8.6-warnings1.patch
> new file mode 100644
> index 0000000..c8b2e7d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1000parted-1.8.6-warni=
ngs1.patch
> @@ -0,0 +1,11 @@
> +--- parted-1.8.6/libparted/fs/linux_swap/linux_swap.c.warnings	2007-03-2=
0 13:22:36.000000000 -0400
> ++++ parted-1.8.6/libparted/fs/linux_swap/linux_swap.c	2007-03-20 13:59:1=
1.000000000 -0400
> +@@ -123,7 +123,7 @@
> +=20
> + error_close_fs:
> + 	swap_close (fs);
> +-error:
> ++
> + 	return 0;
> + }
> + #endif /* !DISCOVER_ONLY */
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.=
6-notransname1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1001par=
ted-1.8.6-notransname1.patch
> new file mode 100644
> index 0000000..5fdf10b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1001parted-1.8.6-notra=
nsname1.patch
> @@ -0,0 +1,39 @@
> +--- parted-1.8.6/parted/parted.c.notransname	2007-03-13 13:01:09.0000000=
00 -0400
> ++++ parted-1.8.6/parted/parted.c	2007-03-21 10:50:35.000000000 -0400
> +@@ -1429,7 +1429,7 @@
> +                                              part->fs_type->name : "");
> +=20
> +                             if (has_name) {
> +-                                    name =3D _(ped_partition_get_name (=
part));
> ++                                    name =3D ped_partition_get_name (pa=
rt);
> +                                     str_list_append (row, name);
> +                             }
> +=20
> +--- parted-1.8.6/parted/table.c.notransname	2007-03-13 13:01:09.00000000=
0 -0400
> ++++ parted-1.8.6/parted/table.c	2007-03-21 10:51:31.000000000 -0400
> +@@ -191,7 +191,8 @@
> +         len +=3D wcslen(COLSUFFIX);
> +=20
> +         newsize =3D (wcslen(*s) + len + 1) * sizeof(wchar_t);
> +-        *s =3D realloc (*s, newsize);
> ++        *s =3D (wchar_t *) realloc (*s, newsize);
> ++        assert(*s !=3D NULL);
> +=20
> +         for (i =3D 0; i < ncols; ++i)
> +         {
> +@@ -199,6 +200,7 @@
> +                 int nspaces =3D max(t->widths[i] - wcswidth(row[i], MAX=
_WIDTH),
> +                                   0);
> +                 wchar_t* pad =3D malloc ( (nspaces + 1) * sizeof(wchar_=
t) );
> ++                assert(pad !=3D NULL);
> +=20
> +                 for (j =3D 0; j < nspaces; ++j)
> +                        pad[j] =3D L' ';=20
> +@@ -211,6 +213,7 @@
> +                         wcscat (*s, DELIMITER);
> +=20
> +                 free (pad);
> ++                pad =3D NULL;
> +         }
> +=20
> +         wcscat (*s, COLSUFFIX);
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.=
6-off-by-one1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1002part=
ed-1.8.6-off-by-one1.patch
> new file mode 100644
> index 0000000..9652a98
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1002parted-1.8.6-off-b=
y-one1.patch
> @@ -0,0 +1,25 @@
> +--- parted-1.8.6/parted/parted.c.offbyone	2007-04-11 12:13:06.000000000 =
-0400
> ++++ parted-1.8.6/parted/parted.c	2007-04-11 12:13:21.000000000 -0400
> +@@ -1217,6 +1217,7 @@
> + static int
> + do_print (PedDevice** dev)
> + {
> ++        PedUnit         default_unit;
> +         PedDisk*        disk;
> +         Table*          table;
> +         StrList*        row;
> +@@ -1303,11 +1304,12 @@
> +         }
> +=20
> +         start =3D ped_unit_format (*dev, 0);
> ++        default_unit =3D ped_unit_get_default ();
> +         end =3D ped_unit_format_byte (*dev, (*dev)->length * (*dev)->se=
ctor_size
> +-                                          - 1 );
> ++         - (default_unit =3D=3D PED_UNIT_CHS || default_unit =3D=3D PED=
_UNIT_CYLINDER));
> +        =20
> +         if (opt_machine_mode) {
> +-            switch (ped_unit_get_default ()) {
> ++            switch (default_unit) {
> +                 case PED_UNIT_CHS:      puts ("CHS;");
> +                                         break;
> +                 case PED_UNIT_CYLINDER: puts ("CYL;");
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.=
6-primary-boundary1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/10=
03parted-1.8.6-primary-boundary1.patch
> new file mode 100644
> index 0000000..0366977
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1003parted-1.8.6-prima=
ry-boundary1.patch
> @@ -0,0 +1,12 @@
> +--- parted-1.8.6/libparted/labels/dos.c.boundary	2007-03-13 13:01:09.000=
000000 -0400
> ++++ parted-1.8.6/libparted/labels/dos.c	2007-04-11 14:56:54.000000000 -0=
400
> +@@ -1696,8 +1696,7 @@
> + 					 _primary_start_constraint (disk, part,
> + 						 bios_geom, min_geom)));
> +=20
> +-	if (!solution)
> +-		solution =3D _best_solution (part, bios_geom, solution,
> ++	solution =3D _best_solution (part, bios_geom, solution,
> + 			_try_constraint (part, constraint,
> + 				_primary_constraint (disk, bios_geom,
> + 				min_geom)));
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.=
6-xvd1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.=
6-xvd1.patch
> new file mode 100644
> index 0000000..17ec29a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1004parted-1.8.6-xvd1.=
patch
> @@ -0,0 +1,50 @@
> +diff -up parted-1.8.6/libparted/arch/linux.c.xvd parted-1.8.6/libparted/=
arch/linux.c
> +--- parted-1.8.6/libparted/arch/linux.c.xvd	2007-08-07 14:05:59.00000000=
0 -0400
> ++++ parted-1.8.6/libparted/arch/linux.c	2007-08-07 14:07:13.000000000 -0=
400
> +@@ -248,6 +248,7 @@ struct blkdev_ioctl_param {
> + #define VIODASD_MAJOR           112
> + #define SX8_MAJOR1              160
> + #define SX8_MAJOR2              161
> ++#define XVD_MAJOR               202
> +=20
> + #define SCSI_BLK_MAJOR(M) (                                            =
 \
> +                 (M) =3D=3D SCSI_DISK0_MAJOR                            =
     \
> +@@ -450,6 +451,8 @@ _device_probe_type (PedDevice* dev)
> +         } else if (_is_dm_major(dev_major)) {
> +                 dev->type =3D PED_DEVICE_DM;
> + #endif
> ++        } else if (dev_major =3D=3D XVD_MAJOR && (dev_minor % 0x10 =3D=
=3D 0)) {
> ++                dev->type =3D PED_DEVICE_XVD;
> +         } else {
> +                 dev->type =3D PED_DEVICE_UNKNOWN;
> +         }
> +@@ -1152,6 +1155,11 @@ linux_new (const char* path)
> +                 break;
> + #endif
> +=20
> ++        case PED_DEVICE_XVD:
> ++                if (!init_generic (dev, _("Xen Virtual Block Device")))
> ++                        goto error_free_arch_specific;
> ++                break;
> ++
> +         case PED_DEVICE_UNKNOWN:
> +                 if (!init_generic (dev, _("Unknown")))
> +                         goto error_free_arch_specific;
> +diff -up parted-1.8.6/include/parted/device.h.xvd parted-1.8.6/include/p=
arted/device.h
> +--- parted-1.8.6/include/parted/device.h.xvd	2007-01-12 10:15:10.0000000=
00 -0500
> ++++ parted-1.8.6/include/parted/device.h	2007-08-07 14:07:13.000000000 -=
0400
> +@@ -45,11 +45,11 @@ typedef enum {
> +         PED_DEVICE_UBD          =3D 8,
> +         PED_DEVICE_DASD         =3D 9,
> +         PED_DEVICE_VIODASD      =3D 10,
> +-        PED_DEVICE_SX8          =3D 11
> ++        PED_DEVICE_SX8          =3D 11,
> + #ifdef ENABLE_DEVICE_MAPPER
> +-                                    ,
> +-        PED_DEVICE_DM           =3D 12
> ++        PED_DEVICE_DM           =3D 12,
> + #endif
> ++        PED_DEVICE_XVD          =3D 13
> + } PedDeviceType;
> +=20
> + typedef struct _PedDevice PedDevice;
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.=
6-devmapper-header1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/10=
05parted-1.8.6-devmapper-header1.patch
> new file mode 100644
> index 0000000..536a20d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/1005parted-1.8.6-devma=
pper-header1.patch
> @@ -0,0 +1,13 @@
> +diff -up parted-1.8.6/include/parted/device.h.devmapper parted-1.8.6/inc=
lude/parted/device.h
> +--- parted-1.8.6/include/parted/device.h.devmapper	2007-10-04 15:39:27.0=
00000000 -0400
> ++++ parted-1.8.6/include/parted/device.h	2007-10-04 15:40:11.000000000 -=
0400
> +@@ -46,9 +46,7 @@ typedef enum {
> +         PED_DEVICE_DASD         =3D 9,
> +         PED_DEVICE_VIODASD      =3D 10,
> +         PED_DEVICE_SX8          =3D 11,
> +-#ifdef ENABLE_DEVICE_MAPPER
> +         PED_DEVICE_DM           =3D 12,
> +-#endif
> +         PED_DEVICE_XVD          =3D 13
> + } PedDeviceType;
> +=20
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_m=
acro1.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_ma=
cro1.patch
> new file mode 100644
> index 0000000..033f3f5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/7000no_effect_macro1.p=
atch
> @@ -0,0 +1,11 @@
> +--- parted-1.8.6/parted/table.c	2010-11-02 13:37:16.256204798 +0900
> ++++ parted-1.8.6/parted/table.c	2010-11-02 13:45:16.231266752 +0900
> +@@ -43,7 +43,7 @@
> + #       define wcslen strlen
> + #       define wcswidth strnlen
> + #       define wcscat strcat
> +-#       define wcsdup strdup
> ++/* #       define wcsdup strdup */
> +         size_t strnlen (const char *, size_t);
> + #endif
> +=20
> diff --git a/meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-=
error.patch b/meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-e=
rror.patch
> new file mode 100644
> index 0000000..777fe6a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted-1.8.6/ui.c-fix-build-error.p=
atch
> @@ -0,0 +1,26 @@
> +From 4f4dfd5aabdaadd8f495e193ca8daed5a3a1782a Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 28 Nov 2014 02:49:19 +0900
> +Subject: [PATCH] parted/ui.c : fix build error
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + parted/ui.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/parted/ui.c b/parted/ui.c
> +index 59cb98b..b583693 100644
> +--- a/parted/ui.c
> ++++ b/parted/ui.c
> +@@ -1376,7 +1376,7 @@ init_ui ()
> +=20
> + #ifdef HAVE_LIBREADLINE
> +         rl_initialize ();
> +-        rl_attempted_completion_function =3D (CPPFunction*) complete_fu=
nction;
> ++        rl_attempted_completion_function =3D (rl_completion_func_t*) co=
mplete_function;
> +         readline_state.in_readline =3D 0;
> + #endif
> +=20
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/parted/parted_1.8.6.bb b/meta-oe/re=
cipes-extended/parted/parted_1.8.6.bb
> new file mode 100644
> index 0000000..537978f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parted/parted_1.8.6.bb
> @@ -0,0 +1,62 @@
> +SUMMARY =3D "The GNU disk partition manipulation program"
> +DESCRIPTION =3D "The GNU Parted program allows you to create, destroy, r=
esize, move, \
> +and copy hard disk partitions. Parted can be used for creating space \
> +for new operating systems, reorganizing disk usage, and copying data \
> +to new hard disks."
> +HOMEPAGE =3D "http://www.gnu.org/software/parted"
> +SECTION =3D "Applications/System"
> +
> +SRC_URI =3D "http://ftp.gnu.org/gnu/parted/parted-1.8.6.tar.bz2 \
> +	   file://1000parted-1.8.6-warnings1.patch \
> +	   file://1001parted-1.8.6-notransname1.patch \
> +	   file://1002parted-1.8.6-off-by-one1.patch \
> +	   file://1003parted-1.8.6-primary-boundary1.patch \
> +	   file://1004parted-1.8.6-xvd1.patch \
> +	   file://1005parted-1.8.6-devmapper-header1.patch \
> +	   file://7000no_effect_macro1.patch \
> +           file://ui.c-fix-build-error.patch \
> +	   "
> +
> +SRC_URI[md5sum] =3D "03c967ae0e915e08da90605d68ba93d7"
> +SRC_URI[sha256sum] =3D "82d94c9bb58cccd1eacfc5ff3a9331d179cc26d8fbe00c45=
1e2c84feb6d23408"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
> +
> +inherit autotools gettext pkgconfig
> +
> +DEPENDS =3D "lvm2 readline"
> +
> +EXTRA_OECONF =3D "--enable-device-mapper \
> +	        --disable-selinux \
> +	        --disable-static \
> +	        --sbindir=3D${sbindir} \
> +	        --disable-Werror \
> +	        --disable-rpath \
> +	        "
> +EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
> +
> +do_configure_prepend() {
> +	# ltmain.sh will set rpath to path on host.
> +	for l in `find ${S} -name "ltmain\.sh"` ; do
> +		sed -i -e 's/\$compile_rpath//g' \
> +		       -e 's/\$finalize_rpath//g' ${l}
> +	done
> +
> +	# FIXME: Some option may be needed by EXTRA_OECONF.
> +	sed -i 's/ac_cv_func_malloc_0_nonnull=3Dno/ac_cv_func_malloc_0_nonnull=
=3Dyes/g' ${S}/configure
> +	sed -i 's/ac_cv_func_calloc_0_nonnull=3Dno/ac_cv_func_calloc_0_nonnull=
=3Dyes/g' ${S}/configure
> +	sed -i 's/ac_cv_func_memcmp_working=3Dno/ac_cv_func_memcmp_working=3Dye=
s/g' ${S}/configure
> +	sed -i 's/ac_cv_func_realloc_0_nonnull=3Dno/ac_cv_func_realloc_0_nonnul=
l=3Dyes/g' ${S}/configure
> +}
> +
> +do_configure() {
> +	oe_runconf
> +}
> +
> +do_install_append() {
> +	/bin/rm -rf ${D}/${libdir}/*.la
> +	/bin/rm -rf ${D}/usr/share/info/dir
> +	/bin/rm -fr ${D}/usr/bin
> +}
> +
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXkldMACgkQN1Ujt2V2gByJVQCfTZokCODIClo7/gmzFL+BMW3o
qcAAnRAwK6M/zEPYtvZ8BqbF//zthsu7
=2Z+9
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
