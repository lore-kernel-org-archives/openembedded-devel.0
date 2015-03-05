Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5F88865C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 13:18:21 +0000 (UTC)
Received: by wgha1 with SMTP id a1so2611642wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 05:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TgJFFZl6fjJ26zuyVsW3GMMXw4uXY8IXDxX0fMWakoE=;
	b=cIPmORa8eyo3kQR7iGz/WqacVCLDR7u+SsbVBOR6HDfCHGza3yn6QUQO476lm5Z18S
	z7GS0DT7bb/t+YOtWnwsq1vkFK6j0u66uugBS+vgQ79X8j13/5ckWRB+8Qj1yy9el9PC
	7QNF7epQM8bJ0996ee/knEdmvuWlOTQ4FG1+pJuEq+RYCan6p1bd4qf2oAsHa/Hbl08d
	WHftFOySmA6XyGnaYtXO6x844bHLA/P3/Vm90mffT5X3PInrLYE5k/t1JkF55bew3nBU
	t/Z/Hc1XfrYnXS+WdbwsxTWy0UvjMDhwQVG+zVZRz1cmYU6vl+T2lhDQNKsNS9seY4VS
	m4yA==
X-Received: by 10.180.184.230 with SMTP id ex6mr22218392wic.73.1425561502757; 
	Thu, 05 Mar 2015 05:18:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dz6sm8651301wib.0.2015.03.05.05.18.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 05:18:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 14:18:26 +0100
To: Baptiste DURAND <baptiste.durand@gmail.com>
Message-ID: <20150305131826.GQ2337@jama>
References: <1425559979-15196-1-git-send-email-baptiste.durand@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1425559979-15196-1-git-send-email-baptiste.durand@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] minidlna: Fix package and bump to version 1.1.4
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
X-List-Received-Date: Thu, 05 Mar 2015 13:18:22 -0000
X-Groupsio-MsgNum: 54643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WKQ7zUpzoH2KEHMN"
Content-Disposition: inline

--WKQ7zUpzoH2KEHMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 01:52:59PM +0100, Baptiste DURAND wrote:
> Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-multimedia/minidlna/minidlna.inc   | 36 +++++++++++++++
>  .../minidlna/minidlna/minidlna-daemon.init.d       | 54 ++++++++++++++++=
++++++
>  .../minidlna/minidlna/minidlna.service             | 10 ++++
>  .../recipes-multimedia/minidlna/minidlna_1.1.4.bb  |  6 +++
>  .../minidlna/minidlna/fix-makefile.patch           | 41 ----------------
>  .../search-for-headers-in-staging-dir.patch        | 48 ----------------=
---
>  .../nonworking/minidlna/minidlna_1.0.25.bb         | 19 --------
>  7 files changed, 106 insertions(+), 108 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/minidlna=
-daemon.init.d
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/minidlna=
=2Eservice
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
>  delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/minidl=
na/fix-makefile.patch
>  delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/minidl=
na/search-for-headers-in-staging-dir.patch
>  delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/minidl=
na_1.0.25.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-oe/r=
ecipes-multimedia/minidlna/minidlna.inc
> new file mode 100644
> index 0000000..f553acb
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> @@ -0,0 +1,36 @@
> +DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with the ai=
m of \
> +being fully compliant with DLNA/UPnP-AV clients."
> +LICENSE =3D "GPL-2.0|BSD"
> +DEPENDS =3D "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag lib=
vorbis"

Please set LICENSE_FLAGS_WHITELIST because of libav dependency, otherwise t=
he build
will fail with:

ERROR: Nothing PROVIDES 'libav' (but meta-oe/meta-oe/recipes-multimedia/min=
idlna/minidlna_1.1.4.bb DEPENDS on or otherwise requires it)
ERROR: libav was skipped: because it has a restricted license not whitelist=
ed in LICENSE_FLAGS_WHITELIST

> +
> +inherit gettext autotools-brokensep update-rc.d systemd
> +
> +SRC_URI =3D "git://git.code.sf.net/p/minidlna/git;branch=3Dmaster;module=
=3Dgit \
> +           file://minidlna-daemon.init.d \
> +           file://minidlna.service "
> +
> +S =3D "${WORKDIR}/git"
> +
> +# This remove "--exclude=3Dautopoint" option from autoreconf argument to=
 avoid
> +# configure.ac:30: error: required file './ABOUT-NLS' not found
> +EXTRA_AUTORECONF =3D ""
> +
> +do_install_append(){
> +	install -d ${D}${sysconfdir}
> +	install -m 0755 minidlna.conf ${D}${sysconfdir}
> +
> +# Systemd script
> +	install -d ${D}${nonarch_base_libdir}/systemd/system
> +	install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/=
systemd/system
> +
> +# Sysvinit script
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/ini=
t.d/minidlna
> +
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "minidlna.service"
> +
> +INITSCRIPT_NAME =3D "minidlna"
> +INITSCRIPT_PARAMS =3D "defaults 90"
> +
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon=
=2Einit.d b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.in=
it.d
> new file mode 100644
> index 0000000..9e64a20
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> @@ -0,0 +1,54 @@
> +#!/bin/sh
> +
> +NAME=3D"minidlna"
> +DAEMON=3D/usr/sbin/minidlnad
> +SCRIPTNAME=3D/etc/init.d/$NAME
> +PIDFILE=3D/var/run/$NAME.pid
> +CONF=3D/etc/$NAME.conf
> +ARGS=3D"-f $CONF"
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +start_function() {
> +
> +    export PATH=3D$PWD:$PATH
> +
> +    if [ -f ${PIDFILE} ]; then
> +        echo "$SCRIPTNAME already running with PID #`cat $PIDFILE` ( acc=
ording to ${PIDFILE} )";
> +        exit 0
> +    fi
> +   =20
> +    $DAEMON $ARGS
> +=20
> +    pid=3D$!
> +
> +    if [ "$pid" !=3D "" ]; then
> +        echo -n "$pid" > ${PIDFILE}
> +    fi
> +}
> +
> +stop_function() {
> +
> +    export PATH=3D$PWD:$PATH
> +
> +    if [ ! -e "${PIDFILE}" ]; then
> +        echo "${SCRIPTNAME} not running ( according to ${PIDFILE} )";
> +        exit 1;
> +    fi
> +    PID=3D`cat ${PIDFILE}`
> +    kill -INT ${PID}
> +    rm -f ${PIDFILE}
> +}
> +
> +case $1 in
> +    "start")
> +        start_function
> +        ;;
> +    "stop")
> +        stop_function
> +        ;;
> +    *)
> +    echo "Usage: $0 {start | stop}"
> +
> +esac
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.servic=
e b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
> new file mode 100644
> index 0000000..656100b
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DMinidlna Daemon
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Dnotify
> +ExecStart=3D/usr/sbin/minidlnad -f /etc/minidlna.conf
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb b/meta=
-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> new file mode 100644
> index 0000000..0531e69
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> @@ -0,0 +1,6 @@
> +require ${BPN}.inc
> +
> +SRCREV =3D "v1_1_4"
> +LIC_FILES_CHKSUM =3D "file://LICENCE.miniupnpd;md5=3Db0dabf9d8e0f871554e=
309d62ead8d2b"
> +SRC_URI[md5sum] =3D "d966256baf2f9b068b9de871ab5dade5"
> +SRC_URI[sha256sum] =3D "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23=
b55789be463f2851"
> diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-=
makefile.patch b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fi=
x-makefile.patch
> deleted file mode 100644
> index 96429fd..0000000
> --- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefil=
e.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Fix Makefile:
> -* don't overwrite CFLAGS but append to it
> -* use gcc as CC only if CC is not already defined
> -* use -I=3D to include paths
> -* fix compile of minidlna binary by removing ${LIBS} dependency
> -
> -Upstream-status: Pending
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -Index: minidlna-1.0.25/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- minidlna-1.0.25.orig/Makefile	2012-01-18 00:49:01.000000000 +0200
> -+++ minidlna-1.0.25/Makefile	2013-02-10 17:46:49.000000000 +0200
> -@@ -12,13 +12,13 @@
> - #
> - #CFLAGS =3D -Wall -O -D_GNU_SOURCE -g -DDEBUG
> - #CFLAGS =3D -Wall -g -Os -D_GNU_SOURCE
> --CFLAGS =3D -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 \
> --	 -I/usr/include/ffmpeg \
> --	 -I/usr/include/libavutil -I/usr/include/libavcodec -I/usr/include/lib=
avformat \
> --	 -I/usr/include/ffmpeg/libavutil -I/usr/include/ffmpeg/libavcodec -I/u=
sr/include/ffmpeg/libavformat
> -+CFLAGS +=3D -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 \
> -+	 -I=3D/usr/include/ffmpeg \
> -+	 -I=3D/usr/include/libavutil -I=3D/usr/include/libavcodec -I=3D/usr/in=
clude/libavformat \
> -+	 -I=3D/usr/include/ffmpeg/libavutil -I=3D/usr/include/ffmpeg/libavcode=
c -I=3D/usr/include/ffmpeg/libavformat
> - #STATIC_LINKING: CFLAGS +=3D -DSTATIC
> - #STATIC_LINKING: LDFLAGS =3D -static
> --CC =3D gcc
> -+CC ?=3D gcc
> - RM =3D rm -f
> - INSTALL =3D install
> -
> -@@ -64,7 +64,7 @@
> - 	$(INSTALL) -d $(ETCINSTALLDIR)
> - 	$(INSTALL) --mode=3D0644 minidlna.conf $(ETCINSTALLDIR)
> -
> --minidlna:	$(BASEOBJS) $(LNXOBJS) $(LIBS)
> -+minidlna:	$(BASEOBJS) $(LNXOBJS)
> - 	@echo Linking $@
> - 	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $(LNXOBJS) $(LIBS)
> -
> diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/sear=
ch-for-headers-in-staging-dir.patch b/meta-oe/recipes-multimedia/nonworking=
/minidlna/minidlna/search-for-headers-in-staging-dir.patch
> deleted file mode 100644
> index 573d88c..0000000
> --- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-=
headers-in-staging-dir.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Search for headers in STAGING_DIR_GOST.
> -
> -Upstream-status: Pending
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -Index: minidlna-1.0.25/genconfig.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- minidlna-1.0.25.orig/genconfig.sh	2012-01-21 02:34:13.000000000 +0200
> -+++ minidlna-1.0.25/genconfig.sh	2013-02-10 17:12:06.000000000 +0200
> -@@ -40,22 +40,22 @@
> -
> - # Detect if there are missing headers
> - # NOTE: This check only works with a normal distro
> --[ ! -e "/usr/include/sqlite3.h" ] && MISSING=3D"libsqlite3 $MISSING"
> --[ ! -e "/usr/include/jpeglib.h" ] && MISSING=3D"libjpeg $MISSING"
> --[ ! -e "/usr/include/libexif/exif-loader.h" ] && MISSING=3D"libexif $MI=
SSING"
> --[ ! -e "/usr/include/id3tag.h" ] && MISSING=3D"libid3tag $MISSING"
> --[ ! -e "/usr/include/ogg/ogg.h" ] && MISSING=3D"libogg $MISSING"
> --[ ! -e "/usr/include/vorbis/codec.h" ] && MISSING=3D"libvorbis $MISSING"
> --[ ! -e "/usr/include/FLAC/metadata.h" ] && MISSING=3D"libflac $MISSING"
> --[ ! -e "/usr/include/ffmpeg/avutil.h" -a \
> --  ! -e "/usr/include/libavutil/avutil.h" -a \
> --  ! -e "/usr/include/ffmpeg/libavutil/avutil.h" ] && MISSING=3D"libavut=
il $MISSING"
> --[ ! -e "/usr/include/ffmpeg/avformat.h" -a \
> --  ! -e "/usr/include/libavformat/avformat.h" -a \
> --  ! -e "/usr/include/ffmpeg/libavformat/avformat.h" ] && MISSING=3D"lib=
avformat $MISSING"
> --[ ! -e "/usr/include/ffmpeg/avcodec.h" -a \
> --  ! -e "/usr/include/libavcodec/avcodec.h" -a \
> --  ! -e "/usr/include/ffmpeg/libavcodec/avcodec.h" ] && MISSING=3D"libav=
codec $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/sqlite3.h" ] && MISSING=3D"libsql=
ite3 $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/jpeglib.h" ] && MISSING=3D"libjpe=
g $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/libexif/exif-loader.h" ] && MISSI=
NG=3D"libexif $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/id3tag.h" ] && MISSING=3D"libid3t=
ag $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ogg/ogg.h" ] && MISSING=3D"libogg=
 $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/vorbis/codec.h" ] && MISSING=3D"l=
ibvorbis $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/FLAC/metadata.h" ] && MISSING=3D"=
libflac $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avutil.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/libavutil/avutil.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavutil/avutil.h" ] && M=
ISSING=3D"libavutil $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avformat.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/libavformat/avformat.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavformat/avformat.h" ] =
&& MISSING=3D"libavformat $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avcodec.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/libavcodec/avcodec.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavcodec/avcodec.h" ] &&=
 MISSING=3D"libavcodec $MISSING"
> - if [ -n "$MISSING" ]; then
> - 	echo -e "\nERROR!  Cannot continue."
> - 	echo -e "The following required libraries are either missing, or are m=
issing development headers:\n"
> diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.=
25.bb b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
> deleted file mode 100644
> index 9264bc2..0000000
> --- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with the ai=
m of \
> -being fully compliant with DLNA/UPnP-AV clients."
> -LICENSE =3D "GPL-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db1a795ac1a06805cf8fd74920bc46=
b5c"
> -
> -DEPENDS =3D "flac libav jpeg sqlite3 libexif libogg libid3tag"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}_${PV}_src.tar.gz \
> -    file://search-for-headers-in-staging-dir.patch \
> -    file://fix-makefile.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "d966256baf2f9b068b9de871ab5dade5"
> -SRC_URI[sha256sum] =3D "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23=
b55789be463f2851"
> -
> -export STAGING_DIR_HOST
> -
> -inherit autotools
> -
> --=20
> 1.8.1.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WKQ7zUpzoH2KEHMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4V6IACgkQN1Ujt2V2gBwzrACeKRVwwb8DLRC9TsMMWvC8+FF6
z6wAn0rpjILWM1wPNZd9NjTYroGVtmo5
=PA3s
-----END PGP SIGNATURE-----

--WKQ7zUpzoH2KEHMN--
