Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id BBE4D6E65F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 21:59:47 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 12so3378915uas.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 13:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=3R8r42pUwR/gEN47xmRr1/5xfgboUQLVo4UR7Vpn7jQ=;
	b=A5gnz3mAhodf+Qe6jL5QntKhDKrTIfxf3hgLqiPIBQCsPtE83BkcRw/lvs/C1T2HWR
	PM/WPb3zGNkhd7rHfBESSRjRAZD8QRp+yJSjBW5OXtvqC652OJlzInfwwLZIeL88SB1J
	sP3H/TSoaIsOizWoC4L8pt/HeWQT9yJyHSiPVJ1zilLJYMftHn3WOnCSYmvnGNTQsz7S
	J4p7ODWootUa+LOQNUttui5W4pqKZv86GnyGNE5OucZCOUsCTBmxKPTeNFwGDKEgjS0w
	VZDLRPc6rdaHHyziaI8uoL4a5qvFRqAKG7Tr4uWN6LuzpG1kZbMlPGoYQiMRwUJuWV42
	JVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=3R8r42pUwR/gEN47xmRr1/5xfgboUQLVo4UR7Vpn7jQ=;
	b=CEIdLh9vyFVmKrBVX4XKrE3xFF2uqhHzJouFL0nb9/UMuWgmzLnc4eS52bQxliXf0g
	LL4CMKT6enibeySPTWEbLdU0NWpZ3biwDB/VgtPopgMn757DJTAg7KJXpxOTWIYRPlTd
	BH20Oa89Gbv8xF7OuqoGULZJj0qYVvhDtE88VrdG9ojGDQ2FYYqFVaqgufTdmpKncVX+
	RikHk0JZ4kcGwTg/CsFSJKOxDe5NVWEkm/TABCJiXRA16DLt/kFcQWLJCtkxUtocvKOZ
	yc7EmRJVwPuZnwpFU2FS43xlbd0OAV2Dd3Uz1NPbs68HH8CKdNO+z/EKULl/xL2GHmlP
	0KfQ==
X-Gm-Message-State: AKaTC0249OeZo68pwoZiYu2EimeZWtQ6O/5bSuPRQj9FO13xNiI4HLk5dvoa1XydgvG7YKD4yD80qMxB8EeVZQ==
X-Received: by 10.159.48.146 with SMTP id j18mr12217697uab.6.1479851988540;
	Tue, 22 Nov 2016 13:59:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Tue, 22 Nov 2016 13:59:47 -0800 (PST)
Received: by 10.176.5.136 with HTTP; Tue, 22 Nov 2016 13:59:47 -0800 (PST)
In-Reply-To: <20161122164904.GB3348@jama>
References: <20161117023409.5303-1-Qi.Chen@windriver.com>
	<20161122164904.GB3348@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Nov 2016 13:59:47 -0800
Message-ID: <CAMKF1sq2of6X2U6yG4AjNE48kqrBM_DC_jnHV-Z+0rC0taNdcA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH V2] openobex: upgrade to 1.7.2
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
X-List-Received-Date: Tue, 22 Nov 2016 21:59:48 -0000
Content-Type: text/plain; charset=UTF-8

I am sending patches which should fix these too

On Nov 22, 2016 9:01 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Thu, Nov 17, 2016 at 10:34:09AM +0800, Chen Qi wrote:
> > Add a patch to resolve segment fault in obex-check-device.
> > Disable generation of documentation.
>
> This is probably causing obexftp and obex-data-server issues:
> http://errors.yoctoproject.org/Errors/Details/104698/
> http://errors.yoctoproject.org/Errors/Details/104700/
>
> reported in
> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2016-November/109897.html
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  .../obex/openobex-1.5/disable-cable-test.patch     | 16 ----------
> >  .../openobex-1.5/libusb_crosscompile_check.patch   | 11 -------
> >  .../obex/openobex-1.5/separate_builddir.patch      | 16 ----------
> >  ...001-obex-check-device-avoid-segment-fault.patch | 29
> ++++++++++++++++++
> >  meta-oe/recipes-connectivity/obex/openobex_1.5.bb  | 35
> ----------------------
> >  .../recipes-connectivity/obex/openobex_1.7.2.bb    | 33
> ++++++++++++++++++++
> >  6 files changed, 62 insertions(+), 78 deletions(-)
> >  delete mode 100644 meta-oe/recipes-connectivity/
> obex/openobex-1.5/disable-cable-test.patch
> >  delete mode 100644 meta-oe/recipes-connectivity/
> obex/openobex-1.5/libusb_crosscompile_check.patch
> >  delete mode 100644 meta-oe/recipes-connectivity/
> obex/openobex-1.5/separate_builddir.patch
> >  create mode 100644 meta-oe/recipes-connectivity/
> obex/openobex/0001-obex-check-device-avoid-segment-fault.patch
> >  delete mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> >  create mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> >
> > diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
> b/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
> > deleted file mode 100644
> > index 95b636d..0000000
> > --- a/meta-oe/recipes-connectivity/obex/openobex-1.
> 5/disable-cable-test.patch
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -
> > -#
> > -# Patch managed by http://www.holgerschurig.de/patcher.html
> > -#
> > -
> > ---- openobex-1.2/apps/Makefile.am~disable-cable-test
> > -+++ openobex-1.2/apps/Makefile.am
> > -@@ -6,7 +6,7 @@
> > -     obex_io.c obex_io.h \
> > -     obex_put_common.c obex_put_common.h
> > -
> > --bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test
> > -+bin_PROGRAMS = irxfer obex_tcp irobex_palm3
> > -
> > - obex_test_SOURCES = \
> > -     obex_test.c obex_test.h \
> > diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.
> 5/libusb_crosscompile_check.patch b/meta-oe/recipes-
> connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
> > deleted file mode 100644
> > index 1177dfe..0000000
> > --- a/meta-oe/recipes-connectivity/obex/openobex-1.
> 5/libusb_crosscompile_check.patch
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > ---- /tmp/acinclude.m4        2009-04-12 10:32:15.000000000 +0200
> > -+++ openobex-1.5/acinclude.m4        2009-04-12 10:32:38.000000000 +0200
> > -@@ -158,7 +158,7 @@
> > -             ;;
> > -     *)
> > -             PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes,
> AC_MSG_RESULT(no))
> > --            AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc,
> REQUIRES="libusb")
> > -+            REQUIRES="libusb"
> > -             ;;
> > -     esac
> > -     AC_SUBST(USB_CFLAGS)
> > diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
> b/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
> > deleted file mode 100644
> > index 8abf8ae..0000000
> > --- a/meta-oe/recipes-connectivity/obex/openobex-1.
> 5/separate_builddir.patch
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -Fix detection of IrDA failing with B!=S
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > -
> > ---- a/acinclude.m4   2014-05-24 14:05:41.757796816 +0100
> > -+++ b/acinclude.m4   2014-05-24 14:03:06.556795536 +0100
> > -@@ -54,6 +54,7 @@
> > - ])
> > -
> > - AC_DEFUN([AC_PATH_IRDA_LINUX], [
> > -+    CPPFLAGS="${CPPFLAGS} -I${srcdir}"
> > -     AC_CACHE_CHECK([for IrDA support], irda_found, [
> > -             AC_TRY_COMPILE([
> > -                             #include <sys/socket.h>
> > diff --git a/meta-oe/recipes-connectivity/obex/openobex/
> 0001-obex-check-device-avoid-segment-fault.patch b/meta-oe/recipes-
> connectivity/obex/openobex/0001-obex-check-device-avoid-
> segment-fault.patch
> > new file mode 100644
> > index 0000000..d7c2681
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/obex/openobex/
> 0001-obex-check-device-avoid-segment-fault.patch
> > @@ -0,0 +1,29 @@
> > +Subject: obex-check-device: avoid segment fault
> > +
> > +The argument number needs to be no less than 3 instead of 2. Otherwise,
> > +when we use `obex-check-device xxx' on target, there would be segment
> > +fault error.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + udev/obex-check-device.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/udev/obex-check-device.c b/udev/obex-check-device.c
> > +index 9eb4769..df9fc73 100644
> > +--- a/udev/obex-check-device.c
> > ++++ b/udev/obex-check-device.c
> > +@@ -62,7 +62,7 @@ int main (int argc, char **argv)
> > +     unsigned long vendor;
> > +     unsigned long product;
> > +
> > +-    if (argc < 2)
> > ++    if (argc < 3)
> > +             return 0;
> > +
> > +     vendor = strtoul(argv[1], NULL, 16);
> > +--
> > +2.8.3
> > +
> > diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> > deleted file mode 100644
> > index 6ac7905..0000000
> > --- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -DESCRIPTION = "The Openobex project is an open source implementation of
> the \
> > -Object Exchange (OBEX) protocol."
> > -HOMEPAGE = "http://openobex.triq.net"
> > -SECTION = "libs"
> > -DEPENDS = "virtual/libusb0"
> > -DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','
> bluez4',d)}"
> > -
> > -LICENSE = "GPLv2 & LGPLv2.1"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a
> \
> > -                    file://COPYING.LIB;md5=
> a6f89e2100d9b6cdffcea4f398e37343 \
> > -"
> > -
> > -SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}
> .tar.gz \
> > -           file://disable-cable-test.patch \
> > -           file://libusb_crosscompile_check.patch \
> > -           file://separate_builddir.patch"
> > -
> > -SRC_URI[md5sum] = "0d83dc86445a46a1b9750107ba7ab65c"
> > -SRC_URI[sha256sum] = "e602047570799a47ecb028420bda8f
> 2cef41310e5a99d084de10aa9422935e65"
> > -
> > -inherit autotools binconfig pkgconfig
> > -
> > -EXTRA_OECONF = "--enable-apps --enable-syslog"
> > -
> > -do_install_append() {
> > -    install -d ${D}${datadir}/aclocal
> > -    install -m 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal
> > -}
> > -
> > -PACKAGES += "openobex-apps"
> > -FILES_${PN} = "${libdir}/lib*.so.*"
> > -FILES_${PN}-dev += "${bindir}/openobex-config"
> > -FILES_${PN}-apps = "${bindir}/*"
> > -DEBIAN_NOAUTONAME_${PN}-apps = "1"
> > -
> > diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> > new file mode 100644
> > index 0000000..948308e
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> > @@ -0,0 +1,33 @@
> > +DESCRIPTION = "The Openobex project is an open source implementation of
> the \
> > +Object Exchange (OBEX) protocol."
> > +HOMEPAGE = "http://openobex.triq.net"
> > +SECTION = "libs"
> > +DEPENDS = "virtual/libusb0"
> > +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','
> bluez4',d)}"
> > +
> > +LICENSE = "GPLv2 & LGPLv2.1"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a
> \
> > +                    file://COPYING.LIB;md5=
> a6f89e2100d9b6cdffcea4f398e37343 \
> > +"
> > +
> > +SRC_URI = "http://downloads.sourceforge.net/openobex/openobex-${PV}-
> Source.tar.gz \
> > +           file://0001-obex-check-device-avoid-segment-fault.patch"
> > +
> > +SRC_URI[md5sum] = "f6e0b6cb7dcfd731460a7e9a91429a3a"
> > +SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550da
> aae06df2689e05834697b7e8c7d73dd4fc"
> > +
> > +inherit cmake
> > +
> > +S = "${WORKDIR}/openobex-${PV}-Source"
> > +
> > +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DBUILD_DOCUMENTATION=no"
> > +
> > +do_install_append () {
> > +    if [ "`ls -A ${D}${bindir}`" = "" ]; then
> > +     rm -rf ${D}${bindir}
> > +    fi
> > +}
> > +
> > +FILES_${PN}-dev += "${libdir}/cmake"
> > +
> > +
> > --
> > 2.8.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

