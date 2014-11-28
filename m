Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id AA5EF723B9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 12:49:59 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so21054991wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 04:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q1yHUmPZNShg8hLJVlgOtB62mjvXhIzRR/x6raDecc4=;
	b=0uhJzlxGkDve+JJbXS+zhEt3yKrlrfDb15QXI/YGIZu3XbKN2xzwThe0bA+fssI+72
	FRfOlRQNbJPdcW3jzwKYedkkN60ktotCl1t5v/UQ176nLwN+X+HTqjEP2Y7yH/snN0U+
	NXN6Zad58x1QYKuGXQ9FVSl+VQ2bfWHw9r1HsIzIibUKvpR0EwuqFgAwZe1fnpwDEf5C
	cfzEO3BzAn0EtzeKm5qT+qUlmH3D6WT/knXtC5s6kvsHRySfQFQtPWOKIbdT+tZ9A25s
	YsTw98zpJEFaBjZlzSw54mmpG/3M5kY2QcP9HBklJOztJs3KxMnJKsbHcTJuuURRd9cd
	Gl4A==
X-Received: by 10.194.77.233 with SMTP id v9mr67600258wjw.24.1417178999945;
	Fri, 28 Nov 2014 04:49:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f7sm15799919wiz.13.2014.11.28.04.49.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Nov 2014 04:49:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 28 Nov 2014 13:50:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141128125004.GA2466@jama>
References: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
	<1417164585-46087-3-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417164585-46087-3-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/3] [meta-oe] dmraid: add recipe
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
X-List-Received-Date: Fri, 28 Nov 2014 12:50:04 -0000
X-Groupsio-MsgNum: 53087
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 04:49:44PM +0800, Bian Naimeng wrote:
> There is no update anymore since 2010, but is still supported by
> some distro such as Ubuntu(trusty 14.04LTS).

Fails to apply

OE @ ~/meta-openembedded $ pwam 84071
2014-11-28 13:48:52 URL:http://patchwork.openembedded.org/patch/84071/mbox/=
 [67864] -> "pw-am-84071.patch" [1]
Applying: dmraid: add recipe
/OE/meta-openembedded/.git/rebase-apply/patch:142: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:150: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:151: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:156: trailing whitespace.
=20
/OE/meta-openembedded/.git/rebase-apply/patch:162: trailing whitespace.
=20
fatal: corrupt patch at line 397
Patch failed at 0001 dmraid: add recipe
The copy of the patch that failed is found in:
   /OE/meta-openembedded/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Also use $BPN instead of "files" for slightly faster lookup.

>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../recipes-extended/dmraid/dmraid_1.0.0.rc16.bb   |  71 +++++
>  .../dmraid/files/01_fix_broken_linking.patch       | 121 +++++++++
>  .../dmraid/files/02_disable_dmreg.patch            | 134 ++++++++++
>  .../files/03_fix_hyphen-used-as-minus-sign.patch   | 291 +++++++++++++++=
++++++
>  .../dmraid/files/04_promise-add-offsets.patch      |  13 +
>  .../dmraid/files/05_exit_code.patch                |  22 ++
>  .../dmraid/files/06_support_virtio_devices.patch   |  13 +
>  .../dmraid/files/07_isw-probe-hpa.patch            | 144 ++++++++++
>  .../files/08_activate_multiple_raid_sets.patch     |  12 +
>  .../dmraid/files/09_pdc_raid10_failure..patch      |  14 +
>  .../dmraid/files/10_ddf1_lsi_persistent_name.patch |  20 ++
>  .../files/11_fix_isw_sectors_calculation.patch     |  14 +
>  .../dmraid/files/12_jmicron_namefix.patch          |  20 ++
>  .../dmraid/files/13_fix_testing.patch              |  24 ++
>  .../files/14_pdc_dump_extended_metadata.patch      | 147 +++++++++++
>  .../15_drop_p_for_partition_conditional.patch      |  31 +++
>  .../dmraid/files/16_change-uuid.patch              |  77 ++++++
>  .../files/17_convert-dmraid45-to-dmraid.patch      | 273 +++++++++++++++=
++++
>  .../dmraid/files/18_ignore-too-small-devices.patch |  39 +++
>  .../files/19_compile-dmraid-in-subdir-tools.patch  |  20 ++
>  .../20_specifies-install-dir-by-DESTDIR.patch      | 123 +++++++++
>  21 files changed, 1623 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/01_fix_broken_l=
inking.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/02_disable_dmre=
g.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/03_fix_hyphen-u=
sed-as-minus-sign.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/04_promise-add-=
offsets.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/05_exit_code.pa=
tch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/06_support_virt=
io_devices.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/07_isw-probe-hp=
a.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/08_activate_mul=
tiple_raid_sets.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/09_pdc_raid10_f=
ailure..patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/10_ddf1_lsi_per=
sistent_name.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/11_fix_isw_sect=
ors_calculation.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/12_jmicron_name=
fix.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/13_fix_testing.=
patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/14_pdc_dump_ext=
ended_metadata.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/15_drop_p_for_p=
artition_conditional.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/16_change-uuid.=
patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/17_convert-dmra=
id45-to-dmraid.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/18_ignore-too-s=
mall-devices.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/19_compile-dmra=
id-in-subdir-tools.patch
>  create mode 100644 meta-oe/recipes-extended/dmraid/files/20_specifies-in=
stall-dir-by-DESTDIR.patch
>=20
> diff --git a/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb b/meta-=
oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb
> new file mode 100644
> index 0000000..281587d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb
> @@ -0,0 +1,71 @@
> +SUMMARY =3D "dmraid (Device-mapper RAID tool and library)"
> +DESCRIPTION =3D "DMRAID supports RAID device discovery, RAID set activat=
ion, \
> +creation, removal, rebuild and display of properties for ATARAID/DDF1 \
> +metadata on Linux >=3D 2.4 using device-mapper."
> +HOMEPAGE =3D "http://people.redhat.com/heinzm/sw/dmraid"
> +SECTION =3D "System Environment/Base"
> +
> +SRC_URI =3D "http://people.redhat.com/heinzm/sw/dmraid/src/old/${BPN}-${=
PV}.tar.bz2 \
> +           file://01_fix_broken_linking.patch \
> +           file://02_disable_dmreg.patch \
> +           file://03_fix_hyphen-used-as-minus-sign.patch \
> +           file://04_promise-add-offsets.patch \
> +           file://05_exit_code.patch \
> +           file://06_support_virtio_devices.patch \
> +           file://07_isw-probe-hpa.patch \
> +           file://08_activate_multiple_raid_sets.patch \
> +           file://09_pdc_raid10_failure..patch \
> +           file://10_ddf1_lsi_persistent_name.patch \
> +           file://11_fix_isw_sectors_calculation.patch \
> +           file://12_jmicron_namefix.patch \
> +           file://13_fix_testing.patch \
> +           file://14_pdc_dump_extended_metadata.patch \
> +           file://15_drop_p_for_partition_conditional.patch \
> +           file://16_change-uuid.patch \
> +           file://17_convert-dmraid45-to-dmraid.patch \
> +           file://18_ignore-too-small-devices.patch \
> +           file://19_compile-dmraid-in-subdir-tools.patch \
> +           file://20_specifies-install-dir-by-DESTDIR.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "32832c1dfd7e72cd4355490322fca68a"
> +SRC_URI[sha256sum] =3D "f849c44d041f8891c61419ddf906e6e34b44948939ae9e55=
0be662ffc2492255"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D15b3012575eeffacc3cec27a6d3cb=
31f"
> +
> +DEPENDS =3D "lvm2"
> +
> +S =3D "${WORKDIR}/${BPN}/${PV}"
> +
> +CONFIGUREOPTS =3D " --build=3D${BUILD_SYS} \
> +                  --host=3D${HOST_SYS} \
> +                  --target=3D${TARGET_SYS} \
> +                  --prefix=3D${prefix} \
> +                  --exec_prefix=3D${exec_prefix} \
> +                  --bindir=3D${bindir} \
> +                  --sbindir=3D${sbindir} \
> +                  --libexecdir=3D${libexecdir} \
> +                  --datadir=3D${datadir} \
> +                  --sysconfdir=3D${sysconfdir} \
> +                  --sharedstatedir=3D${sharedstatedir} \
> +                  --localstatedir=3D${localstatedir} \
> +                  --libdir=3D${libdir} \
> +                  --includedir=3D${includedir} \
> +                  --oldincludedir=3D${oldincludedir} \
> +                  --infodir=3D${infodir} \
> +                  --mandir=3D${mandir} \
> +                "
> +EXTRA_OECONF +=3D " --disable-static_link --enable-led --enable-intel_le=
d --enable-debug  "
> +
> +do_configure() {
> +    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +}
> +
> +do_compile() {
> +  oe_runmake DESTDIR=3D${D}
> +}
> +
> +do_install() {
> +   oe_runmake DESTDIR=3D${D} install
> +}
> diff --git a/meta-oe/recipes-extended/dmraid/files/01_fix_broken_linking.=
patch b/meta-oe/recipes-extended/dmraid/files/01_fix_broken_linking.patch
> new file mode 100644
> index 0000000..b43ecac
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/01_fix_broken_linking.patch
> @@ -0,0 +1,121 @@
> +Author: Luke Yelavich <themuso@ubuntu.com>
> +Description: Fix library symbolic link creation and library linking.
> +--- 1.0.0.rc16.orig/configure
> ++++ 1.0.0.rc16/configure
> +@@ -693,6 +693,7 @@ DEBUG_MALLOC
> + DMRAID_TEST
> + DMRAID_VERSION
> + DMRAID_LIB_VERSION
> ++DMRAID_LIB_MAJOR_VERSION
> + DIETLIBC
> + GROUP
> + JOBS
> +@@ -5767,8 +5768,10 @@ fi
> +=20
> + if test "-f lib/version.h"; then
> +   DMRAID_LIB_VERSION=3D"`sed --quiet 's/^.*\(DMRAID_LIB_VERSION\)[^_].*=
"\(.*\)"/\2/p' lib/version.h`"
> ++  DMRAID_LIB_MAJOR_VERSION=3D"`grep DMRAID_LIB_MAJOR_VERSION lib/versio=
n.h | tr '\t' ' ' | cut -f 3 -d ' '`"
> + else
> +   DMRAID_LIB_VERSION=3D"Unknown"
> ++  DMRAID_LIB_MAJOR_VERSION=3D"Unknown"
> + fi
> +=20
> +=20
> +--- 1.0.0.rc16.orig/configure.in
> ++++ 1.0.0.rc16/configure.in
> +@@ -178,7 +178,7 @@ if test x$DEBUG_MALLOC =3D xyes; then
> + fi
> +=20
> + dnl Mess with default exec_prefix
> +-if [[ "x$exec_prefix" =3D xNONE -a "x$prefix" =3D xNONE ]];
> ++if [ "x$exec_prefix" =3D xNONE -a "x$prefix" =3D xNONE ];
> +  then  exec_prefix=3D"";
> + fi;
> +=20
> +@@ -220,8 +220,10 @@ fi
> +=20
> + if test "-f lib/version.h"; then
> +   DMRAID_LIB_VERSION=3D"`sed --quiet 's/^.*\(DMRAID_LIB_VERSION\)[[^_]]=
=2E*"\(.*\)"/\2/p' lib/version.h`"
> ++  DMRAID_LIB_MAJOR_VERSION=3D"`grep DMRAID_LIB_MAJOR_VERSION lib/versio=
n.h | tr '\t' ' ' | cut -f 3 -d ' '`"
> + else
> +   DMRAID_LIB_VERSION=3D"Unknown"
> ++  DMRAID_LIB_MAJOR_VERSION=3D"Unknown"
> + fi
> +=20
> + AC_SUBST(CC)
> +@@ -232,6 +234,7 @@ AC_SUBST(DEBUG_MALLOC)
> + AC_SUBST(DMRAID_TEST)
> + AC_SUBST(DMRAID_VERSION)
> + AC_SUBST(DMRAID_LIB_VERSION)
> ++AC_SUBST(DMRAID_LIB_MAJOR_VERSION)
> + AC_SUBST(DIETLIBC)
> + AC_SUBST(GROUP)
> + AC_SUBST(JOBS)
> +--- 1.0.0.rc16.orig/lib/Makefile.in
> ++++ 1.0.0.rc16/lib/Makefile.in
> +@@ -65,6 +65,11 @@ ifeq ("@KLIBC@", "no")
> + 		LIB_EVENTS_SHARED=3D$(top_srcdir)/lib/$(LIB_EVENTS_NAME).so
> + 		TARGETS +=3D $(LIB_SHARED) $(LIB_EVENTS_SHARED)
> + 		INSTALL_TARGETS +=3D $(LIB_SHARED) $(LIB_EVENTS_SHARED)
> ++		ifeq ("@DIETLIBC@", "yes")
> ++			LIBDMRAIDLIBS +=3D -ldevmapper_dietc
> ++		else
> ++			LIBDMRAIDLIBS +=3D -ldevmapper
> ++		endif
> + 	endif
> + endif
> +=20
> +@@ -82,10 +87,11 @@ install_dmraid_libs: $(INSTALL_TARGETS)
> + 	for f in $(INSTALL_TARGETS); \
> + 	do \
> + 		n=3D$$(basename $${f}) ; \
> +-		if [[ "$$n" =3D~ '.so$$' ]]; then \
> ++		if echo "$$n" | grep -q '.so$$'; then \
> + 			$(INSTALL) -m 555 $(STRIP) \
> + 				$$f $(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
> +-			$(LN_S) -f $${n}.@DMRAID_LIB_VERSION@ $(libdir)/$${n}; \
> ++			mkdir -p $(prefix)/lib; \
> ++			cd $(prefix)/lib/ && $(LN_S) -f /lib/$${n}.@DMRAID_LIB_VERSION@ $${n=
}; \
> + 		else \
> + 			$(INSTALL) -m 555 $(STRIP) $$f $(libdir)/$${n}; \
> + 		fi \
> +--- 1.0.0.rc16.orig/make.tmpl.in
> ++++ 1.0.0.rc16/make.tmpl.in
> +@@ -44,6 +44,7 @@ endif
> + OWNER =3D @OWNER@
> + GROUP =3D @GROUP@
> + DMRAID_LIB_VERSION =3D @DMRAID_LIB_VERSION@
> ++DMRAID_LIB_MAJOR_VERSION =3D @DMRAID_LIB_MAJOR_VERSION@
> +=20
> + # The number of jobs to run, if blank, defaults to the make standard
> + ifndef MAKEFLAGS
> +@@ -136,7 +137,7 @@ $(TARGETS): $(OBJECTS)
> +=20
> + %.so: $(OBJECTS)
> + 	$(CC) -shared -Wl,-soname,$(notdir $@).$(DMRAID_LIB_VERSION) \
> +-	-Wl,--version-script,.export.sym $(OBJECTS) -o $@ -ldevmapper-event
> ++	-Wl,--version-script,.export.sym $(OBJECTS) $(LIBDMRAIDLIBS) -o $@ -ld=
evmapper-event
> +=20
> + $(LIB_STATIC): $(OBJECTS)
> + 	$(RM) $@
> +--- 1.0.0.rc16.orig/tools/Makefile.in
> ++++ 1.0.0.rc16/tools/Makefile.in
> +@@ -34,12 +34,16 @@ ifeq ("@KLIBC@", "yes")
> + 	DMRAIDLIBS +=3D -ldevmapper_klibc
> + else
> + 	ifeq ("@DIETLIBC@", "yes")
> +-		DMRAIDLIBS +=3D -ldevmapper_dietc
> ++		ifeq ("@LIB_SO@", "no")
> ++			DMRAIDLIBS +=3D -ldevmapper_dietc
> ++		endif
> + 		ifeq ("@STATIC_LINK@", "no")
> + 			DMEVENTTOOLLIBS =3D -ldevmapper-event_dietc
> + 		endif
> + 	else
> +-		DMRAIDLIBS +=3D -ldevmapper
> ++		ifeq ("@LIB_SO@", "no")
> ++			DMRAIDLIBS +=3D -ldevmapper
> ++		endif
> + 		ifeq ("@STATIC_LINK@", "no")
> + 			DMEVENTTOOLLIBS =3D -ldevmapper-event
> + 		endif
> diff --git a/meta-oe/recipes-extended/dmraid/files/02_disable_dmreg.patch=
 b/meta-oe/recipes-extended/dmraid/files/02_disable_dmreg.patch
> new file mode 100644
> index 0000000..079768b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/02_disable_dmreg.patch
> @@ -0,0 +1,134 @@
> +Disabled all dmreg stuff
> +--- 1.0.0.rc16.orig/lib/Makefile.in
> ++++ 1.0.0.rc16/lib/Makefile.in
> +@@ -45,10 +45,6 @@ SOURCES=3D\
> + 	format/ddf/ddf1_dump.c \
> + 	format/partition/dos.c
> +=20
> +-ifeq ("@STATIC_LINK@", "no")
> +-	SOURCES +=3D register/dmreg.c
> +-endif
> +-
> + OBJECTS=3D$(SOURCES:%.c=3D%.o)
> +=20
> + LIB_STATIC=3D$(top_srcdir)/lib/libdmraid.a
> +@@ -63,8 +59,8 @@ ifeq ("@KLIBC@", "no")
> + 	ifeq ("@STATIC_LINK@", "no")
> + 		LIB_SHARED=3D$(top_srcdir)/lib/libdmraid.so
> + 		LIB_EVENTS_SHARED=3D$(top_srcdir)/lib/$(LIB_EVENTS_NAME).so
> +-		TARGETS +=3D $(LIB_SHARED) $(LIB_EVENTS_SHARED)
> +-		INSTALL_TARGETS +=3D $(LIB_SHARED) $(LIB_EVENTS_SHARED)
> ++		TARGETS +=3D $(LIB_SHARED)
> ++		INSTALL_TARGETS +=3D $(LIB_SHARED)
> + 		ifeq ("@DIETLIBC@", "yes")
> + 			LIBDMRAIDLIBS +=3D -ldevmapper_dietc
> + 		else
> +--- 1.0.0.rc16.orig/make.tmpl.in
> ++++ 1.0.0.rc16/make.tmpl.in
> +@@ -137,7 +137,7 @@ $(TARGETS): $(OBJECTS)
> +=20
> + %.so: $(OBJECTS)
> + 	$(CC) -shared -Wl,-soname,$(notdir $@).$(DMRAID_LIB_VERSION) \
> +-	-Wl,--version-script,.export.sym $(OBJECTS) $(LIBDMRAIDLIBS) -o $@ -ld=
evmapper-event
> ++	-Wl,--version-script,.export.sym $(OBJECTS) $(LIBDMRAIDLIBS) -o $@
> +=20
> + $(LIB_STATIC): $(OBJECTS)
> + 	$(RM) $@
> +--- 1.0.0.rc16.orig/tools/Makefile.in
> ++++ 1.0.0.rc16/tools/Makefile.in
> +@@ -22,12 +22,6 @@ TARGETS=3D\
> +=20
> + include $(top_srcdir)/make.tmpl
> +=20
> +-ifeq ("@KLIBC@", "no")
> +-	ifeq ("@STATIC_LINK@", "no")
> +-		TARGETS +=3D dmevent_tool
> +-	endif
> +-endif
> +-
> + DMRAIDLIBS=3D-ldmraid
> +=20
> + ifeq ("@KLIBC@", "yes")
> +@@ -37,16 +31,10 @@ else
> + 		ifeq ("@LIB_SO@", "no")
> + 			DMRAIDLIBS +=3D -ldevmapper_dietc
> + 		endif
> +-		ifeq ("@STATIC_LINK@", "no")
> +-			DMEVENTTOOLLIBS =3D -ldevmapper-event_dietc
> +-		endif
> + 	else
> + 		ifeq ("@LIB_SO@", "no")
> + 			DMRAIDLIBS +=3D -ldevmapper
> + 		endif
> +-		ifeq ("@STATIC_LINK@", "no")
> +-			DMEVENTTOOLLIBS =3D -ldevmapper-event
> +-		endif
> + 	endif
> +=20
> + 	ifeq ("@LIBSELINUX@", "yes")
> +--- 1.0.0.rc16.orig/lib/.export.sym
> ++++ 1.0.0.rc16/lib/.export.sym
> +@@ -52,8 +52,6 @@ Base {
>=20
> + 		dso_end_rebuild;
>=20
> + 		hot_spare_add;
>=20
> + 		dso_get_members;
>=20
> +-		dm_register_device;
>=20
> +-		dm_unregister_device;
> + 		dm_all_monitored;
> + 	local:
>=20
> + 		*;
>=20
> +--- 1.0.0.rc16.orig/lib/activate/activate.c
> ++++ 1.0.0.rc16/lib/activate/activate.c
> +@@ -849,18 +849,12 @@ enum dm_what { DM_ACTIVATE, DM_REGISTER=20
> + static int
> + dm_register_for_event(char *dev_name, char *lib_name)
> + {
> +-#ifdef	DMRAID_AUTOREGISTER
> +-	dm_register_device(dev_name, lib_name);
> +-#endif
> + 	return 1;
> + }
> +=20
> + static int
> + dm_unregister_for_event(char *dev_name, char *lib_name)
> + {
> +-#ifdef	DMRAID_AUTOREGISTER
> +-	dm_unregister_device(dev_name, lib_name);
> +-#endif
> + 	return 1;
> + }
> +=20
> +@@ -874,6 +868,8 @@ do_device(struct lib_context *lc, struct
> + 	if (OPT_TEST(lc))
> + 		return 1;
> +=20
> ++	return 1;
> ++
> +         struct dmraid_format *fmt =3D get_format(rs);
> +=20
> +         if (fmt->name !=3D NULL) {
> +--- 1.0.0.rc16.orig/lib/metadata/reconfig.c
> ++++ 1.0.0.rc16/lib/metadata/reconfig.c
> +@@ -242,20 +242,16 @@ add_dev_to_raid(struct lib_context *lc,=20
> + 		 * metadata on disks to OK state.
> + 		 */
> + 		/* Create lib-events library name */
> +-		if (fmt->name) {
> ++		/*if (fmt->name) {
> + 			strncpy(lib_name, "libdmraid-events-", LIB_NAME_LENGTH);
> + 			strncat(lib_name, fmt->name,
> + 				LIB_NAME_LENGTH-strlen(fmt->name)-3);
> + 			strncat(lib_name, ".so", 3);
> + 		} else
> + 			goto err;
> +-
> +-		/* Check registration */
> +-		if (!dm_monitored_events(&pending, sub_rs->name, lib_name)) {
> +-			/* If NOT registered update metadata to OK state. */
> ++*/
> + 			if (check_rd->fmt->metadata_handler)
> + 				check_rd->fmt->metadata_handler(lc, UPDATE_REBUILD_STATE, NULL, (vo=
id *) rs);
> +-		}
> + 	}
> + #endif
> +=20
> diff --git a/meta-oe/recipes-extended/dmraid/files/03_fix_hyphen-used-as-=
minus-sign.patch b/meta-oe/recipes-extended/dmraid/files/03_fix_hyphen-used=
-as-minus-sign.patch
> new file mode 100644
> index 0000000..8c8c0de
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/03_fix_hyphen-used-as-minus-s=
ign.patch
> @@ -0,0 +1,291 @@
> +Author: Giuseppe Iuculano <giuseppe@iuculano.it>
> +Description: Fix hyphen-used-as-minus-sign
> +--- 1.0.0.rc16.orig/man/dmraid.8
> ++++ 1.0.0.rc16/man/dmraid.8
> +@@ -4,20 +4,20 @@ dmraid \- discover, configure and activa
> + .SH SYNOPSIS
> + .B dmraid
> +  {-a|--activate} {y|n|yes|no}=20
> +- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
> +- [-f|--format FORMAT[,FORMAT...]]
> ++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
> ++ [\-f|--format FORMAT[,FORMAT...]]
> +  [{-P|--partchar} CHAR]
> +- [-p|--no_partitions]
> +- [-Z|--rm_partitions]
> ++ [\-p|--no_partitions]
> ++ [\-Z|--rm_partitions]
> +  [--separator SEPARATOR]
> +- [-t|--test]
> ++ [\-t|--test]
> +  [RAID-set...]
> +=20
> + .B dmraid
> +  {-b|--block_devices}
> +- [-c|--display_columns][FIELD[,FIELD...]]...
> +- [-d|--debug]... [-v|--verbose]...
> +- [--separator SEPARATOR]
> ++ [\-c|--display_columns][FIELD[,FIELD...]]...
> ++ [\-d|--debug]... [\-v|--verbose]...
> ++ [\--separator SEPARATOR]
> +  [device-path...]
> +=20
> + .B dmraid
> +@@ -25,60 +25,60 @@ dmraid \- discover, configure and activa
> +=20
> + .B dmraid
> +  {-l|--list_formats}
> +- [-d|--debug]... [-v|--verbose]...
> ++ [\-d|--debug]... [\-v|--verbose]...
> +=20
> + .B dmraid
> +  {-n|--native_log}
> +- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
> +- [-f|--format FORMAT[,FORMAT...]]
> +- [--separator SEPARATOR]
> ++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
> ++ [\-f|--format FORMAT[,FORMAT...]]
> ++ [\--separator SEPARATOR]
> +  [device-path...]
> +=20
> + .B dmraid
> +- {-R| --rebuild}
> ++ {-R| \--rebuild}
> +  RAID-set
> +  [device-path]
> +=20
> + .B dmraid
> +- {-x| --remove}
> ++ {-x| \--remove}
> +  [RAID-set]
> +=20
> + .B dmraid
> +- -f FORMAT-handler
> +-{-C| --create} set=20
> +- --type raidlevel
> +- [--size=3Dsetsize --strip stridesize]=20
> +- --disk "device-path, device-path [, device-path ...]"
> ++ \-f FORMAT-handler
> ++{-C| \--create} set=20
> ++ \--type raidlevel
> ++ [\--size=3Dsetsize \--strip stridesize]=20
> ++ \--disk "device-path, device-path [, device-path ...]"
> +=20
> + .B dmraid
> +-[ -f|--format FORMAT-handler]
> +--S|--spare [RAID-set]
> +--M|--media  "device-path"
> ++[ \-f|--format FORMAT-handler]
> ++\-S|--spare [RAID-set]
> ++\-M|--media  "device-path"
> +=20
> + .B dmraid
> +  {-r|--raid_devices}
> +- [-c|--display_columns][FIELD[,FIELD...]]...
> +- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
> +- [-D|--dump_metadata]
> +- [-f|--format FORMAT[,FORMAT...]]
> +- [--separator SEPARATOR]
> ++ [\-c|--display_columns][FIELD[,FIELD...]]...
> ++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
> ++ [\-D|--dump_metadata]
> ++ [\-f|--format FORMAT[,FORMAT...]]
> ++ [\--separator SEPARATOR]
> +  [device-path...]
> +=20
> + .B dmraid
> +  {-r|--raid_devices}
> +- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
> +- [-E|--erase_metadata]
> +- [-f|--format FORMAT[,FORMAT...]]
> +- [--separator SEPARATOR]
> ++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
> ++ [\-E|--erase_metadata]
> ++ [\-f|--format FORMAT[,FORMAT...]]
> ++ [\--separator SEPARATOR]
> +  [device-path...]
> +=20
> + .B dmraid
> +  {-s|--sets}...[a|i|active|inactive]
> +- [-c|--display_columns][FIELD[,FIELD...]]...
> +- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
> +- [-f|--format FORMAT[,FORMAT...]]
> +- [-g|--display_group]
> +- [--separator SEPARATOR]
> ++ [\-c|--display_columns][FIELD[,FIELD...]]...
> ++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
> ++ [\-f|--format FORMAT[,FORMAT...]]
> ++ [\-g|--display_group]
> ++ [\--separator SEPARATOR]
> +  [RAID-set...]
> +=20
> + .B dmraid
> +@@ -117,7 +117,7 @@ will make dmraid tell the kernel to remo
> + underlying the set, ie if sda is part of the set, remove sda1, sda2, et=
c.
> + This prevents applications from directly accessiong the disks bypassing=
 dmraid.
> + RAID set names given on command line don't need to be fully specified
> +-(eg, "dmraid -ay sil" would activate all discovered Silicon Image Medley
> ++(eg, "dmraid \-ay sil" would activate all discovered Silicon Image Medl=
ey
> + RAID sets).
> +=20
> + .TP
> +@@ -134,7 +134,7 @@ See description of
> + below for FIELD identifiers.
> +=20
> + .TP
> +-.I [-d|--debug]...
> ++.I [\-d|--debug]...
> + Enable debugging output. Opion can be given multiple times
> + increasing the debug output level.
> +=20
> +@@ -214,18 +214,18 @@ is added to the system.
> +     During system reboot, enter OROM and mark the new drive as the rebu=
ild drive. =20
> +     After booting to the OS, use the dmraid command to rebuild.
> +=20
> +-    Example: dmraid -R raid_set=20
> ++    Example: dmraid \-R raid_set=20
> +=20
> + 2. Using dmraid to identify a new drive
> +     Boot to the OS and use the dmraid command with the new drive as
> + the second parameter.
> +=20
> +-    Example: dmraid -R raid_set /dev/sdc
> ++    Example: dmraid \-R raid_set /dev/sdc
> +=20
> + 3. Using hot spare drive
> +-    Mark a drive as hot spare using the "dmraid -f isw -S" command. The=
n use the dmraid command to start the rebuild.
> ++    Mark a drive as hot spare using the "dmraid \-f isw \-S" command. T=
hen use the dmraid command to start the rebuild.
> +=20
> +-    Example: dmraid -R raid_set
> ++    Example: dmraid \-R raid_set
> +=20
> + .TP
> + .I {-x|--remove} [RAID-set]
> +@@ -235,11 +235,11 @@ Delete one or all existing software RAID
> + .I -f FORMAT-handler {-C|--create} --type raidlevel [--size=3Dsetsize -=
-strip stripsize] --disk "device-path, device-path [,device-path]"
> + Delete one or all existing Configure a software RAID device  and store =
the configuration data in a group of hard drive devices consisting of this =
array. This command requires the following options:
> +=20
> +--f FORMAT-handler
> ++\-f FORMAT-handler
> + .br
> +-	metadata format (see "dmraid -l")
> ++	metadata format (see "dmraid \-l")
> + .br	=09
> +---type digit[digit...]
> ++\--type digit[digit...]
> + .br
> + 	specify the raid level of the software RAID set.=20
> + .br
> +@@ -251,7 +251,7 @@ Delete one or all existing Configure a s
> + .br
> + 		01: raid01 (isw raid10)
> + .br
> +---size: [digits[k|K|m|M|g|G][b|B]]
> ++\--size: [digits[k|K|m|M|g|G][b|B]]
> + .br
> + 	specify the size of the RAID set.The number is an integer followed by =
[kKmMgG] and/or [bB].
> + .br
> +@@ -267,11 +267,11 @@ Delete one or all existing Configure a s
> + .br
> + If this option is missing, it's set to the default value pre-configured=
 by the vendor. Note that different vendors may apply different constraints=
 on the granularity of the size or the minimal value.
> + .br
> +---strip: [digits[k|K|m|M|g|G][b|B]]
> ++\--strip: [digits[k|K|m|M|g|G][b|B]]
> + .br
> + 	specify the strip size of a RAID1, RAID5, and RAID10 RAID set (as abov=
e)
> + .br
> +---disk: device-path[{,| }device-path...]
> ++\--disk: device-path[{,| }device-path...]
> + .br
> + 	specify the array of the hard drives, e.g. /dev/sda.
> +=20
> +@@ -349,7 +349,7 @@ Use SEPARATOR as a delimiter for all opt
> + .TP
> + .I -s... [a|i] [RAID-set...]
> + Display properties of RAID sets. Multiple RAID set names can be given
> +-on the command line which don't need to be fully specified (eg, "dmraid=
 -s hpt"
> ++on the command line which don't need to be fully specified (eg, "dmraid=
 \-s hpt"
> + would display all discovered Highpoint RAID sets). Enter
> + .B -s
> + twice to display RAID subsets too.
> +@@ -377,7 +377,7 @@ Enable verbose runtime information outpu
> + increasing the verbosity level.
> +=20
> + .SH EXAMPLES
> +-"dmraid -l" lists all supported metadata formats with their names along=
 with
> ++"dmraid \-l" lists all supported metadata formats with their names alon=
g with
> + some descriptive information, eg:
> + .br
> + hpt37x : (+) Highpoint HPT37X
> +@@ -400,16 +400,16 @@ dos    : (+) DOS partitions on SW RAIDs
> + .br
> + (0): Discover, (+): Discover+Activate
> +=20
> +-"dmraid -ay" activates all software RAID sets discovered.
> ++"dmraid \-ay" activates all software RAID sets discovered.
> +=20
> +-"dmraid -an" deactivates all active software RAID sets which are not op=
en
> ++"dmraid \-an" deactivates all active software RAID sets which are not o=
pen
> + (eg, mounted filesystem on them).
> +=20
> +-"dmraid -ay -f pdc" (pdc looked up from "dmraid -l") activates all
> ++"dmraid \-ay \-f pdc" (pdc looked up from "dmraid \-l") activates all
> + software RAID sets with Promise format discovered and ignores all other
> + supported formats.
> +=20
> +-"dmraid -r" discovers all software RAID devices supported on your syste=
m, eg:
> ++"dmraid \-r" discovers all software RAID devices supported on your syst=
em, eg:
> + .br
> + /dev/dm-46: hpt45x, "hpt45x_chidjhaiaa-0", striped, ok, 320172928 secto=
rs, data@ 0
> + .br
> +@@ -420,7 +420,7 @@ supported formats.
> + /dev/dm-58: hpt45x, "hpt45x_chidjhaiaa-1", striped, ok, 320172928 secto=
rs, data@ 0
> +=20
> +=20
> +-"dmraid -s -s hpt45x_chidjhaiaa" displays properties of
> ++"dmraid \-s \-s hpt45x_chidjhaiaa" displays properties of
> + set "hpt45x_chidjhaiaa", eg:
> + .br
> + *** Superset
> +@@ -478,7 +478,7 @@ dev    : 2
> + spare  : 0
> + .br
> +=20
> +-"dmraid -s -ccs hpt45" displays properties in column format of all sets
> ++"dmraid \-s \-ccs hpt45" displays properties in column format of all se=
ts
> + and subsets with hpt45* format, eg:
> + .br
> + hpt45x_chidjhaiaa,640345856,128,raid10,ok,4,0
> +@@ -487,7 +487,7 @@ hpt45x_chidjhaiaa-a,640345856,128,stripe
> + .br
> + hpt45x_chidjhaiaa-b,640345856,128,stripe,ok,2,0
> +=20
> +-"dmraid -r --sep : -cpath:size" display paths and sizes in sectors for
> ++"dmraid \-r \--sep : \-cpath:size" display paths and sizes in sectors f=
or
> + RAID devices in column format using ':' as a delimiter, eg:
> + .br
> + /dev/dm-8:320173055
> +@@ -518,18 +518,18 @@ RAID devices in column format using ':'=20
> + .br
> + /dev/dm-66:390624896
> +=20
> +-"dmraid -f isw -C Raid0 --type 0 --strip 8k --size 20g --disk "/dev/sdb=
 /dev/sdc"" creates an ISW volume with
> ++"dmraid \-f isw \-C Raid0 \--type 0 \--strip 8k \--size 20g \--disk "/d=
ev/sdb /dev/sdc"" creates an ISW volume with
> + a name of "Raid0", 20Gig bytes in total, and 8kilo bytes strip size on =
two disks.
> +=20
> +-"dmraid -f isw -C Test0 --type 0 --disk "/dev/sdd /dev/sde"" creates an=
 ISW volume with the default size and strip size.
> ++"dmraid \-f isw \-C Test0 \--type 0 \--disk "/dev/sdd /dev/sde"" create=
s an ISW volume with the default size and strip size.
> +=20
> +-"dmraid -f isw -C Test10 --type 01 --strip 128B --disk "/dev/sda /dev/s=
db /dev/sdc /dev/sdd" creates a stacked
> ++"dmraid \-f isw \-C Test10 \--type 01 \--strip 128B \--disk "/dev/sda /=
dev/sdb /dev/sdc /dev/sdd" creates a stacked
> + RAID device, RAID10 (isw format), with a name of "Test10", 128 blocks (=
512bytes) strip size , and the default volume size on
> + 4 disks.
> +=20
> +-"dmraid -f isw -S -M /dev/sde" marks the device /dev/sde as a hot spare=
 for rebuild
> ++"dmraid \-f isw \-S \-M /dev/sde" marks the device /dev/sde as a hot sp=
are for rebuild
> +=20
> +-"dmraid -R isw_djaggchdde_RAID1 /dev/sde" starts rebuild of the RAID vo=
lume on device /dev/sde
> ++"dmraid \-R isw_djaggchdde_RAID1 /dev/sde" starts rebuild of the RAID v=
olume on device /dev/sde
> +=20
> + .SH DIAGNOSTICS
> + dmraid returns an exit code of 0 for success or 1 for error.
> diff --git a/meta-oe/recipes-extended/dmraid/files/04_promise-add-offsets=
=2Epatch b/meta-oe/recipes-extended/dmraid/files/04_promise-add-offsets.pat=
ch
> new file mode 100644
> index 0000000..1f07da5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/04_promise-add-offsets.patch
> @@ -0,0 +1,13 @@
> +Author: Luke Yelavich <themuso@ubuntu.com>
> +Description: Add extra offsets where promise metadata can be found.
> +--- 1.0.0.rc16.orig/lib/format/ataraid/pdc.h
> ++++ 1.0.0.rc16/lib/format/ataraid/pdc.h
> +@@ -13,7 +13,7 @@
> +=20
> + #include <stdint.h>
> +=20
> +-#define PDC_CONFIGOFFSETS	63,255,256,16,399,591,675,735,974,991
> ++#define PDC_CONFIGOFFSETS	63,255,256,16,399,591,675,735,974,991,911,951
> + #define	PDC_DATAOFFSET 0
> +=20
> + /*
> diff --git a/meta-oe/recipes-extended/dmraid/files/05_exit_code.patch b/m=
eta-oe/recipes-extended/dmraid/files/05_exit_code.patch
> new file mode 100644
> index 0000000..5c0b036
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/05_exit_code.patch
> @@ -0,0 +1,22 @@
> +Author: Giuseppe Iuculano <giuseppe@iuculano.it>
> +Description: Fix exit-code for "No RAID disks" and "no block devices fou=
nd" errors (LP: #300825)
> +--- 1.0.0.rc16.orig/lib/metadata/metadata.c
> ++++ 1.0.0.rc16/lib/metadata/metadata.c
> +@@ -2096,7 +2096,7 @@ get_metadata(struct lib_context *lc, enu
> +=20
> + 	if (!count_devices(lc, DEVICE)) {
> + 		log_print(lc, "no block devices found");
> +-		return 1;
> ++		return 0;
> + 	}
> +=20
> + 	if (!(M_RAID & p->metadata))
> +@@ -2118,7 +2118,7 @@ get_metadata(struct lib_context *lc, enu
> + 	if (!OPT_HOT_SPARE_SET(lc) && !OPT_CREATE(lc)
> + 	    && !count_devices(lc, RAID)) {
> + 		format_error(lc, "disks", argv);
> +-		return 1;
> ++		return 0;
> + 	}
> +=20
> + 	if (M_SET & p->metadata) {
> diff --git a/meta-oe/recipes-extended/dmraid/files/06_support_virtio_devi=
ces.patch b/meta-oe/recipes-extended/dmraid/files/06_support_virtio_devices=
=2Epatch
> new file mode 100644
> index 0000000..2863219
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/06_support_virtio_devices.pat=
ch
> @@ -0,0 +1,13 @@
> +Author: Luke Yelavich <themuso@ubuntu.com>
> +Description: Support for checking virtio devices for dmraid metadata.
> +--- 1.0.0.rc16.orig/lib/device/scan.c
> ++++ 1.0.0.rc16/lib/device/scan.c
> +@@ -174,7 +174,7 @@ interested(struct lib_context *lc, char=20
> + 	 * Whole IDE and SCSI disks only.
> + 	 */
> + 	return (!isdigit(name[strlen(name) - 1]) &&
> +-		(*(name + 1) =3D=3D 'd' && (*name =3D=3D 'h' || *name =3D=3D 's')))
> ++		(*(name + 1) =3D=3D 'd' && (*name =3D=3D 'h' || *name =3D=3D 's' || *=
name =3D=3D 'v')))
> + #ifdef	DMRAID_TEST
> + 		/*
> + 		 * Include dm devices for testing.
> diff --git a/meta-oe/recipes-extended/dmraid/files/07_isw-probe-hpa.patch=
 b/meta-oe/recipes-extended/dmraid/files/07_isw-probe-hpa.patch
> new file mode 100644
> index 0000000..289604f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/07_isw-probe-hpa.patch
> @@ -0,0 +1,144 @@
> +Probe isw disks with [some] HPA awareness, thanks to Robert Collins <rob=
ert@ubuntu.com>. (LP: #372170)
> +--- 1.0.0.rc16.orig/lib/format/ataraid/isw.c
> ++++ 1.0.0.rc16/lib/format/ataraid/isw.c
> +@@ -353,6 +353,7 @@ raiddev(struct isw *isw, unsigned i)
> + enum convert { FULL, FIRST, LAST };
> + #if	BYTE_ORDER =3D=3D LITTLE_ENDIAN
> + #  define	to_cpu(x, y)
> ++#  define       CVT16(x)
> + #else
> + /*
> +  * We can differ from the read_raid_dev template here,
> +@@ -547,15 +548,16 @@ disk_ok(struct lib_context *lc, struct d
> + }
> +=20
> + static void *
> +-isw_read_metadata(struct lib_context *lc, struct dev_info *di,
> +-		  size_t * sz, uint64_t * offset, union read_info *info)
> ++isw_try_sboffset(struct lib_context *lc, struct dev_info *di,
> ++		 size_t * sz, uint64_t * offset, union read_info *info,
> ++		 uint64_t const isw_sboffset)
> + {
> + 	size_t size =3D ISW_DISK_BLOCK_SIZE;
> +-	uint64_t isw_sboffset =3D ISW_CONFIGOFFSET(di);
> + 	struct isw *isw;
> ++	uint64_t temp_isw_sboffset =3D isw_sboffset;
> +=20
> + 	if (!(isw =3D alloc_private_and_read(lc, handler, size,
> +-					   di->path, isw_sboffset)))
> ++					   di->path, temp_isw_sboffset)))
> + 		goto out;
> +=20
> + 	/*
> +@@ -565,9 +567,15 @@ isw_read_metadata(struct lib_context *lc
> + 	to_cpu(isw, FIRST);
> +=20
> + 	/* Check Signature and read optional extended metadata. */
> +-	if (!is_isw(lc, di, isw) ||
> +-	    !isw_read_extended(lc, di, &isw, &isw_sboffset, &size))
> ++	if (!is_isw(lc, di, isw)) {
> ++		log_dbg(lc, "not isw at %ld", isw_sboffset);
> + 		goto bad;
> ++	}
> ++	if (!isw_read_extended(lc, di, &isw, &temp_isw_sboffset, &size)) {
> ++		log_err(lc, "isw metadata, but extended read failed at %ld",
> ++			isw_sboffset);
> ++		goto bad;
> ++	}
> +=20
> + 	/*
> + 	 * Now that we made sure, that we've got all the
> +@@ -578,6 +586,8 @@ isw_read_metadata(struct lib_context *lc
> + 	if (disk_ok(lc, di, isw)) {
> + 		*sz =3D size;
> + 		*offset =3D info->u64 =3D isw_sboffset;
> ++		log_dbg(lc, "isw metadata found at %ld from probe at %ld\n",
> ++			*offset, isw_sboffset);
> + 		goto out;
> + 	}
> +=20
> +@@ -589,6 +599,54 @@ out:
> + 	return (void *) isw;
> + }
> +=20
> ++/* HPA on a disk shifts everything down. This is a 'works-enough' appro=
ach to
> ++ * handling that. There is a better long term approach requiring kernel
> ++ * patches - see the lkml patches for alt_size.
> ++ */
> ++static void *
> ++isw_try_hpa(struct lib_context *lc, struct dev_info *di,
> ++	   size_t * sz, uint64_t * offset, union read_info *info)
> ++{
> ++	struct isw10 *isw10;
> ++	void *result =3D NULL;
> ++	uint64_t actual_offset;
> ++	if (!(isw10 =3D alloc_private_and_read(lc, handler, ISW_DISK_BLOCK_SIZ=
E,
> ++		di->path, ISW_10_CONFIGOFFSET(di))))
> ++		goto out;
> ++	if (strncmp((const char *)isw10->sig, ISW10_SIGNATURE, ISW10_SIGNATURE=
_SIZE))
> ++		goto out_free;
> ++	log_dbg(lc, "Found isw 10 gafr signature.");
> ++	CVT16(isw10->offset);
> ++	actual_offset =3D isw10->offset + 2;
> ++	log_dbg(lc, "isw 10 sector offset calculated at %hd.", actual_offset);
> ++	if (actual_offset > di->sectors)
> ++		goto out_free;
> ++	result =3D isw_try_sboffset(lc, di, sz, offset, info,
> ++		ISW_SECTOR_TO_OFFSET(di->sectors - actual_offset));
> ++      out_free:
> ++	dbg_free(isw10);
> ++      out:
> ++	return result;
> ++}
> ++
> ++
> ++static void *
> ++isw_read_metadata(struct lib_context *lc, struct dev_info *di,
> ++		  size_t * sz, uint64_t * offset, union read_info *info)
> ++{
> ++	void *result;
> ++	if ((result =3D isw_try_sboffset(
> ++		lc, di, sz, offset, info, ISW_CONFIGOFFSET(di))))
> ++		return result;
> ++	if ((result =3D isw_try_hpa(lc, di, sz, offset, info)))
> ++		return result;
> ++        log_dbg(lc, "isw trying hard coded -2115 offset.");
> ++	if ((result =3D isw_try_sboffset(
> ++		lc, di, sz, offset, info, (di->sectors - 2115)*512)))
> ++		return result;
> ++	return NULL;
> ++}
> ++
> + static int setup_rd(struct lib_context *lc, struct raid_dev *rd,
> + 		    struct dev_info *di, void *meta, union read_info *info);
> + static struct raid_dev *
> +--- 1.0.0.rc16.orig/lib/format/ataraid/isw.h
> ++++ 1.0.0.rc16/lib/format/ataraid/isw.h
> +@@ -36,8 +36,11 @@
> +=20
> + /* Intel metadata offset in bytes */
> + #define	ISW_CONFIGSECTOR(di)	((di)->sectors - 2)
> +-#define	ISW_CONFIGOFFSET(di)	(ISW_CONFIGSECTOR(di) << 9)
> ++#define ISW_SECTOR_TO_OFFSET(sector) ((sector) << 9)
> ++#define	ISW_CONFIGOFFSET(di)	(ISW_SECTOR_TO_OFFSET(ISW_CONFIGSECTOR(di)=
))
> + #define	ISW_DATAOFFSET		0	/* Data offset in sectors */
> ++#define ISW_10_CONFIGSECTOR(di) ((di)->sectors - 1)
> ++#define ISW_10_CONFIGOFFSET(di) (ISW_SECTOR_TO_OFFSET(ISW_10_CONFIGSECT=
OR(di)))
> +=20
> + #define MPB_SIGNATURE	     "Intel Raid ISM Cfg Sig. "
> + #define MPB_SIGNATURE_SIZE	(sizeof(MPB_SIGNATURE) - 1)
> +@@ -222,6 +225,14 @@ struct isw {
> + 	// here comes isw_dev[num_raid_devs]
> + } __attribute__ ((packed));
> +=20
> ++#define ISW10_SIGNATURE "$GAFR\x10"
> ++#define ISW10_SIGNATURE_SIZE (sizeof(ISW10_SIGNATURE) - 1)
> ++struct isw10 {
> ++	int8_t sig[ISW10_SIGNATURE_SIZE];
> ++	uint32_t offset; /* offset to real data, in sectors back */
> ++} __attribute__ ((packed));
> ++
> ++
> + #endif
> +=20
> + int register_isw(struct lib_context *lc);
> diff --git a/meta-oe/recipes-extended/dmraid/files/08_activate_multiple_r=
aid_sets.patch b/meta-oe/recipes-extended/dmraid/files/08_activate_multiple=
_raid_sets.patch
> new file mode 100644
> index 0000000..807ceac
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/08_activate_multiple_raid_set=
s.patch
> @@ -0,0 +1,12 @@
> +Continue onto all raid sets instead of returning after processing the fi=
rst. (LP: #401713)
> +--- 1.0.0.rc16.orig/lib/metadata/metadata.c
> ++++ 1.0.0.rc16/lib/metadata/metadata.c
> +@@ -839,7 +839,7 @@ _discover_partitions(struct lib_context=20
> + 		 */
> + 		if (T_GROUP(rs)) {
> + 			_discover_partitions(lc, &rs->sets);
> +-			return;
> ++			continue;
> + 		}
> +=20
> + 		/*
> diff --git a/meta-oe/recipes-extended/dmraid/files/09_pdc_raid10_failure.=
=2Epatch b/meta-oe/recipes-extended/dmraid/files/09_pdc_raid10_failure..pat=
ch
> new file mode 100644
> index 0000000..62b2f36
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/09_pdc_raid10_failure..patch
> @@ -0,0 +1,14 @@
> +fix pdc metadata format handler to report the proper number of devices i=
n a subset
> +--- 1.0.0.rc16.orig/lib/format/ataraid/pdc.c
> ++++ 1.0.0.rc16/lib/format/ataraid/pdc.c
> +@@ -490,7 +490,9 @@ devices(struct raid_dev *rd, void *conte
> + 	if (context && pdc->raid.type !=3D PDC_T_SPAN)
> + 		*((uint64_t *) context) +=3D rd->sectors;
> +=20
> +-	return pdc->raid.total_disks;
> ++	return is_raid10(pdc) ?=20
> ++		pdc->raid.total_disks / 2 :
> ++		pdc->raid.total_disks;
> + }
> +=20
> + static int
> diff --git a/meta-oe/recipes-extended/dmraid/files/10_ddf1_lsi_persistent=
_name.patch b/meta-oe/recipes-extended/dmraid/files/10_ddf1_lsi_persistent_=
name.patch
> new file mode 100644
> index 0000000..6e085e7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/10_ddf1_lsi_persistent_name.p=
atch
> @@ -0,0 +1,20 @@
> +Using a dummy string for the timestamp in the LSI metadata
> +--- 1.0.0.rc16.orig/lib/format/ddf/ddf1.c
> ++++ 1.0.0.rc16/lib/format/ddf/ddf1.c
> +@@ -696,6 +696,16 @@ name(struct lib_context *lc, struct ddf1
> + 			sprintf(b, "%02x%02x%02x%02x",
> + 				vd->guid[i], vd->guid[i + 1],
> + 				vd->guid[i + 2], vd->guid[i + 3]);
> ++
> ++		/*
> ++		 * Because the LSI bios changes the timestamp in the
> ++		 * metadata on every boot, we have to neutralize it
> ++		 * in order to allow for persistent names.
> ++		 *
> ++		 * Using a dummy string "47114711" for that.
> ++		 */
> ++		if (!strncmp((char *) vd->guid, "LSI", 3))
> ++			strncpy(buf + prefix + 32, "47114711", 8);
> + 	}
> +=20
> + out:
> diff --git a/meta-oe/recipes-extended/dmraid/files/11_fix_isw_sectors_cal=
culation.patch b/meta-oe/recipes-extended/dmraid/files/11_fix_isw_sectors_c=
alculation.patch
> new file mode 100644
> index 0000000..8087904
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/11_fix_isw_sectors_calculatio=
n.patch
> @@ -0,0 +1,14 @@
> +Fix isw raid0 incorrect  sectors calculation, thanks to Valentin Pavlyuc=
henko
> +--- 1.0.0.rc16.orig/lib/format/ataraid/isw.c
> ++++ 1.0.0.rc16/lib/format/ataraid/isw.c
> +@@ -776,7 +776,9 @@ _create_rd(struct lib_context *lc,
> + 	r->di =3D rd->di;
> + 	r->fmt =3D rd->fmt;
> + 	r->offset =3D dev->vol.map[0].pba_of_lba0;
> +-	if ((r->sectors =3D dev->vol.map[0].blocks_per_member - RAID_DS_JOURNA=
L))
> ++	//fix bugs on ICH10R
> ++	//if ((r->sectors =3D dev->vol.map[0].blocks_per_member - RAID_DS_JOUR=
NAL))
> ++	if ((r->sectors =3D dev->vol.map[0].blocks_per_member))
> + 		goto out;
> +=20
> + 	log_zero_sectors(lc, rd->di->path, handler);
> diff --git a/meta-oe/recipes-extended/dmraid/files/12_jmicron_namefix.pat=
ch b/meta-oe/recipes-extended/dmraid/files/12_jmicron_namefix.patch
> new file mode 100644
> index 0000000..a0ed1eb
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/12_jmicron_namefix.patch
> @@ -0,0 +1,20 @@
> +From: Phillip Susi <psusi@cfl.rr.com>
> +Author: Danny Wood <danwood76@gmail.com>
> +Subject: Fix jmicron names again
> +Bug-Ubuntu: http://launchpad.net/bugs/576289
> +Last-Update: 2011-03-08
> +Description: Uninitialized variable prevented code from working
> + as intended.
> +Index: 1.0.0.rc16/lib/format/ataraid/jm.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/format/ataraid/jm.c
> ++++ 1.0.0.rc16/lib/format/ataraid/jm.c
> +@@ -25,7 +25,7 @@
> + static char *
> + name(struct lib_context *lc, struct raid_dev *rd, unsigned int subset)
> + {
> +-	size_t i, len;
> ++	size_t i =3D JM_NAME_LEN - 1, len;
> + 	struct jm *jm =3D META(rd, jm);
> + 	char *ret, *name =3D (char *) jm->name;
> + 	char buf[JM_NAME_LEN + 1] =3D { '\0' };
> diff --git a/meta-oe/recipes-extended/dmraid/files/13_fix_testing.patch b=
/meta-oe/recipes-extended/dmraid/files/13_fix_testing.patch
> new file mode 100644
> index 0000000..48c2ed4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/13_fix_testing.patch
> @@ -0,0 +1,24 @@
> +From: Phillip Susi <psusi@cfl.rr.com>
> +Last-Update: 2011-03-08
> +Forwarded: yes
> +Description: Testing with dm devices was failing on Ubuntu because
> + /dev/dm-X is the actual device node, but the code wanted it to be
> + a symlink.  Fixed dm_test_device() to test that the file ( or node
> + it points to ) is a block device, which seems a much more
> + appropriate test.
> +
> +Index: 1.0.0.rc16/lib/device/scan.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/device/scan.c
> ++++ 1.0.0.rc16/lib/device/scan.c
> +@@ -86,8 +86,8 @@
> + {
> + 	struct stat s;
> +=20
> +-	return !lstat(path, &s) &&
> +-		S_ISLNK(s.st_mode) &&
> ++	return !stat(path, &s) &&
> ++		S_ISBLK(s.st_mode) &&
> + 		!strncmp(get_basename(lc, path), "dm-", 3);
> + }
> +=20
> diff --git a/meta-oe/recipes-extended/dmraid/files/14_pdc_dump_extended_m=
etadata.patch b/meta-oe/recipes-extended/dmraid/files/14_pdc_dump_extended_=
metadata.patch
> new file mode 100644
> index 0000000..a821195
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/14_pdc_dump_extended_metadata=
=2Epatch
> @@ -0,0 +1,147 @@
> +From: Phillip Susi <psusi@cfl.rr.com>
> +Last-Update: 2011-03-08
> +Forwarded: Yes
> +Description: PDC supports up to 4 sets of metadata to describe
> + different arrays. Only the first set was being dumped with
> + dmraid -rD or -n.  This patch corrects that.  Also fixes the
> + .offset file, which was always reporting 0.
> +
> +Index: 1.0.0.rc16/lib/format/ataraid/pdc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/format/ataraid/pdc.c
> ++++ 1.0.0.rc16/lib/format/ataraid/pdc.c
> +@@ -172,7 +172,6 @@
> + 	unsigned *s =3D end_sectors;
> + 	uint64_t sector;
> +=20
> +-	*size =3D sizeof(*ret);
> + 	pdc_sectors_max =3D di->sectors - div_up(*size, 512);
> +=20
> + 	if (!(ret =3D alloc_private(lc, handler,
> +@@ -219,7 +218,9 @@
> + 		dbg_free(ret);
> + 		ret =3D NULL;
> + 	}
> +-
> ++	*size =3D sizeof(*ret) * ma;
> ++	*offset =3D di->sectors - info->u32;
> ++	*offset <<=3D 9;
> + 	return ret;
> + }
> +=20
> +@@ -544,60 +545,64 @@
> + static void
> + _pdc_log(struct lib_context *lc, struct dev_info *di, struct pdc *pdc)
> + {
> +-	unsigned i;
> ++	unsigned i, ma =3D count_meta_areas(pdc);
> + 	struct pdc_disk *disk;
> +=20
> +-	log_print(lc, "%s (%s):", di->path, handler);
> +-	DP("promise_id: \"%s\"", pdc, pdc->promise_id);
> +-	P("unknown_0: 0x%x %u",
> +-	  pdc, pdc->unknown_0, pdc->unknown_0, pdc->unknown_0);
> +-	DP("magic_0: 0x%x", pdc, pdc->magic_0);
> +-	P("unknown_1: 0x%x %u",
> +-	  pdc, pdc->unknown_1, pdc->unknown_1, pdc->unknown_1);
> +-	DP("magic_1: 0x%x", pdc, pdc->magic_1);
> +-	P("unknown_2: 0x%x %u",
> +-	  pdc, pdc->unknown_2, pdc->unknown_2, pdc->unknown_2);
> +-	DP("raid.flags: 0x%x", pdc, pdc->raid.flags);
> +-	P("raid.unknown_0: 0x%x %d",
> +-	  pdc, pdc->raid.unknown_0, pdc->raid.unknown_0, pdc->raid.unknown_0);
> +-	DP("raid.disk_number: %u", pdc, pdc->raid.disk_number);
> +-	DP("raid.channel: %u", pdc, pdc->raid.channel);
> +-	DP("raid.device: %u", pdc, pdc->raid.device);
> +-	DP("raid.magic_0: 0x%x", pdc, pdc->raid.magic_0);
> +-	P("raid.unknown_1: 0x%x %u",
> +-	  pdc, pdc->raid.unknown_1, pdc->raid.unknown_1, pdc->raid.unknown_1);
> +-	P("raid.start: 0x%x %u",
> +-	  pdc, pdc->raid.start, pdc->raid.start, pdc->raid.start);
> +-	DP("raid.disk_secs: %u", pdc, pdc->raid.disk_secs);
> +-	P("raid.unknown_3: 0x%x %u",
> +-	  pdc, pdc->raid.unknown_3, pdc->raid.unknown_3, pdc->raid.unknown_3);
> +-	P("raid.unknown_4: 0x%x %u",
> +-	  pdc, pdc->raid.unknown_4, pdc->raid.unknown_4, pdc->raid.unknown_4);
> +-	DP("raid.status: 0x%x", pdc, pdc->raid.status);
> +-	DP("raid.type: 0x%x", pdc, pdc->raid.type);
> +-	DP("raid.total_disks: %u", pdc, pdc->raid.total_disks);
> +-	DP("raid.raid0_shift: %u", pdc, pdc->raid.raid0_shift);
> +-	DP("raid.raid0_disks: %u", pdc, pdc->raid.raid0_disks);
> +-	DP("raid.array_number: %u", pdc, pdc->raid.array_number);
> +-	DP("raid.total_secs: %u", pdc, pdc->raid.total_secs);
> +-	DP("raid.cylinders: %u", pdc, pdc->raid.cylinders);
> +-	DP("raid.heads: %u", pdc, pdc->raid.heads);
> +-	DP("raid.sectors: %u", pdc, pdc->raid.sectors);
> +-	DP("raid.magic_1: 0x%x", pdc, pdc->raid.magic_1);
> +-	P("raid.unknown_5: 0x%x %u",
> +-	  pdc, pdc->raid.unknown_5, pdc->raid.unknown_5, pdc->raid.unknown_5);
> +-
> +-	for (disk =3D pdc->raid.disk, i =3D 0;
> +-	     i < pdc->raid.total_disks; disk++, i++) {
> +-		P2("raid.disk[%d].unknown_0: 0x%x", pdc, i, disk->unknown_0);
> +-		P2("raid.disk[%d].channel: %u", pdc, i, disk->channel);
> +-		P2("raid.disk[%d].device: %u", pdc, i, disk->device);
> +-		P2("raid.disk[%d].magic_0: 0x%x", pdc, i, disk->magic_0);
> +-		P2("raid.disk[%d].disk_number: %u", pdc, i, disk->disk_number);
> +-	}
> ++	while (ma) {
> ++		log_print(lc, "%s (%s):", di->path, handler);
> ++		DP("promise_id: \"%s\"", pdc, pdc->promise_id);
> ++		P("unknown_0: 0x%x %u",
> ++		  pdc, pdc->unknown_0, pdc->unknown_0, pdc->unknown_0);
> ++		DP("magic_0: 0x%x", pdc, pdc->magic_0);
> ++		P("unknown_1: 0x%x %u",
> ++		  pdc, pdc->unknown_1, pdc->unknown_1, pdc->unknown_1);
> ++		DP("magic_1: 0x%x", pdc, pdc->magic_1);
> ++		P("unknown_2: 0x%x %u",
> ++		  pdc, pdc->unknown_2, pdc->unknown_2, pdc->unknown_2);
> ++		DP("raid.flags: 0x%x", pdc, pdc->raid.flags);
> ++		P("raid.unknown_0: 0x%x %d",
> ++		  pdc, pdc->raid.unknown_0, pdc->raid.unknown_0, pdc->raid.unknown_0);
> ++		DP("raid.disk_number: %u", pdc, pdc->raid.disk_number);
> ++		DP("raid.channel: %u", pdc, pdc->raid.channel);
> ++		DP("raid.device: %u", pdc, pdc->raid.device);
> ++		DP("raid.magic_0: 0x%x", pdc, pdc->raid.magic_0);
> ++		P("raid.unknown_1: 0x%x %u",
> ++		  pdc, pdc->raid.unknown_1, pdc->raid.unknown_1, pdc->raid.unknown_1);
> ++		P("raid.start: 0x%x %u",
> ++		  pdc, pdc->raid.start, pdc->raid.start, pdc->raid.start);
> ++		DP("raid.disk_secs: %u", pdc, pdc->raid.disk_secs);
> ++		P("raid.unknown_3: 0x%x %u",
> ++		  pdc, pdc->raid.unknown_3, pdc->raid.unknown_3, pdc->raid.unknown_3);
> ++		P("raid.unknown_4: 0x%x %u",
> ++		  pdc, pdc->raid.unknown_4, pdc->raid.unknown_4, pdc->raid.unknown_4);
> ++		DP("raid.status: 0x%x", pdc, pdc->raid.status);
> ++		DP("raid.type: 0x%x", pdc, pdc->raid.type);
> ++		DP("raid.total_disks: %u", pdc, pdc->raid.total_disks);
> ++		DP("raid.raid0_shift: %u", pdc, pdc->raid.raid0_shift);
> ++		DP("raid.raid0_disks: %u", pdc, pdc->raid.raid0_disks);
> ++		DP("raid.array_number: %u", pdc, pdc->raid.array_number);
> ++		DP("raid.total_secs: %u", pdc, pdc->raid.total_secs);
> ++		DP("raid.cylinders: %u", pdc, pdc->raid.cylinders);
> ++		DP("raid.heads: %u", pdc, pdc->raid.heads);
> ++		DP("raid.sectors: %u", pdc, pdc->raid.sectors);
> ++		DP("raid.magic_1: 0x%x", pdc, pdc->raid.magic_1);
> ++		P("raid.unknown_5: 0x%x %u",
> ++		  pdc, pdc->raid.unknown_5, pdc->raid.unknown_5, pdc->raid.unknown_5);
> ++
> ++		for (disk =3D pdc->raid.disk, i =3D 0;
> ++		     i < pdc->raid.total_disks; disk++, i++) {
> ++			P2("raid.disk[%d].unknown_0: 0x%x", pdc, i, disk->unknown_0);
> ++			P2("raid.disk[%d].channel: %u", pdc, i, disk->channel);
> ++			P2("raid.disk[%d].device: %u", pdc, i, disk->device);
> ++			P2("raid.disk[%d].magic_0: 0x%x", pdc, i, disk->magic_0);
> ++			P2("raid.disk[%d].disk_number: %u", pdc, i, disk->disk_number);
> ++		}
> +=20
> +-	P("checksum: 0x%x %s", pdc, pdc->checksum, pdc->checksum,
> +-	  checksum(pdc) ? "Ok" : "BAD");
> ++		P("checksum: 0x%x %s", pdc, pdc->checksum, pdc->checksum,
> ++		  checksum(pdc) ? "Ok" : "BAD");
> ++		ma--;
> ++		pdc++;
> ++	}
> + }
> +=20
> + static void
> diff --git a/meta-oe/recipes-extended/dmraid/files/15_drop_p_for_partitio=
n_conditional.patch b/meta-oe/recipes-extended/dmraid/files/15_drop_p_for_p=
artition_conditional.patch
> new file mode 100644
> index 0000000..72e6237
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/15_drop_p_for_partition_condi=
tional.patch
> @@ -0,0 +1,31 @@
> +From: Phillip Susi <psusi@cfl.rr.com>
> +Last-Update: 2011-03-08
> +Description: dmraid was changed at one point to insert a 'p' between
> + the base device name and the partition number.  For some time
> + debian and ubuntu reversed this change.  This patch modifies the
> + behavior to add the 'p' iff the last character of the base name is
> + a digit.  This makes dmraid comply with the behavior used by
> + kpartx and "by linux since the dawn of time".
> +Forwarded: Yes
> +
> +Index: 1.0.0.rc16/lib/format/partition/dos.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/format/partition/dos.c
> ++++ 1.0.0.rc16/lib/format/partition/dos.c
> +@@ -31,8 +31,14 @@
> + {
> + 	const char *base =3D get_basename(lc, rd->di->path);
> +=20
> +-	return type ? snprintf(str, len, "%s%s%u", base, OPT_STR_PARTCHAR(lc),
> +-			       partition) : snprintf(str, len, "%s", base);
> ++	if (type)
> ++	{
> ++		if (isdigit(base[strlen(base) - 1]))
> ++			return snprintf(str, len, "%s%s%u", base,
> ++					OPT_STR_PARTCHAR(lc), partition);
> ++		else return snprintf(str, len, "%s%u", base, partition);
> ++	}
> ++	else return snprintf(str, len, "%s", base);
> + }
> +=20
> + static char *
> diff --git a/meta-oe/recipes-extended/dmraid/files/16_change-uuid.patch b=
/meta-oe/recipes-extended/dmraid/files/16_change-uuid.patch
> new file mode 100644
> index 0000000..12017d6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/16_change-uuid.patch
> @@ -0,0 +1,77 @@
> +From: Phillip Susi <psusi@ubuntu.com>
> +Subject: Change uuid for partitions and internal devices
> +Description: Change the uuid for internal devices ( like
> + each half of a raid10 ) so that the rest of the system
> + can recognize that the internal device should not be
> + probed for partitions or filesystems or mounted.  Also
> + change partition's uuid to have the same "partNN-"
> + prefix that kpartx gives them.
> +
> +Index: 1.0.0.rc16/lib/activate/devmapper.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/activate/devmapper.c
> ++++ 1.0.0.rc16/lib/activate/devmapper.c
> +@@ -171,8 +171,18 @@ dmraid_uuid(struct lib_context *lc, stru
> + 	/* Clear garbage data from uuid string */
> + 	memset(uuid, 0, uuid_len);
> +=20
> +-	/* Create UUID string from subsystem prefix and RAID set name. */
> +-	r =3D snprintf(uuid, uuid_len, "DMRAID-%s", name) < uuid_len;
> ++	/* Create UUID string from subsystem prefix and RAID set name.  *
> ++	 * Prefix partitions with "partNN-" and add an 'I' for internal *
> ++	 * for stacked devices ( each half of a raid10 )                */
> ++
> ++	if (rs->type & t_partition) {
> ++		char *part;
> ++		for (part =3D name + strlen(name) - 1; isdigit(*part); part--);
> ++		part++;
> ++		r =3D snprintf(uuid, uuid_len, "part%s-DMRAID-%S", part, name) < uuid=
_len;
> ++	} else if (rs->flags & f_subset)
> ++		r =3D snprintf(uuid, uuid_len, "DMRAIDI-%s", name) < uuid_len;
> ++	else r =3D snprintf(uuid, uuid_len, "DMRAID-%s", name) < uuid_len;
> + 	return r < 0 ? 0 : (r < uuid_len);
> + }
> +=20
> +Index: 1.0.0.rc16/include/dmraid/metadata.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/include/dmraid/metadata.h
> ++++ 1.0.0.rc16/include/dmraid/metadata.h
> +@@ -177,6 +177,7 @@ enum flags {
> + 	f_maximize =3D 0x01,	/* If set, maximize set capacity,
> + 				   if not set, limit to smallest device. */
> + 	f_partitions =3D 0x02,	/* Set has partitions. */
> ++	f_subset =3D 0x04,	/* Set is an internal subset ( half of raid10 ) */
> + };
> +=20
> + #define	F_MAXIMIZE(rs)		((rs)->flags & f_maximize)
> +Index: 1.0.0.rc16/lib/format/ataraid/isw.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/format/ataraid/isw.c
> ++++ 1.0.0.rc16/lib/format/ataraid/isw.c
> +@@ -877,7 +877,8 @@ group_rd(struct lib_context *lc,
> + 				free_raid_dev(lc, &rd);
> + 				return NULL;
> + 			}
> +-
> ++			if (is_raid10(dev))
> ++				rs->flags |=3D f_subset;
> + 			rs->status =3D s_ok;
> +=20
> + 			/* Save and set to enable dev_sort(). */
> +Index: 1.0.0.rc16/lib/format/format.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/format/format.c
> ++++ 1.0.0.rc16/lib/format/format.c
> +@@ -649,9 +649,10 @@ join_superset(struct lib_context *lc,
> + 	if ((n =3D f_name(lc, rd, 0))) {
> + 		if ((ret =3D find_or_alloc_raid_set(lc, n, FIND_TOP, NO_RD,
> + 						  LC_RS(lc), f_create, rd)) &&
> +-		    !find_set(lc, &ret->sets, rs->name, FIND_TOP))
> ++		    !find_set(lc, &ret->sets, rs->name, FIND_TOP)) {
> + 			list_add_sorted(lc, &ret->sets, &rs->list, f_set_sort);
> +-
> ++			rs->flags |=3D f_subset;
> ++		}
> + 		dbg_free(n);
> + 	}
> +=20
> diff --git a/meta-oe/recipes-extended/dmraid/files/17_convert-dmraid45-to=
-dmraid.patch b/meta-oe/recipes-extended/dmraid/files/17_convert-dmraid45-t=
o-dmraid.patch
> new file mode 100644
> index 0000000..285db15
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/17_convert-dmraid45-to-dmraid=
=2Epatch
> @@ -0,0 +1,273 @@
> +From: Stefan Bader <stefan.bader@canonical.com>
> +Date: Mon, 13 Jan 2014 14:39:29 +0100
> +Subject: Convert dmraid to use dm-raid module for RAID4 and RAID5
> +
> +The dmraid library used the dm-raid45 target for RAID4 and RAID5 sets.
> +This module however was never upstream and is suffering constant issues
> +when the Linux kernel changes.
> +Upstream introduced the dm-raid/raid module/target in 2.6.38. This can be
> +used to create device-mapper targets which use the MD RAID disciplines
> +(though not showing up in /proc/mdstat).
> +
> +Most of the table constructor arguments can be mapped, only the member
> +devices may not have an offset.
> +
> +From the old code it seems that RAID5 would always be build by set
> +elements which will not have an offset. So potentially only RAID4
> +could cause issues. That could be worked around if needed by creating
> +additional linear mappings.
> +
> +NOTE: The event code is only compile tested. But we seem to have never
> +shipped the dmraid event tool which is needed to use this feature. And
> +we are about to remove support for ISW from dmraid (in favour of mdadm)
> +anyway.
> +
> +Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
> +
> +Index: 1.0.0.rc16/lib/activate/activate.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/activate/activate.c	2014-01-14 15:41:29.87237269=
3 +0100
> ++++ 1.0.0.rc16/lib/activate/activate.c	2014-01-14 15:41:59.692518476 +01=
00
> +@@ -118,6 +118,17 @@ _dm_path_offset(struct lib_context *lc,
> + 		     valid ? path : lc->path.error, offset);
> + }
> +=20
> ++/* Push metadata and data device path onto a table */
> ++static int
> ++_dm_meta_data_path(struct lib_context *lc, char **table, int valid,
> ++		   const char *meta, const char *path)
> ++
> ++{
> ++	return p_fmt(lc, table, " %s %s",
> ++		     meta ? meta : "-",
> ++		     valid ? path : lc->path.error);
> ++}
> ++
> + /*
> +  * Create dm table for linear mapping.
> +  */
> +@@ -537,9 +548,10 @@ err:
> + /* Push begin of line onto a RAID5 table. */
> + /* FIXME: persistent dirty log. */
> + static int
> +-_dm_raid45_bol(struct lib_context *lc, char **table, struct raid_set *r=
s,
> ++_dm_raid_bol(struct lib_context *lc, char **table, struct raid_set *rs,
> + 	       uint64_t sectors, unsigned int members)
> + {
> ++	int rc;
> + 	int need_sync =3D rs_need_sync(rs);
> + 	struct handler_info rebuild_drive;
> +=20
> +@@ -548,13 +560,31 @@ _dm_raid45_bol(struct lib_context *lc, c
> + 	if (need_sync && !get_rebuild_drive(lc, rs, &rebuild_drive))
> + 		return 0;
> +=20
> +-	return p_fmt(lc, table, "0 %U %s core 2 %u %s %s 1 %u %u %d",
> +-		     sectors, get_dm_type(lc, rs->type),
> +-		     calc_region_size(lc,
> +-				      total_sectors(lc, rs) /
> +-				      _dm_raid_devs(lc, rs, 0)),
> +-		     (need_sync) ? "sync" : "nosync", get_type(lc, rs->type),
> +-		     rs->stride, members, rebuild_drive.data.i32);
> ++	if (rebuild_drive.data.i32 < 0) {
> ++		rc =3D p_fmt(lc, table,
> ++		           "0 %U %s %s 4 %u %s region_size %u %u",
> ++			   sectors,
> ++			   get_dm_type(lc, rs->type),
> ++			   get_type(lc, rs->type),
> ++			   rs->stride,
> ++			   (need_sync) ? "sync" : "nosync",
> ++			   calc_region_size(lc, total_sectors(lc, rs) /
> ++					    _dm_raid_devs(lc, rs, 0)),
> ++			   members);
> ++	} else {
> ++		rc =3D p_fmt(lc, table,
> ++			   "0 %U %s %s 6 %u %s rebuild %d region_size %u %u",
> ++			   sectors,
> ++			   get_dm_type(lc, rs->type),
> ++			   get_type(lc, rs->type),
> ++			   rs->stride,
> ++			   (need_sync) ? "sync" : "nosync",
> ++			   rebuild_drive.data.i32,
> ++			   calc_region_size(lc, total_sectors(lc, rs) /
> ++					    _dm_raid_devs(lc, rs, 0)),
> ++			   members);
> ++	}
> ++	return rc;
> + }
> +=20
> + /* Create "error target" name based on raid set name. */
> +@@ -669,7 +699,7 @@ err:
> + }
> +=20
> + static int
> +-dm_raid45(struct lib_context *lc, char **table, struct raid_set *rs)
> ++dm_raid(struct lib_context *lc, char **table, struct raid_set *rs)
> + {
> + 	int ret;
> + 	uint64_t sectors =3D 0;
> +@@ -749,7 +779,7 @@ dm_raid45(struct lib_context *lc, char *
> + 	 */
> + 	sectors *=3D members - 1;
> +=20
> +-	if (!_dm_raid45_bol(lc, table, rs, sectors, members))
> ++	if (!_dm_raid_bol(lc, table, rs, sectors, members))
> + 		goto err;
> +=20
> + 	/* Stacked RAID sets (for RAID50 etc.) */
> +@@ -759,7 +789,8 @@ dm_raid45(struct lib_context *lc, char *
> + 		if (!(path =3D mkdm_path(lc, r->name)))
> + 			goto err;
> +=20
> +-		ret =3D _dm_path_offset(lc, table, valid_rs(r), path, 0);
> ++		log_dbg(lc, "%s: raid set device %s", __func__, path);
> ++		ret =3D _dm_meta_data_path(lc, table, valid_rs(r), NULL, path);
> + 		dbg_free(path);
> +=20
> + 		if (!ret)
> +@@ -768,8 +799,11 @@ dm_raid45(struct lib_context *lc, char *
> +=20
> + 	/* Lowest level RAID devices. */
> + 	list_for_each_entry(rd, &rs->devs, devs) {
> +-		if (!_dm_path_offset(lc, table, valid_rd(rd),=20
> +-				     rd->di->path, rd->offset))
> ++		if (rd->offset)
> ++			goto err;
> ++		log_dbg(lc, "%s: low level dev %s", __func__, rd->di->path);
> ++		if (!_dm_meta_data_path(lc, table, valid_rd(rd), NULL,
> ++					rd->di->path))
> + 			goto err;
> + 	}
> +=20
> +@@ -802,11 +836,11 @@ static struct type_handler {
> + 	{ t_linear, dm_linear },
> + 	{ t_raid0, dm_raid0 },
> + 	{ t_raid1, dm_raid1 },
> +-	{ t_raid4, dm_raid45 },
> +-	{ t_raid5_ls, dm_raid45 },
> +-	{ t_raid5_rs, dm_raid45 },
> +-	{ t_raid5_la, dm_raid45 },
> +-	{ t_raid5_ra, dm_raid45 },
> ++	{ t_raid4, dm_raid },
> ++	{ t_raid5_ls, dm_raid },
> ++	{ t_raid5_rs, dm_raid },
> ++	{ t_raid5_la, dm_raid },
> ++	{ t_raid5_ra, dm_raid },
> + 	/* RAID types below not supported (yet) */
> + 	{ t_raid6, dm_unsup },
> + };
> +Index: 1.0.0.rc16.orig/lib/metadata/metadata.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/metadata/metadata.c	2014-01-14 15:41:29.90837286=
3 +0100
> ++++ 1.0.0.rc16/lib/metadata/metadata.c	2014-01-14 15:41:59.692518476 +01=
00
> +@@ -31,11 +31,11 @@ static const struct {
> + 	{ t_linear, "linear", "linear"},
> + 	{ t_raid0, "stripe", "striped"},
> + 	{ t_raid1, "mirror", "mirror"},
> +-	{ t_raid4, "raid4", "raid45"},
> +-	{ t_raid5_ls, "raid5_ls", "raid45"},
> +-	{ t_raid5_rs, "raid5_rs", "raid45"},
> +-	{ t_raid5_la, "raid5_la", "raid45"},
> +-	{ t_raid5_ra, "raid5_ra", "raid45"},
> ++	{ t_raid4, "raid4", "raid"},
> ++	{ t_raid5_ls, "raid5_ls", "raid"},
> ++	{ t_raid5_rs, "raid5_rs", "raid"},
> ++	{ t_raid5_la, "raid5_la", "raid"},
> ++	{ t_raid5_ra, "raid5_ra", "raid"},
> + 	{ t_raid6, "raid6", NULL},
> + };
> +=20
> +Index: 1.0.0.rc16/lib/events/libdmraid-events-isw.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/events/libdmraid-events-isw.c	2014-01-14 10:20:2=
3.598184676 +0100
> ++++ 1.0.0.rc16/lib/events/libdmraid-events-isw.c	2014-01-14 15:41:59.696=
518490 +0100
> +@@ -502,7 +502,7 @@ static int _get_num_devs_from_status(cha
> + 	int ret;
> +=20
> + 	for (ret =3D 0; *status; status++) {
> +-		if (*status =3D=3D 'A' || *status =3D=3D 'D')
> ++		if (*status =3D=3D 'A' || *status =3D=3D 'a' || *status =3D=3D 'D')
> + 			ret++;
> + 	}
> +=20
> +@@ -1258,8 +1258,8 @@ err:
> + 	return D_IGNORE;
> + }
> +=20
> +-/* Get the raid45 device(s) that caused the trigger. */
> +-static enum disk_state_type _process_raid45_event(struct dm_task *dmt,
> ++/* Get the raid device(s) that caused the trigger. */
> ++static enum disk_state_type _process_raid_event(struct dm_task *dmt,
> + 						  char *params)
> + {
> + 	int argc, i, num_devs, dead, ret =3D D_INSYNC;
> +@@ -1272,32 +1272,34 @@ static enum disk_state_type _process_rai
> + 		return D_IGNORE;
> +=20
> + 	/*
> +-	 * dm core parms (NOT provided in @params):  	0 976783872 raid45=20
> +-	 *
> +-	 * raid45 device parms:     	3 253:4 253:5 253:6
> +-	 * raid45 device status:	1 AAA
> ++	 * raid device status:	<type> 3 AAA <synced/total> <action> <rmm>
> + 	 */
> +=20
> ++	/* Skip over the raid type */
> ++	if(!dm_split_words(params, 1, 0, &p))
> ++		goto err;
> ++	p +=3D strlen(p) + 1;
> ++
> + 	/* Number of devices. */
> + 	num_devs =3D _get_num_devs(params, &p);
> + 	if (!num_devs)
> + 		goto err;
> +=20
> +-	/* Devices names + "1" + "AA". */
> +-	argc =3D num_devs + 2;
> ++	/* AAA + <completeness> <action> <resync mismatches> */
> ++	argc =3D 4;
> + 	args =3D dm_malloc(argc * sizeof(*args));
> + 	if (!args ||
> + 	    dm_split_words(p, argc, 0, args) !=3D argc)
> + 		goto err;
> +=20
> +-	dev_status_str =3D args[num_devs + 1];
> ++	dev_status_str =3D args[0];
> +=20
> + 	/* Consistency check on num_devs and status chars. */
> + 	i =3D _get_num_devs_from_status(dev_status_str);
> + 	if (i !=3D num_devs)
> + 		goto err;
> +=20
> +-	/* Check for bad raid45 devices. */
> ++	/* Check for bad raid devices. */
> + 	for (i =3D 0, p =3D dev_status_str; i < rs->num_devs; i++) {
> + 		/* Skip past any non active/dead identifiers. */
> + 		dead =3D *(p++) =3D=3D 'D';
> +@@ -1324,7 +1326,7 @@ static enum disk_state_type _process_rai
> + 	return ret;
> +=20
> + err:
> +-	_event_cleanup_and_log(args, "raid45");
> ++	_event_cleanup_and_log(args, "raid");
> + 	return D_IGNORE;
> + }
> +=20
> +@@ -1341,7 +1343,7 @@ static void _process_event(char *target_
> + 	} *proc,  process[] =3D {
> + 		{ "striped", _process_stripe_event, 0 },
> + 		{ "mirror",  _process_mirror_event, 1 },
> +-		{ "raid45",  _process_raid45_event, 1 },
> ++		{ "raid",    _process_raid_event, 1 },
> + 	};
> + #ifdef	_LIBDMRAID_DSO_TESTING
> + 	struct dso_raid_set *rs;
> +@@ -1352,7 +1354,7 @@ static void _process_event(char *target_
> + 	 * stripe (raid 0),
> + 	 * mirror (raid 1)
> + 	 * or
> +-	 * raid45 (raid 4/5).
> ++	 * raid   (raid 4/5).
> + 	 */
> + 	for (proc =3D process; proc < ARRAY_END(process); proc++) {
> + 		if (!strcmp(target_type, proc->target_type))
> diff --git a/meta-oe/recipes-extended/dmraid/files/18_ignore-too-small-de=
vices.patch b/meta-oe/recipes-extended/dmraid/files/18_ignore-too-small-dev=
ices.patch
> new file mode 100644
> index 0000000..ab500bb
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/18_ignore-too-small-devices.p=
atch
> @@ -0,0 +1,39 @@
> +From: Stefan Bader <stefan.bader@canonical.com>
> +Date: Tue, 14 Jan 2014 15:26:50 +0100
> +Subject: Avoid meaningless error messages while probing for meta-data
> +
> +This happens as device-mapper volumes are checked and kpartx creates
> +a 2 sector mapping if a device contains an extended partition.
> +Offsetting from the last sector backwards some probes overflow and
> +end up trying to seek to a very large offset (which fails and emits
> +a visible error message during device scanning).
> +This message is useless as such a small device would be pointless as
> +a RAID set anyway.
> +To fix this without larger changes, pragmatically ignore devices smaller
> +than 8 sectors (4K).
> +
> +Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
> +
> +Index: 1.0.0.rc16/lib/format/format.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- 1.0.0.rc16.orig/lib/format/format.c	2014-01-14 15:50:17.554952405 +0=
100
> ++++ 1.0.0.rc16/lib/format/format.c	2014-01-14 15:50:35.319039242 +0100
> +@@ -533,6 +533,18 @@ read_raid_dev(struct lib_context *lc,
> + 	union read_info info;
> +=20
> + 	/*
> ++	 * Kpartx will create a mapping for extended partitions which only
> ++	 * covers 2 sectors. That leads to error messages when looking for
> ++	 * meta-data as moving back from the last sector results in huge
> ++	 * offsets. Quick hack here to ignore any device smaller than 4K.
> ++	 */
> ++	if (di->sectors < 8) {
> ++		log_dbg(lc, "%s: Ignore device smaller than 4K (%s)",
> ++			handler, di->path);
> ++		return NULL;
> ++	}
> ++
> ++	/*
> + 	 * In case the metadata format handler provides a special
> + 	 * metadata read function, use that. If not, allocate and
> + 	 * read size from offset.
> diff --git a/meta-oe/recipes-extended/dmraid/files/19_compile-dmraid-in-s=
ubdir-tools.patch b/meta-oe/recipes-extended/dmraid/files/19_compile-dmraid=
-in-subdir-tools.patch
> new file mode 100644
> index 0000000..8318248
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/19_compile-dmraid-in-subdir-t=
ools.patch
> @@ -0,0 +1,20 @@
> +Compile dmraid in subdir tools to avoid error as follows
> +
> +  | tools/dmraid.c:12:27: fatal error: dmraid/dmraid.h: No such file or =
directory
> +  |  #include <dmraid/dmraid.h>
> +  |                            ^
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp 1.0.0.rc16.orig/Makefile.in 1.0.0.rc16/Makefile.in
> +--- 1.0.0.rc16.orig/Makefile.in	2009-09-16 16:55:23.000000000 +0800
> ++++ 1.0.0.rc16/Makefile.in	2014-11-26 16:39:54.087815059 +0800
> +@@ -10,8 +10,6 @@ VPATH =3D @srcdir@
> +=20
> + SUBDIRS =3D include lib man tools
> +=20
> +-TARGETS =3D tools/dmraid
> +-
> + include make.tmpl
> +=20
> + tools: lib
> diff --git a/meta-oe/recipes-extended/dmraid/files/20_specifies-install-d=
ir-by-DESTDIR.patch b/meta-oe/recipes-extended/dmraid/files/20_specifies-in=
stall-dir-by-DESTDIR.patch
> new file mode 100644
> index 0000000..63f46ef
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dmraid/files/20_specifies-install-dir-by-D=
ESTDIR.patch
> @@ -0,0 +1,123 @@
> +Install all target into ${D} specified by DESTDIR.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp 1.0.0.rc16.org/include/Makefile.in 1.0.0.rc16/include/Makefil=
e.in
> +--- 1.0.0.rc16.org/include/Makefile.in	2009-09-16 16:55:23.000000000 +08=
00
> ++++ 1.0.0.rc16/include/Makefile.in	2014-11-27 15:05:06.108660939 +0800
> +@@ -16,15 +16,15 @@ include $(top_srcdir)/make.tmpl
> + .PHONY: install_dmraid_headers remove_dmraid_headers
> +=20
> + install_dmraid_headers: $(HEADERS)
> +-	@echo "Installing $(HEADERS) in $(includedir)/dmraid"
> +-	mkdir -p $(includedir)/dmraid
> +-	$(INSTALL) $(STRIP) $(HEADERS) $(includedir)/dmraid
> ++	@echo "Installing $(HEADERS) in $(DESTDIR)/$(includedir)/dmraid"
> ++	mkdir -p $(DESTDIR)$(includedir)/dmraid
> ++	$(INSTALL) $(STRIP) $(HEADERS) $(DESTDIR)/$(includedir)/dmraid
> +=20
> + install: install_dmraid_headers
> +=20
> + remove_dmraid_headers:
> +-	@echo "Removing $(HEADERS) from $(includedir)/dmraid"
> +-	rm -f $(includedir)/dmraid
> ++	@echo "Removing $(HEADERS) from $(DESTDIR)/$(includedir)/dmraid"
> ++	rm -f $(DESTDIR)/$(includedir)/dmraid
> +=20
> + remove:        remove_dmraid_headers
> +=20
> +diff -Nurp 1.0.0.rc16.org/lib/Makefile.in 1.0.0.rc16/lib/Makefile.in
> +--- 1.0.0.rc16.org/lib/Makefile.in	2014-11-27 14:49:17.212698021 +0800
> ++++ 1.0.0.rc16/lib/Makefile.in	2014-11-27 15:07:33.008655199 +0800
> +@@ -78,30 +78,30 @@ $(LIB_EVENTS_SHARED):
> + .PHONY: install_dmraid_libs remove_dmraid_libs
> +=20
> + install_dmraid_libs: $(INSTALL_TARGETS)
> +-	@echo "Installing $(INSTALL_TARGETS) in $(libdir)"; \
> +-	mkdir -p $(libdir); \
> ++	@echo "Installing $(INSTALL_TARGETS) in $(DESTDIR)/$(libdir)"; \
> ++	mkdir -p $(DESTDIR)/$(libdir); \
> + 	for f in $(INSTALL_TARGETS); \
> + 	do \
> + 		n=3D$$(basename $${f}) ; \
> + 		if echo "$$n" | grep -q '.so$$'; then \
> + 			$(INSTALL) -m 555 $(STRIP) \
> +-				$$f $(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
> +-			mkdir -p $(prefix)/lib; \
> +-			cd $(prefix)/lib/ && $(LN_S) -f /lib/$${n}.@DMRAID_LIB_VERSION@ $${n=
}; \
> ++				$$f $(DESTDIR)/$(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
> ++			mkdir -p $(DESTDIR)/$(prefix)/lib; \
> ++			cd $(DESTDIR)/$(prefix)/lib/ && $(LN_S) -f /lib/$${n}.@DMRAID_LIB_VE=
RSION@ $${n}; \
> + 		else \
> +-			$(INSTALL) -m 555 $(STRIP) $$f $(libdir)/$${n}; \
> ++			$(INSTALL) -m 555 $(STRIP) $$f $(DESTDIR)/$(libdir)/$${n}; \
> + 		fi \
> + 	done
> +=20
> + install: install_dmraid_libs
> +=20
> + remove_dmraid_libs:
> +-	@echo "Removing $(INSTALL_TARGETS) from $(libdir)"; \
> ++	@echo "Removing $(INSTALL_TARGETS) from $(DESTDIR)/$(libdir)"; \
> + 	for f in $(INSTALL_TARGETS); \
> + 	do \
> + 		n=3D$$(basename $${f}) ; \
> +-		rm -f $(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
> +-		rm -f $(libdir)/$${n}; \
> ++		rm -f $(DESTDIR)/$(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
> ++		rm -f $(DESTDIR)/$(libdir)/$${n}; \
> + 	done
> +=20
> + remove:	remove_dmraid_libs
> +diff -Nurp 1.0.0.rc16.org/make.tmpl.in 1.0.0.rc16/make.tmpl.in
> +--- 1.0.0.rc16.org/make.tmpl.in	2014-11-27 14:49:17.212698021 +0800
> ++++ 1.0.0.rc16/make.tmpl.in	2014-11-27 15:02:34.940666847 +0800
> +@@ -21,8 +21,8 @@ LD_DEPS +=3D @LD_DEPS@
> + SOFLAG +=3D @SOFLAG@
> +=20
> + # Setup directory variables
> +-prefix =3D $(DESTDIR)@prefix@
> +-exec_prefix =3D $(DESTDIR)@exec_prefix@
> ++prefix =3D @prefix@
> ++exec_prefix =3D @exec_prefix@
> + bindir =3D @bindir@
> + ifeq ("@KLIBC@", "no")
> +   libdir =3D @libdir@
> +diff -Nurp 1.0.0.rc16.org/man/Makefile.in 1.0.0.rc16/man/Makefile.in
> +--- 1.0.0.rc16.org/man/Makefile.in	2009-09-16 16:55:23.000000000 +0800
> ++++ 1.0.0.rc16/man/Makefile.in	2014-11-27 15:08:35.924652740 +0800
> +@@ -9,7 +9,7 @@ top_srcdir =3D @top_srcdir@
> + VPATH =3D @srcdir@
> +=20
> + MAN8=3Ddmraid.8 dmevent_tool.8
> +-MAN8DIR=3D${mandir}/man8
> ++MAN8DIR=3D$(DESTDIR)/${mandir}/man8
> +=20
> + include $(top_srcdir)/make.tmpl
> +=20
> +diff -Nurp 1.0.0.rc16.org/tools/Makefile.in 1.0.0.rc16/tools/Makefile.in
> +--- 1.0.0.rc16.org/tools/Makefile.in	2014-11-27 14:49:17.212698021 +0800
> ++++ 1.0.0.rc16/tools/Makefile.in	2014-11-27 15:10:11.408649009 +0800
> +@@ -71,17 +71,17 @@ dmevent_tool: $(top_srcdir)/lib/libdmrai
> + 	      -L$(DESTDIR)$(libdir) $(DMRAIDLIBS) $(DMEVENTTOOLLIBS) $(DMRAIDL=
IBS) $(LIBS)=20
> +=20
> + install_dmraid_tools: $(TARGETS)
> +-	@echo "Installing $(TARGETS) in $(sbindir)"; \
> +-	mkdir -p $(sbindir); \
> +-	$(INSTALL) $(STRIP) $(TARGETS) $(sbindir)
> ++	@echo "Installing $(TARGETS) in $(DESTDIR)/$(sbindir)"; \
> ++	mkdir -p $(DESTDIR)/$(sbindir); \
> ++	$(INSTALL) $(STRIP) $(TARGETS) $(DESTDIR)/$(sbindir)
> +=20
> + install: install_dmraid_tools
> +=20
> + remove_dmraid_tools:
> +-	@echo "Removing $(TARGETS) from $(sbindir)"; \
> ++	@echo "Removing $(TARGETS) from $(DESTDIR)/$(sbindir)"; \
> + 	for f in $(TARGETS); \
> + 	do \
> +-		rm -f $(sbindir)/$$f; \
> ++		rm -f $(DESTDIR)/$(sbindir)/$$f; \
> + 	done
> +=20
> + remove:	remove_dmraid_tools
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

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR4b3wACgkQN1Ujt2V2gBzQOwCgj/heQcNGYog/OQPovI3DmkC0
YU8AoJTwvkKQTKcLClSASIbjkI+TeYZW
=5bnv
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
