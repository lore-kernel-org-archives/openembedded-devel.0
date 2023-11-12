Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE0CC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 00:59:58 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.8229.1699750790326367519
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 16:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id 1616737167
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 01:59:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.92]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1yp8-2fdUUj0; Sun, 12 Nov 2023 01:59:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cups-filters: Upgrade 1.28.17 -> 2.0.0
Date: Sun, 12 Nov 2023 01:59:41 +0100
Message-ID: <20231112005941.3689515-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699750779-C0AEA9F9-E7BD10BA/0/0 CLEAN NORMAL
X-TOI-MSGID: 98d63b91-9da6-4759-9927-c4941c07fdbc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 00:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106576

- `universal`: Enable `application/vnd.cups-postscript` as input
  There are filters which produce this MIME type (such as `hpps` of
  HPLIP), and if someone uses such driver on a client and the server
  has an IPP Everywhere/driverless printer, the job fails (Pull
  request #534).

- beh backend: Use `execv()` instead of `system()` - CVE-2023-24805
  With `execv()` command line arguments are passed as separate strings
  and not the full command line in a single string. This prevents
  arbitrary command execution by escaping the quoting of the arguments
  in a job with forged job title.

- beh backend: Extra checks against odd/forged input - CVE-2023-24805

  * Do not allow `/` in the scheme of the URI (=3D backend executable
    name), to assure that only backends inside
    `/usr/lib/cups/backend/` are used.

  * Pre-define scheme buffer to empty string, to be defined for case
    of URI being NULL.

  * URI must have `:`, to split off scheme, otherwise error.

  * Check return value of `snprintf()` to create call path for
    backend, to error out on truncation of a too long scheme or on
    complete failure due to a completely odd scheme.

- beh backend: Further improvements - CVE-2023-24805

  * Use `strncat()` instead of `strncpy()` for getting scheme from
    URI, the latter does not require setting terminating zero byte in
    case of truncation.

  * Also exclude `.` or `..` as scheme, as directories are not valid
    CUPS backends.

  * Do not use `fprintf()` in `sigterm_handler()`, to not interfere
    with a `fprintf()` which could be running in the main process when
    `sigterm_handler()` is triggered.

  * Use `static volatile int` for global variable job_canceled.

- `parallel` backend: Added missing `#include` lines

- foomatic-rip: Fix a SIGPIPE error when calling gs (Pull request #517)
  [Ubuntu's autopkgtest for
  foo2zjs](https://autopkgtest.ubuntu.com/packages/f/foo2zjs/lunar/ppc64e=
l)
  shows foo2zjs's testsuite failing with cups-filters 2.0beta3 on
  ppc64el. This is cause by a timing issue in foomatic-rip which is
  fixed now.

- Coverity check done by Zdenek Dohnal for the inclusion of
  cups-filters in Fedora and Red Hat. Zdenek has fixed all the issues:
  Missing `free()`, files not closed, potential string overflows,
  ... Thanks a lot! (Pull request #510).

- Dropped all C++ references and obsolete C standards (Pull requests
  #504 and #513)
  With no C++ compiler needed, there is no need for any checks or
  setting for C++ in configure.ac.

- configure.ac: Change deprecated AC_PROG_LIBTOOL for LT_INIT (Pull
  request #508)

- texttopdf: Do not include fontconfig.h in the CUPS filter wrapper

- Build system: Do not explicitly check for libpoppler-cpp
  The cups-filters package does not contain any code using
  libpoppler-cpp, therefore we let ./configure not check for it.

- COPYING, NOTICE: Simplification for autotools-generated files
  autotools-generated files can be included under the license of the
  upstream code, and FSF copyright added to upstream copyright
  list. Simplified COPYING appropriately.

- Makefile.am: Include LICENSE in distribution tarball

- Add templates for issue reports on GitHub. This makes a selection
  screen appear when clicking "New Issue" in the web UI, to selct
  whether the issue is a regular bug, a feature request, or a security
  vulnerability.

- Corrected installation path for *.h files of *.drv files.  The ppdc
  (and underlying functions) of libppd searches for include files in
  /usr/share/ppdc and not in /usr/share/cups/ppdc any more.

- configure.ac: Remove unnecessary "AVAHI_GLIB_..." definitions.

- Makefile.am: Include NOTICE in distribution tarball

- configure.ac: Added "foreign" to to AM_INIT_AUTOMAKE() call. Makes
  automake not require a file named README.

- Cleaned up .gitignore

- Tons of fixes in the source code documentation: README.md, INSTALL,
  DEVELOPING.md, CONTRIBUTING.md, COPYING, NOTICE, ... Adapted to the
  cups-filters component, added links.

- Converted nearly all filters to filter functions, only exceptions
  are `rastertoescpx`, `rastertopclx`, `commandtoescpx`,
  `commandtopclx`, and `foomatic-rip`. The latter is deeply involved
  with Foomatic PPDs and the others are legacy printer drivers. The
  filter functions are mainly in libcupsfilters, the ones which
  generate PostScript are in libppd.

- Replaced all the filters converted to filter functions by simple
  wrapper executables using `ppdFilterCUPSWrapper()` of libppd for
  backward compatibility with CUPS 2.x.

- Added new streaming mode triggered by the boolean
  "filter-streaming-mode" option. In this mode a filter (function) is
  supposed to avoid everything which prevents the job data from
  streaming, as loading the whole job (or good part of it) into a
  temporary file or into memory, interpreting PDF, pre-checking input
  file type or zero-page jobs, ... This is mainly to be used by
  Printer Applications when they do raster printing in streaming mode,
  to run with lowest resources possible. Currently `foomatic-rip`,
  `ghostscript`, and `pdftopdf` got a streaming mode. For the former
  two PostScript (not PDF) is assumed as input and no zero-page-job
  check is done, in the latter all QPDF processing (page management,
  page size adjustment, ...) is skipped and only JCL according to the
  PPD added.

- The CUPS filter `imagetops` uses the `ppdFilterImageToPS()` filter
  function of libppd now.

- `driverless`, `driverless-fax`: Added IPP Fax Out support. Now
  printer setup tools list an additional fax "driver". A fax queue is
  created by selecting this driver. Jobs have to be sent with "-o
  phone=3D12345" to supply the destination phone number (Pull request
  #280, #293, #296, #302, #304, #305, #306, #309, Issue #298, #308).

- `sys5ippprinter`: Removed `sys5ippprinter`, as CUPS does not support
  System V interface scripts any more. This first approach of PPD-less
  printing was also not actually made use of.

- `urftopdf`: Removed as we require CUPS 2.2.2+ now which supports
  Apple Raster by itself.

- Build system, `README.md`: Require CUPS 2.2.2+. Removed now unneeded
  `./configure` switches for use of the `urftopdf` filter for old CUPS
  versions.

- Sample PPDs: Renamed source directory from `ppd/` to `ppdfiles/`.

- Build system: Remove '-D_PPD_DEPRECATED=3D""' from the compiling
  command lines of the source files which use libcups. The flag is not
  supported any more for longer times already and all the PPD-related
  functions deprecated by CUPS have moved into libppd now.

- Build system: Add files in `.gitignore` that are generated by
  "autogen.sh", "configure", and "make" (Pull request #336).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../cups/cups-filters_1.28.17.bb              | 84 -------------------
 .../cups/cups-filters_2.0.0.bb                | 27 ++++++
 ...se-instead-of-throw-from-c-17-onward.patch | 14 ++--
 .../cups/libcupsfilters_2.0.0.bb              | 17 ++++
 meta-oe/recipes-printing/cups/libppd_2.0.0.bb | 18 ++++
 5 files changed, 69 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
 rename meta-oe/recipes-printing/cups/{cups-filters =3D> libcupsfilters}/=
0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch (71%)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
 create mode 100644 meta-oe/recipes-printing/cups/libppd_2.0.0.bb

diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb b/meta=
-oe/recipes-printing/cups/cups-filters_1.28.17.bb
deleted file mode 100644
index dc527bf72..000000000
--- a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
+++ /dev/null
@@ -1,84 +0,0 @@
-DESCRIPTION =3D "CUPS backends, filters, and other software"
-HOMEPAGE =3D "http://www.linuxfoundation.org/collaborate/workgroups/open=
printing/cups-filters"
-
-LICENSE =3D "GPL-2.0-only & LGPL-2.0-only & MIT & GPL-2.0-or-later & GPL=
-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d77679ce6a2cc4d873d4ebbf2a40=
1e6"
-
-SECTION =3D "console/utils"
-
-DEPENDS =3D "cups glib-2.0 glib-2.0-native dbus dbus-glib lcms poppler q=
pdf libpng libexif"
-DEPENDS:class-native =3D "poppler-native glib-2.0-native dbus-native pkg=
config-native gettext-native libpng-native"
-
-SRC_URI =3D "https://github.com/OpenPrinting/${BPN}/releases/download/${=
PV}/${BP}.tar.xz \
-           file://0001-use-noexcept-false-instead-of-throw-from-c-17-onw=
ard.patch"
-SRC_URI[sha256sum] =3D "270a3752a960368aa99d431fb5d34f4039b2ac943c576d84=
0612d1d8185c9bb9"
-
-inherit autotools-brokensep gettext pkgconfig github-releases
-
-EXTRA_OECONF +=3D " --disable-ldap \
-                       --with-pdftops=3Dhybrid --enable-imagefilters \
-                       --enable-ghostscript --with-gs-path=3D${bindir}/g=
s \
-                       --with-pdftops-path=3D${bindir}/gs \
-                       --with-fontdir=3D${datadir}/fonts --with-rcdir=3D=
no \
-                       --with-cups-rundir=3D${localstatedir}/run/cups \
-                       --localstatedir=3D${localstatedir}/var \
-                       --with-rcdir=3Dno \
-                       --without-php"
-
-EXTRA_OECONF:class-native +=3D " --with-pdftops=3Dpdftops \
-                                    --disable-avahi --disable-ghostscrip=
t \
-                                    --disable-ldap \
-                                    --with-png --without-jpeg --without-=
tiff"
-
-CXXFLAGS +=3D "-std=3Dc++17"
-
-PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,jpeg"
-PACKAGECONFIG[png] =3D "--with-png,--without-png,libpng"
-PACKAGECONFIG[tiff] =3D "--with-tiff,--without-tiff,tiff"
-
-PACKAGECONFIG ??=3D "dbus ${@bb.utils.contains('DISTRO_FEATURES', 'zeroc=
onf', 'avahi', '', d)}"
-
-PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
-PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,,dbus"
-
-DIRFILES =3D "1"
-
-PACKAGES =3D+ "\
-	${PN}-gst \
-        ${PN}-data \
-        "
-
-FILES:${PN}-gst =3D "\
-	${libexecdir}/cups/filter/gsto* \
-	"
-RDEPENDS:${PN}-gst +=3D "ghostscript"
-
-FILES:${PN}-data =3D "\
-	${datadir}/cups/data \
-	"
-
-FILES:${PN}-dbg +=3D "\
-	${libexecdir}/cups/backend/.debug \
-	${libexecdir}/cups/driver/.debug \
-	${libexecdir}/cups/filter/.debug \
-	"
-
-FILES:${PN} +=3D "\
-        ${libexecdir}/cups \
-        ${datadir}/ppd/ \
-        ${datadir}/cups/charsets \
-        ${datadir}/cups/drv \
-        ${datadir}/cups/mime \
-        ${datadir}/cups/ppdc \
-        ${datadir}/cups/banners \
-"
-RDEPENDS:${PN} +=3D "bash"
-RDEPENDS:${PN} +=3D "ghostscript"
-
-do_install:append() {
-	# remove braille dir
-	rm -rf ${D}${datadir}/cups/braille
-
-	# remove sysroot path contamination from pkgconfig file
-	sed -i -e 's:${STAGING_DIR_TARGET}::' ${D}/${libdir}/pkgconfig/libcupsf=
ilters.pc
-}
diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-o=
e/recipes-printing/cups/cups-filters_2.0.0.bb
new file mode 100644
index 000000000..0370ae79d
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION =3D "CUPS backends, filters, and other software"
+HOMEPAGE =3D "http://www.linuxfoundation.org/collaborate/workgroups/open=
printing/cups-filters"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d5b952b53dbe7752199903d082e5=
f07"
+
+DEPENDS =3D "libcupsfilters libppd glib-2.0 poppler"
+
+SRC_URI =3D "https://github.com/OpenPrinting/${BPN}/releases/download/${=
PV}/${BP}.tar.xz"
+SRC_URI[sha256sum] =3D "b5152e3dd148ed73835827ac2f219df7cf5808dbf9dbaec2=
aa0127b44de800d8"
+
+inherit autotools gettext pkgconfig github-releases
+
+EXTRA_OECONF +=3D " \
+	--enable-imagefilters \
+	--enable-ghostscript --with-gs-path=3D${bindir}/gs \
+	--with-fontdir=3D${datadir}/fonts \
+	--localstatedir=3D${localstatedir} \
+"
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',=
 'avahi', '', d)}"
+PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
+
+FILES:${PN} +=3D "${datadir}"
+FILES:${PN}-dev +=3D "${datadir}/ppdc"
+
+RDEPENDS:${PN} +=3D "bash"
+RDEPENDS:${PN} +=3D "ghostscript"
diff --git a/meta-oe/recipes-printing/cups/cups-filters/0001-use-noexcept=
-false-instead-of-throw-from-c-17-onward.patch b/meta-oe/recipes-printing=
/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-o=
nward.patch
similarity index 71%
rename from meta-oe/recipes-printing/cups/cups-filters/0001-use-noexcept-=
false-instead-of-throw-from-c-17-onward.patch
rename to meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-=
false-instead-of-throw-from-c-17-onward.patch
index 5de8dae00..72bbf10a1 100644
--- a/meta-oe/recipes-printing/cups/cups-filters/0001-use-noexcept-false-=
instead-of-throw-from-c-17-onward.patch
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-fals=
e-instead-of-throw-from-c-17-onward.patch
@@ -15,22 +15,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  filter/pdftoraster.cxx | 4 ++++
  1 file changed, 4 insertions(+)
=20
-diff --git a/filter/pdftoraster.cxx b/filter/pdftoraster.cxx
+diff --git a/cupsfilters/pdftoraster.cxx b/cupsfilters/pdftoraster.cxx
 index e8af184fb..e91e22459 100755
---- a/filter/pdftoraster.cxx
-+++ b/filter/pdftoraster.cxx
-@@ -2148,7 +2148,11 @@ int main(int argc, char *argv[]) {
- /* For compatibility with g++ >=3D 4.7 compilers _GLIBCXX_THROW
-  *  should be used as a guard, otherwise use traditional definition */
+@@ -2198,7 +2198,11 @@
+ // For compatibility with g++ >=3D 4.7 compilers _GLIBCXX_THROW
+ // should be used as a guard, otherwise use traditional definition
  #ifndef _GLIBCXX_THROW
+-#define _GLIBCXX_THROW throw
 +#if __cplusplus < 201703L
- #define _GLIBCXX_THROW throw
++#define _GLIBCXX_THROW throw
 +#else
 +#define _GLIBCXX_THROW(x) noexcept(false)
 +#endif
  #endif
 =20
  void * operator new(size_t size) _GLIBCXX_THROW (std::bad_alloc)
+
 --=20
 2.39.1
=20
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb b/meta=
-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
new file mode 100644
index 000000000..7f7174d94
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "OpenPrinting libcupsfilters"
+HOMEPAGE =3D "https://github.com/OpenPrinting"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daab2024bd2a475438a154cd1640c9=
684"
+
+DEPENDS =3D "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg =
tiff"
+
+SRC_URI =3D " \
+	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.ta=
r.xz \
+	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch =
\
+"
+SRC_URI[sha256sum] =3D "542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e=
36ac34aa0d9aa601"
+
+inherit autotools gettext pkgconfig github-releases
+
+FILES:${PN} +=3D "${datadir}"
+RDEPENDS:${PN} +=3D "ghostscript"
diff --git a/meta-oe/recipes-printing/cups/libppd_2.0.0.bb b/meta-oe/reci=
pes-printing/cups/libppd_2.0.0.bb
new file mode 100644
index 000000000..99b1f6e73
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libppd_2.0.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "OpenPrinting libppd"
+HOMEPAGE =3D "https://github.com/OpenPrinting"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc1fca671047153ce6825c4ab06f2a=
b49"
+
+DEPENDS =3D "libcupsfilters"
+
+SRC_URI =3D "https://github.com/OpenPrinting/${BPN}/releases/download/${=
PV}/${BP}.tar.xz"
+SRC_URI[sha256sum] =3D "882d3c659a336e91559de8f3c76fc26197fe6e5539d9b484=
a596e29a5a4e0bc8"
+
+inherit autotools gettext pkgconfig github-releases
+
+do_install:append() {
+	rm -r ${D}${bindir}
+}
+
+FILES:${PN} +=3D "${datadir}"
+
--=20
2.42.0


