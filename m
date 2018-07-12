Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id E53F976084
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 14:15:17 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id t4-v6so16315098vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PQbfJT4Z68g7DBUb/Gsecsa0hnBGbzLiGsO11viFF9o=;
	b=sxv2NLQKyzcVf1HHI+Reb/Fl2MDvgBDeYIS5ImGBctVR12KFXL7nfYb6dz3rWRa7Kn
	nfN0RqywcGyxs8ub+5vb70GHyJmY6bH3ty1tdPvsDVCJ5a0RVHBrfvCrZ6NQoS7fD8kO
	5jAZpHTlEeXu3UhxsfeycuTX9eBvJekkLfX3VUbtnMhBRVT9mhZ0OxILl8Jz/TOrhd3K
	xIXlrXrSd0Wor9eAJfrca+tTs8hQT054Px4H7Dj8ETENNSShPbWt6HiJ5nSPMH2p7C2X
	xIuQNm/L4nGoRzEz6ShL9Yw/YaSBmXQzyqlc4YepQYjKyL0+PypW/iL0WUkH63EYwV10
	Mqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PQbfJT4Z68g7DBUb/Gsecsa0hnBGbzLiGsO11viFF9o=;
	b=sAvD0jm4SK3iCQTa2u2y2N4LiwVvwdRU9xzhxk7ms3wgJ7NQd2sm5zAoKkzdid1f5O
	Lz9i9JcVqd6VGcoI3bNPbq8Y5zjGQd+vmryi9cjVT9kMGpca7yJ1POVbMUBSf+LMXRYJ
	ncP1h7xNrXc8X1x3fHh5SB0Yoly6lgpF7uASJj5fW4EGsk/8GS0YZOiQxU99larhoSu+
	zaxFNsa4rpNj0ejIJvzyhaXATeadNptLvSflb3VWtIgcD9kFaXLDuAPRGgNUCbgIeHcz
	BjvI2pDtkcNXwQVJd+P2dt4+zAbLbAfr6m+ljHhccajmXAHwA8PB3LhQVukIn2ECOEbS
	O+xA==
X-Gm-Message-State: AOUpUlGUxjc2RyZTwAlRwmJeLPVDAkvA6m5ARVrghaRYrLcpQ3lPGEP5
	iuYCYQoTB4SBdn1P+z0uB8cu0Qlztz+s5v8SvIghsw==
X-Google-Smtp-Source: AAOMgpcxZnEih2GFpLb5YZY+veARFpjG/5QfKWj7od3EeEmpb+gpxOtAFLrAJo6c1sieTDSaH1n42UNLqWZqHjcvWh0=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr1316481vkh.4.1531404918318; 
	Thu, 12 Jul 2018 07:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <1530984352-5594-1-git-send-email-jkrishnanjanappa@mvista.com>
In-Reply-To: <1530984352-5594-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jul 2018 08:14:52 -0600
Message-ID: <CAMKF1sqb2w1WUW4Y+AeVdE986b4Vf0VNCAZbcC0iEjduvLghag@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tgt: Migrate recipe from meta-openstack layer
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
X-List-Received-Date: Thu, 12 Jul 2018 14:15:18 -0000
Content-Type: text/plain; charset="UTF-8"

I guess more recipes needs to be migrated. This fails with

ERROR: Nothing RPROVIDES 'libconfig-general-perl' (but
/mnt/a/oe/sources/meta-openembedded/meta-networking/recipes-support/tgt/tgt_git.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'libconfig-general-perl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libconfig-general-perl']
NOTE: Runtime target 'tgt' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['tgt', 'libconfig-general-perl']
ERROR: Nothing RPROVIDES 'tgt-dev' (but
/mnt/a/oe/sources/meta-openembedded/meta-networking/recipes-support/tgt/tgt_git.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'tgt-dev'
NOTE: Runtime target 'tgt-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['tgt-dev']


On Sat, Jul 7, 2018 at 11:26 AM Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
>
> As iscsitarget cannot be built with Linux kernel >= 4.14, so
> migrate Linux SCSI target framework (tgt) recipe from meta-openstack
> layer; to allow users to test iSCSI target feature with tgt in
> meta-networking layer.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  ...-path-of-header-files-check-in-Yocto-buil.patch |  47 +++++++++
>  .../tgt/files/0001-usr-Makefile-WARNING-fix.patch  |  29 ++++++
>  .../recipes-support/tgt/files/tgtd.init            | 116 +++++++++++++++++++++
>  ...Makefile-apply-LDFLAGS-to-all-executables.patch |  35 +++++++
>  meta-networking/recipes-support/tgt/tgt_git.bb     |  73 +++++++++++++
>  5 files changed, 300 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
>  create mode 100644 meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
>  create mode 100644 meta-networking/recipes-support/tgt/files/tgtd.init
>  create mode 100644 meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
>  create mode 100644 meta-networking/recipes-support/tgt/tgt_git.bb
>
> diff --git a/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> new file mode 100644
> index 0000000..173ecb6
> --- /dev/null
> +++ b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> @@ -0,0 +1,47 @@
> +From 93fea40915d01be6d02587a0b8be85a642e6a8d5 Mon Sep 17 00:00:00 2001
> +From: Zhenhua Luo <zhenhua.luo@freescale.com>
> +Date: Thu, 10 Apr 2014 11:26:39 +0800
> +Subject: [PATCH] Correct the path of header files check in Yocto build env
> +
> +Upstream-Status: Inappropriate [the fix is specific to Yocto build env]
> +
> +Current Makefile will check headers on host instead of Yocto sysroot, following
> +error appears. Change the path of header check.
> +| bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
> +| #include <libaio.h>
> +|                     ^
> +| compilation terminated.
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> +
> +---
> + usr/Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/usr/Makefile b/usr/Makefile
> +index decf13c..9ff8f15 100644
> +--- a/usr/Makefile
> ++++ b/usr/Makefile
> +@@ -1,11 +1,11 @@
> + sbindir ?= $(PREFIX)/sbin
> + libdir ?= $(PREFIX)/lib/tgt
> +
> +-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo 1),)
> + CFLAGS += -DUSE_SIGNALFD
> + endif
> +
> +-ifneq ($(shell test -n $(shell find /usr/include -name "timerfd.h" | head -n1) && echo 1),)
> ++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -name "timerfd.h" | head -n1) && echo 1),)
> + CFLAGS += -DUSE_TIMERFD
> + endif
> +
> +@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
> + CFLAGS += -DUSE_SYSTEMD
> + endif
> +
> +-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e /usr/include/libaio.h && echo 1),)
> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h && test -e $(SYSROOT)/usr/include/libaio.h && echo 1),)
> + CFLAGS += -DUSE_EVENTFD
> + TGTD_OBJS += bs_aio.o
> + LIBS += -laio
> diff --git a/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
> new file mode 100644
> index 0000000..078ba9e
> --- /dev/null
> +++ b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
> @@ -0,0 +1,29 @@
> +From 6f4e3b11c7dccf83e2d18635c84837b212dfcc1c Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Sun, 26 Jul 2015 04:23:51 +0900
> +Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:
> + /work/i586-oe-linux/tgt/1.0.60+gitAUTOINC+ab51727a36-r0/
> + packages-split/tgt/usr/sbin/tgtd contains probably-redundant RPATH /usr/lib
> + [useless-rpaths]
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +
> +---
> + usr/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/usr/Makefile b/usr/Makefile
> +index 9ff8f15..cc8df11 100644
> +--- a/usr/Makefile
> ++++ b/usr/Makefile
> +@@ -63,7 +63,7 @@ TGTD_OBJS += tgtd.o mgmt.o target.o scsi.o log.o driver.o util.o work.o \
> +
> + TGTD_DEP = $(TGTD_OBJS:.o=.d)
> +
> +-LDFLAGS = -Wl,-E,-rpath=$(libdir)
> ++LDFLAGS += -Wl,-E
> +
> + .PHONY:all
> + all: $(PROGRAMS) $(MODULES)
> diff --git a/meta-networking/recipes-support/tgt/files/tgtd.init b/meta-networking/recipes-support/tgt/files/tgtd.init
> new file mode 100644
> index 0000000..4b0ce94
> --- /dev/null
> +++ b/meta-networking/recipes-support/tgt/files/tgtd.init
> @@ -0,0 +1,116 @@
> +#!/bin/sh
> +
> +### BEGIN INIT INFO
> +# Provides: tgtd
> +# Required-Start: $remote_fs $network $syslog
> +# Required-Stop: $remote_fs $syslog
> +# Default-Start:     3 5
> +# Default-Stop:      0 1 2 6
> +# Short-Description: SCSI target daemon
> +# Description: Linux SCSI target framework (tgt)
> +### END INIT INFO
> +
> +DESC="tgtd"
> +DAEMON="/usr/sbin/tgtd"
> +TGTD_CONFIG=/etc/tgt/targets.conf
> +
> +start ()
> +{
> +    echo -n "Starting $DESC..."
> +
> +    # Ensure service isn't running
> +    tgt-admin -s >/dev/null 2>&1
> +    RETVAL=$?
> +    if [ "$RETVAL" -ne 107 ] ; then
> +        echo "$DESC is already running."
> +        exit 1
> +    fi
> +
> +    # Start tgtd first
> +    $DAEMON &>/dev/null
> +    RETVAL=$?
> +    if [ "$RETVAL" -ne 0 ]; then
> +        echo "failed."
> +        exit 1
> +    fi
> +
> +    # Put tgtd into "offline" state until all the targets are configured.
> +    # We don't want initiators to (re)connect and fail the connection
> +    # if it's not ready.
> +    tgtadm --op update --mode sys --name State -v offline
> +    # Configure the targets.
> +    tgt-admin -f -e -c $TGTD_CONFIG
> +    # Put tgtd into "ready" state.
> +    tgtadm --op update --mode sys --name State -v ready
> +
> +    echo "done."
> +}
> +
> +stop ()
> +{
> +    echo -n "Stopping $DESC..."
> +
> +    # Remove all targets. It only removes targets which are not in use.
> +    tgt-admin --update ALL -c /dev/null &>/dev/null
> +    # tgtd will exit if all targets were removed
> +    tgtadm --op delete --mode system &>/dev/null
> +    RETVAL=$?
> +    if [ "$RETVAL" -eq 107 ] ; then
> +        if [ "$TASK" != "restart" ] ; then
> +            return 1
> +        fi
> +    elif [ "$RETVAL" -ne 0 ] ; then
> +        echo "Some initiators are still connected - could not stop tgtd"
> +        return 2
> +    fi
> +    echo -n
> +}
> +
> +reload()
> +{
> +        echo "Reloading configuration of $DESC" "$NAME"
> +        # Update configuration for targets. Only targets which
> +        # are not in use will be updated.
> +        tgt-admin --update ALL -c $TGTD_CONFIG &>/dev/null
> +        RETVAL=$?
> +        if [ "$RETVAL" -eq 107 ] ; then
> +                echo "tgtd is not running"
> +                exit 1
> +        fi
> +}
> +
> +status()
> +{
> +        tgt-admin -s >/dev/null 2>&1
> +       RETVAL=$?
> +        if [ "$RETVAL" -eq 107 ] ; then
> +                echo "tgtd is not running"
> +        else
> +                echo "tgtd is running"
> +        fi
> +}
> +
> +case "$1" in
> +    start)
> +        start
> +        ;;
> +    stop)
> +        stop
> +        ;;
> +    restart|force-reload)
> +        stop
> +        start
> +        ;;
> +    reload)
> +        reload
> +        ;;
> +    status)
> +        status
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|force-reload|restart|status|reload}"
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
> new file mode 100644
> index 0000000..d480ef7
> --- /dev/null
> +++ b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
> @@ -0,0 +1,35 @@
> +From a815ac8ee16b344d9e24b445957f32bf2aafa532 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 5 Jan 2017 11:07:51 -0500
> +Subject: [PATCH] usr/Makefile: apply LDFLAGS to all executables
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + usr/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/usr/Makefile b/usr/Makefile
> +index cc8df11..c55fd68 100644
> +--- a/usr/Makefile
> ++++ b/usr/Makefile
> +@@ -78,7 +78,7 @@ TGTADM_OBJS = tgtadm.o concat_buf.o
> + TGTADM_DEP = $(TGTADM_OBJS:.o=.d)
> +
> + tgtadm: $(TGTADM_OBJS)
> +-      $(CC) $^ -o $@
> ++      $(CC) $^ -o $@ $(LDFLAGS)
> +
> + -include $(TGTADM_DEP)
> +
> +@@ -86,7 +86,7 @@ TGTIMG_OBJS = tgtimg.o libssc.o libcrc32c.o
> + TGTIMG_DEP = $(TGTIMG_OBJS:.o=.d)
> +
> + tgtimg: $(TGTIMG_OBJS)
> +-      $(CC) $^ -o $@
> ++      $(CC) $^ -o $@ $(LDFLAGS)
> +
> + -include $(TGTIMG_DEP)
> +
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-support/tgt/tgt_git.bb b/meta-networking/recipes-support/tgt/tgt_git.bb
> new file mode 100644
> index 0000000..9ca181a
> --- /dev/null
> +++ b/meta-networking/recipes-support/tgt/tgt_git.bb
> @@ -0,0 +1,73 @@
> +DESCRIPTION = "Linux SCSI target framework (tgt)"
> +HOMEPAGE = "http://stgt.sourceforge.net"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
> +DEPENDS = "sg3-utils"
> +
> +SRCREV = "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
> +PV = "1.0.67+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/fujita/tgt.git \
> +       file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
> +        file://0001-usr-Makefile-WARNING-fix.patch \
> +        file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
> +"
> +SRC_URI += "file://tgtd.init"
> +
> +S = "${WORKDIR}/git"
> +
> +CONFFILES_${PN} += "${sysconfdir}/tgt/targets.conf"
> +
> +inherit update-rc.d
> +
> +CFLAGS += ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE -DTGT_VERSION=\\"1.0.63\\" -DBSDIR=\\"${libdir}/backing-store\\"'
> +
> +#do_compile() {
> +#    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
> +#}
> +EXTRA_OEMAKE = "-e programs conf scripts"
> +
> +do_install() {
> +    oe_runmake -e DESTDIR="${D}" install-programs install-conf install-scripts
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/tgtd.init ${D}${sysconfdir}/init.d/tgtd
> +    fi
> +}
> +
> +RDEPENDS_${PN} = " \
> +    bash \
> +    libaio \
> +    libconfig-general-perl \
> +    perl-module-english \
> +    perl-module-tie-hash-namedcapture \
> +    perl-module-xsloader \
> +    perl-module-carp \
> +    perl-module-exporter \
> +    perl-module-errno \
> +    perl-module-exporter-heavy \
> +    perl-module-symbol \
> +    perl-module-selectsaver \
> +    perl-module-dynaloader \
> +    perl-module-carp-heavy \
> +    perl-module-filehandle \
> +    perl-module-feature \
> +    perl-module-overload \
> +    perl-module-fcntl \
> +    perl-module-io \
> +    perl-module-io-file \
> +    perl-module-io-handle \
> +    perl-module-io-seekable \
> +    perl-module-file-glob \
> +    perl-module-base \
> +    perl-module-encoding-warnings \
> +    perl-module-file-spec-unix \
> +    perl-module-file-spec \
> +    perl-module-file-spec-functions \
> +    perl-module-getopt-long \
> +    perl-module-constant \
> +    "
> +INITSCRIPT_PACKAGES = "${PN}"
> +INITSCRIPT_NAME_${PN} = "tgtd"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

