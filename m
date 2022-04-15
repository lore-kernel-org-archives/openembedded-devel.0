Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842C7C83026
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:04 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.8469.1650035348824367155
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 08:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oNtz5A4V;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id i14so6611852qvk.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0A2k9u6aOTIlvMPr8/P8a9nqb3C9/K64acd125tiBDA=;
        b=oNtz5A4VLd3nMdII5FDRS7h3ZbsXkc7PJ28rDaYsqjOzW09IJth6BBpQqcuB+Ey9/I
         MyXRgh9NjKd4Ngn/miNFGX+1ixNMrwaW4cLYwPs+RXdAncCMKlvjbjIt77GXzXCHovUD
         nXjjWCOSeMEiJKHAUhPDCtT0808e8ci91DpI3MeAH9fYiVeqxJN8mgra6s7Z+UHzYHKz
         eOeHV6tT3SbXDqKfkgLPj3FC7kdBEwTPvkF6Mes5ThhEQpLL6ri22UUBRTrbAAtEmOFQ
         vzf7GamSwV7vZJr+p56D4mSH2eICh35UC+3llNQa1sYnrZBdhku/Uof/GjuJ0o0FSZ3r
         vDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0A2k9u6aOTIlvMPr8/P8a9nqb3C9/K64acd125tiBDA=;
        b=l8uyV3gXLk8bezSgT9SJ7v2lXt3fwBQZgNnMu1TFIP7HFSI+ByCO3QULukvAUG4MG9
         3qYhTzZHpzlT3EOpf186UpdtFzEGWW9kE9vSt+cLQ5Nktok6NGnFpmEKdfh2JUSBUQyI
         xBhRIa9W5T7AYgyW2nuRLzuJOSPxi1e0qnI3tTl7t852EpYEYuV6qBsGM4wvPbooNvAF
         tMPq9bZ0/09ZS94T/zsQpOpUFpOzo/EoMt8NDMgbxXCA1HuzF/PjVZdKkl9XqyMIUQSE
         CQw587cWKKazfPAb9Tb/R9zaSoxv03gGRRj6KyrbTTPxddsZRCKB5kwY8YiNocZqZ079
         oXcg==
X-Gm-Message-State: AOAM531jX6AVQNp2/kPUZ+r/R+Z2oenpH3Tvg17Pq60WxyhNH/nx5vnw
	4iH9JutXIDvH5RFrFUQN1CW/hUJIfvBL1m8UiSTPyCMsw/4qWQ==
X-Google-Smtp-Source: 
 ABdhPJy7fGzE31/gLVWK+OB1P85e/OFMNW7kBwD3sJMyCCgPJ5PgBNHR4vXftpsocIlH2oERmQVr+Vg9GVXzs6dA47c=
X-Received: by 2002:ad4:44b4:0:b0:444:45d6:ec25 with SMTP id
 n20-20020ad444b4000000b0044445d6ec25mr8056351qvt.24.1650035347472; Fri, 15
 Apr 2022 08:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220415054504.647069-1-mingli.yu@windriver.com>
In-Reply-To: <20220415054504.647069-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Apr 2022 08:08:41 -0700
Message-ID: 
 <CAMKF1srNUtTXo2JkX4qF58PdZr1NnF7D3ssutUQ8DyX3A4FtBA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] tgt: move from meta-openstack
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96666

fails to build on musl
https://errors.yoctoproject.org/Errors/Details/655054/

On Thu, Apr 14, 2022 at 10:45 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> tgt is a substitute to iscsitarget [1].
>
> [1] https://git.openembedded.org/meta-openembedded/commit/?id=1e7e4e91817b272b7685406f8d9ef58fe8c65e29
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...-of-header-files-check-in-Yocto-buil.patch |  47 +++++++
>  .../files/0001-usr-Makefile-WARNING-fix.patch |  29 +++++
>  .../recipes-extended/tgt/files/tgtd           |   5 +
>  .../recipes-extended/tgt/files/tgtd.init      | 116 ++++++++++++++++++
>  .../recipes-extended/tgt/files/tgtd.service   |  33 +++++
>  ...ile-apply-LDFLAGS-to-all-executables.patch |  35 ++++++
>  .../recipes-extended/tgt/tgt_git.bb           |  92 ++++++++++++++
>  7 files changed, 357 insertions(+)
>  create mode 100644 meta-networking/recipes-extended/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
>  create mode 100644 meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch
>  create mode 100644 meta-networking/recipes-extended/tgt/files/tgtd
>  create mode 100644 meta-networking/recipes-extended/tgt/files/tgtd.init
>  create mode 100755 meta-networking/recipes-extended/tgt/files/tgtd.service
>  create mode 100644 meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
>  create mode 100644 meta-networking/recipes-extended/tgt/tgt_git.bb
>
> diff --git a/meta-networking/recipes-extended/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch b/meta-networking/recipes-extended/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
> new file mode 100644
> index 000000000..173ecb620
> --- /dev/null
> +++ b/meta-networking/recipes-extended/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
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
> diff --git a/meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch b/meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch
> new file mode 100644
> index 000000000..078ba9ef5
> --- /dev/null
> +++ b/meta-networking/recipes-extended/tgt/files/0001-usr-Makefile-WARNING-fix.patch
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
> diff --git a/meta-networking/recipes-extended/tgt/files/tgtd b/meta-networking/recipes-extended/tgt/files/tgtd
> new file mode 100644
> index 000000000..64df6a3eb
> --- /dev/null
> +++ b/meta-networking/recipes-extended/tgt/files/tgtd
> @@ -0,0 +1,5 @@
> +# options for tgtd
> +TGTD_OPTS=""
> +
> +# configuration file
> +TGTD_CONFIG=/etc/tgt/targets.conf
> diff --git a/meta-networking/recipes-extended/tgt/files/tgtd.init b/meta-networking/recipes-extended/tgt/files/tgtd.init
> new file mode 100644
> index 000000000..4b0ce9443
> --- /dev/null
> +++ b/meta-networking/recipes-extended/tgt/files/tgtd.init
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
> diff --git a/meta-networking/recipes-extended/tgt/files/tgtd.service b/meta-networking/recipes-extended/tgt/files/tgtd.service
> new file mode 100755
> index 000000000..afbd4b4ea
> --- /dev/null
> +++ b/meta-networking/recipes-extended/tgt/files/tgtd.service
> @@ -0,0 +1,33 @@
> +[Unit]
> +Description=tgtd iSCSI target daemon
> +After=network.target
> +
> +[Service]
> +EnvironmentFile=@SYSCONFDIR@/sysconfig/tgtd
> +
> +ExecStart=@SBINDIR@/tgtd -f $TGTD_OPTS
> +# see bz 848942. workaround for a race for now.
> +ExecStartPost=@BASE_BINDIR@/sleep 5
> +# Put tgtd into "offline" state until all the targets are configured.
> +# We don't want initiators to (re)connect and fail the connection
> +# if it's not ready.
> +ExecStartPost=@SBINDIR@/tgtadm --op update --mode sys --name State -v offline
> +# Configure the targets.
> +ExecStartPost=@SBINDIR@/tgt-admin -e -c $TGTD_CONFIG
> +# Put tgtd into "ready" state.
> +ExecStartPost=@SBINDIR@/tgtadm --op update --mode sys --name State -v ready
> +
> +# Update configuration for targets. Only targets which
> +# are not in use will be updated.
> +ExecReload=@SBINDIR@/tgt-admin --update ALL -c $TGTD_CONFIG
> +
> +# NOTE: Shutdown of the iscsi target may cause data corruption
> +# for initiators that are connected.
> +ExecStop=@SBINDIR@/tgtadm --op update --mode sys --name State -v offline
> +# Remove all targets. It only removes targets which are not in use.
> +ExecStop=@SBINDIR@/tgt-admin --update ALL -c /dev/null
> +# tgtd will exit if all targets were removed
> +ExecStop=@SBINDIR@/tgtadm --op delete --mode system
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch b/meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
> new file mode 100644
> index 000000000..d480ef786
> --- /dev/null
> +++ b/meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
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
> diff --git a/meta-networking/recipes-extended/tgt/tgt_git.bb b/meta-networking/recipes-extended/tgt/tgt_git.bb
> new file mode 100644
> index 000000000..9c5c24bf6
> --- /dev/null
> +++ b/meta-networking/recipes-extended/tgt/tgt_git.bb
> @@ -0,0 +1,92 @@
> +DESCRIPTION = "Linux SCSI target framework (tgt)"
> +HOMEPAGE = "http://stgt.sourceforge.net"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
> +DEPENDS = "sg3-utils libaio"
> +
> +SRCREV = "b43dbc6711e43c0a32cc4d9df22884841d911d51"
> +PV = "1.0.79+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
> +       file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
> +        file://0001-usr-Makefile-WARNING-fix.patch \
> +        file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
> +"
> +SRC_URI += "file://tgtd.init \
> +            file://tgtd.service \
> +            file://tgtd \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +CONFFILES:${PN} += "${sysconfdir}/tgt/targets.conf"
> +
> +inherit update-rc.d systemd
> +
> +SYSTEMD_SERVICE:${PN} = "tgtd.service"
> +SYSTEMD_AUTO_ENABLE:${PN} = "disable"
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
> +    elif ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/tgtd.service ${D}${systemd_unitdir}/system/tgtd.service
> +        install -d ${D}${sysconfdir}/sysconfig
> +        install -m 0644 ${WORKDIR}/tgtd ${D}${sysconfdir}/sysconfig/tgtd
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tgtd.service
> +        sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/tgtd.service
> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/tgtd.service
> +    fi
> +}
> +
> +FILES:${PN} += "${systemd_unitdir}/system/tgtd.service \
> +                ${sysconfdir}/sysconfig/tgtd \
> +"
> +
> +RDEPENDS:${PN} = " \
> +    bash \
> +    libaio \
> +    libconfig-general-perl \
> +    perl \
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
> +INITSCRIPT_NAME:${PN} = "tgtd"
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96662): https://lists.openembedded.org/g/openembedded-devel/message/96662
> Mute This Topic: https://lists.openembedded.org/mt/90481288/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

