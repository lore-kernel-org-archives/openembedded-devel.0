Return-Path: <baptiste.durand@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D45B17381B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:42:07 +0000 (UTC)
Received: by igbhl2 with SMTP id hl2so46326805igb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=y2eZATefuDwyZbMnHWLb84kF7T0XVv0juRG0LvzJl4Q=;
	b=cxXxUcJrk042fdkguVNgtIUh3sf76jM6URuPrzdpeIYmbPkrBlZkPFq2BPAVrka4oX
	2plp/2xj1g5hqSTKWitTOB7PqtiP68uKgGm14/dk5zkDLuxcJcWRAs/dmZyJQmZ6tbJm
	6FmqQd3HwxXdP1UXP6GbF0Mpj8AfgIcgRCGtOyI/CQXv3sw5+zXZZBmefyhW1EZyEHML
	OFs9Jz3xc3wRpUsyphuJQYVfZQ94uHavlg88xmWH0nTeeF4xTIOruadsOajq1/ize9Js
	HGaoXsTz6KvSEqsRCzdrDObRYggmYTGT8W5y3CxZzrH18HsJbuhiswhpElw/kMfBb8Ba
	EJ3g==
MIME-Version: 1.0
X-Received: by 10.107.9.213 with SMTP id 82mr2847618ioj.57.1425566528140; Thu,
	05 Mar 2015 06:42:08 -0800 (PST)
Received: by 10.107.3.72 with HTTP; Thu, 5 Mar 2015 06:42:08 -0800 (PST)
In-Reply-To: <CAB0T2v84Lagh0zqm2zcbQ9qkG1HpESyjTQZVkCk2XSALtHOmgw@mail.gmail.com>
References: <1425559979-15196-1-git-send-email-baptiste.durand@gmail.com>
	<20150305131826.GQ2337@jama>
	<CAB0T2v84Lagh0zqm2zcbQ9qkG1HpESyjTQZVkCk2XSALtHOmgw@mail.gmail.com>
Date: Thu, 5 Mar 2015 15:42:08 +0100
Message-ID: <CAB0T2v-ubnfJiiYEff9Q9h4+2oQPp2LHA_H6xv28QDQ9VT3ThA@mail.gmail.com>
From: Baptiste Durand <baptiste.durand@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 05 Mar 2015 14:42:10 -0000
Content-Type: text/plain; charset=UTF-8

Sorry Martin

I have just seen your recent change on mplayer2 recipes.
http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=522ee507725c0e5300af1856c481e93938be313f

You probably means LICENSE_FLAGS not LICENSE_FLAGS_WHITELIST

I will resend an update


2015-03-05 15:30 GMT+01:00 Baptiste Durand <baptiste.durand@gmail.com>:

>
>
> 2015-03-05 14:18 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
>
>> On Thu, Mar 05, 2015 at 01:52:59PM +0100, Baptiste DURAND wrote:
>> > Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta-oe/recipes-multimedia/minidlna/minidlna.inc   | 36 +++++++++++++++
>> >  .../minidlna/minidlna/minidlna-daemon.init.d       | 54
>> ++++++++++++++++++++++
>> >  .../minidlna/minidlna/minidlna.service             | 10 ++++
>> >  .../recipes-multimedia/minidlna/minidlna_1.1.4.bb  |  6 +++
>> >  .../minidlna/minidlna/fix-makefile.patch           | 41
>> ----------------
>> >  .../search-for-headers-in-staging-dir.patch        | 48
>> -------------------
>> >  .../nonworking/minidlna/minidlna_1.0.25.bb         | 19 --------
>> >  7 files changed, 106 insertions(+), 108 deletions(-)
>> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> >  create mode 100644
>> meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
>> >  create mode 100644
>> meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
>> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/
>> minidlna_1.1.4.bb
>> >  delete mode 100644
>> meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
>> >  delete mode 100644
>> meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
>> >  delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/
>> minidlna_1.0.25.bb
>> >
>> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> > new file mode 100644
>> > index 0000000..f553acb
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> > @@ -0,0 +1,36 @@
>> > +DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the
>> aim of \
>> > +being fully compliant with DLNA/UPnP-AV clients."
>> > +LICENSE = "GPL-2.0|BSD"
>> > +DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag
>> libvorbis"
>>
>> Please set LICENSE_FLAGS_WHITELIST because of libav dependency, otherwise
>> the build
>> will fail with:
>>
>> ERROR: Nothing PROVIDES 'libav' (but
>> meta-oe/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb DEPENDS on
>> or otherwise requires it)
>> ERROR: libav was skipped: because it has a restricted license not
>> whitelisted in LICENSE_FLAGS_WHITELIST
>>
>>
>
> Hello Martin
> I'm not sure to understand what do you mean exactly :S
>
> I thought this variable (LICENSE_FLAGS_WHITELIST)  should be used only in
> distro configuration or local.conf, not in a recipe.
>
>
> The purpose of this varaibel is to be able to build rootfs with or without
> commercial packages, is it correct?
>
> In my point of view , setting this variable to the value commercial
> directly in a recipe is not a good idea.
>
>
> BR
>
> Baptiste
>
>
>
> > +
>> > +inherit gettext autotools-brokensep update-rc.d systemd
>> > +
>> > +SRC_URI = "git://
>> git.code.sf.net/p/minidlna/git;branch=master;module=git \
>> > +           file://minidlna-daemon.init.d \
>> > +           file://minidlna.service "
>> > +
>> > +S = "${WORKDIR}/git"
>> > +
>> > +# This remove "--exclude=autopoint" option from autoreconf argument to
>> avoid
>> > +# configure.ac:30: error: required file './ABOUT-NLS' not found
>> > +EXTRA_AUTORECONF = ""
>> > +
>> > +do_install_append(){
>> > +     install -d ${D}${sysconfdir}
>> > +     install -m 0755 minidlna.conf ${D}${sysconfdir}
>> > +
>> > +# Systemd script
>> > +     install -d ${D}${nonarch_base_libdir}/systemd/system
>> > +     install -m 0755 ${WORKDIR}/minidlna.service
>> ${D}${nonarch_base_libdir}/systemd/system
>> > +
>> > +# Sysvinit script
>> > +     install -d ${D}${sysconfdir}/init.d
>> > +     install -m 0755 ${WORKDIR}/minidlna-daemon.init.d
>> ${D}${sysconfdir}/init.d/minidlna
>> > +
>> > +}
>> > +
>> > +SYSTEMD_SERVICE_${PN} = "minidlna.service"
>> > +
>> > +INITSCRIPT_NAME = "minidlna"
>> > +INITSCRIPT_PARAMS = "defaults 90"
>> > +
>> > diff --git
>> a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
>> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
>> > new file mode 100644
>> > index 0000000..9e64a20
>> > --- /dev/null
>> > +++
>> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
>> > @@ -0,0 +1,54 @@
>> > +#!/bin/sh
>> > +
>> > +NAME="minidlna"
>> > +DAEMON=/usr/sbin/minidlnad
>> > +SCRIPTNAME=/etc/init.d/$NAME
>> > +PIDFILE=/var/run/$NAME.pid
>> > +CONF=/etc/$NAME.conf
>> > +ARGS="-f $CONF"
>> > +
>> > +# Exit if the package is not installed
>> > +[ -x "$DAEMON" ] || exit 0
>> > +
>> > +start_function() {
>> > +
>> > +    export PATH=$PWD:$PATH
>> > +
>> > +    if [ -f ${PIDFILE} ]; then
>> > +        echo "$SCRIPTNAME already running with PID #`cat $PIDFILE` (
>> according to ${PIDFILE} )";
>> > +        exit 0
>> > +    fi
>> > +
>> > +    $DAEMON $ARGS
>> > +
>> > +    pid=$!
>> > +
>> > +    if [ "$pid" != "" ]; then
>> > +        echo -n "$pid" > ${PIDFILE}
>> > +    fi
>> > +}
>> > +
>> > +stop_function() {
>> > +
>> > +    export PATH=$PWD:$PATH
>> > +
>> > +    if [ ! -e "${PIDFILE}" ]; then
>> > +        echo "${SCRIPTNAME} not running ( according to ${PIDFILE} )";
>> > +        exit 1;
>> > +    fi
>> > +    PID=`cat ${PIDFILE}`
>> > +    kill -INT ${PID}
>> > +    rm -f ${PIDFILE}
>> > +}
>> > +
>> > +case $1 in
>> > +    "start")
>> > +        start_function
>> > +        ;;
>> > +    "stop")
>> > +        stop_function
>> > +        ;;
>> > +    *)
>> > +    echo "Usage: $0 {start | stop}"
>> > +
>> > +esac
>> > diff --git
>> a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
>> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
>> > new file mode 100644
>> > index 0000000..656100b
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
>> > @@ -0,0 +1,10 @@
>> > +[Unit]
>> > +Description=Minidlna Daemon
>> > +After=network.target
>> > +
>> > +[Service]
>> > +Type=notify
>> > +ExecStart=/usr/sbin/minidlnad -f /etc/minidlna.conf
>> > +
>> > +[Install]
>> > +WantedBy=multi-user.target
>> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
>> b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
>> > new file mode 100644
>> > index 0000000..0531e69
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
>> > @@ -0,0 +1,6 @@
>> > +require ${BPN}.inc
>> > +
>> > +SRCREV = "v1_1_4"
>> > +LIC_FILES_CHKSUM =
>> "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
>> > +SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
>> > +SRC_URI[sha256sum] =
>> "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
>> > diff --git
>> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
>> b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
>> > deleted file mode 100644
>> > index 96429fd..0000000
>> > ---
>> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
>> > +++ /dev/null
>> > @@ -1,41 +0,0 @@
>> > -Fix Makefile:
>> > -* don't overwrite CFLAGS but append to it
>> > -* use gcc as CC only if CC is not already defined
>> > -* use -I= to include paths
>> > -* fix compile of minidlna binary by removing ${LIBS} dependency
>> > -
>> > -Upstream-status: Pending
>> > -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> > -
>> > -Index: minidlna-1.0.25/Makefile
>> > -===================================================================
>> > ---- minidlna-1.0.25.orig/Makefile    2012-01-18 00:49:01.000000000
>> +0200
>> > -+++ minidlna-1.0.25/Makefile 2013-02-10 17:46:49.000000000 +0200
>> > -@@ -12,13 +12,13 @@
>> > - #
>> > - #CFLAGS = -Wall -O -D_GNU_SOURCE -g -DDEBUG
>> > - #CFLAGS = -Wall -g -Os -D_GNU_SOURCE
>> > --CFLAGS = -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
>> > --     -I/usr/include/ffmpeg \
>> > --     -I/usr/include/libavutil -I/usr/include/libavcodec
>> -I/usr/include/libavformat \
>> > --     -I/usr/include/ffmpeg/libavutil -I/usr/include/ffmpeg/libavcodec
>> -I/usr/include/ffmpeg/libavformat
>> > -+CFLAGS += -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
>> > -+     -I=/usr/include/ffmpeg \
>> > -+     -I=/usr/include/libavutil -I=/usr/include/libavcodec
>> -I=/usr/include/libavformat \
>> > -+     -I=/usr/include/ffmpeg/libavutil
>> -I=/usr/include/ffmpeg/libavcodec -I=/usr/include/ffmpeg/libavformat
>> > - #STATIC_LINKING: CFLAGS += -DSTATIC
>> > - #STATIC_LINKING: LDFLAGS = -static
>> > --CC = gcc
>> > -+CC ?= gcc
>> > - RM = rm -f
>> > - INSTALL = install
>> > -
>> > -@@ -64,7 +64,7 @@
>> > -     $(INSTALL) -d $(ETCINSTALLDIR)
>> > -     $(INSTALL) --mode=0644 minidlna.conf $(ETCINSTALLDIR)
>> > -
>> > --minidlna:   $(BASEOBJS) $(LNXOBJS) $(LIBS)
>> > -+minidlna:   $(BASEOBJS) $(LNXOBJS)
>> > -     @echo Linking $@
>> > -     @$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $(LNXOBJS) $(LIBS)
>> > -
>> > diff --git
>> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
>> b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
>> > deleted file mode 100644
>> > index 573d88c..0000000
>> > ---
>> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
>> > +++ /dev/null
>> > @@ -1,48 +0,0 @@
>> > -Search for headers in STAGING_DIR_GOST.
>> > -
>> > -Upstream-status: Pending
>> > -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> > -
>> > -Index: minidlna-1.0.25/genconfig.sh
>> > -===================================================================
>> > ---- minidlna-1.0.25.orig/genconfig.sh        2012-01-21
>> 02:34:13.000000000 +0200
>> > -+++ minidlna-1.0.25/genconfig.sh     2013-02-10 17:12:06.000000000
>> +0200
>> > -@@ -40,22 +40,22 @@
>> > -
>> > - # Detect if there are missing headers
>> > - # NOTE: This check only works with a normal distro
>> > --[ ! -e "/usr/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
>> > --[ ! -e "/usr/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
>> > --[ ! -e "/usr/include/libexif/exif-loader.h" ] && MISSING="libexif
>> $MISSING"
>> > --[ ! -e "/usr/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
>> > --[ ! -e "/usr/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
>> > --[ ! -e "/usr/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
>> > --[ ! -e "/usr/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
>> > --[ ! -e "/usr/include/ffmpeg/avutil.h" -a \
>> > --  ! -e "/usr/include/libavutil/avutil.h" -a \
>> > --  ! -e "/usr/include/ffmpeg/libavutil/avutil.h" ] &&
>> MISSING="libavutil $MISSING"
>> > --[ ! -e "/usr/include/ffmpeg/avformat.h" -a \
>> > --  ! -e "/usr/include/libavformat/avformat.h" -a \
>> > --  ! -e "/usr/include/ffmpeg/libavformat/avformat.h" ] &&
>> MISSING="libavformat $MISSING"
>> > --[ ! -e "/usr/include/ffmpeg/avcodec.h" -a \
>> > --  ! -e "/usr/include/libavcodec/avcodec.h" -a \
>> > --  ! -e "/usr/include/ffmpeg/libavcodec/avcodec.h" ] &&
>> MISSING="libavcodec $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/sqlite3.h" ] &&
>> MISSING="libsqlite3 $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/jpeglib.h" ] &&
>> MISSING="libjpeg $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/libexif/exif-loader.h" ] &&
>> MISSING="libexif $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/id3tag.h" ] &&
>> MISSING="libid3tag $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ogg/ogg.h" ] && MISSING="libogg
>> $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/vorbis/codec.h" ] &&
>> MISSING="libvorbis $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/FLAC/metadata.h" ] &&
>> MISSING="libflac $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avutil.h" -a \
>> > -+  ! -e "$STAGING_DIR_HOST/usr/include/libavutil/avutil.h" -a \
>> > -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavutil/avutil.h" ] &&
>> MISSING="libavutil $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avformat.h" -a \
>> > -+  ! -e "$STAGING_DIR_HOST/usr/include/libavformat/avformat.h" -a \
>> > -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavformat/avformat.h"
>> ] && MISSING="libavformat $MISSING"
>> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avcodec.h" -a \
>> > -+  ! -e "$STAGING_DIR_HOST/usr/include/libavcodec/avcodec.h" -a \
>> > -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavcodec/avcodec.h" ]
>> && MISSING="libavcodec $MISSING"
>> > - if [ -n "$MISSING" ]; then
>> > -     echo -e "\nERROR!  Cannot continue."
>> > -     echo -e "The following required libraries are either missing, or
>> are missing development headers:\n"
>> > diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/
>> minidlna_1.0.25.bb b/meta-oe/recipes-multimedia/nonworking/minidlna/
>> minidlna_1.0.25.bb
>> > deleted file mode 100644
>> > index 9264bc2..0000000
>> > --- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
>> > +++ /dev/null
>> > @@ -1,19 +0,0 @@
>> > -DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the
>> aim of \
>> > -being fully compliant with DLNA/UPnP-AV clients."
>> > -LICENSE = "GPL-2.0"
>> > -LIC_FILES_CHKSUM =
>> "file://LICENCE;md5=b1a795ac1a06805cf8fd74920bc46b5c"
>> > -
>> > -DEPENDS = "flac libav jpeg sqlite3 libexif libogg libid3tag"
>> > -
>> > -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}_${PV}_src.tar.gz \
>> > -    file://search-for-headers-in-staging-dir.patch \
>> > -    file://fix-makefile.patch \
>> > -"
>> > -
>> > -SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
>> > -SRC_URI[sha256sum] =
>> "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
>> > -
>> > -export STAGING_DIR_HOST
>> > -
>> > -inherit autotools
>> > -
>> > --
>> > 1.8.1.4
>> >
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>
>
>
> --
> Baptiste DURAND
>
>


-- 
Baptiste DURAND

