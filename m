Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJi3o-0005N1-0O for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 10:12:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJi17-0005pC-Hh for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 10:10:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 10:10:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 10:10:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 10:00:49 +0200
Message-ID: <iqarbh$fvf$2@dough.gmane.org>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] recipes: fix LICENSE fields
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
X-List-Received-Date: Tue, 10 May 2011 08:12:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

On 10-05-11 09:39, Martin Jansa wrote:
> * & in LICENSE breaks distribute_sources
>   ERROR: Function 'SRC_DISTRIBUTECOMMAND' failed (see /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/temp/log.do_distribute_sources.17340 for further information)
>   ERROR: Logfile of failure stored in: /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/temp/log.do_distribute_sources.17340
>   Log data follows:
>   | WARNING: LICENSE: 'PublicDomain & MIT & MIT-style'
>   | WARNING: licenses: ['PublicDomain', '&', 'MIT', '&', 'MIT-style']
>   | WARNING: license: PublicDomain
>   | WARNING: license: &
>   | ERROR: Function 'SRC_DISTRIBUTECOMMAND' failed (see /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/temp/log.do_distribute_sources.17340 for further information)
>   | + cd /OE/tmpdir-shr/deploy/sources/PublicDomain/pixman
>   | + SRC_DISTRIBUTECOMMAND
>   | + test -e /OE/pixman-0.22.0.tar.gz.md5
>   | + ln -sf /OE/pixman-0.22.0.tar.gz .
>   | + /pixman
>   | + cd /OE/tmpdir-shr/deploy/sources/
>   | /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/temp/run.SRC_DISTRIBUTECOMMAND.17340: line 95: /pixman: No such file or directory
>   NOTE: package pixman-0.22.0-r5.0: task do_distribute_sources: Failed
> * "Public Domain" causes sources distributed from "Public" and "Domain"
>   folders which is not expected, so use PD as in other recipes
> * embryo and epdf had LICENSE defined before inherit efl which
>   overwrites it (that's why distribute_sources wasn't failing on their &
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes/antlr/antlr_2.7.7.bb          |    4 +++-
>  recipes/dt/dt.inc                     |    4 ++--
>  recipes/efl1/embryo.inc               |    7 ++++---
>  recipes/efl1/epdf_svn.bb              |   10 ++++++----
>  recipes/gtk+/composite-pixbuf_0.0.bb  |    3 ++-
>  recipes/mesa/mesa-demos_8.0.1.bb      |    4 ++--
>  recipes/nrlolsr/nrlolsr_7.8.1.bb      |    4 +++-
>  recipes/xml-commons/jaxp1.3_1.3.04.bb |    4 +++-
>  recipes/xorg-lib/pixman_0.22.0.bb     |    4 ++--
>  9 files changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/recipes/antlr/antlr_2.7.7.bb b/recipes/antlr/antlr_2.7.7.bb
> index 3dbcea7..ea921b5 100644
> --- a/recipes/antlr/antlr_2.7.7.bb
> +++ b/recipes/antlr/antlr_2.7.7.bb
> @@ -1,8 +1,10 @@
>  DESCRIPTION = "Framework for constructing recognizers, interpreters, compilers, and translators"
>  # see http://www.antlr2.org/license.html
> -LICENSE = "Public Domain"
> +LICENSE = "PD"
>  HOMEPAGE = "http://www.antlr2.org"
>  
> +PR = "r1"
> +
>  SRC_URI = "http://www.antlr2.org/download/${BP}.tar.gz"
>  
>  inherit java-library
> diff --git a/recipes/dt/dt.inc b/recipes/dt/dt.inc
> index 31f3402..fbf5df5 100644
> --- a/recipes/dt/dt.inc
> +++ b/recipes/dt/dt.inc
> @@ -3,8 +3,8 @@ operation of peripherals, file systems, device drivers, or any data stream suppo
>  operating system."
>  SECTION = "console/tests"
>  HOMEPAGE = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/dt.html"
> -LICENSE = "Public domain"
> -INC_PR = "r0"
> +LICENSE = "PD"
> +INC_PR = "r1"
>  
>  SRC_URI = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ftp/dt/dt-source.tar.gz"
>  S = "${WORKDIR}/dt.d"
> diff --git a/recipes/efl1/embryo.inc b/recipes/efl1/embryo.inc
> index ab02905..8bb8b6f 100644
> --- a/recipes/efl1/embryo.inc
> +++ b/recipes/efl1/embryo.inc
> @@ -1,11 +1,12 @@
>  DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
> -LICENSE = "MIT BSD & CompuPhase"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6aa45e26c1ed178da910fd76b306a875"
>  
>  inherit efl
>  
> +LICENSE = "MIT BSD CompuPhase"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6aa45e26c1ed178da910fd76b306a875"
> +
>  BBCLASSEXTEND = "native"
> -INC_PR = "r0"
> +INC_PR = "r1"
>  
>  # Some upgrade path tweaking
>  AUTO_LIBNAME_PKGS = ""
> diff --git a/recipes/efl1/epdf_svn.bb b/recipes/efl1/epdf_svn.bb
> index 1f37629..490b3ce 100644
> --- a/recipes/efl1/epdf_svn.bb
> +++ b/recipes/efl1/epdf_svn.bb
> @@ -1,8 +1,4 @@
>  DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
> -LICENSE = "GPLv2 & LGPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
> -"
>  
>  DEPENDS = "poppler evas ecore"
>  PV = "0.1.0+svnr${SRCPV}"
> @@ -10,6 +6,12 @@ PR = "r4"
>  SRCREV = "${EFL_SRCREV}"
>  
>  inherit efl
> +
> +LICENSE = "GPLv2 LGPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> +                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
> +"
> +
>  SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep"
>  S = "${WORKDIR}/${SRCNAME}"
>  
> diff --git a/recipes/gtk+/composite-pixbuf_0.0.bb b/recipes/gtk+/composite-pixbuf_0.0.bb
> index 29e329a..4c0479f 100644
> --- a/recipes/gtk+/composite-pixbuf_0.0.bb
> +++ b/recipes/gtk+/composite-pixbuf_0.0.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "Pixbuf performance test"
> -LICENSE = "Public domain"
> +LICENSE = "PD"
>  DEPENDS = "gtk+" 
> +PR = "r1"
>  
>  SRC_URI = "http://amelang.net/composite_pixbuf.c"
>  
> diff --git a/recipes/mesa/mesa-demos_8.0.1.bb b/recipes/mesa/mesa-demos_8.0.1.bb
> index 0314342..3632761 100644
> --- a/recipes/mesa/mesa-demos_8.0.1.bb
> +++ b/recipes/mesa/mesa-demos_8.0.1.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "mesa demo applications"
>  HOMEPAGE = "http://mesa3d.org"
>  SECTION = "x11"
>  
> -LICENSE = "MIT & PD"
> +LICENSE = "MIT PD"
>  
>  DEPENDS = "virtual/libx11 virtual/libgl libglew"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${PN}-${PV}.tar.bz2"
>  
> diff --git a/recipes/nrlolsr/nrlolsr_7.8.1.bb b/recipes/nrlolsr/nrlolsr_7.8.1.bb
> index 3a748b9..bb3c1a8 100644
> --- a/recipes/nrlolsr/nrlolsr_7.8.1.bb
> +++ b/recipes/nrlolsr/nrlolsr_7.8.1.bb
> @@ -1,6 +1,8 @@
>  DESCRIPTION = "NRL OLSR - added to OE to support the Maniac Challenge (http://www.maniacchallenge.org/)"
>  SECTION = "applications"
> -LICENSE = "Public Domain"
> +LICENSE = "PD"
> +
> +PR = "r1"
>  
>  S="${WORKDIR}/nrlolsr/"
>  
> diff --git a/recipes/xml-commons/jaxp1.3_1.3.04.bb b/recipes/xml-commons/jaxp1.3_1.3.04.bb
> index 1875fa7..8daa80f 100644
> --- a/recipes/xml-commons/jaxp1.3_1.3.04.bb
> +++ b/recipes/xml-commons/jaxp1.3_1.3.04.bb
> @@ -1,7 +1,9 @@
>  DESCRIPTION = "Java XML parser and transformer APIs (DOM, SAX, JAXP, TrAX)"
> -LICENSES = "AL2.0 W3C Public Domain"
> +LICENSES = "AL2.0 W3C PD"
>  AUTHOR = "Apache Software Foundation"
>  
> +PR = "r1"
> +
>  SRC_URI = "http://archive.apache.org/dist/xml/commons/source/xml-commons-external-${PV}-src.tar.gz;subdir=${BPN}-${PV}"
>  
>  inherit java-library
> diff --git a/recipes/xorg-lib/pixman_0.22.0.bb b/recipes/xorg-lib/pixman_0.22.0.bb
> index d256e68..ee18681 100644
> --- a/recipes/xorg-lib/pixman_0.22.0.bb
> +++ b/recipes/xorg-lib/pixman_0.22.0.bb
> @@ -1,12 +1,12 @@
>  require pixman.inc
>  
> -LICENSE = "MIT & MIT-style & Public Domain"
> +LICENSE = "MIT MIT-style PD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3\
>                      file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
>                      file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
>                      file://pixman/pixman-x64-mmx-emulation.h;beginline=4;endline=9;md5=4e32716f2efaa6c4659222667c339bb8"
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  SRC_URI = "http://xorg.freedesktop.org/archive/individual/lib/${BPN}-${PV}.tar.gz \
>             file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyPCxMkyGM64RGpERAt9eAJ4z9eLM+NkO3TV9fpy7EeSW3Pd9SgCgsy1k
c9pg4QSATzX78taQD4K7nWs=
=oxrv
-----END PGP SIGNATURE-----



