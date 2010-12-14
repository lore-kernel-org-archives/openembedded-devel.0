Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PSQIN-0002TH-UB for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 09:31:42 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PSQGq-0008Rs-MC for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 09:30:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 09:30:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 09:30:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 14 Dec 2010 09:26:20 +0100
Message-ID: <ie79nc$d1$2@dough.gmane.org>
References: <1292277061-32592-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1292277061-32592-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc/glibc: Use/add cross-localedef to generate locales
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
X-List-Received-Date: Tue, 14 Dec 2010 08:31:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-12-10 22:51, Khem Raj wrote:
> * Add recipe for cross-localedef-native
> * Consolidate eglibc/glibc to share common contructs in bbclass
> * Move common code in eglibc to eglibc.inc
> * By default use cross-locaedef to generate locales now instead of qemu

Will this use parallel make as well? It would be nice to speed this up
even more :)

regards,

Koen

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/glibc-package.bbclass                 |  308 -----------------
>  classes/libc-package.bbclass                  |  400 ++++++++++++++++++++++
>  recipes/eglibc/cross-localedef-native_2.12.bb |   37 ++
>  recipes/eglibc/eglibc-package.bbclass         |  448 -------------------------
>  recipes/eglibc/eglibc-package.inc             |   93 +++++
>  recipes/eglibc/eglibc.inc                     |   17 +-
>  recipes/eglibc/eglibc_2.10.bb                 |   15 +-
>  recipes/eglibc/eglibc_2.11.bb                 |   15 +-
>  recipes/eglibc/eglibc_2.12.bb                 |   21 +-
>  recipes/eglibc/eglibc_2.9.bb                  |   15 +-
>  recipes/eglibc/eglibc_svn.bb                  |   15 +-
>  recipes/glibc/glibc-package.inc               |  129 ++++----
>  12 files changed, 624 insertions(+), 889 deletions(-)
>  delete mode 100644 classes/glibc-package.bbclass
>  create mode 100644 classes/libc-package.bbclass
>  create mode 100644 recipes/eglibc/cross-localedef-native_2.12.bb
>  delete mode 100644 recipes/eglibc/eglibc-package.bbclass
>  create mode 100644 recipes/eglibc/eglibc-package.inc
> 
> diff --git a/classes/glibc-package.bbclass b/classes/glibc-package.bbclass
> deleted file mode 100644
> index 239317f..0000000
> --- a/classes/glibc-package.bbclass
> +++ /dev/null
> @@ -1,308 +0,0 @@
> -#
> -# This class knows how to package up glibc. Its shared since prebuild binary toolchains
> -# may need packaging and its pointless to duplicate this code.
> -#
> -# Caller should set GLIBC_INTERNAL_USE_BINARY_LOCALE to one of:
> -#  "compile" - Use QEMU to generate the binary locale files
> -#  "precompiled" - The binary locale files are pregenerated and already present
> -#  "ondevice" - The device will build the locale files upon first boot through the postinst
> -
> -inherit qemu
> -
> -GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
> -
> -PACKAGES = "glibc-dbg glibc catchsegv sln nscd ldd localedef glibc-utils glibc-pic glibc-dev glibc-static glibc-doc glibc-locale libcidn libmemusage libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
> -PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* locale-base-* glibc-binary-localedata-*"
> -
> -INSANE_SKIP_glibc-dbg = True
> -
> -libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${bas
>  e_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
> -
> -# The problem is that if PN = "glibc", FILES_${PN} will overwrite FILES_glibc
> -# Solution: Make them both the same thing, then it doesn't matter
> -
> -glibcfiles = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> -glibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
> -                  ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
> -                  ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
> -glibcpicfiles = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
> -glibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${libdir}/*nonshared.a \
> -                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> -
> -FILES_glibc = "${glibcfiles}"
> -FILES_${PN} = "${glibcfiles}"
> -FILES_ldd = "${bindir}/ldd"
> -FILES_libsegfault = "${base_libdir}/libSegFault*"
> -FILES_libcidn = "${base_libdir}/libcidn*.so"
> -FILES_libmemusage = "${base_libdir}/libmemusage.so"
> -FILES_glibc-extra-nss = "${base_libdir}/libnss*"
> -FILES_sln = "${base_sbindir}/sln"
> -FILES_glibc-pic = "${glibcpicfiles}"
> -FILES_${PN}-pic = "${glibcpicfiles}"
> -FILES_glibc-dev = "${glibcdevfiles}"
> -FILES_${PN}-dev = "${glibcdevfiles}"
> -FILES_glibc-dbg = "${glibcdbgfiles}"
> -FILES_${PN}-dbg = "${glibcdbgfiles}"
> -FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
> -FILES_glibc-utils = "${bindir}/* ${sbindir}/*"
> -FILES_glibc-gconv = "${libdir}/gconv/*"
> -FILES_catchsegv = "${bindir}/catchsegv"
> -RDEPENDS_catchsegv = "libsegfault"
> -FILES_glibc-pcprofile = "${base_libdir}/libpcprofile.so"
> -FILES_glibc-thread-db = "${base_libdir}/libthread_db*"
> -FILES_localedef = "${bindir}/localedef"
> -RPROVIDES_glibc-dev += "libc-dev"
> -
> -DESCRIPTION_sln = "glibc: create symbolic links between files"
> -DESCRIPTION_nscd = "glibc: name service cache daemon for passwd, group, and hosts"
> -DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services"
> -DESCRIPTION_ldd = "glibc: print shared library dependencies"
> -DESCRIPTION_localedef = "glibc: compile locale definition files"
> -DESCRIPTION_glibc-utils = "glibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
> -
> -TMP_LOCALE="/tmp/locale${libdir}/locale"
> -
> -locale_base_postinst() {
> -#!/bin/sh
> -
> -if [ "x$D" != "x" ]; then
> -  exit 1
> -fi
> -
> -rm -rf ${TMP_LOCALE}
> -mkdir -p ${TMP_LOCALE}
> -if [ -f ${libdir}/locale/locale-archive ]; then
> -        cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
> -fi
> -localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s --prefix=/tmp/locale %s
> -mkdir -p ${libdir}/locale/
> -mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
> -rm -rf ${TMP_LOCALE}
> -}
> -
> -locale_base_postrm() {
> -#!/bin/sh
> -
> -rm -rf ${TMP_LOCALE}
> -mkdir -p ${TMP_LOCALE}
> -if [ -f ${libdir}/locale/locale-archive ]; then
> -	cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
> -fi
> -localedef --delete-from-archive --inputfile=${datadir}/locales/%s --charmap=%s --prefix=/tmp/locale %s
> -mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
> -rm -rf ${TMP_LOCALE}
> -}
> -
> -do_prep_locale_tree() {
> -	treedir=${WORKDIR}/locale-tree
> -	rm -rf $treedir
> -	mkdir -p $treedir/bin $treedir/lib $treedir/${datadir} $treedir/${libdir}/locale
> -	cp -pPR ${PKGD}${datadir}/i18n $treedir/${datadir}/i18n
> -	# unzip to avoid parsing errors
> -	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
> -		gunzip $i
> -	done
> -	ls -d ${PKGD}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
> -	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so ]; then
> -		cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so $treedir/lib
> -	fi
> -	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so.* ]; then
> -		cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so.* $treedir/lib
> -	fi
> -	install -m 0755 ${PKGD}${bindir}/localedef $treedir/bin
> -}
> -
> -do_collect_bins_from_locale_tree() {
> -	treedir=${WORKDIR}/locale-tree
> -
> -	mkdir -p ${PKGD}${libdir}
> -	cp -pPR $treedir/${libdir}/locale ${PKGD}${libdir}
> -}
> -
> -python package_do_split_gconvs () {
> -	import os, re
> -	if (bb.data.getVar('PACKAGE_NO_GCONV', d, 1) == '1'):
> -		bb.note("package requested not splitting gconvs")
> -		return
> -
> -	if not bb.data.getVar('PACKAGES', d, 1):
> -		return
> -
> -	libdir = bb.data.getVar('libdir', d, 1)
> -	if not libdir:
> -		bb.error("libdir not defined")
> -		return
> -	datadir = bb.data.getVar('datadir', d, 1)
> -	if not datadir:
> -		bb.error("datadir not defined")
> -		return
> -
> -	gconv_libdir = base_path_join(libdir, "gconv")
> -	charmap_dir = base_path_join(datadir, "i18n", "charmaps")
> -	locales_dir = base_path_join(datadir, "i18n", "locales")
> -	binary_locales_dir = base_path_join(libdir, "locale")
> -
> -	do_split_packages(d, gconv_libdir, file_regex='^(.*)\.so$', output_pattern='glibc-gconv-%s', description='gconv module for character set %s', extra_depends='glibc-gconv')
> -
> -	do_split_packages(d, charmap_dir, file_regex='^(.*)\.gz$', output_pattern='glibc-charmap-%s', description='character map for %s encoding', extra_depends='')
> -
> -	def calc_locale_deps(fn, pkg, file_regex, output_pattern, group):
> -		deps = []
> -		f = open(fn, "r")
> -		c_re = re.compile('^copy "(.*)"')
> -		i_re = re.compile('^include "(\w+)".*')
> -		for l in f.readlines():
> -			m = c_re.match(l) or i_re.match(l)
> -			if m:
> -				dp = legitimize_package_name('glibc-localedata-%s' % m.group(1))
> -				if not dp in deps:
> -					deps.append(dp)
> -		f.close()
> -		if deps != []:
> -			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
> -
> -	do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern='glibc-localedata-%s', description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
> -	bb.data.setVar('PACKAGES', bb.data.getVar('PACKAGES', d) + ' glibc-gconv', d)
> -
> -	use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
> -
> -	dot_re = re.compile("(.*)\.(.*)")
> -
> -	if use_bin != "precompiled":
> -		supported = bb.data.getVar('GLIBC_GENERATE_LOCALES', d, 1)
> -		if not supported or supported == "all":
> -		    f = open(base_path_join(bb.data.getVar('WORKDIR', d, 1), "SUPPORTED"), "r")
> -		    supported = f.readlines()
> -		    f.close()
> -		else:
> -		    supported = supported.split()
> -		    supported = map(lambda s:s.replace(".", " ") + "\n", supported)
> -	else:
> -		supported = []
> -		full_bin_path = bb.data.getVar('PKGD', d, True) + binary_locales_dir
> -		for dir in os.listdir(full_bin_path):
> -			dbase = dir.split(".")
> -			d2 = "  "
> -			if len(dbase) > 1:
> -				d2 = "." + dbase[1].upper() + "  "
> -			supported.append(dbase[0] + d2)
> -
> -	# Collate the locales by base and encoding
> -	utf8_only = int(bb.data.getVar('LOCALE_UTF8_ONLY', d, 1) or 0)
> -	encodings = {}
> -	for l in supported:
> -		l = l[:-1]
> -		(locale, charset) = l.split(" ")
> -		if utf8_only and charset != 'UTF-8':
> -			continue
> -		m = dot_re.match(locale)
> -		if m:
> -			locale = m.group(1)
> -		if not encodings.has_key(locale):
> -			encodings[locale] = []
> -		encodings[locale].append(charset)
> -
> -	def output_locale_source(name, pkgname, locale, encoding):
> -		bb.data.setVar('RDEPENDS_%s' % pkgname, 'localedef glibc-localedata-%s glibc-charmap-%s' % (legitimize_package_name(locale), legitimize_package_name(encoding)), d)
> -		bb.data.setVar('pkg_postinst_%s' % pkgname, bb.data.getVar('locale_base_postinst', d, 1) % (locale, encoding, locale), d)
> -		bb.data.setVar('pkg_postrm_%s' % pkgname, bb.data.getVar('locale_base_postrm', d, 1) % (locale, encoding, locale), d)
> -
> -	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
> -		m = re.match("(.*)\.(.*)", name)
> -		if m:
> -			glibc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
> -		else:
> -			glibc_name = name
> -		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
> -
> -	def output_locale_binary(name, pkgname, locale, encoding):
> -		# This is a hack till linux-libc-headers gets patched for the missing arm syscalls and all arm device kernels as well
> -		if bb.data.getVar("DISTRO_NAME", d, 1) == "Angstrom":
> -			kernel_ver = "2.6.24"
> -		elif bb.data.getVar("DISTRO_NAME", d, 1) == "KaeilOS":
> -			kernel_ver = "2.6.24"
> -		else:
> -			kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> -
> -		qemu = qemu_target_binary(d) + " -s 1048576"
> -		if kernel_ver:
> -			qemu += " -r %s" % (kernel_ver)
> -		pkgname = 'locale-base-' + legitimize_package_name(name)
> -
> -		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
> -		ldlibdir = "%s/lib" % treedir
> -		path = bb.data.getVar("PATH", d, 1)
> -		i18npath = base_path_join(treedir, datadir, "i18n")
> -
> -		localedef_opts = "--force --old-style --no-archive --prefix=%s --inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir, locale, encoding, name)
> -
> -		qemu_options = bb.data.getVar("QEMU_OPTIONS_%s" % bb.data.getVar('PACKAGE_ARCH', d, 1), d, 1)
> -		if not qemu_options:
> -			qemu_options = bb.data.getVar('QEMU_OPTIONS', d, 1)
> -		
> -		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
> -		bb.note("generating locale %s (%s)" % (locale, encoding))
> -		if os.system(cmd):
> -			raise bb.build.FuncFailed("localedef returned an error (command was %s)." % cmd)
> -
> -	def output_locale(name, locale, encoding):
> -		pkgname = 'locale-base-' + legitimize_package_name(name)
> -		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
> -		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
> -		rprovides = 'virtual-locale-%s' % legitimize_package_name(name)
> -		m = re.match("(.*)_(.*)", name)
> -		if m:
> -			rprovides += ' virtual-locale-%s' % m.group(1)
> -		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
> -		if use_bin == "compile":
> -			output_locale_binary_rdepends(name, pkgname, locale, encoding)
> -			output_locale_binary(name, pkgname, locale, encoding)
> -		elif use_bin == "precompiled":
> -			output_locale_binary_rdepends(name, pkgname, locale, encoding)
> -		else:
> -			output_locale_source(name, pkgname, locale, encoding)
> -
> -	if use_bin == "compile":
> -		bb.note("preparing tree for binary locale generation")
> -		bb.build.exec_func("do_prep_locale_tree", d)
> -
> -	# Reshuffle names so that UTF-8 is preferred over other encodings
> -	non_utf8 = []
> -	for l in encodings.keys():
> -		if len(encodings[l]) == 1:
> -			output_locale(l, l, encodings[l][0])
> -			if encodings[l][0] != "UTF-8":
> -				non_utf8.append(l)
> -		else:
> -			if "UTF-8" in encodings[l]:
> -				output_locale(l, l, "UTF-8")
> -				encodings[l].remove("UTF-8")
> -			else:
> -				non_utf8.append(l)
> -			for e in encodings[l]:
> -				output_locale('%s.%s' % (l, e), l, e)
> -
> -	if non_utf8 != [] and use_bin != "precompiled":
> -		bb.note("the following locales are supported only in legacy encodings:")
> -		bb.note("  " + " ".join(non_utf8))
> -
> -	if use_bin == "compile":
> -		bb.note("collecting binary locales from locale tree")
> -		bb.build.exec_func("do_collect_bins_from_locale_tree", d)
> -		do_split_packages(d, binary_locales_dir, file_regex='(.*)', output_pattern='glibc-binary-localedata-%s', description='binary locale definition for %s', extra_depends='', allow_dirs=True)
> -	elif use_bin == "precompiled":
> -		do_split_packages(d, binary_locales_dir, file_regex='(.*)', output_pattern='glibc-binary-localedata-%s', description='binary locale definition for %s', extra_depends='', allow_dirs=True)
> -	else:
> -		bb.note("generation of binary locales disabled. this may break i18n!")
> -
> -}
> -
> -# We want to do this indirection so that we can safely 'return'
> -# from the called function even though we're prepending
> -python populate_packages_prepend () {
> -	if bb.data.getVar('DEBIAN_NAMES', d, 1):
> -		bb.data.setVar('PKG_glibc', 'libc6', d)
> -		bb.data.setVar('PKG_glibc-dev', 'libc6-dev', d)
> -	bb.build.exec_func('package_do_split_gconvs', d)
> -}
> diff --git a/classes/libc-package.bbclass b/classes/libc-package.bbclass
> new file mode 100644
> index 0000000..e7b6f74
> --- /dev/null
> +++ b/classes/libc-package.bbclass
> @@ -0,0 +1,400 @@
> +#
> +# This class knows how to package up [e]glibc. Its shared since prebuild binary toolchains
> +# may need packaging and its pointless to duplicate this code.
> +#
> +# Caller should set GLIBC_INTERNAL_USE_BINARY_LOCALE to one of:
> +#  "compile" - Use QEMU to generate the binary locale files
> +#  "precompiled" - The binary locale files are pregenerated and already present
> +#  "ondevice" - The device will build the locale files upon first boot through the postinst
> +
> +GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
> +
> +python __anonymous () {
> +    enabled = bb.data.getVar("ENABLE_BINARY_LOCALE_GENERATION", d, 1)
> +
> +    if enabled and int(enabled):
> +        import re
> +
> +        target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
> +        binary_arches = bb.data.getVar("BINARY_LOCALE_ARCHES", d, 1) or ""
> +        use_cross_localedef = bb.data.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", d, 1) or ""
> +
> +        for regexp in binary_arches.split(" "):
> +            r = re.compile(regexp)
> +
> +            if r.match(target_arch):
> +                depends = bb.data.getVar("DEPENDS", d, 1)
> +		if use_cross_localedef == "1" :
> +	                depends = "%s cross-localedef-native" % depends
> +		else:
> +	                depends = "%s qemu-native" % depends
> +                bb.data.setVar("DEPENDS", depends, d)
> +                bb.data.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile", d)
> +                break
> +}
> +
> +def get_libc_fpu_setting(bb, d):
> +    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> +        return "--without-fp"
> +    return ""
> +
> +OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
> +
> +do_configure_prepend() {
> +        sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
> +}
> +
> +
> +
> +# indentation removed on purpose
> +locale_base_postinst() {
> +#!/bin/sh
> +
> +if [ "x$D" != "x" ]; then
> +	exit 1
> +fi
> +
> +rm -rf ${TMP_LOCALE}
> +mkdir -p ${TMP_LOCALE}
> +if [ -f ${libdir}/locale/locale-archive ]; then
> +        cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
> +fi
> +localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s --prefix=/tmp/locale %s
> +mkdir -p ${libdir}/locale/
> +mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
> +rm -rf ${TMP_LOCALE}
> +}
> +
> +# indentation removed on purpose
> +locale_base_postrm() {
> +#!/bin/sh
> +
> +rm -rf ${TMP_LOCALE}
> +mkdir -p ${TMP_LOCALE}
> +if [ -f ${libdir}/locale/locale-archive ]; then
> +	cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
> +fi
> +localedef --delete-from-archive --inputfile=${datadir}/locales/%s --charmap=%s --prefix=/tmp/locale %s
> +mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
> +rm -rf ${TMP_LOCALE}
> +}
> +
> +do_install() {
> +	oe_runmake install_root=${D} \
> +	libdir='${libdir}' slibdir='${base_libdir}' \
> +	localedir='${libdir}/locale' \
> +	install
> +	for r in ${rpcsvc}; do
> +		h=`echo $r|sed -e's,\.x$,.h,'`
> +		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
> +	done
> +	install -m 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/
> +	install -d ${D}${libdir}/locale
> +	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
> +	# get rid of some broken files...
> +	for i in ${GLIBC_BROKEN_LOCALES}; do
> +		grep -v $i ${WORKDIR}/SUPPORTED > ${WORKDIR}/SUPPORTED.tmp
> +		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
> +	done
> +	rm -f ${D}/etc/rpc
> +	rm -rf ${D}${datadir}/zoneinfo
> +	rm -rf ${D}${libexecdir}/getconf
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0644 ${S}/nscd/nscd.conf ${D}${sysconfdir}/
> +	install ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
> +}
> +
> +TMP_LOCALE="/tmp/locale${libdir}/locale"
> +
> +do_prep_locale_tree() {
> +	treedir=${WORKDIR}/locale-tree
> +	rm -rf $treedir
> +	mkdir -p $treedir/bin $treedir/lib $treedir/${datadir} $treedir/${libdir}/locale
> +	cp -pPR ${PKGD}${datadir}/i18n $treedir/${datadir}/i18n
> +	# unzip to avoid parsing errors
> +	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
> +		gunzip $i
> +	done
> +	cp -pPR ${PKGD}${base_libdir}/* $treedir/lib
> +	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.* ]; then
> +		cp -pPR ${STAGING_DIR_NATIVE}/${prefix_native}/lib/libgcc_s.* $treedir/lib
> +	fi
> +	install -m 0755 ${PKGD}${bindir}/localedef $treedir/bin
> +}
> +
> +do_collect_bins_from_locale_tree() {
> +	treedir=${WORKDIR}/locale-tree
> +
> +	mkdir -p ${PKGD}${libdir}
> +	cp -pPR $treedir/${libdir}/locale ${PKGD}${libdir}
> +}
> +
> +inherit qemu
> +
> +python package_do_split_gconvs () {
> +	import os, re
> +	if (bb.data.getVar('PACKAGE_NO_GCONV', d, 1) == '1'):
> +		bb.note("package requested not splitting gconvs")
> +		return
> +
> +	if not bb.data.getVar('PACKAGES', d, 1):
> +		return
> +
> +	bpn = bb.data.getVar('BPN', d, 1)
> +	libdir = bb.data.getVar('libdir', d, 1)
> +	if not libdir:
> +		bb.error("libdir not defined")
> +		return
> +	datadir = bb.data.getVar('datadir', d, 1)
> +	if not datadir:
> +		bb.error("datadir not defined")
> +		return
> +
> +	gconv_libdir = base_path_join(libdir, "gconv")
> +	charmap_dir = base_path_join(datadir, "i18n", "charmaps")
> +	locales_dir = base_path_join(datadir, "i18n", "locales")
> +	binary_locales_dir = base_path_join(libdir, "locale")
> +
> +	def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
> +		deps = []
> +		f = open(fn, "r")
> +		c_re = re.compile('^copy "(.*)"')
> +		i_re = re.compile('^include "(\w+)".*')
> +		for l in f.readlines():
> +			m = c_re.match(l) or i_re.match(l)
> +			if m:
> +				dp = legitimize_package_name('%s-gconv-%s' % (bpn, m.group(1)))
> +				if not dp in deps:
> +					deps.append(dp)
> +		f.close()
> +		if deps != []:
> +			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
> +		if bpn != 'glibc':
> +			bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'), d)
> +
> +	do_split_packages(d, gconv_libdir, file_regex='^(.*)\.so$', output_pattern=bpn+'-gconv-%s', \
> +		description='gconv module for character set %s', hook=calc_gconv_deps, \
> +		extra_depends=bpn+'-gconv')
> +
> +	def calc_charmap_deps(fn, pkg, file_regex, output_pattern, group):
> +		deps = []
> +		f = open(fn, "r")
> +		c_re = re.compile('^copy "(.*)"')
> +		i_re = re.compile('^include "(\w+)".*')
> +		for l in f.readlines():
> +			m = c_re.match(l) or i_re.match(l)
> +			if m:
> +				dp = legitimize_package_name('%s-charmap-%s' % (bpn, m.group(1)))
> +				if not dp in deps:
> +					deps.append(dp)
> +		f.close()
> +		if deps != []:
> +			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
> +		if bpn != 'glibc':
> +			bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'), d)
> +
> +	do_split_packages(d, charmap_dir, file_regex='^(.*)\.gz$', output_pattern=bpn+'-charmap-%s', \
> +		description='character map for %s encoding', hook=calc_charmap_deps, extra_depends='')
> +
> +	def calc_locale_deps(fn, pkg, file_regex, output_pattern, group):
> +		deps = []
> +		f = open(fn, "r")
> +		c_re = re.compile('^copy "(.*)"')
> +		i_re = re.compile('^include "(\w+)".*')
> +		for l in f.readlines():
> +			m = c_re.match(l) or i_re.match(l)
> +			if m:
> +				dp = legitimize_package_name(bpn+'-localedata-%s' % m.group(1))
> +				if not dp in deps:
> +					deps.append(dp)
> +		f.close()
> +		if deps != []:
> +			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
> +		if bpn != 'glibc':
> +			bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'), d)
> +
> +	do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern=bpn+'-localedata-%s', \
> +		description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
> +	bb.data.setVar('PACKAGES', bb.data.getVar('PACKAGES', d) + ' ' + bpn + '-gconv', d)
> +
> +	use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
> +
> +	dot_re = re.compile("(.*)\.(.*)")
> +
> +#GLIBC_GENERATE_LOCALES var specifies which locales to be supported, empty or "all" means all locales 
> +	if use_bin != "precompiled":
> +		supported = bb.data.getVar('GLIBC_GENERATE_LOCALES', d, 1)
> +		if not supported or supported == "all":
> +			f = open(base_path_join(bb.data.getVar('WORKDIR', d, 1), "SUPPORTED"), "r")
> +			supported = f.readlines()
> +			f.close()
> +		else:
> +			supported = supported.split()
> +			supported = map(lambda s:s.replace(".", " ") + "\n", supported)
> +	else:
> +		supported = []
> +		full_bin_path = bb.data.getVar('PKGD', d, True) + binary_locales_dir
> +		for dir in os.listdir(full_bin_path):
> +			dbase = dir.split(".")
> +			d2 = "  "
> +			if len(dbase) > 1:
> +				d2 = "." + dbase[1].upper() + "  "
> +			supported.append(dbase[0] + d2)
> +
> +	# Collate the locales by base and encoding
> +	utf8_only = int(bb.data.getVar('LOCALE_UTF8_ONLY', d, 1) or 0)
> +	encodings = {}
> +	for l in supported:
> +		l = l[:-1]
> +		(locale, charset) = l.split(" ")
> +		if utf8_only and charset != 'UTF-8':
> +			continue
> +		m = dot_re.match(locale)
> +		if m:
> +			locale = m.group(1)
> +		if not encodings.has_key(locale):
> +			encodings[locale] = []
> +		encodings[locale].append(charset)
> +
> +	def output_locale_source(name, pkgname, locale, encoding):
> +		bb.data.setVar('RDEPENDS_%s' % pkgname, 'localedef %s-localedata-%s %s-charmap-%s' % \
> +		(bpn, legitimize_package_name(locale), bpn, legitimize_package_name(encoding)), d)
> +		bb.data.setVar('pkg_postinst_%s' % pkgname, bb.data.getVar('locale_base_postinst', d, 1) \
> +		% (locale, encoding, locale), d)
> +		bb.data.setVar('pkg_postrm_%s' % pkgname, bb.data.getVar('locale_base_postrm', d, 1) % \
> +		(locale, encoding, locale), d)
> +
> +	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
> +		m = re.match("(.*)_(.*)", name)
> +		if m:
> +			libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
> +		else:
> +			libc_name = name
> +		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
> +			% (bpn, libc_name)), d)
> +		rprovides = (bb.data.getVar('RPROVIDES_%s' % pkgname, d, True) or "").split()
> +		rprovides.append(legitimize_package_name('%s-binary-localedata-%s' % (bpn, libc_name)))
> +		bb.data.setVar('RPROVIDES_%s' % pkgname, " ".join(rprovides), d)
> +
> +	def output_locale_binary(name, pkgname, locale, encoding):
> +		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
> +		ldlibdir = "%s/lib" % treedir
> +		path = bb.data.getVar("PATH", d, 1)
> +		i18npath = base_path_join(treedir, datadir, "i18n")
> +		gconvpath = base_path_join(treedir, "iconvdata")
> +
> +		use_cross_localedef = bb.data.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", d, 1) or "0"
> +		if use_cross_localedef == "1":
> +	    		target_arch = bb.data.getVar('TARGET_ARCH', d, True)
> +			locale_arch_options = { \
> +				"arm":     " --uint32-align=4 --little-endian ", \
> +				"powerpc": " --uint32-align=4 --big-endian ",    \
> +				"mips":    " --uint32-align=4 --big-endian ",    \
> +				"mipsel":  " --uint32-align=4 --little-endian ", \
> +				"i586":    " --uint32-align=4 --little-endian ", \
> +				"x86_64":  " --uint32-align=4 --little-endian "  }
> +
> +			if target_arch in locale_arch_options:
> +				localedef_opts = locale_arch_options[target_arch]
> +			else:
> +				bb.error("locale_arch_options not found for target_arch=" + target_arch)
> +				raise bb.build.FuncFailed("unknown arch:" + target_arch + " for locale_arch_options")
> +
> +			localedef_opts += " --force --old-style --no-archive --prefix=%s \
> +				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/usr/lib/locale/%s" \
> +				% (treedir, treedir, datadir, locale, encoding, treedir, name)
> +
> +			cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
> +				(path, i18npath, gconvpath, localedef_opts)
> +		else: # earlier slower qemu way 
> +			qemu = qemu_target_binary(d) 
> +			localedef_opts = "--force --old-style --no-archive --prefix=%s \
> +				--inputfile=%s/i18n/locales/%s --charmap=%s %s" \
> +				% (treedir, datadir, locale, encoding, name)
> +
> +			qemu_options = bb.data.getVar("QEMU_OPTIONS_%s" % bb.data.getVar('PACKAGE_ARCH', d, 1), d, 1)
> +			if not qemu_options:
> +				qemu_options = bb.data.getVar('QEMU_OPTIONS', d, 1)
> +
> +			cmd = "PSEUDO_RELOADED=YES PATH=\"%s\" I18NPATH=\"%s\" %s -L %s \
> +				-E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % \
> +				(path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
> +
> +		bb.note("generating locale %s (%s)" % (locale, encoding))
> +		import subprocess
> +		process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +		if process.wait() != 0:
> +			bb.note("cmd:")
> +			bb.note(cmd)
> +			bb.note("stdout:")
> +			bb.note(process.stdout.read())
> +			bb.note("stderr:")
> +			bb.note(process.stderr.read())
> +			raise bb.build.FuncFailed("localedef returned an error")
> +
> +	def output_locale(name, locale, encoding):
> +		pkgname = 'locale-base-' + legitimize_package_name(name)
> +		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
> +		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
> +		rprovides = ' virtual-locale-%s' % legitimize_package_name(name)
> +		m = re.match("(.*)_(.*)", name)
> +		if m:
> +			rprovides += ' virtual-locale-%s' % m.group(1)
> +		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
> +
> +		if use_bin == "compile":
> +			output_locale_binary_rdepends(name, pkgname, locale, encoding)
> +			output_locale_binary(name, pkgname, locale, encoding)
> +		elif use_bin == "precompiled":
> +			output_locale_binary_rdepends(name, pkgname, locale, encoding)
> +		else:
> +			output_locale_source(name, pkgname, locale, encoding)
> +
> +	if use_bin == "compile":
> +		bb.note("preparing tree for binary locale generation")
> +		bb.build.exec_func("do_prep_locale_tree", d)
> +
> +	# Reshuffle names so that UTF-8 is preferred over other encodings
> +	non_utf8 = []
> +	for l in encodings.keys():
> +		if len(encodings[l]) == 1:
> +			output_locale(l, l, encodings[l][0])
> +			if encodings[l][0] != "UTF-8":
> +				non_utf8.append(l)
> +		else:
> +			if "UTF-8" in encodings[l]:
> +				output_locale(l, l, "UTF-8")
> +				encodings[l].remove("UTF-8")
> +			else:
> +				non_utf8.append(l)
> +			for e in encodings[l]:
> +				output_locale('%s.%s' % (l, e), l, e)
> +
> +	if non_utf8 != [] and use_bin != "precompiled":
> +		bb.note("the following locales are supported only in legacy encodings:")
> +		bb.note("  " + " ".join(non_utf8))
> +
> +	if use_bin == "compile":
> +		bb.note("collecting binary locales from locale tree")
> +		bb.build.exec_func("do_collect_bins_from_locale_tree", d)
> +		do_split_packages(d, binary_locales_dir, file_regex='(.*)', \
> +			output_pattern=bpn+'-binary-localedata-%s', \
> +			description='binary locale definition for %s', extra_depends='', allow_dirs=True)
> +	elif use_bin == "precompiled":
> +		do_split_packages(d, binary_locales_dir, file_regex='(.*)', \
> +			output_pattern=bpn+'-binary-localedata-%s', \
> +			description='binary locale definition for %s', extra_depends='', allow_dirs=True)
> +	else:
> +		bb.note("generation of binary locales disabled. this may break i18n!")
> +
> +}
> +
> +# We want to do this indirection so that we can safely 'return'
> +# from the called function even though we're prepending
> +python populate_packages_prepend () {
> +	if bb.data.getVar('DEBIAN_NAMES', d, 1):
> +		bpn = bb.data.getVar('BPN', d, 1)
> +		bb.data.setVar('PKG_'+bpn, 'libc6', d)
> +		bb.data.setVar('PKG_'+bpn+'-dev', 'libc6-dev', d)
> +	bb.build.exec_func('package_do_split_gconvs', d)
> +}
> diff --git a/recipes/eglibc/cross-localedef-native_2.12.bb b/recipes/eglibc/cross-localedef-native_2.12.bb
> new file mode 100644
> index 0000000..39970fe
> --- /dev/null
> +++ b/recipes/eglibc/cross-localedef-native_2.12.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "Cross locale generation tool for eglibc"
> +HOMEPAGE = "http://www.eglibc.org/home"
> +SECTION = "libs"
> +PRIORITY = "required"
> +LICENSE = "LGPL"
> +
> +inherit native
> +inherit autotools
> +
> +PR = "r1"
> +SRCREV="12230"
> +EGLIBC_BRANCH="eglibc-2_12"
> +SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
> +S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
> +
> +do_unpack_append() {
> +	bb.build.exec_func('do_move_ports', d)
> +}
> +
> +do_move_ports() {
> +        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
> +	    rm -rf ${S}../libc/ports
> +	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/../libc/
> +	fi
> +}
> +
> +EXTRA_OECONF = "--with-glibc=${WORKDIR}/${EGLIBC_BRANCH}/libc"
> +
> +do_configure () {
> +	./configure ${EXTRA_OECONF}
> +}
> +
> +
> +do_install() {
> +	install -d ${D}${bindir} 
> +	install -m 0755 ${S}/localedef ${D}${bindir}/cross-localedef
> +}
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> deleted file mode 100644
> index b141d42..0000000
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ /dev/null
> @@ -1,448 +0,0 @@
> -#
> -# For now, we will skip building of a gcc package if it is a uclibc one
> -# and our build is not a uclibc one, and we skip a eglibc one if our build
> -# is a uclibc build.
> -#
> -# See the note in gcc/gcc_3.4.0.oe
> -#
> -
> -inherit qemu
> -
> -python __anonymous () {
> -    import bb, re
> -    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)
> -    if uc_os:
> -        raise bb.parse.SkipPackage("incompatible with target %s" %
> -                                   bb.data.getVar('TARGET_OS', d, 1))
> -}
> -#
> -# This class knows how to package up glibc. Its shared since prebuild binary toolchains
> -# may need packaging and its pointless to duplicate this code.
> -#
> -# Caller should set GLIBC_INTERNAL_USE_BINARY_LOCALE to one of:
> -#  "compile" - Use QEMU to generate the binary locale files
> -#  "precompiled" - The binary locale files are pregenerated and already present
> -#  "ondevice" - The device will build the locale files upon first boot through the postinst
> -
> -GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
> -
> -# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
> -# is set. The idea is to avoid running localedef on the target (at first boot)
> -# to decrease initial boot time and avoid localedef being killed by the OOM
> -# killer which used to effectively break i18n on machines with < 128MB RAM.
> -
> -# default to disabled until qemu works for everyone
> -ENABLE_BINARY_LOCALE_GENERATION ?= "0"
> -
> -# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
> -
> -# Set this to zero if you don't want ldconfig in the output package
> -USE_LDCONFIG ?= "1"
> -
> -PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-pic eglibc-doc eglibc-locale libcidn libmemusage libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile eglibc-dev eglibc-static"
> -PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
> -
> -INSANE_SKIP_eglibc-dbg = True
> -
> -RPROVIDES_eglibc-dbg = "glibc-dbg"
> -RPROVIDES_eglibc = "glibc"
> -RPROVIDES_eglibc-utils = "glibc-utils"
> -RPROVIDES_eglibc-pic = "glibc-pic"
> -RPROVIDES_eglibc-dev = "glibc-dev"
> -RPROVIDES_eglibc-static = "glibc-static"
> -RPROVIDES_eglibc-doc = "glibc-doc"
> -RPROVIDES_eglibc-locale = "glibc-locale"
> -RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
> -RPROVIDES_eglibc-thread-db = "glibc-thread-db"
> -RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
> -
> -libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${bas
>  e_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
> -
> -# The problem is that if PN = "glibc", FILES_${PN} will overwrite FILES_glibc
> -# Solution: Make them both the same thing, then it doesn't matter
> -
> -eglibcfiles = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> -eglibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
> -                  ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
> -                  ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
> -eglibcpicfiles = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
> -eglibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${libdir}/*nonshared.a \
> -                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> -
> -FILES_eglibc = "${eglibcfiles}"
> -FILES_${PN} = "${eglibcfiles}"
> -FILES_ldd = "${bindir}/ldd"
> -FILES_libsegfault = "${base_libdir}/libSegFault*"
> -FILES_libcidn = "${base_libdir}/libcidn*.so"
> -FILES_libmemusage = "${base_libdir}/libmemusage.so"
> -FILES_eglibc-extra-nss = "${base_libdir}/libnss*.so"
> -FILES_sln = "${base_sbindir}/sln"
> -FILES_eglibc-pic = "${eglibcpicfiles}"
> -FILES_${PN}-pic = "${eglibcpicfiles}"
> -FILES_eglibc-dev = "${eglibcdevfiles}"
> -FILES_${PN}-dev = "${eglibcdevfiles}"
> -FILES_eglibc-dbg = "${eglibcdbgfiles}"
> -FILES_${PN}-dbg = "${eglibcdbgfiles}"
> -FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
> -FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
> -FILES_eglibc-gconv = "${libdir}/gconv/*"
> -FILES_catchsegv = "${bindir}/catchsegv"
> -RDEPENDS_catchsegv = "libsegfault"
> -FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
> -FILES_eglibc-thread-db = "${base_libdir}/libthread_db*"
> -FILES_localedef = "${bindir}/localedef"
> -
> -RPROVIDES_eglibc-dev += "libc-dev libc6-dev virtual-libc-dev"
> -
> -DESCRIPTION_sln = "eglibc: create symbolic links between files"
> -DESCRIPTION_nscd = "eglibc: name service cache daemon for passwd, group, and hosts"
> -DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services"
> -DESCRIPTION_ldd = "eglibc: print shared library dependencies"
> -DESCRIPTION_localedef = "eglibc: compile locale definition files"
> -DESCRIPTION_eglibc-utils = "eglibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
> -
> -INITSCRIPT_NAME = "nscd"
> -INITSCRIPT_PACKAGES = "nscd"
> -INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
> -inherit update-rc.d
> -
> -def get_eglibc_fpu_setting(bb, d):
> -    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> -        return "--without-fp"
> -    return ""
> -
> -EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
> -EXTRA_OEMAKE += "rootsbindir=${base_sbindir}"
> -
> -OVERRIDES_prepend = "${TARGET_ARCH}-${TARGET_OS}:"
> -
> -do_configure_prepend() {
> -        sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
> -}
> -
> -do_install() {
> -	oe_runmake install_root=${D} \
> -	libdir='${libdir}' slibdir='${base_libdir}' \
> -	localedir='${libdir}/locale' \
> -	install
> -	for r in ${rpcsvc}; do
> -		h=`echo $r|sed -e's,\.x$,.h,'`
> -		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
> -	done
> -	install -m 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/
> -	install -d ${D}${libdir}/locale
> -	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
> -	# get rid of some broken files...
> -	for i in ${GLIBC_BROKEN_LOCALES}; do
> -		grep -v $i ${WORKDIR}/SUPPORTED > ${WORKDIR}/SUPPORTED.tmp
> -		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
> -	done
> -	rm -f ${D}/etc/rpc
> -	rm -rf ${D}${datadir}/zoneinfo
> -	rm -rf ${D}${libexecdir}/getconf
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0644 ${S}/nscd/nscd.conf ${D}${sysconfdir}/
> -	install ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
> -}
> -
> -TMP_LOCALE="/tmp/locale${libdir}/locale"
> -
> -locale_base_postinst() {
> -#!/bin/sh
> -
> -if [ "x$D" != "x" ]; then
> -  exit 1
> -fi
> -
> -rm -rf ${TMP_LOCALE}
> -mkdir -p ${TMP_LOCALE}
> -if [ -f ${libdir}/locale/locale-archive ]; then
> -        cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
> -fi
> -localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s --prefix=/tmp/locale %s
> -mkdir -p ${libdir}/locale/
> -mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
> -rm -rf ${TMP_LOCALE}
> -}
> -
> -locale_base_postrm() {
> -#!/bin/sh
> -
> -rm -rf ${TMP_LOCALE}
> -mkdir -p ${TMP_LOCALE}
> -if [ -f ${libdir}/locale/locale-archive ]; then
> -	cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
> -fi
> -localedef --delete-from-archive --inputfile=${datadir}/locales/%s --charmap=%s --prefix=/tmp/locale %s
> -mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
> -rm -rf ${TMP_LOCALE}
> -}
> -
> -python __anonymous () {
> -    enabled = bb.data.getVar("ENABLE_BINARY_LOCALE_GENERATION", d, 1)
> -
> -    if enabled and int(enabled):
> -        import re
> -
> -        target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
> -        binary_arches = bb.data.getVar("BINARY_LOCALE_ARCHES", d, 1) or ""
> -
> -        for regexp in binary_arches.split(" "):
> -            r = re.compile(regexp)
> -
> -            if r.match(target_arch):
> -                depends = bb.data.getVar("DEPENDS", d, 1)
> -                depends = "%s qemu-native" % depends
> -                bb.data.setVar("DEPENDS", depends, d)
> -                bb.data.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile", d)
> -                break
> -}
> -
> -do_prep_locale_tree() {
> -	treedir=${WORKDIR}/locale-tree
> -	rm -rf $treedir
> -	mkdir -p $treedir/bin $treedir/lib $treedir/${datadir} $treedir/${libdir}/locale
> -	cp -pPR ${PKGD}${datadir}/i18n $treedir/${datadir}/i18n
> -	# unzip to avoid parsing errors
> -	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
> -		gunzip $i
> -	done
> -	ls -d ${PKGD}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
> -	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.* ]; then
> -		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
> -	fi
> -	install -m 0755 ${PKGD}${bindir}/localedef $treedir/bin
> -}
> -
> -do_collect_bins_from_locale_tree() {
> -	treedir=${WORKDIR}/locale-tree
> -
> -	mkdir -p ${PKGD}${libdir}
> -	cp -pPR $treedir/${libdir}/locale ${PKGD}${libdir}
> -}
> -
> -python package_do_split_gconvs () {
> -	import os, re
> -	if (bb.data.getVar('PACKAGE_NO_GCONV', d, 1) == '1'):
> -		bb.note("package requested not splitting gconvs")
> -		return
> -
> -	if not bb.data.getVar('PACKAGES', d, 1):
> -		return
> -
> -	libdir = bb.data.getVar('libdir', d, 1)
> -	if not libdir:
> -		bb.error("libdir not defined")
> -		return
> -	datadir = bb.data.getVar('datadir', d, 1)
> -	if not datadir:
> -		bb.error("datadir not defined")
> -		return
> -
> -	gconv_libdir = base_path_join(libdir, "gconv")
> -	charmap_dir = base_path_join(datadir, "i18n", "charmaps")
> -	locales_dir = base_path_join(datadir, "i18n", "locales")
> -	binary_locales_dir = base_path_join(libdir, "locale")
> -
> -	def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
> -		deps = []
> -		f = open(fn, "r")
> -		c_re = re.compile('^copy "(.*)"')
> -		i_re = re.compile('^include "(\w+)".*')
> -		for l in f.readlines():
> -			m = c_re.match(l) or i_re.match(l)
> -			if m:
> -				dp = legitimize_package_name('eglibc-gconv-%s' % m.group(1))
> -				if not dp in deps:
> -					deps.append(dp)
> -		f.close()
> -		if deps != []:
> -			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
> -		bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace('eglibc', 'glibc'), d)
> -
> -	do_split_packages(d, gconv_libdir, file_regex='^(.*)\.so$', output_pattern='eglibc-gconv-%s', description='gconv module for character set %s', hook=calc_gconv_deps, extra_depends='eglibc-gconv')
> -
> -	def calc_charmap_deps(fn, pkg, file_regex, output_pattern, group):
> -		deps = []
> -		f = open(fn, "r")
> -		c_re = re.compile('^copy "(.*)"')
> -		i_re = re.compile('^include "(\w+)".*')
> -		for l in f.readlines():
> -			m = c_re.match(l) or i_re.match(l)
> -			if m:
> -				dp = legitimize_package_name('eglibc-charmap-%s' % m.group(1))
> -				if not dp in deps:
> -					deps.append(dp)
> -		f.close()
> -		if deps != []:
> -			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
> -		bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace('eglibc', 'glibc'), d)
> -
> -	do_split_packages(d, charmap_dir, file_regex='^(.*)\.gz$', output_pattern='eglibc-charmap-%s', description='character map for %s encoding', hook=calc_charmap_deps, extra_depends='')
> -
> -	def calc_locale_deps(fn, pkg, file_regex, output_pattern, group):
> -		deps = []
> -		f = open(fn, "r")
> -		c_re = re.compile('^copy "(.*)"')
> -		i_re = re.compile('^include "(\w+)".*')
> -		for l in f.readlines():
> -			m = c_re.match(l) or i_re.match(l)
> -			if m:
> -				dp = legitimize_package_name('eglibc-localedata-%s' % m.group(1))
> -				if not dp in deps:
> -					deps.append(dp)
> -		f.close()
> -		if deps != []:
> -			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
> -		bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace('eglibc', 'glibc'), d)
> -
> -	do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern='eglibc-localedata-%s', description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
> -	bb.data.setVar('PACKAGES', bb.data.getVar('PACKAGES', d) + ' eglibc-gconv', d)
> -	use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
> -	dot_re = re.compile("(.*)\.(.*)")
> -
> -	if use_bin != "precompiled":
> -	    supported = bb.data.getVar('GLIBC_GENERATE_LOCALES', d, 1)
> -	    if not supported or supported == "all":
> -		f = open(base_path_join(bb.data.getVar('WORKDIR', d, 1), "SUPPORTED"), "r")
> -		supported = f.readlines()
> -		f.close()
> -	    else:
> -		supported = supported.split()
> -		supported = map(lambda s:s.replace(".", " ") + "\n", supported)
> -
> -        else:
> -	   supported = []
> -	   full_bin_path = bb.data.getVar('PKGD', d, True) + binary_locales_dir
> -	   for dir in os.listdir(full_bin_path):
> -		dbase = dir.split(".")
> -		d2 = "  "
> -		if len(dbase) > 1:
> -		    d2 = "." + dbase[1].upper() + "  "
> -		supported.append(dbase[0] + d2)
> -
> -	# Collate the locales by base and encoding
> -	utf8_only = int(bb.data.getVar('LOCALE_UTF8_ONLY', d, 1) or 0)
> -	encodings = {}
> -	for l in supported:
> -		l = l[:-1]
> -		(locale, charset) = l.split(" ")
> -		if utf8_only and charset != 'UTF-8':
> -		    continue
> -		m = dot_re.match(locale)
> -		if m:
> -			locale = m.group(1)
> -		if not encodings.has_key(locale):
> -			encodings[locale] = []
> -		encodings[locale].append(charset)
> -
> -	def output_locale_source(name, pkgname, locale, encoding):
> -		bb.data.setVar('RDEPENDS_%s' % pkgname, 'localedef eglibc-localedata-%s eglibc-charmap-%s' % (legitimize_package_name(locale), legitimize_package_name(encoding)), d)
> -		
> -		bb.data.setVar('pkg_postinst_%s' % pkgname, bb.data.getVar('locale_base_postinst', d, 1) % (locale, encoding, locale), d)
> -		bb.data.setVar('pkg_postrm_%s' % pkgname, bb.data.getVar('locale_base_postrm', d, 1) % (locale, encoding, locale), d)
> -
> -	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
> -		m = re.match("(.*)\.(.*)", name)
> -		if m:
> -		    glibc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
> -		else:
> -		    glibc_name = name
> -		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('eglibc-binary-localedata-%s' % glibc_name), d)
> -		rprovides = bb.data.getVar("RPROVIDES_%s" % pkgname, d, 1)
> -		rprovides += ' glibc-binary-localedata-%s' % glibc_name
> -		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
> -
> -	def output_locale_binary(name, pkgname, locale, encoding):
> -		# This is a hack till linux-libc-headers gets patched for the missing arm syscalls and all arm device kernels as well
> -		if bb.data.getVar("DISTRO_NAME", d, 1) == "Angstrom":
> -			kernel_ver = "2.6.24"
> -		elif bb.data.getVar("DISTRO_NAME", d, 1) == "KaeilOS":
> -			kernel_ver = "2.6.24"
> -		else:
> -			kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> -
> -		qemu = qemu_target_binary(d) + " -s 1048576"
> -		if kernel_ver:
> -			qemu += " -r %s" % (kernel_ver)
> -		pkgname = 'locale-base-' + legitimize_package_name(name)
> -
> -		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
> -		ldlibdir = "%s/lib" % treedir
> -		path = bb.data.getVar("PATH", d, 1)
> -		i18npath = base_path_join(treedir, datadir, "i18n")
> -
> -		localedef_opts = "--force --old-style --no-archive --prefix=%s --inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir, locale, encoding, name)
> -
> -		qemu_options = bb.data.getVar("QEMU_OPTIONS_%s" % bb.data.getVar('PACKAGE_ARCH', d, 1), d, 1)
> -		if not qemu_options:
> -			qemu_options = bb.data.getVar('QEMU_OPTIONS', d, 1)
> -		
> -		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
> -		bb.note("generating locale %s (%s)" % (locale, encoding))
> -		if os.system(cmd):
> -			raise bb.build.FuncFailed("localedef returned an error (command was %s)." % cmd)
> -
> -	def output_locale(name, locale, encoding):
> -
> -		pkgname = 'locale-base-' + legitimize_package_name(name)
> -		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
> -		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
> -		rprovides = 'virtual-locale-%s' % legitimize_package_name(name)
> -		m = re.match("(.*)_(.*)", name)
> -		if m:
> -			rprovides += ' virtual-locale-%s' % m.group(1)
> -		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
> -		if use_bin == "compile":
> -			output_locale_binary_rdepends(name, pkgname, locale, encoding)
> -			output_locale_binary(name, pkgname, locale, encoding)
> -		elif use_bin == "precompiled":
> -			output_locale_binary_rdepends(name, pkgname, locale, encoding)
> -		else:
> -			output_locale_source(name, pkgname, locale, encoding)
> -
> -	if use_bin == "compile":
> -		bb.note("preparing tree for binary locale generation")
> -		bb.build.exec_func("do_prep_locale_tree", d)
> -
> -	# Reshuffle names so that UTF-8 is preferred over other encodings
> -	non_utf8 = []
> -	for l in encodings.keys():
> -		if len(encodings[l]) == 1:
> -			output_locale(l, l, encodings[l][0])
> -			if encodings[l][0] != "UTF-8":
> -				non_utf8.append(l)
> -		else:
> -			if "UTF-8" in encodings[l]:
> -				output_locale(l, l, "UTF-8")
> -				encodings[l].remove("UTF-8")
> -			else:
> -				non_utf8.append(l)
> -			for e in encodings[l]:
> -				output_locale('%s.%s' % (l, e), l, e)
> -
> -	if non_utf8 != [] and use_bin != "precompiled":
> -		bb.note("the following locales are supported only in legacy encodings:")
> -		bb.note("  " + " ".join(non_utf8))
> -
> -	if use_bin == "compile":
> -		bb.note("collecting binary locales from locale tree")
> -		bb.build.exec_func("do_collect_bins_from_locale_tree", d)
> -		do_split_packages(d, binary_locales_dir, file_regex='(.*)', output_pattern='eglibc-binary-localedata-%s', description='binary locale definition for %s', extra_depends='', allow_dirs=True)
> -	elif use_bin == "precompiled":
> -		do_split_packages(d, binary_locales_dir, file_regex='(.*)', output_pattern='eglibc-binary-localedata-%s', description='binary locale definition for %s', extra_depends='', allow_dirs=True)
> -	else:
> -		bb.note("generation of binary locales disabled. this may break i18n!")
> -
> -}
> -
> -# We want to do this indirection so that we can safely 'return'
> -# from the called function even though we're prepending
> -python populate_packages_prepend () {
> -	if bb.data.getVar('DEBIAN_NAMES', d, 1):
> -		bb.data.setVar('PKG_eglibc', 'libc6', d)
> -		bb.data.setVar('PKG_eglibc-dev', 'libc6-dev', d)
> -	bb.build.exec_func('package_do_split_gconvs', d)
> -}
> diff --git a/recipes/eglibc/eglibc-package.inc b/recipes/eglibc/eglibc-package.inc
> new file mode 100644
> index 0000000..517eaaa
> --- /dev/null
> +++ b/recipes/eglibc/eglibc-package.inc
> @@ -0,0 +1,93 @@
> +#
> +# For now, we will skip building of a gcc package if it is a uclibc one
> +# and our build is not a uclibc one, and we skip a eglibc one if our build
> +# is a uclibc build.
> +#
> +# See the note in gcc/gcc_3.4.0.oe
> +#
> +
> +python __anonymous () {
> +    import bb, re
> +    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)
> +    if uc_os:
> +        raise bb.parse.SkipPackage("incompatible with target %s" %
> +                                   bb.data.getVar('TARGET_OS', d, 1))
> +}
> +
> +# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
> +# is set. The idea is to avoid running localedef on the target (at first boot)
> +# to decrease initial boot time and avoid localedef being killed by the OOM
> +# killer which used to effectively break i18n on machines with < 128MB RAM.
> +
> +# default to disabled 
> +ENABLE_BINARY_LOCALE_GENERATION ?= "0"
> +ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-nativesdk = "0"
> +
> +#enable locale generation on these arches
> +# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
> +
> +# set "1" to use cross-localedef for locale generation
> +# set "0" for qemu emulation of native localedef for locale generation
> +LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
> +
> +# Set this to zero if you don't want ldconfig in the output package
> +USE_LDCONFIG ?= "1"
> +
> +PKGSUFFIX = ""
> +PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
> +
> +PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} ${PN}-utils ${PN}-pic eglibc-doc eglibc-locale libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db eglibc-pcprofile ${PN}-dev ${PN}-static"
> +
> +PACKAGES_DYNAMIC = " \
> +		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* \
> +		    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
> +		    locale-base-*"
> +
> +RPROVIDES_eglibc = "glibc"
> +RPROVIDES_eglibc-utils = "glibc-utils"
> +RPROVIDES_eglibc-pic = "glibc-pic"
> +RPROVIDES_eglibc-dev = "glibc-dev"
> +RPROVIDES_eglibc-doc = "glibc-doc"
> +RPROVIDES_eglibc-locale = "glibc-locale"
> +RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
> +RPROVIDES_eglibc-thread-db = "glibc-thread-db"
> +RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
> +RPROVIDES_eglibc-dbg = "glibc-dbg"
> +libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base
>  _libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
> +
> +FILES_${PN} = "${sysconfdir} ${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> +FILES_ldd${PKGSUFFIX} = "${bindir}/ldd"
> +FILES_libsegfault${PKGSUFFIX} = "${base_libdir}/libSegFault*"
> +FILES_libcidn = "${base_libdir}/libcidn*.so"
> +FILES_libmemusage = "${base_libdir}/libmemusage.so"
> +FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
> +FILES_sln = "/sbin/sln"
> +FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
> +FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
> +	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> +FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
> +FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
> +FILES_eglibc-gconv = "${libdir}/gconv/*"
> +FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/gconv/.debug"
> +FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
> +RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
> +FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
> +FILES_eglibc-thread-db = "${base_libdir}/libthread_db*"
> +FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
> +RPROVIDES_eglibc-dev += "libc-dev"
> +
> +SUMMARY_sln = "The static ln."
> +DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
> +SUMMARY_nscd = "Name service cache daemon"
> +DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups for the passwd, group and hosts information.  It can damatically improvide performance with remote, such as NIS or NIS+, name services."
> +SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
> +DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
> +SUMMARY_ldd = "print shared library dependencies"
> +DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
> +DESCRIPTION_localedef = "eglibc: compile locale definition files"
> +SUMMARY_eglibc-utils = "Miscellaneous utilities provided by eglibc"
> +DESCRIPTION_eglibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
> +
> +inherit libc-package
> +
> diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
> index 05fcb11..3f4ad83 100644
> --- a/recipes/eglibc/eglibc.inc
> +++ b/recipes/eglibc/eglibc.inc
> @@ -12,6 +12,10 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
>  #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>  PROVIDES += "virtual/libintl virtual/libiconv"
> +PACKAGES_DYNAMIC = "libc6*"
> +RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
> +PROVIDES_${PN}-dbg = "glibc-dbg"
> +
>  inherit autotools
>  
>  LEAD_SONAME = "libc.so"
> @@ -25,4 +29,15 @@ ARM_INSTRUCTION_SET = "arm"
>  EXTRA_OEMAKE := "PARALLELMFLAGS="${PARALLEL_MAKE}""
>  PARALLEL_MAKE = ""
>  
> -PACKAGES_DYNAMIC = "libc6*"
> +EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
> +
> +do_unpack_append() {
> +	bb.build.exec_func('do_move_ports', d)
> +}
> +
> +do_move_ports() {
> +        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
> +	    rm -rf ${S}/ports
> +	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
> +	fi
> +}
> diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
> index 1eab7eb..d986704 100644
> --- a/recipes/eglibc/eglibc_2.10.bb
> +++ b/recipes/eglibc/eglibc_2.10.bb
> @@ -51,19 +51,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --without-selinux \
>                  ${GLIBC_EXTRA_OECONF}"
>  
> -EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
> -
> -do_unpack_append() {
> -	bb.build.exec_func('do_move_ports', d)
> -}
> -
> -do_move_ports() {
> -        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
> -	    rm -rf ${S}/ports
> -	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
> -	fi
> -}
> -
>  do_configure () {
>  # override this function to avoid the autoconf/automake/aclocal/autoheader
>  # calls for now
> @@ -95,4 +82,4 @@ do_compile () {
>  	)
>  }
>  
> -require eglibc-package.bbclass
> +require eglibc-package.inc
> diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
> index b249f29..1a22ccc 100644
> --- a/recipes/eglibc/eglibc_2.11.bb
> +++ b/recipes/eglibc/eglibc_2.11.bb
> @@ -51,19 +51,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --without-selinux \
>                  ${GLIBC_EXTRA_OECONF}"
>  
> -EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
> -
> -do_unpack_append() {
> -	bb.build.exec_func('do_move_ports', d)
> -}
> -
> -do_move_ports() {
> -        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
> -	    rm -rf ${S}/ports
> -	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
> -	fi
> -}
> -
>  do_configure () {
>  # override this function to avoid the autoconf/automake/aclocal/autoheader
>  # calls for now
> @@ -95,4 +82,4 @@ do_compile () {
>  	)
>  }
>  
> -require eglibc-package.bbclass
> +require eglibc-package.inc
> diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
> index 1285568..b72f14f 100644
> --- a/recipes/eglibc/eglibc_2.12.bb
> +++ b/recipes/eglibc/eglibc_2.12.bb
> @@ -21,7 +21,11 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
>  S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  
> -# the -isystem in bitbake.conf screws up glibc do_stage
> +PACKAGES_DYNAMIC = "libc6*"
> +RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
> +PROVIDES_${PN}-dbg = "glibc-dbg"
> +
> +# the -isystem in bitbake.conf screws up eglibc sysroot
>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
>  TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
>  
> @@ -53,19 +57,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --without-selinux \
>                  ${GLIBC_EXTRA_OECONF}"
>  
> -EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
> -
> -do_unpack_append() {
> -	bb.build.exec_func('do_move_ports', d)
> -}
> -
> -do_move_ports() {
> -        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
> -	    rm -rf ${S}/ports
> -	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
> -	fi
> -}
> -
>  do_configure () {
>  # override this function to avoid the autoconf/automake/aclocal/autoheader
>  # calls for now
> @@ -98,4 +89,4 @@ do_compile () {
>  	)
>  }
>  
> -require eglibc-package.bbclass
> +require eglibc-package.inc
> diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
> index c06345e..be60ba7 100644
> --- a/recipes/eglibc/eglibc_2.9.bb
> +++ b/recipes/eglibc/eglibc_2.9.bb
> @@ -51,19 +51,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --without-selinux \
>                  ${GLIBC_EXTRA_OECONF}"
>  
> -EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
> -
> -do_unpack_append() {
> -	bb.build.exec_func('do_move_ports', d)
> -}
> -
> -do_move_ports() {
> -        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
> -	    rm -rf ${S}/ports
> -	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
> -	fi
> -}
> -
>  do_configure () {
>  # override this function to avoid the autoconf/automake/aclocal/autoheader
>  # calls for now
> @@ -95,4 +82,4 @@ do_compile () {
>  	)
>  }
>  
> -require eglibc-package.bbclass
> +require eglibc-package.inc
> diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
> index fb4d3ba..0062fff 100644
> --- a/recipes/eglibc/eglibc_svn.bb
> +++ b/recipes/eglibc/eglibc_svn.bb
> @@ -50,19 +50,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --without-selinux \
>                  ${GLIBC_EXTRA_OECONF}"
>  
> -EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
> -
> -do_unpack_append() {
> -	bb.build.exec_func('do_move_ports', d)
> -}
> -
> -do_move_ports() {
> -        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
> -	    rm -rf ${S}/ports
> -	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
> -	fi
> -}
> -
>  do_configure () {
>  # override this function to avoid the autoconf/automake/aclocal/autoheader
>  # calls for now
> @@ -94,4 +81,4 @@ do_compile () {
>  	)
>  }
>  
> -require eglibc-package.bbclass
> +require eglibc-package.inc
> diff --git a/recipes/glibc/glibc-package.inc b/recipes/glibc/glibc-package.inc
> index 8cd8564..476143b 100644
> --- a/recipes/glibc/glibc-package.inc
> +++ b/recipes/glibc/glibc-package.inc
> @@ -22,69 +22,76 @@ python __anonymous () {
>  
>  # default to disabled until qemu works for everyone
>  ENABLE_BINARY_LOCALE_GENERATION ?= "0"
> +ENABLE_BINARY_LOCALE_GENERATION_pn-glibc-nativesdk = "0"
>  
>  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.* sh3.* i[3-6]86 x86_64 powerpc"
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
> +
> +# set "1" to use cross-localedef for locale generation
> +# set "0" for qemu emulation of native localedef for locale generation
> +LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
> +
> +PKGSUFFIX = ""
> +PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
> +
> +PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} \
> +	ldd${PKGSUFFIX} localedef${PKGSUFFIX} ${PN}-utils ${PN}-doc \
> +	${PN}-locale libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
> +	${PN}-pcprofile ${PN}-dev ${PN}-static"
> +
> +PACKAGES_DYNAMIC = "glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* locale-base-* \
> +	glibc-binary-localedata-*"
> +
> +libc_baselibs = "${base_libdir}/libc* ${base_libdir}/libm* ${base_libdir}/ld* \
> +	${base_libdir}/libpthread* ${base_libdir}/libresolv* ${base_libdir}/librt* \
> +	${base_libdir}/libutil* ${base_libdir}/libnsl* ${base_libdir}/libnss_files* \
> +	${base_libdir}/libnss_compat* ${base_libdir}/libnss_dns* ${base_libdir}/libdl* \
> +	${base_libdir}/libanl* ${base_libdir}/libBrokenLocale*"
> +
> +# The problem is that if PN = "glibc", FILES_${PN} will overwrite FILES_glibc
> +# Solution: Make them both the same thing, then it doesn't matter
> +
> +glibcfiles = "${sysconfdir} ${libc_baselibs} ${base_sbindir}/ldconfig \
> +	${libexecdir}/* ${datadir}/zoneinfo"
> +glibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
> +                  ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
> +                  ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
> +glibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> +                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> +                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> +
> +FILES_glibc = "${glibcfiles}"
> +FILES_${PN} = "${glibcfiles}"
> +FILES_ldd${PKGSUFFIX} = "${bindir}/ldd"
> +FILES_libsegfault${PKGSUFFIX} = "${base_libdir}/libSegFault*"
> +FILES_glibc-extra-nss = "${base_libdir}/libnss*"
> +FILES_sln = "${base_sbindir}/sln"
> +FILES_glibc-dev = "${glibcdevfiles}"
> +FILES_${PN}-dev = "${glibcdevfiles}"
> +FILES_glibc-dbg = "${glibcdbgfiles}"
> +FILES_${PN}-dbg = "${glibcdbgfiles}"
> +FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
> +FILES_glibc-utils = "${bindir}/* ${sbindir}/*"
> +FILES_glibc-gconv = "${libdir}/gconv/*"
> +FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
> +RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
> +FILES_glibc-pcprofile = "${base_libdir}/libpcprofile.so"
> +FILES_glibc-thread-db = "${base_libdir}/libthread_db*"
> +FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
> +RPROVIDES_glibc-dev += "libc-dev"
> +
> +SUMMARY_sln = "The static ln."
> +DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
> +SUMMARY_nscd = "Name service cache daemon"
> +DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups for the passwd, group and hosts information.  It can damatically improvide performance with remote, such as NIS or NIS+, name services."
> +SUMMARY_glibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
> +DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services.
> +SUMMARY_ldd = "print shared library dependencies"
> +DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
> +DESCRIPTION_localedef = "glibc: compile locale definition files"
> +SUMMARY_glibc-utils = "Miscellaneous utilities provided by glibc"
> +DESCRIPTION_glibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
>  
> -# Set this to zero if you don't want ldconfig in the output package
> -USE_LDCONFIG ?= "1"
> -
> -inherit glibc-package
> -
> -INITSCRIPT_NAME = "nscd"
> -INITSCRIPT_PACKAGES = "nscd"
> -INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
> -inherit update-rc.d
> -
> -def get_glibc_fpu_setting(bb, d):
> -    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> -        return "--without-fp"
> -    return ""
> -
> -EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
>  EXTRA_OEMAKE += "rootsbindir=${base_sbindir}"
>  
> -OVERRIDES_prepend = "${TARGET_ARCH}-${TARGET_OS}:"
> -
> -do_install() {
> -	oe_runmake install_root=${D} install
> -	for r in ${rpcsvc}; do
> -		h=`echo $r|sed -e's,\.x$,.h,'`
> -		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
> -	done
> -	install -d ${D}${libdir}/locale
> -	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
> -	# get rid of some broken files...
> -	for i in ${GLIBC_BROKEN_LOCALES}; do
> -		grep -v $i ${WORKDIR}/SUPPORTED > ${WORKDIR}/SUPPORTED.tmp
> -		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
> -	done
> -	rm -f ${D}{sysconfdir}/rpc
> -	rm -rf ${D}${datadir}/zoneinfo
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0644 ${S}/nscd/nscd.conf ${D}${sysconfdir}/
> -	install ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
> -}
> -
> -
> -python __anonymous () {
> -    enabled = bb.data.getVar("ENABLE_BINARY_LOCALE_GENERATION", d, 1)
> -
> -    if enabled and int(enabled):
> -        import re
> -
> -        target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
> -        binary_arches = bb.data.getVar("BINARY_LOCALE_ARCHES", d, 1) or ""
> -
> -        for regexp in binary_arches.split(" "):
> -            r = re.compile(regexp)
> -
> -            if r.match(target_arch):
> -                depends = bb.data.getVar("DEPENDS", d, 1)
> -                depends = "%s qemu-native" % depends
> -                bb.data.setVar("DEPENDS", depends, d)
> -                bb.data.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile", d)
> -                break
> -}
> -
> -
> +inherit libc-package

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNByorMkyGM64RGpERAppIAJ9znltkY/2Kpdm3P4b5DlXOk5qDzgCfc7a6
9/aGmBpa/CaS1ctW82iohng=
=IwrH
-----END PGP SIGNATURE-----



