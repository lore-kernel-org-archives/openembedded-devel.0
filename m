Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U9WaM-0005WB-B1
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2013 09:05:39 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so1010149dae.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2013 23:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=T3bV+SWVEsF9YwkoThkbqhp8iHlTdsfQ9ijUYYrNPl4=;
	b=P3y+W16ghjn/QrMezNIs6SpjEb62cNjMeNvIO74I7O2IbsRCFSFs5lpjPKDmpKWJ5z
	aK8zB75dgF7LVFRtLJiC2mO+Be9EKMD6aSZgRfU6tYhZEEhR+ZiBNXtvkhP3dIf8oU/G
	pQu57c8RrpG1Zkw56Mhdkfcp3CBPlsrtjE2mULYJxSlCVHe+F9eNl/9pcbFDY5Po9bCQ
	+nrr4MLqnGLDUoGxCHmBp7PLNyUs9YftbodQ5M3u0jmh7B0iGdKZYRUzXBi7ufjq7yV3
	2hf87RnTEpZk2yJqaOpopeI3zGaFLIiH9mL0f1goagL0h3uOZoiIJfKCk1rFkCG91Zjf
	NLDA==
X-Received: by 10.66.240.67 with SMTP id vy3mr12466560pac.180.1361692149423;
	Sat, 23 Feb 2013 23:49:09 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id o5sm9306776pay.5.2013.02.23.23.49.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 23 Feb 2013 23:49:08 -0800 (PST)
Date: Sat, 23 Feb 2013 23:48:57 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130224074856.GA3154@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	"Felipe F. Tonello" <ftonello@cercacor.com>
References: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Sun, 24 Feb 2013 08:05:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/02/13 09:25), eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
> 
> This recipe provides the Qt library and QML plugins for connman.
> 
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
>  .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>  create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> 
> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> new file mode 100644
> index 0000000..6ec084d
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> @@ -0,0 +1,37 @@
> +From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> +From: "Felipe F. Tonello" <ftonello@cercacor.com>
> +Date: Mon, 7 Jan 2013 17:13:22 -0800
> +Subject: [PATCH] added flags to disable qml plugin and test program to
> + compile
> +
> +This is usefull when there is no need to compile test program and qml plugin.
> +
> +Upstream-Status: Accepted
> +
> +Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> +---
> + connman-qt.pro |   11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/connman-qt.pro b/connman-qt.pro
> +index 7d9ec99..425c41f 100644
> +--- a/connman-qt.pro
> ++++ b/connman-qt.pro
> +@@ -1,4 +1,13 @@
> + TEMPLATE = subdirs
> +-SUBDIRS += libconnman-qt test plugin
> ++SUBDIRS += libconnman-qt
> + CONFIG += ordered
> + 
> ++# CONFIG flag to disable test program
> ++!notest {
> ++    SUBDIRS += test
> ++}
> ++
> ++# CONFIG flag to disable qml plugin
> ++!noplugin {
> ++    SUBDIRS += plugin
> ++}
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> new file mode 100644
> index 0000000..2c33b49
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> @@ -0,0 +1,69 @@
> +DESCRIPTION = "Qt Library for ConnMan"
> +HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
> +
> +SECTION = "qt/lib"
> +
> +PR = "r0"
> +
> +inherit qt4x11 pkgconfig
> +
> +RDEPENDS_${PN} = "connman"
> +RDEPENDS_${PN}-plugin = "${PN}"
> +
> +PROVIDES += "${PN}-plugin"
> +
> +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
> +RRECOMMENDS_${PN} = "${PN}-plugin"
> +
> +# this is for users to bbappend this recipe and change it
> +BRANCH = "master"
> +TAG = "${PV}"
> +SRCREV = "${AUTOREV}"

Dont use AUTOREV please. I know its merged but I would suggest to send
an update for that and also avoid TAG and use concrete SRCREV

> +
> +SRC_URI = " \
> +  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
> +  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
> +# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
> +PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
> +
> +FILES_${PN} = " \
> +  ${libdir}/libconnman-qt4${SOLIBS} \
> +"
> +
> +FILES_${PN}-dev = " \
> +  ${includedir}/connman-qt/* \
> +  ${libdir}/libconnman-qt4${SOLIBSDEV} \
> +  ${libdir}/libconnman-qt4.prl \
> +  ${libdir}/pkgconfig/connman-qt4.pc \
> +  ${libdir}/connman-qt4.pc \
> +"
> +
> +FILES_${PN}-plugin = " \
> +  ${PLUGINS_TARGET}/qmldir \
> +  ${PLUGINS_TARGET}/lib*.so \
> +"
> +
> +FILES_${PN}-plugin-dbg = " \
> +  ${PLUGINS_TARGET}/.debug \
> +  ${PLUGINS_TARGET}/.debug/* \
> +"
> +
> +EXTRA_QMAKEVARS_PRE = " \
> +  CONFIG+=notest \
> +"
> +
> +do_configure_prepend() {
> +  # Hack *.pro variables
> +  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
> +}
> +
> +do_install() {
> +  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
> +}
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


