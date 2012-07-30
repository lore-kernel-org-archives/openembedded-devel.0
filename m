Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Svqcr-0004Wu-OS
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 16:07:13 +0200
Received: by ghbz2 with SMTP id z2so4298853ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fze4USTmHI0ctgToR8oACE12Bav2Yfn/lasfuCLYSY4=;
	b=KdgGV+C8PiNOk68xDJ38UQldfXAvDXIXMKCEfstc28+fxl8qy8q6pgOxka3VJskqXm
	xdX5Bq3gxDN23tiC22g3wCIqxhT73UxzExg0S0UIKYUjB6L+TziPBMxdAlgz5nO0YtfQ
	WA7OrH5XcwZKnG0nbKkLuAiLBftR92GQqzp01OYaWOebvaDyaSlfXof9lnUk4ma11q5+
	dGT9DiiRNASwHGbIwc2PMpR1pUCCzmVy5umieKxsetQt+CYDZwodVyk1C4E+cGCGsHDu
	EyLpMxahPW32zhYQp2dpr/2evh+QQYO3TuVK3mMKYeCWEMU1IXOUMAwW1KW+1eD2HQCA
	qlAg==
MIME-Version: 1.0
Received: by 10.50.191.227 with SMTP id hb3mr303616igc.45.1343656537243; Mon,
	30 Jul 2012 06:55:37 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 30 Jul 2012 06:55:37 -0700 (PDT)
In-Reply-To: <20120722104353.A204B1032B@opal>
References: <20120722104353.A204B1032B@opal>
Date: Mon, 30 Jul 2012 15:55:37 +0200
Message-ID: <CALbNGRTJjTZZG=ysG3m+gnv0YqfaBhUEZkLF5WUJxg7-hSLGDg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python-native: Put binaries in seperate directory
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
X-List-Received-Date: Mon, 30 Jul 2012 14:07:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 22, 2012 at 12:43 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: a2e554f731437545e9483a7a73e6847c03f6f48a
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a2e554f731437545e9483a7a73e6847c03f6f48a
>
> Author: Morgan Little <morgan.little@windriver.com>
> Date:   Thu Jul 19 13:46:06 2012 -0400
>
> python-native: Put binaries in seperate directory
>
> Update python-native to install the binaries in the python-native directory,
> add pythonnative.bbclass to let recipes that need python-native use the
> binaries and update disutils access the new binaries. Update distutils-base
> to inherit pythonnative.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
>  meta/classes/distutils-base.bbclass                |    2 +-
>  meta/classes/distutils.bbclass                     |    8 ++++----
>  meta/classes/pythonnative.bbclass                  |    3 +++
>  .../recipes-devtools/python/python-native_2.7.3.bb |   10 ++++++----
>  4 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
> index 6d18e08..c761b36 100644
> --- a/meta/classes/distutils-base.bbclass
> +++ b/meta/classes/distutils-base.bbclass
> @@ -1,5 +1,5 @@
>  DEPENDS  += "${@["python-native python", ""][(d.getVar('PACKAGES', True) == '')]}"
>  RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
>
> -inherit distutils-common-base
> +inherit distutils-common-base pythonnative
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index bcddf8d..690df73 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -11,14 +11,14 @@ distutils_do_compile() {
>           STAGING_INCDIR=${STAGING_INCDIR} \
>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>           BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
> +         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
>           bbfatal "python setup.py build_ext execution failed."
>  }
>
>  distutils_stage_headers() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>          bbfatal "python setup.py install_headers execution failed."
>  }
>
> @@ -28,7 +28,7 @@ distutils_stage_all() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>          bbfatal "python setup.py install (stage) execution failed."
>  }
>
> @@ -38,7 +38,7 @@ distutils_do_install() {
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal "python setup.py install execution failed."
>
>          for i in `find ${D} -name "*.py"` ; do \
> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
> new file mode 100644
> index 0000000..bc346da
> --- /dev/null
> +++ b/meta/classes/pythonnative.bbclass
> @@ -0,0 +1,3 @@
> +PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
> +PATH_prepend = "${STAGING_BINDIR_NATIVE}/python-native:"
> +DEPENDS += " python-native "
> diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
> index 50bf894..bfdcd12 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>  SRC_URI += "file://04-default-is-optimized.patch \
>             file://05-enable-ctypes-cross-build.patch \
> @@ -20,6 +20,8 @@ inherit native
>
>  RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-core-native"
>
> +EXTRA_OECONF += " --bindir=${bindir}/${PN}"
> +
>  EXTRA_OEMAKE = '\
>    BUILD_SYS="" \
>    HOST_SYS="" \
> @@ -34,11 +36,11 @@ do_configure_prepend() {
>
>  do_install() {
>         oe_runmake 'DESTDIR=${D}' install
> -       install -d ${D}${bindir}/
> -       install -m 0755 Parser/pgen ${D}${bindir}/
> +       install -d ${D}${bindir}/${PN}
> +       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
>
>         # Make sure we use /usr/bin/env python
> -       for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
> +       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
>                 sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
>         done
>  }
>
>
Could somebody enlighten me please: What is the benefit in moving
python-native into a subdirectory and causing tons of recipe changes?
The commit message does not help me much.
To me it is just another build breaker after gobject-introspection &
gtk-doc. Please tell me how many further weeks we have to suffer for
innovations like this so I can come back then.

Andreas

Andreas


