Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD97741E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 May 2015 05:06:52 +0000 (UTC)
Received: by wizk4 with SMTP id k4so13989062wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=AMtcXsuNMw3i5wpMJGUESW+y0/tHVou5A4Gvywqn5rg=;
	b=dWJVwuOa9KEtBIHMPAbEJocnolnS+gr4rlyole++FwYa/Sif7g71lSBCNVBvbs/4Aa
	3CfJjLYI62IQ2NaqxMH1IYrQ5piF12OamozVzR0bAf90k2JZeyjMm+E1eAs3UZh1f8oK
	3xIz9Ztcb7vjd7P6/7r2/U6ZqEj+Pl/afcdd0m6pTJQB9vMFoCtglnaIflzvLLuHKV6v
	G2Qows0Waw6NKIz7NSVzVdCa0yxBj2mcAS3tnswqx8+Pb45ClHTy2rdNAaYGXwX7KHsd
	x7K7243914zZP8dLdbZTRsAxk4xBlDjspGw021lnNlYxb2Ifzecg6wbRVZG+Zwn1a7Z3
	oiLQ==
X-Received: by 10.180.85.42 with SMTP id e10mr3205892wiz.17.1431752813854;
	Fri, 15 May 2015 22:06:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id bm9sm5602300wjc.21.2015.05.15.22.06.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 May 2015 22:06:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 16 May 2015 07:07:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150516050718.GA9407@jama>
References: <1431647846-2409-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1431647846-2409-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-browser][PATCH] cef,chromium: Separate out installs
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
X-List-Received-Date: Sat, 16 May 2015 05:06:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 04:57:26PM -0700, Khem Raj wrote:
> Use specific domains for installation, so they can be built and
> installed in a single build

Thanks, one more issue was shown in my world builds:

WARNING: QA Issue: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/wo=
rk/i586-oe-linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/lib/c=
ef3/libffmpegsumo.so' has relocations in .text [textrel]
ERROR: QA Issue: non debug package contains .debug directory: cef3 path /wo=
rk/i586-oe-linux/cef3/280796-r0/packages-split/cef3/usr/bin/lib/.debug/libc=
ef.so [debug-files]
WARNING: QA Issue: cef3: found library in wrong location: /usr/bin/lib/libc=
ef.so
cef3: found library in wrong location: /usr/bin/lib/.debug/libcef.so [libdi=
r]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/i586-oe-linux/cef3/280796-r0/temp/log.do_package_qa.2247
NOTE: recipe cef3-280796-r0: task do_package_qa: Failed

Thanks

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{chromium/google-chrome =3D> cef3/cef-simple}    |  6 ++---
>  recipes-browser/chromium/cef3_280796.bb            |  1 +
>  recipes-browser/chromium/chromium.inc              | 30 ++++++++++++----=
------
>  recipes-browser/chromium/chromium/google-chrome    |  4 +--
>  .../chromium/chromium/google-chrome.desktop        |  2 +-
>  recipes-browser/chromium/chromium_40.0.2214.91.bb  |  4 +--
>  6 files changed, 25 insertions(+), 22 deletions(-)
>  copy recipes-browser/chromium/{chromium/google-chrome =3D> cef3/cef-simp=
le} (66%)
>=20
> diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-br=
owser/chromium/cef3/cef-simple
> similarity index 66%
> copy from recipes-browser/chromium/chromium/google-chrome
> copy to recipes-browser/chromium/cef3/cef-simple
> index 78f4a29..ce377e1 100644
> --- a/recipes-browser/chromium/chromium/google-chrome
> +++ b/recipes-browser/chromium/cef3/cef-simple
> @@ -1,11 +1,11 @@
>  #!/bin/sh
> =20
>  export CHROME_DEVEL_SANDBOX=3D/usr/sbin/chrome-devel-sandbox
> -export LD_LIBRARY_PATH=3D/usr/lib/chrome
> +export LD_LIBRARY_PATH=3D/usr/lib/cef3
> =20
>  CHROME_EXTRA_ARGS=3D""
>  if [ "${USER}" =3D "root" ] ; then
> -	CHROME_EXTRA_ARGS=3D"${CHROME_EXTRA_ARGS} --user-data-dir=3D${HOME}/.ch=
romium/"
> +	CHROME_EXTRA_ARGS=3D"${CHROME_EXTRA_ARGS} --user-data-dir=3D${HOME}/.ce=
f3/"
>  fi
> =20
> -/usr/bin/chrome/chrome ${CHROME_EXTRA_ARGS} $@
> +/usr/bin/cef3/cefsimple ${CHROME_EXTRA_ARGS} $@
> diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/ch=
romium/cef3_280796.bb
> index 9ca5810..9a9efe5 100644
> --- a/recipes-browser/chromium/cef3_280796.bb
> +++ b/recipes-browser/chromium/cef3_280796.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "http://people.linaro.org/~zoltan.kuscsik/c=
hromium-browser/chromium_re
>             git://github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;dests=
uffix=3Dsrc/ui/ozone/platform/egl;branch=3Dmaster;name=3Degl \
>             git://chromium.googlesource.com/chromium/tools/depot_tools.gi=
t;protocol=3Dhttps;destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtools \
>             file://01_get_svn_version_from_LASTCHANGE.patch \
> +	   file://cef-simple \
>  	  "
>  SRC_URI[md5sum] =3D "9efbb50283b731042e62b9bd5e312b2f"
>  SRC_URI[sha256sum] =3D "f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2=
025075aee9fb348d"
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chro=
mium/chromium.inc
> index 72a649d..377e685 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -34,20 +34,23 @@ do_install() {
>  	if [ -f "${WORKDIR}/google-chrome" ]; then
>  		install -Dm 0755 ${WORKDIR}/google-chrome ${D}${bindir}/google-chrome
>  	fi
> +	if [ -f "${WORKDIR}/cef-simple" ]; then
> +		install -Dm 0755 ${WORKDIR}/cef-simple ${D}${bindir}/cef-simple
> +	fi
>  	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox" ]; then
>  		install -Dm 4755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox ${D}${=
sbindir}/chrome-devel-sandbox
>  	fi
>  	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple" ]; then
> -		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple ${D}${bindi=
r}/cefsimple
> +		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple ${D}${bindi=
r}/${BPN}/cefsimple
>  	fi
>  	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
>  		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${b=
indir}/lib/libcef.so
>  	fi
>  	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
> -		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome ${D}${bindir}/=
chrome/chrome
> +		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome ${D}${bindir}/=
${BPN}/chrome
>  	fi
>  	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
> -		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bind=
ir}/chrome/icudtl.dat
> +		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bind=
ir}/${BPN}/icudtl.dat
>  	fi
>  	if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
>  		install -Dm 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/appli=
cations/google-chrome.desktop
> @@ -55,7 +58,7 @@ do_install() {
>  	#Chromium plugins libs
>  	for f in libpdf.so libosmesa.so libffmpegsumo.so; do
>  		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
> -			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${libdir}/chr=
ome/$f
> +			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${libdir}/${B=
PN}/$f
>  		fi
>  	done
> =20
> @@ -64,7 +67,7 @@ do_install() {
>  	         cef_100_percent.pak cef_200_percent.pak cef_resources.pak cef.=
pak \
>  		 locales/en-US.pak; do
>  		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
> -			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${bindir}/chr=
ome/$f
> +			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${bindir}/${B=
PN}/$f
>  		fi
>  	done
> =20
> @@ -72,19 +75,18 @@ do_install() {
> =20
>  PACKAGES =3D+ "${PN}-codecs-ffmpeg ${PN}-plugin-pdf"
> =20
> -FILES_${PN}-codecs-ffmpeg =3D "${libdir}/chrome/libffmpegsumo.so"
> -FILES_${PN}-plugin-pdf =3D "${libdir}/chrome/libpdf.so"
> +FILES_${PN}-codecs-ffmpeg =3D "${libdir}/${BPN}/libffmpegsumo.so"
> +FILES_${PN}-plugin-pdf =3D "${libdir}/${BPN}/libpdf.so"
> +
> +FILES_${PN} =3D "${bindir}/${BPN} ${datadir}/applications ${sbindir}/ ${=
libdir}/${BPN}/"
> +FILES_${PN} +=3D "${bindir} ${libdir}"
> +FILES_${PN} +=3D "${bindir}/${BPN}/*.pak"
> +FILES_${PN} +=3D "${bindir}/${BPN}/locales/*.pak"
> =20
> -FILES_${PN} =3D "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/ap=
plications ${sbindir}/ ${libdir}/chrome/"
> -FILES_${PN}-dbg +=3D "${bindir}/chrome/.debug/ ${libdir}/chrome/.debug/"
> +FILES_${PN}-dbg +=3D "${bindir}/${BPN}/.debug/ ${libdir}/${BPN}/.debug/ =
${libdir}/.debug/"
> =20
>  PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> =20
>  INSANE_SKIP_${PN} =3D "ldflags"
>  SOLIBS =3D ".so"
>  FILES_SOLIBSDEV =3D ""
> -FILES_${PN} +=3D "${bindir} ${bindir}/chrome/ ${libdir}"
> -FILES_${PN} +=3D "${bindir}/chrome/*.pak"
> -FILES_${PN} +=3D "${bindir}/chrome/locales/*.pak"
> -FILES_${PN}-dbg +=3D "${bindir}/chrome/.debug/ ${libdir}/.debug/"
> -
> diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-br=
owser/chromium/chromium/google-chrome
> index 78f4a29..b1ec288 100644
> --- a/recipes-browser/chromium/chromium/google-chrome
> +++ b/recipes-browser/chromium/chromium/google-chrome
> @@ -1,11 +1,11 @@
>  #!/bin/sh
> =20
>  export CHROME_DEVEL_SANDBOX=3D/usr/sbin/chrome-devel-sandbox
> -export LD_LIBRARY_PATH=3D/usr/lib/chrome
> +export LD_LIBRARY_PATH=3D/usr/lib/chromium
> =20
>  CHROME_EXTRA_ARGS=3D""
>  if [ "${USER}" =3D "root" ] ; then
>  	CHROME_EXTRA_ARGS=3D"${CHROME_EXTRA_ARGS} --user-data-dir=3D${HOME}/.ch=
romium/"
>  fi
> =20
> -/usr/bin/chrome/chrome ${CHROME_EXTRA_ARGS} $@
> +/usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@
> diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b/re=
cipes-browser/chromium/chromium/google-chrome.desktop
> index 76a2533..094bd82 100644
> --- a/recipes-browser/chromium/chromium/google-chrome.desktop
> +++ b/recipes-browser/chromium/chromium/google-chrome.desktop
> @@ -107,7 +107,7 @@ Comment[zh_HK]=3D???????
>  Comment[zh_TW]=3D???????
>  Exec=3D/usr/bin/google-chrome %U
>  Terminal=3Dfalse
> -Icon=3D/usr/bin/chrome/product_logo_48.png
> +Icon=3D/usr/bin/chromium/product_logo_48.png
>  Type=3DApplication
>  Categories=3DNetwork;WebBrowser;
>  MimeType=3Dtext/html;text/xml;application/xhtml_xml;x-scheme-handler/htt=
p;x-scheme-handler/https;x-scheme-handler/ftp;
> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-=
browser/chromium/chromium_40.0.2214.91.bb
> index 53af755..0a73f1e 100644
> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> @@ -189,8 +189,8 @@ do_install_append() {
> =20
>  	# Always adding this libdir (not just with component builds), because t=
he
>          # LD_LIBRARY_PATH line in the google-chromium script refers to it
> -        install -d ${D}${libdir}/chrome/
> +        install -d ${D}${libdir}/${BPN}/
>          if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'component-build'=
, 'component-build', '', d)}" ]; then
> -                install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*.so=
 ${D}${libdir}/chrome/
> +                install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*.so=
 ${D}${libdir}/${BPN}/
>          fi
>  }
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

