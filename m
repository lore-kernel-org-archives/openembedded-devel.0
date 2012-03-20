Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SA7yc-00034Y-QV
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 23:56:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2012 15:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119752732"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2012 15:47:26 -0700
Message-ID: <4F6908FE.8020608@linux.intel.com>
Date: Tue, 20 Mar 2012 15:47:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F5F7E1F.4000901@linux.intel.com>
	<1331913369-31149-1-git-send-email-cheepeero@gmx.net>
In-Reply-To: <1331913369-31149-1-git-send-email-cheepeero@gmx.net>
Subject: Re: [oe-core][PATCH v2] qt-mobility: fix build in the absence of opengl
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
X-List-Received-Date: Tue, 20 Mar 2012 22:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 08:56 AM, Ciprian Ciubotariu wrote:
> QMake pro files don't explicitly define QT_NO_OPENGL if the
> configuration lacks opengl, but example code relies on this define.
> ---
>   .../qt4/files/qt-mobility-no-opengl.patch          |   36 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    5 ++-
>   2 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch
>
> diff --git a/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch b/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch
> new file mode 100644
> index 0000000..aa15683
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch
> @@ -0,0 +1,36 @@
> +diff --git a/examples/declarative-camera/declarative-camera.pro b/examples/declarative-camera/declarative-camera.pro
> +index 8164fbc..54fd8ad 100644
> +--- a/examples/declarative-camera/declarative-camera.pro
> ++++ b/examples/declarative-camera/declarative-camera.pro
> +@@ -5,10 +5,10 @@ TEMPLATE=app
> +
> + QT += declarative network
> +
> +-!maemo5 {
> +-    contains(QT_CONFIG, opengl) {
> +-        QT += opengl
> +-    }
> ++contains(QT_CONFIG, opengl): !maemo5 {
> ++   QT += opengl
> ++} else {
> ++   DEFINES += QT_NO_OPENGL
> + }
> +
> + win32 {
> +diff --git a/examples/videographicsitem/videographicsitem.pro b/examples/videographicsitem/videographicsitem.pro
> +index 8461beb..eedee2f 100644
> +--- a/examples/videographicsitem/videographicsitem.pro
> ++++ b/examples/videographicsitem/videographicsitem.pro
> +@@ -9,7 +9,11 @@ MOBILITY = multimedia
> +
> + QMAKE_RPATHDIR += $$DESTDIR
> +
> +-!symbian:contains(QT_CONFIG, opengl): QT += opengl
> ++contains(QT_CONFIG, opengl): !symbian {
> ++   QT += opengl
> ++} else {
> ++   DEFINES += QT_NO_OPENGL
> ++}
> +
> + HEADERS   += videoplayer.h \
> +              videoitem.h
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> index 593cbd6..2ac2253 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
>
>   SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
>              file://qt-mobility-configure.patch \
> -           file://0001-gstvideoconnector-fixed-buffers-allocation.patch"
> +           file://0001-gstvideoconnector-fixed-buffers-allocation.patch \
> +           file://qt-mobility-no-opengl.patch"
>
>   SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
>   SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
>
> -PR = "r2"
> +PR = "r3"
>
>   S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
>

Merged into OE-Core

Thanks
	Sau!


