Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id A6C9D6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 20:03:16 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id h16so32048018vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 13:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WBXLXS6bmWmoErlKCIaRKU2rnrP8NQT3ICjelr3UonY=;
	b=eNL3abvYEdo4wmUXl0dM7ruSkZMIJletB4m+Xsr0idaCAxlGuQj8I6hSBpj0aUsaUe
	aOHRO4IVX3JuXEIhwWSSEPSR0wMmlntCqVn/UEgftUrJvwaesdaKvkPK0Vx5ubrmP/yS
	x2OocreYAn7XgoWBOJsSu2AwauSVpjdRbhG6cwZ6KDhZgbX4RHvMOJcYHPhiasDF6+Iz
	2o1JNeIeF2ufri71jC3wgUg4KCb/ag9B8nu/IXVrNYAA7t6Hdh4jyp6EAuy91H9e2C+7
	joL0+qSkKoHlx5VAYk/4SQZNcCMcvQnTqq2/K2ECwIPvQMaPGyj47Hreu3GJbouExJDq
	MOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WBXLXS6bmWmoErlKCIaRKU2rnrP8NQT3ICjelr3UonY=;
	b=TKnwmE72bvDj9UMHFqoHq5/aLCpIf4te09f1aEccywbXnp9g6LeRcdz997UHAn5uVW
	KcK+nTe3LLgthDQ85ZhTU029fcdp4/gHoHxizwOuGzMKVlpKpEfORhrBj1y0a7AOhUD/
	e6SPcv2gwh/SheCo4evMbRwryd4f1cHE07wuCqQ6TfaCgJ3sHeDhvqDWIK4sY1ovv5El
	D4aaVZwtWojXFtku93Q4Is9iv+TuR6eiyJlFia+t3wEYB74IaWRO/Xfyy8FrzhV6rS6V
	vPIiit47q4lVw5no5vlISMEY5L7c5OuGXFT8kYNOnJcYjOIV8fygQLsOaemfEVjgwiYo
	m3BQ==
X-Gm-Message-State: AODbwcBbAVzZtJpHagVL1mMrN+OestiDO7MgGeuNEwenh7o3mfKkAI0F
	ICEiq71fMWrQUCWJDLVJKEcOquO+Ua4u
X-Received: by 10.31.14.1 with SMTP id 1mr4921449vko.140.1494705797030; Sat,
	13 May 2017 13:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.74.16 with HTTP; Sat, 13 May 2017 13:03:16 -0700 (PDT)
In-Reply-To: <1494703489-23588-2-git-send-email-philip@balister.org>
References: <1494703489-23588-1-git-send-email-philip@balister.org>
	<1494703489-23588-2-git-send-email-philip@balister.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sat, 13 May 2017 22:03:16 +0200
Message-ID: <CALbNGRRz-K4SG41qKRVbwYaFDP83c3Y8qc55K6uQhxxg0fXL=w@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] python-pyqt5: Add recipe.
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
X-List-Received-Date: Sat, 13 May 2017 20:03:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 13, 2017 at 9:24 PM, Philip Balister <philip@balister.org> wrote:
>  * Build tested on raspberrypi3
>  * I promise to chase the patch upstream.
>
> Signed-off-by: Philip Balister <philip@balister.org>
Hi Philip,

I played around with this too - but did not finish and am happy to you
put some progress on it.
> ---
>  recipes-python/pyqt5/files/fix-sm.patch    | 17 ++++++++
>  recipes-python/pyqt5/python-pyqt5_5.8.2.bb | 68 ++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 recipes-python/pyqt5/files/fix-sm.patch
>  create mode 100644 recipes-python/pyqt5/python-pyqt5_5.8.2.bb
>
> diff --git a/recipes-python/pyqt5/files/fix-sm.patch b/recipes-python/pyqt5/files/fix-sm.patch
> new file mode 100644
> index 0000000..f2936a2
> --- /dev/null
> +++ b/recipes-python/pyqt5/files/fix-sm.patch
> @@ -0,0 +1,17 @@
> +--- PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip.orig 2017-05-13 13:28:42.523392315 -0400
> ++++ PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip      2017-05-13 13:30:08.081207211 -0400
> +@@ -270,12 +270,14 @@
> + %End
> +
> + public:
> ++%If (PyQt_SessionManager)
> + %If (Qt_5_6_0 -)
> +     static bool isFallbackSessionManagementEnabled();
> + %End
> + %If (Qt_5_6_0 -)
> +     static void setFallbackSessionManagementEnabled(bool);
> + %End
> ++%End
> +
> + signals:
> + %If (Qt_5_6_0 -)
> diff --git a/recipes-python/pyqt5/python-pyqt5_5.8.2.bb b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
> new file mode 100644
> index 0000000..b4c0a8d
> --- /dev/null
> +++ b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
> @@ -0,0 +1,68 @@
> +SUMMARY = "Python Qt5 Bindings"
> +AUTHOR = "Phil Thomson @ riverbank.co.uk"
> +HOMEPAGE = "http://riverbankcomputing.co.uk"
> +SECTION = "devel/python"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "\
> +    file://LICENSE;md5=d32239bcb673463ab874e80d47fae504 \
> +"
> +DEPENDS = "sip sip-native qtbase python"
> +
> +SRC_URI = "\
> +    ${SOURCEFORGE_MIRROR}/pyqt/PyQt5_gpl-${PV}.tar.gz \
> +    file://fix-sm.patch \
> +"
> +SRC_URI[md5sum] = "c3048e9d242f3e72fd393630da1d971a"
> +SRC_URI[sha256sum] = "ebd70515b30bbd6098fee29e6271a6696b1183c5530ee30e6ba9aaab195536e8"
> +
> +S = "${WORKDIR}/PyQt5_gpl-${PV}"
> +
> +
> +inherit qmake5 pythonnative python-dir distro_features_check
> +# depends on qt4-x11-free
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
> +DISABLED_FEATURES = "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_SessionManager"
> +
> +DISABLED_FEATURES_append_arm = " PyQt_qreal_double"
> +
> +PYQT_MODULES = "QtCore QtGui QtNetwork"
> +PYQT_MODULES_aarch64 = "QtCore QtGui QtNetwork"
> +
> +do_configure_prepend() {
> +    cd ${S}
> +    echo "py_platform = linux" > pyqt.cfg
> +    echo "py_inc_dir = %(sysroot)/$includedir/python%(py_major).%(py_minor)" >> pyqt.cfg
> +    echo "py_pylib_dir = %(sysroot)/${libdir}/python%(py_major).%(py_minor)" >> pyqt.cfg
> +    echo "py_pylib_lib = python%(py_major).%(py_minor)mu" >> pyqt.cfg
> +    echo "pyqt_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> pyqt.cfg
> +    echo "pyqt_bin_dir = ${D}/${bindir}" >> pyqt.cfg
> +    echo "pyqt_sip_dir = ${D}/${datadir}/sip/PyQt5" >> pyqt.cfg
> +    echo "pyuic_interpreter = ${D}/${bindir}/python%(py_major).%(py_minor)" >> pyqt.cfg
> +    echo "pyqt_disabled_features = ${DISABLED_FEATURES}" >> pyqt.cfg
> +    echo "qt_shared = True" >> pyqt.cfg
> +    echo "[Qt 5.7]" >> pyqt.cfg
^ How about
    QT_VERSION=`${OE_QMAKE_QMAKE} -query QT_VERSION`
    echo "[Qt $QT_VERSION]" >> pyqt.cfg
That worked for me
> +    echo "pyqt_modules = ${PYQT_MODULES}" >> pyqt.cfg
> +    echo yes | python configure.py --verbose --qmake  ${STAGING_BINDIR_NATIVE}/qt5/qmake --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
> +}
> +
> +do_compile() {
> +    cd ${S}
> +    oe_runmake
> +}
> +
> +do_install() {
> +    cd ${S}
> +    oe_runmake install
> +}
> +
> +RDEPENDS_${PN} = "python-core python-sip"
^ I don't know your use case but do you think there is a chance to
support python3?
> +
> +FILES_${PN} += "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/PyQt5/"
> +FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*/.debug/"
> +
> --
> 2.7.4
>
Best regards

Andreas

