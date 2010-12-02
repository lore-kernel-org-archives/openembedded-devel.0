Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1PO9WV-0006pm-Nj
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 14:48:36 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 59B30180284D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:47:15 +0100 (CET)
Received: from gonzales.localnet (ppp-188-174-87-224.dynamic.mnet-online.de
	[188.174.87.224])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS id 14C461C000A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:47:15 +0100 (CET)
From: Klaus Kurzmann <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Dec 2010 14:47:17 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.3; x86_64; ; )
References: <1291204540-4644-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1291204540-4644-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201012021447.17355.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.10
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] e-wm, efl: create e-base.bbclass with common settings and EFL_SRCREV
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
X-List-Received-Date: Thu, 02 Dec 2010 13:48:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Mittwoch, 1. Dezember 2010, 12:55:39 schrieb Martin Jansa:
> * include it from e.bbclass, efl.bbclass and now also python-efl.inc
> * also use BPN instead of "${@bb.data.getVar('PN', d, 1).replace('-native',
> '')}"
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  classes/e-base.bbclass               |    8 ++++++++
>  classes/e.bbclass                    |    9 +--------
>  classes/efl.bbclass                  |    8 +-------
>  conf/distro/include/sane-srcrevs.inc |    3 ---
>  recipes/efl1/libeflvala_svn.bb       |    6 +++---
>  recipes/python/python-efl.inc        |    6 ++----
>  6 files changed, 15 insertions(+), 25 deletions(-)
>  create mode 100644 classes/e-base.bbclass
> 
> diff --git a/classes/e-base.bbclass b/classes/e-base.bbclass
> new file mode 100644
> index 0000000..81f6b8a
> --- /dev/null
> +++ b/classes/e-base.bbclass
> @@ -0,0 +1,8 @@
> +HOMEPAGE = "http://www.enlightenment.org"
> +SRCNAME ?= "${BPN}"
> +
> +EFL_SRCREV ?= "54714"
> +SRC_URI =
> "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http" +S
> = "${WORKDIR}/${SRCNAME}"
> +
> +ARM_INSTRUCTION_SET = "arm"
> diff --git a/classes/e.bbclass b/classes/e.bbclass
> index 5db0749..88a1f6a 100644
> --- a/classes/e.bbclass
> +++ b/classes/e.bbclass
> @@ -1,13 +1,6 @@
> -HOMEPAGE = "http://www.enlightenment.org"
>  SECTION = "e/apps"
> -SRCNAME ?= "${PN}"
> 
> -SRC_URI =
> "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http" -S
> = "${WORKDIR}/${SRCNAME}"
> -
> -ARM_INSTRUCTION_SET = "arm"
> -
> -inherit autotools pkgconfig binconfig
> +inherit e-base autotools pkgconfig binconfig
> 
>  do_prepsources () {
>  	make clean distclean || true
> diff --git a/classes/efl.bbclass b/classes/efl.bbclass
> index f148e9c..518444e 100644
> --- a/classes/efl.bbclass
> +++ b/classes/efl.bbclass
> @@ -1,17 +1,11 @@
>  SECTION = "e/libs"
> -HOMEPAGE = "http://www.enlightenment.org"
>  LICENSE = "MIT BSD"
> -SRCNAME = "${@bb.data.getVar('PN', d, 1).replace('-native', '')}"
> -SRC_URI =
> "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http" -S
> = "${WORKDIR}/${SRCNAME}"
>  DEPENDS += "pkgconfig-native"
> 
>  # revision 0d93ec84b30bc1bee2caaee72d667f87bc468a70 made SRCDATE and hence
> PV go backwards, so we need to up PE to unbreak builds and feeds :( PE =
> "2"
> 
> -ARM_INSTRUCTION_SET = "arm"
> -
> -inherit autotools
> +inherit e-base autotools
> 
>  # evas-native looks at this var, so keep it
>  AUTOTOOLS_STAGE_PKGCONFIG = "1"
> diff --git a/conf/distro/include/sane-srcrevs.inc
> b/conf/distro/include/sane-srcrevs.inc index 9531ae4..e69de29 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -1,3 +0,0 @@
> -# only SRCREVs included in more recipes should be here, otherwise put sane
> SRCREV to recipe directly -
> -EFL_SRCREV ?= "54714"
> diff --git a/recipes/efl1/libeflvala_svn.bb
> b/recipes/efl1/libeflvala_svn.bb index 22159e6..35f6872 100644
> --- a/recipes/efl1/libeflvala_svn.bb
> +++ b/recipes/efl1/libeflvala_svn.bb
> @@ -7,11 +7,11 @@ PV = "0.5.0+svnr${SRCPV}"
>  PR = "r1"
>  PE = "1"
>  SRCREV = "${EFL_SRCREV}"
> +SRCNAME = "vala"
> 
> -SRC_URI =
> "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS;module=vala;proto=http"
> -S = "${WORKDIR}/vala"
> +inherit e-base autotools pkgconfig vala
> 
> -inherit autotools pkgconfig vala
> +SRC_URI =
> "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS;module=${SRCNAME};proto=
> http"
> 
>  PACKAGES =+ "${PN}-examples"
>  FILES_${PN}-examples = "${datadir}/libeflvala ${bindir}/*"
> diff --git a/recipes/python/python-efl.inc b/recipes/python/python-efl.inc
> index 1b4a88f..5fc6b9c 100644
> --- a/recipes/python/python-efl.inc
> +++ b/recipes/python/python-efl.inc
> @@ -1,7 +1,6 @@
>  DESCRIPTION = "${PN} bindings"
>  LICENSE = "BSD"
>  AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
> -HOMEPAGE = "http://www.enlightenment.org"
>  # NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
>  # we need to build pyrex otherwise cython doesn't get called to build
>  # the extension modules.
> @@ -14,10 +13,9 @@ PR = "ml1"
>  export BUILD_SYS
>  export HOST_SYS
> 
> -inherit autotools pkgconfig distutils-base
> +inherit e-base autotools pkgconfig distutils-base
> 
> -SRC_URI =
> "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS/python;module=${PN};prot
> o=http" -S = "${WORKDIR}/${PN}"
> +SRC_URI =
> "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS/python;module=${SRCNAME}
> ;proto=http"
> 
>  do_configure_prepend() {
>  	# prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use
> $PKG_CONFIG instead of pkg-config directly

Acked-by: Klaus Kurzmann <mok@fluxnetz.de>
-- 
Klaus 'mrmoku' Kurzmann


