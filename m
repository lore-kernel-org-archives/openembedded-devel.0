Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6533D782DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Sep 2017 06:46:27 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id a47so976934wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tiN38Dos7LAPuNzVRtq5xUnwMq3FKIM2qa4SfOzTM1Y=;
	b=cdl0tQ14rMbTfFxCbGh0THl5z2OZ4GyzZlUUvwucNO82nQjmGX0REeIgdgZ9QX5Haj
	48KA8QPW6SZo9RZ1due4jzUBQphacCVTwVJCUsTafjT7csHdRdQKLZjxW7a8BxUuS9yj
	VkTXceKi+Iff2mckJj/pOlcnfNKtabHlLMcKMlCSSM+G9L/Ypa0/dl9UvIUYUUXRZapr
	vkakwWXcHnYZ26Vr4piqIMB/7d0H+G6N5ghL0aeWIoAJRa9aSxzVxnwvTSKiDCFBiBk9
	3f2a/sAuG1CsHWhFLx/ZA2mExxJjlMzwDZkYh1hYNdYNsACemetxTb/xoyYHfVJGknVA
	Xz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tiN38Dos7LAPuNzVRtq5xUnwMq3FKIM2qa4SfOzTM1Y=;
	b=aX/3ULSBliK6Vr8+5LS82vXD9znvYngao6aL903A5mxhPUDEX9gfDmC5NqMlwH5Dni
	3cFMmJJIiAQSOwK7x2rZqpM4a3TNz84mn0FovbaOALn7yppaIRtBaGxJGId62dFBzU4f
	xvKgzEJOpVJnK86CVP79HYqjLDxSTnPbGMCRIP1/nFeIBCzAp9pRVoPyJqf80JCg0MP4
	vj0H6WsDlETcBg3dtFV0yOXrbx+tCsmSLVd6Dn0miPPdmlN+vv2y2wjmX/wyer0EBnVx
	eTdHYkHTeCyd3RiNK2nyWP4EID3PUA02pEO+n4DESRebY39h336A4Fm7WATmLxy/yjE5
	aymQ==
X-Gm-Message-State: AHPjjUgeMuuqVk09bX1XEIAjfTHVIubO5iyi67kdsULZ8N3ufQYcbpD2
	59ZVcRxnczc9VzqS
X-Google-Smtp-Source: ADKCNb52K6fYPXl3W6P3kwpMcIg89YTs03OfL0mzCCBxNIxYziKYgYfJsaBT/CmlxfZNr6E5GM57lg==
X-Received: by 10.223.151.51 with SMTP id r48mr2236435wrb.309.1504334788669;
	Fri, 01 Sep 2017 23:46:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x69sm2961498wme.34.2017.09.01.23.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Sep 2017 23:46:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 2 Sep 2017 08:48:29 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170902064829.GA3070@jama>
References: <20170831020401.6367-1-raj.khem@gmail.com>
	<CA+chaQdT78AE7OJagPnp3W93PYwL5kdGBe8Dz12h+tXf9udnyg@mail.gmail.com>
	<CAMKF1sp=CDYbTvUS9dRSn_Hh8q_k6MO7OrTQQ4yELLdANYDFWA@mail.gmail.com>
	<CAMKF1soMqGOCfZLirAUfBjLZonfcFyYOXHdX7+h36+BtyTSmNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soMqGOCfZLirAUfBjLZonfcFyYOXHdX7+h36+BtyTSmNA@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/4] ntop: Fix build with musl
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
X-List-Received-Date: Sat, 02 Sep 2017 06:46:28 -0000
X-Groupsio-MsgNum: 68522
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2017 at 08:44:00AM -0700, Khem Raj wrote:
> On Fri, Sep 1, 2017 at 8:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Sep 1, 2017 at 6:05 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >> added .patch file fails to apply in master-next:
> >> http://errors.yoctoproject.org/Errors/Details/154751/
> >>
> >
> > I do see the ^M  line endings in the source. However, this patch works =
fine
> > with archlinux host here. Can you try to cherry-pick it directly from
> >
> > https://github.com/kraj/meta-openembedded/commit/42cd752bd366ccd40c8f30=
2ac9dd0455511eab4e
> >
> > I wonder if its something to do with mailing lists + patchwork.
> >
>=20
> oh and did you apply v2 ?
> https://patchwork.openembedded.org/patch/143411/

the ntop patch was indeed CR+LF issue, which patchwork doesn't respect, I'v=
e updated it from your branch, next
time you can use dos2unix.bbclass to make it a bit easier.

the iscsi patch in master-next was already v2.

>=20
> >> On Thu, Aug 31, 2017 at 4:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> move away from .inc file, when its included in single recipe
> >>> helps with devtool workflow too.
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>  meta-networking/recipes-support/ntop/ntop.inc      | 131
> >>> --------------------
> >>>  .../ntop/ntop/0001-nDPI-Include-sys-types.h.patch  |  24 ++++
> >>>  .../recipes-support/ntop/ntop/support-arm64.patch  |  28 -----
> >>>  meta-networking/recipes-support/ntop/ntop_5.0.1.bb | 135
> >>> ++++++++++++++++++++-
> >>>  4 files changed, 158 insertions(+), 160 deletions(-)
> >>>  delete mode 100644 meta-networking/recipes-support/ntop/ntop.inc
> >>>  create mode 100644
> >>> meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types=
=2Eh.patch
> >>>  delete mode 100644
> >>> meta-networking/recipes-support/ntop/ntop/support-arm64.patch
> >>>
> >>> diff --git a/meta-networking/recipes-support/ntop/ntop.inc
> >>> b/meta-networking/recipes-support/ntop/ntop.inc
> >>> deleted file mode 100644
> >>> index b96433425..000000000
> >>> --- a/meta-networking/recipes-support/ntop/ntop.inc
> >>> +++ /dev/null
> >>> @@ -1,131 +0,0 @@
> >>> -SUMMARY =3D "ntop is network top"
> >>> -DESCRIPTION =3D "ntop is a network traffic probe that shows the netw=
ork
> >>> usage, \
> >>> -similar to what the popular top Unix command does."
> >>> -
> >>> -SECTION =3D "console/network"
> >>> -
> >>> -LICENSE =3D "GPLv2+ & GPLv3 & OpenSSL"
> >>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
> >>> -
> >>> file://LICENSE-OpenSSL.txt;md5=3Da409f902e447ddd889cffa0c70e7c7c2 \
> >>> -                   "
> >>> -
> >>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
> >>> -           file://ntop_configure_in.patch \
> >>> -           file://ntop_init.patch \
> >>> -           file://ntop_webInterface.patch \
> >>> -           file://ntop_configure_in_net_snmp_config_exist.patch \
> >>> -           file://ntop.service \
> >>> -           file://use-static-inline.patch \
> >>> -           file://support-arm64.patch \
> >>> -          "
> >>> -
> >>> -inherit autotools-brokensep useradd pythonnative pkgconfig systemd
> >>> -
> >>> -DEPENDS =3D "geoip rrdtool python zlib libpcap gdbm"
> >>> -
> >>> -PACKAGECONFIG ??=3D "openssl snmp plugins"
> >>> -PACKAGECONFIG[openssl] =3D "--with-ssl, --without-ssl, openssl, open=
ssl"
> >>> -PACKAGECONFIG[snmp] =3D "--enable-snmp=3Dyes
> >>> NETSNMP=3D${STAGING_BINDIR_CROSS}/net-snmp-config, \
> >>> ---disable-snmp,net-snmp,"
> >>> -PACKAGECONFIG[plugins] =3D "--enable-plugins=3Dyes, --disable-plugin=
s, ,"
> >>> -
> >>> -EXTRA_OECONF +=3D "ac_cv_file_aclocal_m4=3Dyes ac_cv_file_depcomp=3D=
no"
> >>> -
> >>> -do_configure() {
> >>> -    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
> >>> -    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.=
m4
> >>> -    cp 3rd_party/* ./
> >>> -
> >>> -    # config nDPI
> >>> -    cd nDPI
> >>> -    ./configure ${CONFIGUREOPTS} --with-pic
> >>> -    cd ..
> >>> -
> >>> -    sed -i -e
> >>> 's:^CFG_DBFILE_DIR=3D$localstatedir/ntop:CFG_DBFILE_DIR=3D$localstate=
dir/lib/ntop:'
> >>> ${S}/configure.in
> >>> -
> >>> -    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
> >>> -    sed -i \
> >>> -        -e 's:\(^CFLAGS=3D"\$.*\) -I/usr/local/include
> >>> -I/opt/local/include":\1":' \
> >>> -        -e 's:\(^CPPFLAGS=3D"\$.*\) -I/usr/local/include
> >>> -I/opt/local/include":\1":' \
> >>> -        -e 's:\(^LDFLAGS=3D"\$.*\) -L/usr/local/lib -L/opt/local/lib=
":\1":'
> >>> \
> >>> -        ${S}/configure.in
> >>> -
> >>> -    # replace the DISTRO RELEASE in configure.in which are host's
> >>> -    # with our release, although those doesn't affect functionality
> >>> -    sed -i -e \
> >>> -
> >>> '/DEFINEOS=3D"LINUX"/{N;s/DISTRO=3D.*/DISTRO=3D"${DISTRO}"/;N;s/RELEA=
SE=3D.*/RELEASE=3D"${DISTRO_VERSION}"/;}'
> >>> \
> >>> -        ${S}/configure.in
> >>> -
> >>> -    # osName in original configure.in should be ${TARGET_SYS}
> >>> -    # which will show in ntop's "show configuration"
> >>> -    sed -i -e \
> >>> -        's:^osName=3D.*:osName=3D${TARGET_SYS}:' \
> >>> -        ${S}/configure.in
> >>> -
> >>> -    # rename configureextra to configureextra_rename to avoid
> >>> -    # configure.in to guess host OS and pull in more configure, non
> >>> needed
> >>> -    # which will cause some cross-compiling failure on specific host
> >>> -    # e.g. SUSE(SLED...)
> >>> -    test ! -f configureextra || mv -f configureextra
> >>> configureextra_rename
> >>> -
> >>> -    # make sure configure finds python includdirs/libs with these en=
vs
> >>> -    export BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> >>> -        STAGING_INCDIR=3D${STAGING_INCDIR} \
> >>> -        STAGING_LIBDIR=3D${STAGING_LIBDIR}
> >>> -
> >>> -    autotools_do_configure
> >>> -}
> >>> -
> >>> -do_compile_prepend() {
> >>> -    cd nDPI
> >>> -    oe_runmake
> >>> -    cd ..
> >>> -}
> >>> -
> >>> -do_install_append() {
> >>> -    # remove the empty dirs
> >>> -    rm -rf ${D}${libdir}/plugins
> >>> -
> >>> -    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
> >>> -        ${D}${sysconfdir}/init.d/ntop
> >>> -    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
> >>> -        ${D}${sysconfdir}/ntop.conf
> >>> -
> >>> -    # change ntop dir in ntop.conf
> >>> -    # don't use the -P as the ntop.init didn't support it
> >>> -    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path
> >>> /var/lib/ntop:" \
> >>> -        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
> >>> -        ${D}${sysconfdir}/ntop.conf
> >>> -
> >>> -    # For systemd
> >>> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> >>> 'false', d)}; then
> >>> -        install -D -m 0755 ${S}/packages/RedHat/ntop.init
> >>> ${D}${libexecdir}/ntop-helper
> >>> -        install -D -m 0644 ${WORKDIR}/ntop.service
> >>> ${D}${systemd_system_unitdir}/ntop.service
> >>> -        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
> >>> -            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> >>> -            ${D}${systemd_system_unitdir}/ntop.service
> >>> -    fi
> >>> -
> >>> -    # Fix host-user-contaminated issue
> >>> -    chown -R root:root ${D}
> >>> -
> >>> -    chown -R ntop.ntop ${D}${datadir}/ntop
> >>> -    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
> >>> -}
> >>> -
> >>> -USERADD_PACKAGES =3D "${PN}"
> >>> -USERADD_PARAM_${PN} =3D "-M -g ntop -r -d ${localstatedir}/lib/ntop \
> >>> --s /usr/sbin/nologin -c 'ntop' ntop"
> >>> -GROUPADD_PARAM_${PN} =3D "-r ntop"
> >>> -
> >>> -SYSTEMD_SERVICE_${PN} =3D "ntop.service"
> >>> -SYSTEMD_AUTO_ENABLE =3D "disable"
> >>> -
> >>> -FILES_${PN}_append =3D "${libdir}/ntop/plugins ${libdir}/libntop-*.s=
o \
> >>> -                      ${libdir}/libntopreport-*.so
> >>> ${libdir}/lib*-${PV}.so"
> >>> -FILES_${PN}-dev =3D "${includedir} ${libdir}/libntop.so \
> >>> -                   ${libdir}/libntopreport.so \
> >>> -                   ${libdir}/libnetflowPlugin.so
> >>> ${libdir}/libsflowPlugin.so \
> >>> -                   ${libdir}/librrdPlugin.so \
> >>> -                   ${libdir}/*.a ${libdir}/libntopreport.a
> >>> ${libdir}/*.la"
> >>> -
> >>> diff --git
> >>> a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-typ=
es.h.patch
> >>> b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-typ=
es.h.patch
> >>> new file mode 100644
> >>> index 000000000..3a6a76120
> >>> --- /dev/null
> >>> +++
> >>> b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-typ=
es.h.patch
> >>> @@ -0,0 +1,24 @@
> >>> +From 6543f3e2d5fe214e2fc6c050289bf1ae73b18724 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Wed, 30 Aug 2017 13:56:24 -0700
> >>> +Subject: [PATCH] nDPI: Include sys/types.h
> >>> +
> >>> +Needed for uint_t types
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + nDPI/src/include/ipq_api.h | 1 +
> >>> + 1 file changed, 1 insertion(+)
> >>> +
> >>> +Index: ntop-5.0.1/nDPI/src/include/ipq_api.h
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +--- ntop-5.0.1.orig/nDPI/src/include/ipq_api.h
> >>> ++++ ntop-5.0.1/nDPI/src/include/ipq_api.h
> >>> +@@ -24,6 +24,7 @@
> >>> + #ifndef __IPOQUE_API_INCLUDE_FILE__
> >>> + #define __IPOQUE_API_INCLUDE_FILE__
> >>> +
> >>> ++#include <sys/types.h>
> >>> +
> >>> + #if defined(HAVE_NTOP) && defined(WIN32)
> >>> + #include <winsock2.h>
> >>> diff --git a/meta-networking/recipes-support/ntop/ntop/support-arm64.=
patch
> >>> b/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
> >>> deleted file mode 100644
> >>> index 0b1e8afbc..000000000
> >>> --- a/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
> >>> +++ /dev/null
> >>> @@ -1,28 +0,0 @@
> >>> -Add support for arm64
> >>> -
> >>> -Upstream-Status: Inappropriate [no longer maintained]
> >>> -
> >>> -Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> >>> -
> >>> -diff --git a/nDPI/config.sub.old b/nDPI/config.sub
> >>> -index c2d1257..e4347ac 100755
> >>> ---- a/nDPI/config.sub.old
> >>> -+++ b/nDPI/config.sub
> >>> -@@ -249,7 +249,7 @@ case $basic_machine in
> >>> -       | alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5=
[67]
> >>> \
> >>> -       | alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] |
> >>> alpha64pca5[67] \
> >>> -       | am33_2.0 \
> >>> --      | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb=
] |
> >>> avr | avr32 \
> >>> -+      | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb=
] |
> >>> avr | avr32 | aarch64 \
> >>> -       | bfin \
> >>> -       | c4x | clipper \
> >>> -       | d10v | d30v | dlx | dsp16xx \
> >>> -@@ -331,7 +331,7 @@ case $basic_machine in
> >>> -       | alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
> >>> -       | alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[7=
8]-*
> >>> \
> >>> -       | alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
> >>> --      | arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
> >>> -+      | arm-*  | armbe-* | armle-* | armeb-* | armv*-* | aarch64-* \
> >>> -       | avr-* | avr32-* \
> >>> -       | bfin-* | bs2000-* \
> >>> -       | c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x=
-* \
> >>> diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> >>> b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> >>> index 77b5e436f..298fbec61 100644
> >>> --- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> >>> +++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
> >>> @@ -1,4 +1,137 @@
> >>> -include ntop.inc
> >>> +SUMMARY =3D "ntop is network top"
> >>> +DESCRIPTION =3D "ntop is a network traffic probe that shows the netw=
ork
> >>> usage, \
> >>> +similar to what the popular top Unix command does."
> >>>
> >>> +SECTION =3D "console/network"
> >>> +
> >>> +LICENSE =3D "GPLv2+ & GPLv3 & OpenSSL"
> >>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
> >>> +
> >>> file://LICENSE-OpenSSL.txt;md5=3Da409f902e447ddd889cffa0c70e7c7c2 \
> >>> +                   "
> >>> +
> >>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
> >>> +           file://ntop_configure_in.patch \
> >>> +           file://ntop_init.patch \
> >>> +           file://ntop_webInterface.patch \
> >>> +           file://ntop_configure_in_net_snmp_config_exist.patch \
> >>> +           file://ntop.service \
> >>> +           file://use-static-inline.patch \
> >>> +           file://0001-nDPI-Include-sys-types.h.patch \
> >>> +          "
> >>>  SRC_URI[md5sum] =3D "01710b6925a8a5ffe1a41b8b512ebd69"
> >>>  SRC_URI[sha256sum] =3D
> >>> "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
> >>> +
> >>> +inherit autotools-brokensep useradd pythonnative pkgconfig systemd
> >>> +
> >>> +DEPENDS =3D "geoip rrdtool python zlib libpcap gdbm"
> >>> +
> >>> +PACKAGECONFIG ??=3D "openssl snmp plugins"
> >>> +PACKAGECONFIG[openssl] =3D "--with-ssl, --without-ssl, openssl, open=
ssl"
> >>> +PACKAGECONFIG[snmp] =3D "--enable-snmp=3Dyes
> >>> NETSNMP=3D${STAGING_BINDIR_CROSS}/net-snmp-config, \
> >>> +--disable-snmp,net-snmp,"
> >>> +PACKAGECONFIG[plugins] =3D "--enable-plugins=3Dyes, --disable-plugin=
s, ,"
> >>> +
> >>> +EXTRA_OECONF +=3D "ac_cv_file_aclocal_m4=3Dyes ac_cv_file_depcomp=3D=
no"
> >>> +
> >>> +do_configure() {
> >>> +    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
> >>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
> >>> ${S}
> >>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub =
${S}
> >>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
> >>> ${S}/nDPI
> >>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub
> >>> ${S}/nDPI
> >>> +    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.=
m4
> >>> +    cp 3rd_party/* ./
> >>> +
> >>> +    # config nDPI
> >>> +    cd nDPI
> >>> +    ./configure ${CONFIGUREOPTS} --with-pic
> >>> +    cd ..
> >>> +
> >>> +    sed -i -e
> >>> 's:^CFG_DBFILE_DIR=3D$localstatedir/ntop:CFG_DBFILE_DIR=3D$localstate=
dir/lib/ntop:'
> >>> ${S}/configure.in
> >>> +
> >>> +    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
> >>> +    sed -i \
> >>> +        -e 's:\(^CFLAGS=3D"\$.*\) -I/usr/local/include
> >>> -I/opt/local/include":\1":' \
> >>> +        -e 's:\(^CPPFLAGS=3D"\$.*\) -I/usr/local/include
> >>> -I/opt/local/include":\1":' \
> >>> +        -e 's:\(^LDFLAGS=3D"\$.*\) -L/usr/local/lib -L/opt/local/lib=
":\1":'
> >>> \
> >>> +        ${S}/configure.in
> >>> +
> >>> +    # replace the DISTRO RELEASE in configure.in which are host's
> >>> +    # with our release, although those doesn't affect functionality
> >>> +    sed -i -e \
> >>> +
> >>> '/DEFINEOS=3D"LINUX"/{N;s/DISTRO=3D.*/DISTRO=3D"${DISTRO}"/;N;s/RELEA=
SE=3D.*/RELEASE=3D"${DISTRO_VERSION}"/;}'
> >>> \
> >>> +        ${S}/configure.in
> >>> +
> >>> +    # osName in original configure.in should be ${TARGET_SYS}
> >>> +    # which will show in ntop's "show configuration"
> >>> +    sed -i -e \
> >>> +        's:^osName=3D.*:osName=3D${TARGET_SYS}:' \
> >>> +        ${S}/configure.in
> >>> +
> >>> +    # rename configureextra to configureextra_rename to avoid
> >>> +    # configure.in to guess host OS and pull in more configure, non
> >>> needed
> >>> +    # which will cause some cross-compiling failure on specific host
> >>> +    # e.g. SUSE(SLED...)
> >>> +    test ! -f configureextra || mv -f configureextra
> >>> configureextra_rename
> >>> +
> >>> +    # make sure configure finds python includdirs/libs with these en=
vs
> >>> +    export BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> >>> +        STAGING_INCDIR=3D${STAGING_INCDIR} \
> >>> +        STAGING_LIBDIR=3D${STAGING_LIBDIR}
> >>> +
> >>> +    autotools_do_configure
> >>> +}
> >>> +
> >>> +do_compile_prepend() {
> >>> +    cd nDPI
> >>> +    oe_runmake
> >>> +    cd ..
> >>> +}
> >>> +
> >>> +do_install_append() {
> >>> +    # remove the empty dirs
> >>> +    rm -rf ${D}${libdir}/plugins
> >>> +
> >>> +    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
> >>> +        ${D}${sysconfdir}/init.d/ntop
> >>> +    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
> >>> +        ${D}${sysconfdir}/ntop.conf
> >>> +
> >>> +    # change ntop dir in ntop.conf
> >>> +    # don't use the -P as the ntop.init didn't support it
> >>> +    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path
> >>> /var/lib/ntop:" \
> >>> +        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
> >>> +        ${D}${sysconfdir}/ntop.conf
> >>> +
> >>> +    # For systemd
> >>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> >>> 'false', d)}; then
> >>> +        install -D -m 0755 ${S}/packages/RedHat/ntop.init
> >>> ${D}${libexecdir}/ntop-helper
> >>> +        install -D -m 0644 ${WORKDIR}/ntop.service
> >>> ${D}${systemd_system_unitdir}/ntop.service
> >>> +        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
> >>> +            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> >>> +            ${D}${systemd_system_unitdir}/ntop.service
> >>> +    fi
> >>> +
> >>> +    # Fix host-user-contaminated issue
> >>> +    chown -R root:root ${D}
> >>> +
> >>> +    chown -R ntop.ntop ${D}${datadir}/ntop
> >>> +    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
> >>> +}
> >>> +
> >>> +USERADD_PACKAGES =3D "${PN}"
> >>> +USERADD_PARAM_${PN} =3D "-M -g ntop -r -d ${localstatedir}/lib/ntop \
> >>> +-s /usr/sbin/nologin -c 'ntop' ntop"
> >>> +GROUPADD_PARAM_${PN} =3D "-r ntop"
> >>> +
> >>> +SYSTEMD_SERVICE_${PN} =3D "ntop.service"
> >>> +SYSTEMD_AUTO_ENABLE =3D "disable"
> >>> +
> >>> +FILES_${PN}_append =3D "${libdir}/ntop/plugins ${libdir}/libntop-*.s=
o \
> >>> +                      ${libdir}/libntopreport-*.so
> >>> ${libdir}/lib*-${PV}.so"
> >>> +FILES_${PN}-dev =3D "${includedir} ${libdir}/libntop.so \
> >>> +                   ${libdir}/libntopreport.so \
> >>> +                   ${libdir}/libnetflowPlugin.so
> >>> ${libdir}/libsflowPlugin.so \
> >>> +                   ${libdir}/librrdPlugin.so \
> >>> +                   ${libdir}/*.a ${libdir}/libntopreport.a
> >>> ${libdir}/*.la"
> >>> +
> >>> --
> >>> 2.14.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWapUOwAKCRA3VSO3ZXaA
HFzPAJ9pbvOEGCorryiQ40H1J9gEdc1qUgCeMZtHAEVcPNxAcfg+naPhmlAdV84=
=4KPm
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
