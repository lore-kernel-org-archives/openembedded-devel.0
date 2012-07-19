Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srl5y-0005bc-GQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 09:24:22 +0200
Received: by wgbdr1 with SMTP id dr1so1927166wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 00:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L0arYZ5Loc/NrWwV6P455YUqxFZYxnTjaGRr1F+lXbs=;
	b=GRLjfMFnWQvOPWbGqBseXma3HQ1/V5CIyVi+Kupn1HJaaXPxQznd89x97ph2+dnUP/
	UMmzOy7y1cGeDn02RIe71F4K1WNdyz6XF2K4Ix9Ha5UJdnJJVXLgrp904rrOuD0/eGOK
	4x0n/U7xY9UqO0YdyO4fCmad9VrHh/y0cDMFXwi5/12AjTkFrho2sXt7F/rOn5+t7mlu
	IJx/cNi51lTIrhCinx9QcFbdtBnWFwIZQcXM1EvNq766xlt8QhxCttvVR7dgFYZiiSY3
	hJnNvd24CooGlk3hOZwTraKz2vk7WcaFa2ZuHdqOdy97agN4atK5zW5pEQod6Kbddp04
	49TQ==
Received: by 10.180.81.193 with SMTP id c1mr13352347wiy.12.1342681981082;
	Thu, 19 Jul 2012 00:13:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm36984821wiy.3.2012.07.19.00.12.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 00:12:59 -0700 (PDT)
Date: Thu, 19 Jul 2012 09:13:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120719071310.GC3331@jama.jama.net>
References: <1342510452-419-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1342510452-419-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 19 Jul 2012 07:24:22 -0000
X-Groupsio-MsgNum: 39766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2012 at 09:34:11AM +0200, Koen Kooi wrote:
> This is a combined udev+systemd recipe: it will build both udev and syste=
md in one go, but keep the old (sub)package layout:
>=20
> 	udev
> 	udev-utils
> 	udev-systemd
> 	systemd
> 	systemd-vconsole-setup
> 	systemd-analyze
> 	systemd-initramfs
>=20
> And all libraries are seperated out:
>=20
> 	libgudev-1.0-0
> 	libsystemd-daemon0
> 	libsystemd-id128-0
> 	libsystemd-journal0
> 	libsystemd-login0
> 	libudev1
>=20
> The SRCREV is 94 patches ahead of the v186 tag to drag in compile fixes f=
or 'old' gcc versions like 4.5.x.
>=20
> Runtime tested with build from scratch and opkg upgrade with angstrom

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../recipes-core/systemd/systemd/gtk-doc.make      |  230 ++++++++++++++=
++++++
>  .../recipes-core/systemd/systemd/modprobe.rules    |   17 ++
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>  meta-systemd/recipes-core/systemd/systemd_git.bb   |   93 ++++++--
>  4 files changed, 344 insertions(+), 14 deletions(-)
>  create mode 100644 meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
>  create mode 100644 meta-systemd/recipes-core/systemd/systemd/modprobe.ru=
les
>  create mode 100644 meta-systemd/recipes-core/systemd/systemd/touchscreen=
=2Erules
>=20
> diff --git a/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make b/met=
a-systemd/recipes-core/systemd/systemd/gtk-doc.make
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
> +GTKDOC_CC =3D $(LIBTOOL) --tag=3DCC --mode=3Dcompile $(CC) $(INCLUDES) $=
(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
> +GTKDOC_LD =3D $(LIBTOOL) --tag=3DCC --mode=3Dlink $(CC) $(AM_CFLAGS) $(C=
FLAGS) $(AM_LDFLAGS) $(LDFLAGS)
> +GTKDOC_RUN =3D $(LIBTOOL) --mode=3Dexecute
> +else
> +GTKDOC_CC =3D $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) =
$(CFLAGS)
> +GTKDOC_LD =3D $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
> +GTKDOC_RUN =3D
> +endif
> +
> +# We set GPATH here; this gives us semantics for GNU make
> +# which are more like other make's VPATH, when it comes to
> +# whether a source that is a target of one rule is then
> +# searched for in VPATH/GPATH.
> +#
> +GPATH =3D $(srcdir)
> +
> +TARGET_DIR=3D$(HTML_DIR)/$(DOC_MODULE)
> +
> +EXTRA_DIST =3D 				\
> +	$(content_files)		\
> +	$(HTML_IMAGES)			\
> +	$(DOC_MAIN_SGML_FILE)		\
> +	$(DOC_MODULE)-sections.txt	\
> +	$(DOC_MODULE)-overrides.txt
> +
> +DOC_STAMPS=3Dscan-build.stamp tmpl-build.stamp sgml-build.stamp html-bui=
ld.stamp \
> +	pdf-build.stamp \
> +	$(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp \
> +	$(srcdir)/pdf.stamp
> +
> +SCANOBJ_FILES =3D 		 \
> +	$(DOC_MODULE).args 	 \
> +	$(DOC_MODULE).hierarchy  \
> +	$(DOC_MODULE).interfaces \
> +	$(DOC_MODULE).prerequisites \
> +	$(DOC_MODULE).signals
> +
> +REPORT_FILES =3D \
> +	$(DOC_MODULE)-undocumented.txt \
> +	$(DOC_MODULE)-undeclared.txt \
> +	$(DOC_MODULE)-unused.txt
> +
> +CLEANFILES =3D $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
> +
> +if ENABLE_GTK_DOC
> +if GTK_DOC_BUILD_HTML
> +HTML_BUILD_STAMP=3Dhtml-build.stamp
> +else
> +HTML_BUILD_STAMP=3D
> +endif
> +if GTK_DOC_BUILD_PDF
> +PDF_BUILD_STAMP=3Dpdf-build.stamp
> +else
> +PDF_BUILD_STAMP=3D
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
> +	@echo 'gtk-doc: Scanning header files'
> +	@-chmod -R u+w $(srcdir)
> +	@_source_dir=3D'' ; for i in $(DOC_SOURCE_DIR) ; do \
> +	    _source_dir=3D"$${_source_dir} --source-dir=3D$$i" ; \
> +	  done ; \
> +	  cd $(srcdir) && \
> +	  gtkdoc-scan --module=3D$(DOC_MODULE) --ignore-headers=3D"$(IGNORE_HFI=
LES)" $${_source_dir} $(SCAN_OPTIONS) $(EXTRA_HFILES)
> +	@if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; t=
hen \
> +	    CC=3D"$(GTKDOC_CC)" LD=3D"$(GTKDOC_LD)" RUN=3D"$(GTKDOC_RUN)" CFLAG=
S=3D"$(GTKDOC_CFLAGS) $(CFLAGS)" LDFLAGS=3D"$(GTKDOC_LIBS) $(LDFLAGS)" gtkd=
oc-scangobj $(SCANGOBJ_OPTIONS) --module=3D$(DOC_MODULE) --output-dir=3D$(s=
rcdir) ; \
> +	else \
> +	    cd $(srcdir) ; \
> +	    for i in $(SCANOBJ_FILES) ; do \
> +               test -f $$i || touch $$i ; \
> +	    done \
> +	fi
> +	@touch scan-build.stamp
> +
> +$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC=
_MODULE)-overrides.txt: scan-build.stamp
> +	@true
> +
> +#### templates ####
> +
> +tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-=
sections.txt $(DOC_MODULE)-overrides.txt
> +	@echo 'gtk-doc: Rebuilding template files'
> +	@-chmod -R u+w $(srcdir)
> +	@cd $(srcdir) && gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPTION=
S)
> +	@touch tmpl-build.stamp
> +
> +tmpl.stamp: tmpl-build.stamp
> +	@true
> +
> +$(srcdir)/tmpl/*.sgml:
> +	@true
> +
> +#### xml ####
> +
> +sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*=
=2Esgml $(expand_content_files)
> +	@echo 'gtk-doc: Building XML'
> +	@-chmod -R u+w $(srcdir)
> +	@_source_dir=3D'' ; for i in $(DOC_SOURCE_DIR) ; do \
> +	    _source_dir=3D"$${_source_dir} --source-dir=3D$$i" ; \
> +	  done ; \
> +	  cd $(srcdir) && \
> +	  gtkdoc-mkdb --module=3D$(DOC_MODULE) --output-format=3Dxml --expand-c=
ontent-files=3D"$(expand_content_files)" --main-sgml-file=3D$(DOC_MAIN_SGML=
_FILE) $${_source_dir} $(MKDB_OPTIONS)
> +	@touch sgml-build.stamp
> +
> +sgml.stamp: sgml-build.stamp
> +	@true
> +
> +#### html ####
> +
> +html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
> +	@echo 'gtk-doc: Building HTML'
> +	@-chmod -R u+w $(srcdir)
> +	@rm -rf $(srcdir)/html
> +	@mkdir $(srcdir)/html
> +	@mkhtml_options=3D""; \
> +	gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\-\-path"; \
> +	if test "$(?)" =3D "0"; then \
> +	  mkhtml_options=3D--path=3D"$(srcdir)"; \
> +	fi; \
> +	cd $(srcdir)/html && gtkdoc-mkhtml $$mkhtml_options $(MKHTML_OPTIONS) $=
(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
> +	@test "x$(HTML_IMAGES)" =3D "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) =
html )
> +	@echo 'gtk-doc: Fixing cross-references'
> +	@cd $(srcdir) && gtkdoc-fixxref --module=3D$(DOC_MODULE) --module-dir=
=3Dhtml --html-dir=3D$(HTML_DIR) $(FIXXREF_OPTIONS)
> +	@touch html-build.stamp
> +
> +#### pdf ####
> +
> +pdf-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
> +	@echo 'gtk-doc: Building PDF'
> +	@-chmod -R u+w $(srcdir)
> +	@rm -rf $(srcdir)/$(DOC_MODULE).pdf
> +	@mkpdf_imgdirs=3D""; \
> +	if test "x$(HTML_IMAGES)" !=3D "x"; then \
> +	  for img in $(HTML_IMAGES); do \
> +	    part=3D`dirname $$img`; \
> +	    echo $$mkpdf_imgdirs | grep >/dev/null "\-\-imgdir=3D$$part "; \
> +	    if test $$? !=3D 0; then \
> +	      mkpdf_imgdirs=3D"$$mkpdf_imgdirs --imgdir=3D$$part"; \
> +	    fi; \
> +	  done; \
> +	fi; \
> +	cd $(srcdir) && gtkdoc-mkpdf --path=3D"$(abs_srcdir)" $$mkpdf_imgdirs $=
(DOC_MODULE) $(DOC_MAIN_SGML_FILE) $(MKPDF_OPTIONS)
> +	@touch pdf-build.stamp
> +
> +##############
> +
> +clean-local:
> +	rm -f *~ *.bak
> +	rm -rf .libs
> +
> +distclean-local:
> +	cd $(srcdir) && \
> +	  rm -rf xml $(REPORT_FILES) $(DOC_MODULE).pdf \
> +	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
> +
> +maintainer-clean-local: clean
> +	cd $(srcdir) && rm -rf xml html
> +
> +install-data-local:
> +	@installfiles=3D`echo $(srcdir)/html/*`; \
> +	if test "$$installfiles" =3D '$(srcdir)/html/*'; \
> +	then echo '-- Nothing to install' ; \
> +	else \
> +	  if test -n "$(DOC_MODULE_VERSION)"; then \
> +	    installdir=3D"$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
> +	  else \
> +	    installdir=3D"$(DESTDIR)$(TARGET_DIR)"; \
> +	  fi; \
> +	  $(mkinstalldirs) $${installdir} ; \
> +	  for i in $$installfiles; do \
> +	    echo '-- Installing '$$i ; \
> +	    $(INSTALL_DATA) $$i $${installdir}; \
> +	  done; \
> +	  if test -n "$(DOC_MODULE_VERSION)"; then \
> +	    mv -f $${installdir}/$(DOC_MODULE).devhelp2 \
> +	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp2; \
> +	    mv -f $${installdir}/$(DOC_MODULE).devhelp \
> +	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp; \
> +	  fi; \
> +	  $(GTKDOC_REBASE) --relative --dest-dir=3D$(DESTDIR) --html-dir=3D$${i=
nstalldir}; \
> +	fi
> +
> +uninstall-local:
> +	@if test -n "$(DOC_MODULE_VERSION)"; then \
> +	  installdir=3D"$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
> +	else \
> +	  installdir=3D"$(DESTDIR)$(TARGET_DIR)"; \
> +	fi; \
> +	rm -rf $${installdir}
> +
> +#
> +# Require gtk-doc when making dist
> +#
> +if ENABLE_GTK_DOC
> +dist-check-gtkdoc:
> +else
> +dist-check-gtkdoc:
> +	@echo "*** gtk-doc must be installed and enabled in order to make dist"
> +	@false
> +endif
> +
> +dist-hook: dist-check-gtkdoc dist-hook-local
> +	mkdir $(distdir)/tmpl
> +	mkdir $(distdir)/html
> +	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
> +	cp $(srcdir)/html/* $(distdir)/html
> +	-cp $(srcdir)/$(DOC_MODULE).pdf $(distdir)/
> +	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
> +	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
> +	cd $(distdir) && rm -f $(DISTCLEANFILES)
> +	$(GTKDOC_REBASE) --online --relative --html-dir=3D$(distdir)/html
> +
> +.PHONY : dist-hook-local docs
> diff --git a/meta-systemd/recipes-core/systemd/systemd/modprobe.rules b/m=
eta-systemd/recipes-core/systemd/systemd/modprobe.rules
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
> +# %e the smallest number for that name which does not matches an existin=
g node
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
> +ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", R=
UN+=3D"/sbin/modprobe $env{MODALIAS}"
> diff --git a/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules =
b/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
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
> +# %e the smallest number for that name which does not matches an existin=
g node
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
> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-e0*,3,*a0,1,*18,*", SYMLINK+=3D"input/touchscreen0"
> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"ads7846", SYMLINK+=3D"input/touchscreen0"
> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-syst=
emd/recipes-core/systemd/systemd_git.bb
> index f4ca72a..8af1aa5 100644
> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
> +++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
> @@ -1,9 +1,14 @@
>  DESCRIPTION =3D "Systemd a init replacement"
>  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> =20
> -DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline udev dbus libcap libcgroup tcp-wrappers"
> +LICENSE =3D "GPLv2 & LGPLv2.1 & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
> +                    file://LICENSE.LGPL2.1;md5=3Dfb919cc88dbe06ec0b0bd50=
e001ccf1f \
> +                    file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8=
868ed"
> +
> +PROVIDES =3D "udev"
> +
> +DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> =20
>  SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0"
> @@ -14,20 +19,17 @@ inherit gitpkgv
>  PKGV =3D "v${GITPKGVTAG}"
> =20
>  PV =3D "git"
> -PR =3D "r27"
> +PR =3D "r0"
> =20
>  inherit useradd pkgconfig autotools vala perlnative
> =20
> -SRCREV =3D "3eff4208ffecedd778fec260f0d4b18e94dab443"
> +SRCREV =3D "cd96b3b86abb4a88cac2722bdfb6e5d4413f6831"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgi=
t \
> -           ${UCLIBCPATCHES} \
> +           file://gtk-doc.make \
> +           file://touchscreen.rules \
> +           file://modprobe.rules \
>            "
> -UCLIBCPATCHES =3D ""
> -UCLIBCPATCHES_libc-uclibc =3D "file://paper-over-mkostemp.patch \
> -                             file://format-replace-m-uclibc.patch \
> -                            "
> -
>  LDFLAGS_libc-uclibc_append =3D " -lrt"
> =20
>  S =3D "${WORKDIR}/git"
> @@ -39,17 +41,27 @@ SYSTEMDDISTRO_angstrom =3D "angstrom"
>  EXTRA_OECONF =3D " --with-distro=3D${SYSTEMDDISTRO} \
>                   --with-rootprefix=3D${base_prefix} \
>                   --with-rootlibdir=3D${base_libdir} \
> +                 --sbindir=3D${base_sbindir} \
> +                 --libexecdir=3D${base_libdir} \
>                   ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pa=
m', '--disable-pam', d)} \
> -                 --disable-gtk \
>                   --enable-xz \
>                   --disable-manpages \
>                   --disable-coredump \
> +                 --disable-introspection \
> +                 --with-pci-ids-path=3D/usr/share/misc \
> +                 ac_cv_file__usr_share_pci_ids=3Dno \
> +                 ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
> +                 ac_cv_file__usr_share_misc_pci_ids=3Dyes \
> +                 --disable-gtk-doc-html \=20
> +                 --disable-tcpwrap \
>                 "
> =20
>  # There's no docbook-xsl-native, so for the xsltproc check to false
>  do_configure_prepend() {
>  	sed -i /xsltproc/d configure.ac
> =20
> +	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
> +
>  	# we only have /home/root, not /root
>  	sed -i -e 's:=3D/root:=3D/home/root:g' units/*.service*
>  }
> @@ -68,6 +80,8 @@ do_install() {
>  	# create machine-id
>  	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machi=
ne-id-setup at install time, b) have / read-only and an empty file there (f=
or stateless) and c) boot with / writable
>  	touch ${D}${sysconfdir}/machine-id
> +
> +	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
>  }
> =20
>  python populate_packages_prepend (){
> @@ -100,10 +114,18 @@ FILES_${PN} =3D " ${base_bindir}/* \
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
> @@ -114,6 +136,10 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                  ${libdir}/sysctl.d \
>                  ${localstatedir} \
>                  ${libexecdir} \
> +                ${base_libdir}/udev/rules.d/70-uaccess.rules \
> +                ${base_libdir}/udev/rules.d/71-seat.rules \
> +                ${base_libdir}/udev/rules.d/73-seat-late.rules \
> +                ${base_libdir}/udev/rules.d/99-systemd.rules \
>                 "
> =20
>  FILES_${PN}-dbg +=3D "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.de=
bug ${base_libdir}/security/.debug/"
> @@ -136,6 +162,45 @@ RRECOMMENDS_${PN} +=3D "systemd-serialgetty \
>                        kernel-module-autofs4 kernel-module-unix kernel-mo=
dule-ipv6 \
>  "
> =20
> +PACKAGES =3D+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
> +
> +FILES_udev-dbg +=3D "${base_libdir}/udev/.debug"
> +
> +RDEPENDS_udev +=3D "udev-utils"
> +RPROVIDES_udev =3D "hotplug"
> +
> +FILES_udev +=3D "${base_libdir}/udev/udevd \
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
> +FILES_udev-consolekit +=3D "${libdir}/ConsoleKit"
> +RDEPENDS_udev-consolekit +=3D "${@base_contains('DISTRO_FEATURES', 'x11'=
, 'consolekit', '', d)}"
> +
> +FILES_udev-utils =3D "${bindir}/udevadm"
> +
> +FILES_udev-systemd =3D "${base_libdir}/systemd/system/*udev* ${base_libd=
ir}/systemd/system/*.wants/*udev*"
> +RDEPENDS_udev-systemd =3D "udev"
> +
>  # TODO:
>  # u-a for runlevel and telinit
> =20
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAHs4YACgkQN1Ujt2V2gBxSxQCglDMhLZVck5DEqEh23cSoYpFI
BI8AoIqAgcO/u3FFQXXMJSdVwk0eRj3j
=r67o
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
