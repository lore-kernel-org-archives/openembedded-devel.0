Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sr4wY-0000Jd-KQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 12:23:51 +0200
Received: by ghbz2 with SMTP id z2so161856ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1L7t/zPX2GyyoLPKwCcKohMMOTBqyrGIXJtt2fTw1/8=;
	b=TgN1ebSh4pajQbPxjJiitA4I0peIrEn2iGkqLTBZJNCVyHVBOgEU5z1Vq5JQnm4hMH
	hcH1lxHYMF65qwucXAxLbFNEzcLUyLQdfEq10IE+QohbkNA7+Pb6wblxh1Fp5MbDZxN+
	gthigsvcWek0BMKsU0C9xcI/1TDvxjGtoHZFfQ0cFnFQCBLL7Og4UQyBzwsyIHQ92Jr3
	y7IqK4GvI59oL8UV5UTdykItJqr8ouJgkOarpsO7/kCbxBISmakXWQse1Sd3Q4UUITnh
	IVqt/UqNsehc3l7/1pnA2/2XB7uqLr5GqgaOAuJjVg5q1doMT558PXyUL5ejFM3t4oB1
	7zpA==
MIME-Version: 1.0
Received: by 10.50.197.167 with SMTP id iv7mr813107igc.32.1342519950802; Tue,
	17 Jul 2012 03:12:30 -0700 (PDT)
Received: by 10.64.35.109 with HTTP; Tue, 17 Jul 2012 03:12:30 -0700 (PDT)
In-Reply-To: <1342510452-419-1-git-send-email-koen@dominion.thruhere.net>
References: <1342510452-419-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 17 Jul 2012 12:12:30 +0200
Message-ID: <CAAQYJAs9zpTgWfTvtq8vmnRdeRZw4=e++PM+BhqWLLB1cvCyKw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC][meta-oe][meta-systemd][PATCH v3 1/2] systemd: update to 186+git
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
X-List-Received-Date: Tue, 17 Jul 2012 10:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 17, 2012 at 9:34 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> This is a combined udev+systemd recipe: it will build both udev and
> systemd in one go, but keep the old (sub)package layout:
>
>         udev
>         udev-utils
>         udev-systemd
>         systemd
>         systemd-vconsole-setup
>         systemd-analyze
>         systemd-initramfs
>
> And all libraries are seperated out:
>
>         libgudev-1.0-0
>         libsystemd-daemon0
>         libsystemd-id128-0
>         libsystemd-journal0
>         libsystemd-login0
>         libudev1
>
> The SRCREV is 94 patches ahead of the v186 tag to drag in compile fixes
> for 'old' gcc versions like 4.5.x.
>
> Runtime tested with build from scratch and opkg upgrade with angstrom
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../recipes-core/systemd/systemd/gtk-doc.make      |  230
> ++++++++++++++++++++
>  .../recipes-core/systemd/systemd/modprobe.rules    |   17 ++
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>  meta-systemd/recipes-core/systemd/systemd_git.bb   |   93 ++++++--
>  4 files changed, 344 insertions(+), 14 deletions(-)
>  create mode 100644 meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
>  create mode 100644
> meta-systemd/recipes-core/systemd/systemd/modprobe.rules
>  create mode 100644
> meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
>
> diff --git a/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
> b/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
> new file mode 100644
> index 0000000..57fab98
> --- /dev/null
> +++ b/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
> @@ -0,0 +1,230 @@
> +# -*- mode: makefile -*-
> +
> +####################################
> +# Everything below here is generic #
> +####################################
> +
> +if GTK_DOC_USE_LIBTOOL
> +GTKDOC_CC = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(INCLUDES)
> $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
> +GTKDOC_LD = $(LIBTOOL) --tag=CC --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS)
> $(AM_LDFLAGS) $(LDFLAGS)
> +GTKDOC_RUN = $(LIBTOOL) --mode=execute
> +else
> +GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
> $(CFLAGS)
> +GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
> +GTKDOC_RUN =
> +endif
> +
> +# We set GPATH here; this gives us semantics for GNU make
> +# which are more like other make's VPATH, when it comes to
> +# whether a source that is a target of one rule is then
> +# searched for in VPATH/GPATH.
> +#
> +GPATH = $(srcdir)
> +
> +TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
> +
> +EXTRA_DIST =                           \
> +       $(content_files)                \
> +       $(HTML_IMAGES)                  \
> +       $(DOC_MAIN_SGML_FILE)           \
> +       $(DOC_MODULE)-sections.txt      \
> +       $(DOC_MODULE)-overrides.txt
> +
> +DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp
> html-build.stamp \
> +       pdf-build.stamp \
> +       $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp \
> +       $(srcdir)/pdf.stamp
> +
> +SCANOBJ_FILES =                 \
> +       $(DOC_MODULE).args       \
> +       $(DOC_MODULE).hierarchy  \
> +       $(DOC_MODULE).interfaces \
> +       $(DOC_MODULE).prerequisites \
> +       $(DOC_MODULE).signals
> +
> +REPORT_FILES = \
> +       $(DOC_MODULE)-undocumented.txt \
> +       $(DOC_MODULE)-undeclared.txt \
> +       $(DOC_MODULE)-unused.txt
> +
> +CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
> +
> +if ENABLE_GTK_DOC
> +if GTK_DOC_BUILD_HTML
> +HTML_BUILD_STAMP=html-build.stamp
> +else
> +HTML_BUILD_STAMP=
> +endif
> +if GTK_DOC_BUILD_PDF
> +PDF_BUILD_STAMP=pdf-build.stamp
> +else
> +PDF_BUILD_STAMP=
> +endif
> +
> +all-local: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
> +else
> +all-local:
> +endif
> +
> +docs: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
> +
> +$(REPORT_FILES): sgml-build.stamp
> +
> +#### scan ####
> +
> +scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
> +       @echo 'gtk-doc: Scanning header files'
> +       @-chmod -R u+w $(srcdir)
> +       @_source_dir='' ; for i in $(DOC_SOURCE_DIR) ; do \
> +           _source_dir="$${_source_dir} --source-dir=$$i" ; \
> +         done ; \
> +         cd $(srcdir) && \
> +         gtkdoc-scan --module=$(DOC_MODULE)
> --ignore-headers="$(IGNORE_HFILES)" $${_source_dir} $(SCAN_OPTIONS)
> $(EXTRA_HFILES)
> +       @if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null
> 2>&1 ; then \
> +           CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" RUN="$(GTKDOC_RUN)"
> CFLAGS="$(GTKDOC_CFLAGS) $(CFLAGS)" LDFLAGS="$(GTKDOC_LIBS) $(LDFLAGS)"
> gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE)
> --output-dir=$(srcdir) ; \
> +       else \
> +           cd $(srcdir) ; \
> +           for i in $(SCANOBJ_FILES) ; do \
> +               test -f $$i || touch $$i ; \
> +           done \
> +       fi
> +       @touch scan-build.stamp
> +
> +$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt
> $(DOC_MODULE)-overrides.txt: scan-build.stamp
> +       @true
> +
> +#### templates ####
> +
> +tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES)
> $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
> +       @echo 'gtk-doc: Rebuilding template files'
> +       @-chmod -R u+w $(srcdir)
> +       @cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE)
> $(MKTMPL_OPTIONS)
> +       @touch tmpl-build.stamp
> +
> +tmpl.stamp: tmpl-build.stamp
> +       @true
> +
> +$(srcdir)/tmpl/*.sgml:
> +       @true
> +
> +#### xml ####
> +
> +sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt
> $(srcdir)/tmpl/*.sgml $(expand_content_files)
> +       @echo 'gtk-doc: Building XML'
> +       @-chmod -R u+w $(srcdir)
> +       @_source_dir='' ; for i in $(DOC_SOURCE_DIR) ; do \
> +           _source_dir="$${_source_dir} --source-dir=$$i" ; \
> +         done ; \
> +         cd $(srcdir) && \
> +         gtkdoc-mkdb --module=$(DOC_MODULE) --output-format=xml
> --expand-content-files="$(expand_content_files)"
> --main-sgml-file=$(DOC_MAIN_SGML_FILE) $${_source_dir} $(MKDB_OPTIONS)
> +       @touch sgml-build.stamp
> +
> +sgml.stamp: sgml-build.stamp
> +       @true
> +
> +#### html ####
> +
> +html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
> +       @echo 'gtk-doc: Building HTML'
> +       @-chmod -R u+w $(srcdir)
> +       @rm -rf $(srcdir)/html
> +       @mkdir $(srcdir)/html
> +       @mkhtml_options=""; \
> +       gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\-\-path"; \
> +       if test "$(?)" = "0"; then \
> +         mkhtml_options=--path="$(srcdir)"; \
> +       fi; \
> +       cd $(srcdir)/html && gtkdoc-mkhtml $$mkhtml_options
> $(MKHTML_OPTIONS) $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
> +       @test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp
> $(HTML_IMAGES) html )
> +       @echo 'gtk-doc: Fixing cross-references'
> +       @cd $(srcdir) && gtkdoc-fixxref --module=$(DOC_MODULE)
> --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
> +       @touch html-build.stamp
> +
> +#### pdf ####
> +
> +pdf-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
> +       @echo 'gtk-doc: Building PDF'
> +       @-chmod -R u+w $(srcdir)
> +       @rm -rf $(srcdir)/$(DOC_MODULE).pdf
> +       @mkpdf_imgdirs=""; \
> +       if test "x$(HTML_IMAGES)" != "x"; then \
> +         for img in $(HTML_IMAGES); do \
> +           part=`dirname $$img`; \
> +           echo $$mkpdf_imgdirs | grep >/dev/null "\-\-imgdir=$$part "; \
> +           if test $$? != 0; then \
> +             mkpdf_imgdirs="$$mkpdf_imgdirs --imgdir=$$part"; \
> +           fi; \
> +         done; \
> +       fi; \
> +       cd $(srcdir) && gtkdoc-mkpdf --path="$(abs_srcdir)"
> $$mkpdf_imgdirs $(DOC_MODULE) $(DOC_MAIN_SGML_FILE) $(MKPDF_OPTIONS)
> +       @touch pdf-build.stamp
> +
> +##############
> +
> +clean-local:
> +       rm -f *~ *.bak
> +       rm -rf .libs
> +
> +distclean-local:
> +       cd $(srcdir) && \
> +         rm -rf xml $(REPORT_FILES) $(DOC_MODULE).pdf \
> +                $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
> +
> +maintainer-clean-local: clean
> +       cd $(srcdir) && rm -rf xml html
> +
> +install-data-local:
> +       @installfiles=`echo $(srcdir)/html/*`; \
> +       if test "$$installfiles" = '$(srcdir)/html/*'; \
> +       then echo '-- Nothing to install' ; \
> +       else \
> +         if test -n "$(DOC_MODULE_VERSION)"; then \
> +           installdir="$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
> +         else \
> +           installdir="$(DESTDIR)$(TARGET_DIR)"; \
> +         fi; \
> +         $(mkinstalldirs) $${installdir} ; \
> +         for i in $$installfiles; do \
> +           echo '-- Installing '$$i ; \
> +           $(INSTALL_DATA) $$i $${installdir}; \
> +         done; \
> +         if test -n "$(DOC_MODULE_VERSION)"; then \
> +           mv -f $${installdir}/$(DOC_MODULE).devhelp2 \
> +             $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp2;
> \
> +           mv -f $${installdir}/$(DOC_MODULE).devhelp \
> +             $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp; \
> +         fi; \
> +         $(GTKDOC_REBASE) --relative --dest-dir=$(DESTDIR)
> --html-dir=$${installdir}; \
> +       fi
> +
> +uninstall-local:
> +       @if test -n "$(DOC_MODULE_VERSION)"; then \
> +         installdir="$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
> +       else \
> +         installdir="$(DESTDIR)$(TARGET_DIR)"; \
> +       fi; \
> +       rm -rf $${installdir}
> +
> +#
> +# Require gtk-doc when making dist
> +#
> +if ENABLE_GTK_DOC
> +dist-check-gtkdoc:
> +else
> +dist-check-gtkdoc:
> +       @echo "*** gtk-doc must be installed and enabled in order to make
> dist"
> +       @false
> +endif
> +
> +dist-hook: dist-check-gtkdoc dist-hook-local
> +       mkdir $(distdir)/tmpl
> +       mkdir $(distdir)/html
> +       -cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
> +       cp $(srcdir)/html/* $(distdir)/html
> +       -cp $(srcdir)/$(DOC_MODULE).pdf $(distdir)/
> +       -cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
> +       -cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
> +       cd $(distdir) && rm -f $(DISTCLEANFILES)
> +       $(GTKDOC_REBASE) --online --relative --html-dir=$(distdir)/html
> +
> +.PHONY : dist-hook-local docs
> diff --git a/meta-systemd/recipes-core/systemd/systemd/modprobe.rules
> b/meta-systemd/recipes-core/systemd/systemd/modprobe.rules
> new file mode 100644
> index 0000000..d4a096b
> --- /dev/null
> +++ b/meta-systemd/recipes-core/systemd/systemd/modprobe.rules
> @@ -0,0 +1,17 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existing
> node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Try and modprobe for drivers for new hardware
> +ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*",
> RUN+="/sbin/modprobe $env{MODALIAS}"
> diff --git a/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
> b/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
> new file mode 100644
> index 0000000..d83fd16
> --- /dev/null
> +++ b/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
> @@ -0,0 +1,18 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existing
> node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Create a symlink to any touchscreen input device
> +SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
> +SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="ads7846",
> SYMLINK+="input/touchscreen0"
>

This rule always remember me that unfortunately some devices do not report
pressure.
Broken driver? Hardware design? No idea...we ended up with a more ample
check to support some legacy devices.
I've proposed the same patch for oe-core but is still pending [2].

Now, it would be very nice if we could get rid of the .bbappend...

Regards

Andrea

[1]
http://cgit.openembedded.org/meta-handheld/tree/recipes-core/udev/udev_164.bbappend
[2]
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-April/020466.html


> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bbb/meta-systemd/recipes-core/systemd/
> systemd_git.bb
> index f4ca72a..8af1aa5 100644
> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
> +++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
> @@ -1,9 +1,14 @@
>  DESCRIPTION = "Systemd a init replacement"
>  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
> -DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native
> gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
> +LICENSE = "GPLv2 & LGPLv2.1 & MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
> +
>  file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
> +
>  file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
> +
> +PROVIDES = "udev"
> +
> +DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native
> gperf-native acl readline dbus libcap libcgroup tcp-wrappers"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>  SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
> @@ -14,20 +19,17 @@ inherit gitpkgv
>  PKGV = "v${GITPKGVTAG}"
>
>  PV = "git"
> -PR = "r27"
> +PR = "r0"
>
>  inherit useradd pkgconfig autotools vala perlnative
>
> -SRCREV = "3eff4208ffecedd778fec260f0d4b18e94dab443"
> +SRCREV = "cd96b3b86abb4a88cac2722bdfb6e5d4413f6831"
>
>  SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
> -           ${UCLIBCPATCHES} \
> +           file://gtk-doc.make \
> +           file://touchscreen.rules \
> +           file://modprobe.rules \
>            "
> -UCLIBCPATCHES = ""
> -UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
> -                             file://format-replace-m-uclibc.patch \
> -                            "
> -
>  LDFLAGS_libc-uclibc_append = " -lrt"
>
>  S = "${WORKDIR}/git"
> @@ -39,17 +41,27 @@ SYSTEMDDISTRO_angstrom = "angstrom"
>  EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
>                   --with-rootprefix=${base_prefix} \
>                   --with-rootlibdir=${base_libdir} \
> +                 --sbindir=${base_sbindir} \
> +                 --libexecdir=${base_libdir} \
>                   ${@base_contains('DISTRO_FEATURES', 'pam',
> '--enable-pam', '--disable-pam', d)} \
> -                 --disable-gtk \
>                   --enable-xz \
>                   --disable-manpages \
>                   --disable-coredump \
> +                 --disable-introspection \
> +                 --with-pci-ids-path=/usr/share/misc \
> +                 ac_cv_file__usr_share_pci_ids=no \
> +                 ac_cv_file__usr_share_hwdata_pci_ids=no \
> +                 ac_cv_file__usr_share_misc_pci_ids=yes \
> +                 --disable-gtk-doc-html \
> +                 --disable-tcpwrap \
>                 "
>
>  # There's no docbook-xsl-native, so for the xsltproc check to false
>  do_configure_prepend() {
>         sed -i /xsltproc/d configure.ac
>
> +       cp ${WORKDIR}/gtk-doc.make ${S}/docs/
> +
>         # we only have /home/root, not /root
>         sed -i -e 's:=/root:=/home/root:g' units/*.service*
>  }
> @@ -68,6 +80,8 @@ do_install() {
>         # create machine-id
>         # 20:12 < mezcalero> koen: you have three options: a) run
> systemd-machine-id-setup at install time, b) have / read-only and an empty
> file there (for stateless) and c) boot with / writable
>         touch ${D}${sysconfdir}/machine-id
> +
> +       install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
>  }
>
>  python populate_packages_prepend (){
> @@ -100,10 +114,18 @@ FILES_${PN} = " ${base_bindir}/* \
>                  ${datadir}/dbus-1/system-services \
>                  ${datadir}/polkit-1 \
>                  ${datadir}/${PN} \
> -                ${sysconfdir} \
> +                ${sysconfdir}/bash_completion.d/ \
> +                ${sysconfdir}/binfmt.d/ \
> +                ${sysconfdir}/dbus-1/ \
> +                ${sysconfdir}/machine-id \
> +                ${sysconfdir}/modules-load.d/ \
> +                ${sysconfdir}/sysctl.d/ \
> +                ${sysconfdir}/systemd/ \
> +                ${sysconfdir}/tmpfiles.d/ \
> +                ${sysconfdir}/xdg/ \
>                  ${systemd_unitdir}/* \
>                  ${systemd_unitdir}/system/* \
> -                ${base_libdir}/udev/rules.d \
> +                ${base_libdir}/udev/rules.d/99-systemd.rules \
>                  ${base_libdir}/security/*.so \
>                  /cgroup \
>                  ${bindir}/systemd* \
> @@ -114,6 +136,10 @@ FILES_${PN} = " ${base_bindir}/* \
>                  ${libdir}/sysctl.d \
>                  ${localstatedir} \
>                  ${libexecdir} \
> +                ${base_libdir}/udev/rules.d/70-uaccess.rules \
> +                ${base_libdir}/udev/rules.d/71-seat.rules \
> +                ${base_libdir}/udev/rules.d/73-seat-late.rules \
> +                ${base_libdir}/udev/rules.d/99-systemd.rules \
>                 "
>
>  FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug
> ${base_libdir}/security/.debug/"
> @@ -136,6 +162,45 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
>                        kernel-module-autofs4 kernel-module-unix
> kernel-module-ipv6 \
>  "
>
> +PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
> +
> +FILES_udev-dbg += "${base_libdir}/udev/.debug"
> +
> +RDEPENDS_udev += "udev-utils"
> +RPROVIDES_udev = "hotplug"
> +
> +FILES_udev += "${base_libdir}/udev/udevd \
> +               ${base_libdir}/systemd/systemd-udevd \
> +               ${base_libdir}/udev/accelerometer \
> +               ${base_libdir}/udev/ata_id \
> +               ${base_libdir}/udev/cdrom_id \
> +               ${base_libdir}/udev/collect \
> +               ${base_libdir}/udev/findkeyboards \
> +               ${base_libdir}/udev/keyboard-force-release.sh \
> +               ${base_libdir}/udev/keymap \
> +               ${base_libdir}/udev/mtd_probe \
> +               ${base_libdir}/udev/scsi_id \
> +               ${base_libdir}/udev/v4l_id \
> +               ${base_libdir}/udev/keymaps \
> +               ${base_libdir}/udev/rules.d/4*.rules \
> +               ${base_libdir}/udev/rules.d/5*.rules \
> +               ${base_libdir}/udev/rules.d/6*.rules \
> +               ${base_libdir}/udev/rules.d/70-power-switch.rules \
> +               ${base_libdir}/udev/rules.d/75*.rules \
> +               ${base_libdir}/udev/rules.d/78*.rules \
> +               ${base_libdir}/udev/rules.d/8*.rules \
> +               ${base_libdir}/udev/rules.d/95*.rules \
> +               ${sysconfdir}/udev \
> +              "
> +
> +FILES_udev-consolekit += "${libdir}/ConsoleKit"
> +RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11',
> 'consolekit', '', d)}"
> +
> +FILES_udev-utils = "${bindir}/udevadm"
> +
> +FILES_udev-systemd = "${base_libdir}/systemd/system/*udev*
> ${base_libdir}/systemd/system/*.wants/*udev*"
> +RDEPENDS_udev-systemd = "udev"
> +
>  # TODO:
>  # u-a for runlevel and telinit
>
> --
> 1.7.10
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

