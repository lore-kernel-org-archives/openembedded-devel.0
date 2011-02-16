Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pppiz-0001nv-Go
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:19:53 +0100
Received: by qwi2 with SMTP id 2so1735990qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=mVm3DfiaVZeFpKUj5OG9W5o44EGxaZsOQWCZDhhCk/A=;
	b=ZJoNTPj/RPOhZnk58IWrq/dZ86ar+ZQUF9gYZTm2l9Nadnt0994a8E6PAQb/yrNMBu
	j9sXtzq8I/nZSnCQEFd0+jWdeLqCc0qXwrjCPwF89s5UkGgQVYoeiL0gdGMEiRNioLIq
	cPBPQMAhCs1QmqU17YxRWl4kdpxPrE7hYMPuA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=xYcNyu3XX38kGwSBW9B3mEftRkknf4M0BzA5QjolIeVxXUECZ6+JBt9B85epuU17ru
	pqUpocFKDXopEwjazc9DojGBuZ4JkQ03NyArWvdTfnFTRuBbd66RH25ePR9fCe09M+uZ
	R876kd4YYoT7JT/vy0zfq101xVtfJ7cuyEomA=
Received: by 10.224.73.197 with SMTP id r5mr1539145qaj.201.1297894720533;
	Wed, 16 Feb 2011 14:18:40 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q12sm188805qcu.6.2011.02.16.14.18.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:18:39 -0800 (PST)
Date: Wed, 16 Feb 2011 14:18:41 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216221841.GC14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Chris Larson <chris_larson@mentor.com>
References: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/4] autotools: break up into multiple files
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
X-List-Received-Date: Wed, 16 Feb 2011 22:19:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 15:07), Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> Split up most of autotools.bbclass into:
> 
> - classes/autotools/configure.inc
> - classes/autotools/bootstrap.inc
> - classes/autotools/staging.inc
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/autotools.bbclass       |  243 ++++-----------------------------------
>  classes/autotools/bootstrap.inc |   70 +++++++++++
>  classes/autotools/configure.inc |   91 +++++++++++++++
>  classes/autotools/staging.inc   |   36 ++++++
>  4 files changed, 222 insertions(+), 218 deletions(-)
>  create mode 100644 classes/autotools/bootstrap.inc
>  create mode 100644 classes/autotools/configure.inc
>  create mode 100644 classes/autotools/staging.inc
> 
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index a88a4d1..60925e9 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -1,237 +1,44 @@
> -# use autotools_stage_all for native packages
> -AUTOTOOLS_NATIVE_STAGE_INSTALL = "1"
> +require classes/autotools/staging.inc
> +require classes/autotools/bootstrap.inc
> +require classes/autotools/configure.inc
>  
>  def autotools_deps(d):
> -	if bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS', d, 1):
> -		return ''
> +    if bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS', d, 1):
> +        return ''
>  
> -	pn = bb.data.getVar('PN', d, 1)
> -	deps = ''
> +    pn = bb.data.getVar('PN', d, 1)
> +    deps = ''
>  
> -	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
> -		return deps
> -	deps += 'autoconf-native automake-native help2man-native '
> +    if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
> +        return deps
>  
> -	if pn not in ['libtool', 'libtool-native', 'libtool-cross']:
> -		deps += 'libtool-native '
> -		if (not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
> -		                          'sdk') and
> -		    not d.getVar('INHIBIT_DEFAULT_DEPS', True)):
> -			deps += 'libtool-cross '
> +    deps += 'autoconf-native automake-native help2man-native '
>  
> -	return deps + 'gnu-config-native '
> +    if pn not in ['libtool', 'libtool-native', 'libtool-cross']:
> +        deps += 'libtool-native '
> +        if (not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
> +                                  'sdk') and
> +            not d.getVar('INHIBIT_DEFAULT_DEPS', True)):
> +            deps += 'libtool-cross '
>  
> -EXTRA_OEMAKE = ""
> +    return deps + 'gnu-config-native '
>  
>  DEPENDS_prepend = "${@autotools_deps(d)}"
>  DEPENDS_virtclass-native_prepend = "${@autotools_deps(d)}"
>  DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d)}"
>  
> -inherit siteinfo
> +autotools_do_configure () {
> +    autotools_do_bootstrap
>  
> -def _autotools_get_sitefiles(d):
> -    if oe.utils.inherits(d, 'native', 'nativesdk'):
> -        return
> -
> -    sitedata = siteinfo_data(d)
> -    for path in d.getVar("BBPATH", True).split(":"):
> -        for element in sitedata:
> -            filename = os.path.join(path, "site", element)
> -            if os.path.exists(filename):
> -                yield filename
> -
> -# Space separated list of shell scripts with variables defined to supply test
> -# results for autoconf tests we cannot run at build time.
> -export CONFIG_SITE = "${@' '.join(_autotools_get_sitefiles(d))}"
> -
> -acpaths = "default"
> -EXTRA_AUTORECONF = "--exclude=autopoint"
> -
> -def autotools_set_crosscompiling(d):
> -	if not bb.data.inherits_class('native', d):
> -		return " cross_compiling=yes"
> -	return ""
> -
> -def append_libtool_sysroot(d):
> -	if bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes":
> -		if bb.data.getVar('BUILD_SYS', d, 1) == bb.data.getVar('HOST_SYS', d, 1):
> -			return '--with-libtool-sysroot'
> -		else:
> -			return '--with-libtool-sysroot=${STAGING_DIR_HOST}'
> -	return ''
> -
> -def distro_imposed_configure_flags(d):
> -	distro_features = bb.data.getVar('DISTRO_FEATURES', d, True) or ""
> -	distro_features = distro_features.split()
> -	flags = set()
> -	features = (('largefile', 'largefile'),
> -		('ipv6'     , 'ipv6'),
> -		('nls'      , 'nls'))
> -
> -	for knob, cfgargs in features:
> -		if isinstance(cfgargs, basestring):
> -			cfgargs = [cfgargs]
> -		en_or_dis = knob in distro_features and "enable" or "disable"
> -		for flg in cfgargs:
> -			flags.add("--%s-%s" % (en_or_dis, flg))
> -	return " ".join(flags)
> -
> -# EXTRA_OECONF_append = "${@autotools_set_crosscompiling(d)}"
> -
> -CONFIGUREOPTS = " --build=${BUILD_SYS} \
> -		  --host=${HOST_SYS} \
> -		  --target=${TARGET_SYS} \
> -		  --prefix=${prefix} \
> -		  --exec_prefix=${exec_prefix} \
> -		  --bindir=${bindir} \
> -		  --sbindir=${sbindir} \
> -		  --libexecdir=${libexecdir} \
> -		  --datadir=${datadir} \
> -		  --sysconfdir=${sysconfdir} \
> -		  --sharedstatedir=${sharedstatedir} \
> -		  --localstatedir=${localstatedir} \
> -		  --libdir=${libdir} \
> -		  --includedir=${includedir} \
> -		  --oldincludedir=${oldincludedir} \
> -		  --infodir=${infodir} \
> -		  --mandir=${mandir} \
> -		  ${@append_libtool_sysroot(d)} \
> -		  ${@distro_imposed_configure_flags(d)} \
> -		"
> -
> -oe_runconf () {
> -	if [ -x ${S}/configure ] ; then
> -		${S}/configure \
> -		${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
> -	else
> -		oefatal "no configure script found"
> -	fi
> -}
> -
> -oe_autoreconf () {
> -	if [ x"${acpaths}" = xdefault ]; then
> -		acpaths=
> -		for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
> -			grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
> -			acpaths="$acpaths -I $i"
> -		done
> -	else
> -		acpaths="${acpaths}"
> -	fi
> -	AUTOV=`automake --version | head -n 1 | sed "s/.* //;s/\.[0-9]\+$//"`
> -	install -d ${STAGING_DATADIR}/aclocal
> -	install -d ${STAGING_DATADIR}/aclocal-$AUTOV
> -	acpaths="$acpaths -I${STAGING_DATADIR}/aclocal-$AUTOV -I ${STAGING_DATADIR}/aclocal"
> -	# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
> -	# like it was auto-generated.  Work around this by blowing it away
> -	# by hand, unless the package specifically asked not to run aclocal.
> -	if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
> -		rm -f aclocal.m4
> -	fi
> -	if [ -e configure.in ]; then
> -		CONFIGURE_AC=configure.in
> -	else
> -		CONFIGURE_AC=configure.ac
> -	fi
> -	if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
> -		if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
> -			: do nothing -- we still have an old unmodified configure.ac
> -		else
> -			echo "no" | glib-gettextize --force
> -		fi
> -	else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
> -		if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
> -			ln -sf ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> -		else
> -			oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
> -		fi
> -	fi
> -
> -	fi
> -	for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
> -		mkdir -p ${aux}
> -	done
> -	autoreconf -Wcross --verbose --install --symlink --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
> -	if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
> -		intltoolize --force --automake
> -	fi
> -}
> -
> -autotools_do_configure() {
> -	case ${PN} in
> -	autoconf*|automake*)
> -	;;
> -	*)
> -		find ${S} -name configure.in -o -name configure.ac | \
> -			while read fn; do
> -				rm -f `dirname $fn`/configure
> -			done
> -		if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
> -			olddir=`pwd`
> -			cd ${S}
> -			oe_autoreconf
> -			cd $olddir
> -		fi
> -	;;
> -	esac
> -	if [ -e ${S}/configure ]; then
> -		oe_runconf $@
> -	else
> -		oenote "nothing to configure"
> -	fi
> +    if [ -e ${S}/configure ]; then
> +        oe_runconf $@
> +    else
> +        oenote "nothing to configure"
> +    fi
>  }
>  
>  autotools_do_install() {
> -	oe_runmake 'DESTDIR=${D}' install
> -}
> -
> -PACKAGE_PREPROCESS_FUNCS += "${@['autotools_prepackage_lamangler',''][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]}"
> -autotools_prepackage_lamangler () {
> -        for i in `find ${PKGD} -name "*.la"` ; do \
> -            sed -i -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
> -                   -e 's:${D}::g;' \
> -                   -e 's:-I${WORKDIR}\S*: :g;' \
> -                   -e 's:-L${WORKDIR}\S*: :g;' \
> -                   $i
> -	done
> -}
> -
> -# STAGE_TEMP_PREFIX is used for a speedup by packaged-staging
> -STAGE_TEMP="${WORKDIR}/temp-staging"
> -STAGE_TEMP_PREFIX = ""
> -
> -autotools_stage_includes() {
> -	if [ "${INHIBIT_AUTO_STAGE_INCLUDES}" != "1" ]
> -	then
> -		rm -rf ${STAGE_TEMP}
> -		mkdir -p ${STAGE_TEMP}
> -		make DESTDIR="${STAGE_TEMP}" install
> -		cp -pPR ${STAGE_TEMP}/${includedir}/* ${STAGING_INCDIR}
> -		rm -rf ${STAGE_TEMP}
> -	fi
> -}
> -
> -autotools_stage_dir() {
> - 	sysroot_stage_dir $1 ${STAGE_TEMP_PREFIX}$2
> -}
> -
> -autotools_stage_libdir() {
> -	sysroot_stage_libdir $1 ${STAGE_TEMP_PREFIX}$2
> -}
> -
> -autotools_stage_all() {
> -	if [ "${INHIBIT_AUTO_STAGE}" = "1" ]
> -	then
> -		return
> -	fi
> -	rm -rf ${STAGE_TEMP}
> -	mkdir -p ${STAGE_TEMP}
> -	oe_runmake DESTDIR="${STAGE_TEMP}" install
> -	rm -rf ${STAGE_TEMP}/${mandir} || true
> -	rm -rf ${STAGE_TEMP}/${infodir} || true
> -	sysroot_stage_dirs ${STAGE_TEMP} ${STAGE_TEMP_PREFIX}
> -	rm -rf ${STAGE_TEMP}
> +    oe_runmake 'DESTDIR=${D}' install
>  }
>  
>  EXPORT_FUNCTIONS do_configure do_install
> -
> diff --git a/classes/autotools/bootstrap.inc b/classes/autotools/bootstrap.inc
> new file mode 100644
> index 0000000..4e71568
> --- /dev/null
> +++ b/classes/autotools/bootstrap.inc
> @@ -0,0 +1,70 @@
> +acpaths = "default"
> +EXTRA_AUTORECONF = "--exclude=autopoint"
> +
> +oe_autoreconf () {
> +    if [ x"${acpaths}" = xdefault ]; then
> +        acpaths=
> +        for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
> +            grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
> +            acpaths="$acpaths -I $i"
> +        done
> +    else
> +        acpaths="${acpaths}"
> +    fi
> +    AUTOV=`automake --version | head -n 1 | sed "s/.* //;s/\.[0-9]\+$//"`
> +    install -d ${STAGING_DATADIR}/aclocal
> +    install -d ${STAGING_DATADIR}/aclocal-$AUTOV
> +    acpaths="$acpaths -I${STAGING_DATADIR}/aclocal-$AUTOV -I ${STAGING_DATADIR}/aclocal"
> +    # autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
> +    # like it was auto-generated.  Work around this by blowing it away
> +    # by hand, unless the package specifically asked not to run aclocal.
> +    if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
> +        rm -f aclocal.m4
> +    fi
> +    if [ -e configure.in ]; then
> +        CONFIGURE_AC=configure.in
> +    else
> +        CONFIGURE_AC=configure.ac
> +    fi
> +    if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
> +        if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
> +            : do nothing -- we still have an old unmodified configure.ac
> +        else
> +            echo "no" | glib-gettextize --force
> +        fi
> +    else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
> +        if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
> +            ln -sf ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> +        else
> +            oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
> +        fi
> +    fi
> +
> +    fi
> +    for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
> +        mkdir -p ${aux}
> +    done
> +    autoreconf -Wcross --verbose --install --symlink --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
> +    if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
> +        intltoolize --force --automake
> +    fi
> +}
> +
> +autotools_do_bootstrap() {
> +    case ${PN} in
> +    autoconf*|automake*)
> +        ;;
> +    *)
> +        find ${S} -name configure.in -o -name configure.ac | \
> +            while read fn; do
> +                rm -f `dirname $fn`/configure
> +            done
> +        if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
> +            olddir=`pwd`
> +            cd ${S}
> +            oe_autoreconf
> +            cd $olddir
> +        fi
> +        ;;
> +    esac
> +}
> diff --git a/classes/autotools/configure.inc b/classes/autotools/configure.inc
> new file mode 100644
> index 0000000..02cd918
> --- /dev/null
> +++ b/classes/autotools/configure.inc
> @@ -0,0 +1,91 @@
> +# use autotools_stage_all for native packages
> +AUTOTOOLS_NATIVE_STAGE_INSTALL = "1"
> +
> +EXTRA_OEMAKE = ""
> +
> +inherit siteinfo
> +
> +def _autotools_get_sitefiles(d):
> +    if oe.utils.inherits(d, 'native', 'nativesdk'):
> +        return
> +
> +    sitedata = siteinfo_data(d)
> +    for path in d.getVar("BBPATH", True).split(":"):
> +        for element in sitedata:
> +            filename = os.path.join(path, "site", element)
> +            if os.path.exists(filename):
> +                yield filename
> +
> +# Space separated list of shell scripts with variables defined to supply test
> +# results for autoconf tests we cannot run at build time.
> +export CONFIG_SITE = "${@' '.join(_autotools_get_sitefiles(d))}"
> +
> +def autotools_set_crosscompiling(d):
> +    if not bb.data.inherits_class('native', d):
> +        return " cross_compiling=yes"
> +    return ""
> +
> +def append_libtool_sysroot(d):
> +    if bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes":
> +        if bb.data.getVar('BUILD_SYS', d, 1) == bb.data.getVar('HOST_SYS', d, 1):
> +            return '--with-libtool-sysroot'
> +        else:
> +            return '--with-libtool-sysroot=${STAGING_DIR_HOST}'
> +    return ''
> +
> +def distro_imposed_configure_flags(d):
> +    distro_features = bb.data.getVar('DISTRO_FEATURES', d, True) or ""
> +    distro_features = distro_features.split()
> +    flags = set()
> +    features = (('largefile', 'largefile'),
> +        ('ipv6'     , 'ipv6'),
> +        ('nls'      , 'nls'))
> +
> +    for knob, cfgargs in features:
> +        if isinstance(cfgargs, basestring):
> +            cfgargs = [cfgargs]
> +        en_or_dis = knob in distro_features and "enable" or "disable"
> +        for flg in cfgargs:
> +            flags.add("--%s-%s" % (en_or_dis, flg))
> +    return " ".join(flags)
> +
> +CONFIGUREOPTS = " --build=${BUILD_SYS} \
> +          --host=${HOST_SYS} \
> +          --target=${TARGET_SYS} \
> +          --prefix=${prefix} \
> +          --exec_prefix=${exec_prefix} \
> +          --bindir=${bindir} \
> +          --sbindir=${sbindir} \
> +          --libexecdir=${libexecdir} \
> +          --datadir=${datadir} \
> +          --sysconfdir=${sysconfdir} \
> +          --sharedstatedir=${sharedstatedir} \
> +          --localstatedir=${localstatedir} \
> +          --libdir=${libdir} \
> +          --includedir=${includedir} \
> +          --oldincludedir=${oldincludedir} \
> +          --infodir=${infodir} \
> +          --mandir=${mandir} \
> +          ${@append_libtool_sysroot(d)} \
> +          ${@distro_imposed_configure_flags(d)} \
> +        "
> +
> +oe_runconf () {
> +    if [ -x ${S}/configure ] ; then
> +        ${S}/configure \
> +        ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
> +    else
> +        oefatal "no configure script found"
> +    fi
> +}
> +
> +PACKAGE_PREPROCESS_FUNCS += "${@['autotools_prepackage_lamangler',''][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]}"
> +autotools_prepackage_lamangler () {
> +        for i in `find ${PKGD} -name "*.la"` ; do \
> +            sed -i -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
> +                   -e 's:${D}::g;' \
> +                   -e 's:-I${WORKDIR}\S*: :g;' \
> +                   -e 's:-L${WORKDIR}\S*: :g;' \
> +                   $i
> +    done
> +}
> diff --git a/classes/autotools/staging.inc b/classes/autotools/staging.inc
> new file mode 100644
> index 0000000..b91f4a6
> --- /dev/null
> +++ b/classes/autotools/staging.inc
> @@ -0,0 +1,36 @@
> +# STAGE_TEMP_PREFIX is used for a speedup by packaged-staging
> +STAGE_TEMP="${WORKDIR}/temp-staging"
> +STAGE_TEMP_PREFIX = ""
> +
> +autotools_stage_includes() {
> +    if [ "${INHIBIT_AUTO_STAGE_INCLUDES}" != "1" ]
> +    then
> +        rm -rf ${STAGE_TEMP}
> +        mkdir -p ${STAGE_TEMP}
> +        make DESTDIR="${STAGE_TEMP}" install
> +        cp -pPR ${STAGE_TEMP}/${includedir}/* ${STAGING_INCDIR}
> +        rm -rf ${STAGE_TEMP}
> +    fi
> +}
> +
> +autotools_stage_dir() {
> +    sysroot_stage_dir $1 ${STAGE_TEMP_PREFIX}$2
> +}
> +
> +autotools_stage_libdir() {
> +    sysroot_stage_libdir $1 ${STAGE_TEMP_PREFIX}$2
> +}
> +
> +autotools_stage_all() {
> +    if [ "${INHIBIT_AUTO_STAGE}" = "1" ]
> +    then
> +        return
> +    fi
> +    rm -rf ${STAGE_TEMP}
> +    mkdir -p ${STAGE_TEMP}
> +    oe_runmake DESTDIR="${STAGE_TEMP}" install
> +    rm -rf ${STAGE_TEMP}/${mandir} || true
> +    rm -rf ${STAGE_TEMP}/${infodir} || true
> +    sysroot_stage_dirs ${STAGE_TEMP} ${STAGE_TEMP_PREFIX}
> +    rm -rf ${STAGE_TEMP}
> +}
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


