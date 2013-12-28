Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0D0615BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2013 09:15:32 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VwpzW-0001dr-CZ for openembedded-devel@lists.openembedded.org;
	Sat, 28 Dec 2013 10:15:30 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2013 10:15:30 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2013 10:15:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 28 Dec 2013 10:15:21 +0100
Message-ID: <l9m4qt$96c$1@ger.gmane.org>
References: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][for-dora 1/3] geos: Update to 3.4.2 and rework the packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 09:15:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

All 3 patches look good to me for going into the dora branch

Otavio Salvador schreef op 27-12-13 06:15:
> * This updates to the 3.4.2 release and rework the packaging splitting 
> the C bindings in another binary package to reduce footprint in rootfs;
> this also moves geos-config to the development package as it should.
> 
> * Fix -dev installation and upgrade path Using 'lib_package' renames the
> binaries and we need a transitional package to be used as upgrade path.
> This is done using an empty 'geos' package which installs the new ones as
> runtime dependency.
> 
> This same package is used to satisfy -dev dependency of geos package 
> allowing for its inclusion into SDK.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> Signed-off-by:
> Martin Jansa <Martin.Jansa@gmail.com> --- 
> .../geos-config-Add-includedir-variable.patch      | 39
> ++++++++++++++++++++++ meta-oe/recipes-navigation/geos/geos.inc
> | 22 ++++++------ meta-oe/recipes-navigation/geos/geos_3.3.2.bb      |  7
> ---- meta-oe/recipes-navigation/geos/geos_3.4.2.bb      |  6 ++++ 4 files
> changed, 56 insertions(+), 18 deletions(-) create mode 100644
> meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
>
> 
delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.3.2.bb
> create mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.2.bb
> 
> diff --git
> a/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
> b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
>
> 
new file mode 100644
> index 0000000..645e6f6 --- /dev/null +++
> b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
>
> 
@@ -0,0 +1,39 @@
> +From 9d51027c228dafd7db2d0cffca1f0fc695e950fd Mon Sep 17 00:00:00 2001 
> +From: Otavio Salvador <otavio@ossystems.com.br> +Date: Mon, 2 Dec 2013
> 11:33:26 -0200 +Subject: [PATCH] geos-config: Add includedir variable + 
> +This fixes cross-compile as it is easier to mangle the includedir 
> +during sysroot generation. + +Upstream-Status: Pending + +Signed-off-by:
> Otavio Salvador <otavio@ossystems.com.br> +--- + tools/geos-config.in |
> 3 ++- + 1 file changed, 2 insertions(+), 1 deletion(-) + +diff --git
> a/tools/geos-config.in b/tools/geos-config.in +index 9b45b5f..1749892
> 100644 +--- a/tools/geos-config.in ++++ b/tools/geos-config.in +@@ -1,6
> +1,7 @@ + #!/bin/sh + prefix=@prefix@ + exec_prefix=@exec_prefix@ 
> ++includedir=@includedir@ + libdir=@libdir@ + + usage() +@@ -38,7 +39,7
> @@ case $1 in +     echo @VERSION@ +      ;; +     --cflags) +-    echo
> -I${prefix}/include ++    echo -I${includedir} +       ;; +     --libs) +
> # TODO: make an alias for --clibs +-- +1.7.10.4 + diff --git
> a/meta-oe/recipes-navigation/geos/geos.inc
> b/meta-oe/recipes-navigation/geos/geos.inc index e0c82bc..2e308b4 100644 
> --- a/meta-oe/recipes-navigation/geos/geos.inc +++
> b/meta-oe/recipes-navigation/geos/geos.inc @@ -2,20 +2,20 @@ DESCRIPTION
> = "GEOS - Geometry Engine, Open Source" HOMEPAGE =
> "http://trac.osgeo.org/geos/" SECTION = "libs"
> 
> -INC_PR = "r1" - LICENSE = "LGPLv2.1+" LIC_FILES_CHKSUM =
> "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> 
> SRC_URI = "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
> 
> -inherit autotools pkgconfig +inherit autotools pkgconfig binconfig + 
> +PACKAGES =+ "geoslib ${PN}-c1" + +DESCRIPTION_${PN}lib = "Geometry
> engine for Geographic Information Systems - C++ Library" +FILES_${PN}lib
> += "${libdir}/libgeos-${PV}.so" + +DESCRIPTION_${PN}-c1 = "Geometry
> engine for Geographic Information Systems - C Library" +FILES_${PN}-c1 +=
> "${libdir}/libgeos_c.so.*"
> 
> -# libgeos-${PV}.so is needed in PV -FILES_SOLIBSDEV = "" 
> -FILES_${PN}-dev = "${libdir}/*.la \ -
> ${libdir}/libgeos.so \ -                   ${libdir}/libgeos_c.so \ -
> ${includedir}" -FILES_${PN} += " ${libdir}/libgeos-${PV}.so" 
> -INSANE_SKIP_${PN} = "dev-so" +ALLOW_EMPTY_${PN} = "1" +RDEPENDS_${PN} +=
> "geoslib ${PN}-c1" diff --git
> a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
> b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb deleted file mode 100644 
> index e57ca6b..0000000 ---
> a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb +++ /dev/null @@ -1,7
> +0,0 @@ -require geos.inc - -PR = "${INC_PR}.0" - -SRC_URI[md5sum] =
> "5b7270c73fd1c516f368af8fd1962323" -SRC_URI[sha256sum] =
> "ec64d3a92540a1618aa3b91dc1235caae1c370ec23afd59a2734062bf182ed5b" - diff
> --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
> b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb new file mode 100644 
> index 0000000..3a9a028 --- /dev/null +++
> b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb @@ -0,0 +1,6 @@ +require
> geos.inc + +SRC_URI +=
> "file://geos-config-Add-includedir-variable.patch" + +SRC_URI[md5sum] =
> "fc5df2d926eb7e67f988a43a92683bae" +SRC_URI[sha256sum] =
> "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSvpapMkyGM64RGpERAu23AKCTwqKh/MOVeen0WBKbAtq1CLTDYgCgkXRe
ZhxeqjTmCOJbU8SGJowgWuE=
=qqxF
-----END PGP SIGNATURE-----


