Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3F172E08
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:11:03 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id p6so12221415qcv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 07:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oSTUNEJzqzcm1bO5OtnornyfFxNriMwW8nS1jnnosHE=;
	b=be+wd/YWtz55gOGhJp08Y+tVLzkcESnmMhjxvX+MVGx0xdaizlHIo5Bp4jBRJbLb2a
	Jt4t2nNwEDBn3c9MaZj8RKwN+kLUxwejLjxFNccQ/EweSO4UX0QtBUGhW/SLf8stQn3G
	TE1CzhgkmjzzmoR1vU/QUwr+EOjsWaGHFwOCK7B76burABoo6RAJdH3IzZyNWl43wwxg
	+WhE8NhQcpbdKj9LntVLbniqNoCsBYm6qvhB4gRBQEZhWTfDEnS9XnkQiF/WUOtxtnj9
	jgqshLxqDKgHWG+P2S+N7pHczGqjNFoVsocsDatSpr+JSk1llPyyVzXVq5MiUP1RtXbH
	f+QA==
MIME-Version: 1.0
X-Received: by 10.224.120.10 with SMTP id b10mr9312869qar.19.1423235464234;
	Fri, 06 Feb 2015 07:11:04 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Fri, 6 Feb 2015 07:11:04 -0800 (PST)
In-Reply-To: <20150205163534.GA2444@jama>
References: <1423075209-24723-1-git-send-email-danismostlikely@gmail.com>
	<1423153384-25662-1-git-send-email-danismostlikely@gmail.com>
	<20150205163534.GA2444@jama>
Date: Fri, 6 Feb 2015 09:11:04 -0600
Message-ID: <CACS+7ZS2ZSbpZCjCXKW_YOWx1DUaMOAGrEEHUe4RPg=LA6t_6A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Fri, 06 Feb 2015 15:11:12 -0000
Content-Type: text/plain; charset=UTF-8

On 5 February 2015 at 10:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Feb 05, 2015 at 10:23:04AM -0600, Dan McGregor wrote:
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> I've only tested the build with armv7 and x86, but the build
>> doesn't segfault anymore. The last time this was tested was
>> with qemu 1.5, we're now using 2.1.
>>
>> While here, don't copy stuff from the sysroot into the qemu tree
>> just use the sysroot itself.
>>
>> Also disable X11 support by default. There is still an issue
>> seen by multiple people where an emacs built with X11 support
>> will hang when run outside of X.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>>  meta-oe/recipes-support/emacs/emacs.inc     | 91 +----------------------------
>>  meta-oe/recipes-support/emacs/emacs_23.4.bb |  2 -
>>  2 files changed, 3 insertions(+), 90 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
>> index a1a4965..c1d50f2 100644
>> --- a/meta-oe/recipes-support/emacs/emacs.inc
>> +++ b/meta-oe/recipes-support/emacs/emacs.inc
>> @@ -14,14 +14,13 @@ X11DEPENDS = " \
>>      libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes \
>>      libxft libxpm libxrandr libxrender \
>>      gdk-pixbuf glib-2.0 gtk+ pango libxcb harfbuzz icu \
>> -"
>> +"
>>
>>  EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
>>
>> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> +PACKAGECONFIG ??= ""
>>  PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x --without-dbus,${X11DEPENDS}"
>>
>> -
>>  inherit autotools
>>
>>  PACKAGES =+ "${PN}-el"
>> @@ -33,15 +32,13 @@ FILES_${PN} += "${datadir}/emacs ${datadir}/icons"
>>
>>  FILES_${PN}-dbg += "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/*/.debug"
>>
>> -TREEDIR = "${WORKDIR}/qemu-treedir"
>> -
>>  QEMUARCH= "${TARGET_ARCH}"
>>  QEMUARCH_i486 = "i386"
>>  QEMUARCH_i586 = "i386"
>>  QEMUARCH_i686 = "i386"
>>
>>  # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
>> -QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
>> +QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_HOST} "
>
> We were using STAGING_DIR_HOST before, but it was causing some issues:
> see oe-classic commit which introduced TREEDIR:
> http://git.openembedded.org/openembedded/commit/?h=cbf539f8e7431241e28b77394d33b764f7b0463b
>
> Are you sure that this issue won't re-appear?

Thanks for pointing me there. I couldn't for the life of me figure out
why it was done that way to begin with. The only way I could see that
issue coming up again is if libgcc_s.so.1 is an absolute symlink or if
it has a missing target.

I would really like to hear if somebody can still reproduce it. I
haven't been able to on beaglebone, wandboard-quad, qemuppc, or
qemux86,


>
>>  export LOGNAME = "$(whoami)"
>>
>> @@ -52,88 +49,6 @@ do_compile_prepend() {
>>      ln -sf ../src/emacs lisp/emacs
>>      ln -sf ../src/emacs lib-src/emacs
>>      ln -sf ../src/emacs leim/emacs
>> -#copy STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copied code from glibc-package.bbclass
>> -    treedir=${TREEDIR}
>> -    if [ -e $treedir ];then
>> -        rm -rf $treedir
>> -    fi
>> -
>> -    mkdir -p $treedir/${base_libdir}
>> -
>> -    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]; then
>> -        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so $treedir/${base_libdir}
>> -    fi
>> -    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* ]; then
>> -        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* $treedir/${base_libdir}
>> -    fi
>> -    # stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
>> -    # temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
>> -    if [ ! -f $treedir/${base_libdir}/libc.so ]; then
>> -        ln -s libc.so.6 $treedir/${base_libdir}/libc.so
>> -    fi
>> -
>> -    # copy only as much stuff as we need
>> -    # before: 5.5G   ../../qemu-treedir/
>> -    # after:   17M   ../../qemu-treedir/
>> -    cp -pPR \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/ld-* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libc.* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libc-* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libm-* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libm.* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libtinfo.so.* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libdl* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/librt* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
>> -    ${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_libdir}/
>> -
>> -    if [ ! -z "${@base_contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" ] ; then
>> -        echo "X11 build enabled"
>> -        # copy only as much stuff as we need
>> -        # before: 5.5G   ../../qemu-treedir/
>> -        # after:   86M   ../../qemu-treedir/
>> -        cp -pPR \
>> -        ${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
>> -        ${STAGING_DIR_TARGET}/${base_libdir}/libz.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libpng1*.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libcroco-0.6.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libharfbuzz.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libicule.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libicuuc.so.* \
>> -        ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* $treedir/${base_libdir}/
>> -
>> -        # X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr Xrender
>> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${base_libdir}/
>> -
>> -        # gdk-x11 gdk_pixbuf gio glib gmodule gobject gthread gtk-x11
>> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/${base_libdir}/
>> -
>> -        # pango pangocairo pangoft2
>> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.* $treedir/${base_libdir}/
>> -
>> -        # xcb-render xcb-shm xcb
>> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${base_libdir}/
>> -    fi
>>  }
>>
>>  do_install_append() {
>> diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
>> index a324828..36e8f0c 100644
>> --- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
>> +++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
>> @@ -2,8 +2,6 @@ require emacs.inc
>>
>>  PR = "r4"
>>
>> -PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
>> -
>>  SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
>>             file://use-qemu.patch \
>>             file://nostdlib-unwind.patch \
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

