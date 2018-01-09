Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id C7ADC6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 17:41:26 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id p124so5554097ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2018 09:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hwCVOQaAu9NVof1yj+H1BW7b0BhR+jv+tOFpIxwYnfY=;
	b=07SJRvmWeydQuMeYB4Xrp4wFAUfdr/yV/W7RY3p0PPsPb654t7UD1J0n7hd87d6ute
	qZSnVN5islIfDHtp0Sp5KI243K5WcohaEn2Fav6SJSxIAZQWAXR6kgDQoA1xkMRohWcX
	RQaLYMduIvl2/S+tXFHUPuU6FfpvbxgA7pc0hG1PmE5MyGfSPJ87hcp5f/re+HfFplW2
	5GM2Rz0YvuufayPcf8JiMdD/kDFibrsbF9NQ5jbloer7HWyKBHWzGFshGUOcmdANpJEw
	tffgMjCL7WhTq5eVwgw/P06OFOmLiziooUnJP0RrnnPsvPbWygFp/obNHoLahp+FVjWq
	L1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hwCVOQaAu9NVof1yj+H1BW7b0BhR+jv+tOFpIxwYnfY=;
	b=VbWyUv31eReA/dQGrVkUJ5lhkXNbn795CDagf8lK0mWTmDcO2xO2EwKp81KeSpkLdq
	Jy1yVNuQvMrG7he++Me3JDtVJ+UTdUl3p1VZF1j3SqRCgpPy28Z0ZI2S7vIO/5gB9TD5
	R80xxDgUWSSqsFXQSVvfv9BNDG0hTIuQebrq2VvF5wmt7DCkQMXeblCrqVE4SyrcI3vn
	IODtOt/wqBEAh3xwFDoNNWTtDWte2dBvqXIgvDsFQ9nuMAbJLWZKXMnIKcXkNfB69BLd
	UiIs1s0J2PWPFa8XSPuoRhGCqwueRNMuA+CX0b3+YlJFbVkVapl0k4gYvM8XrMdGN/wx
	X16g==
X-Gm-Message-State: AKGB3mJg5CKw7doM+64lI2JadqKmqfukUGUh/DAPIZFeK5+4sZPxofUy
	Hn52OZPZ8PUw1GtbgNPANu6jC+eGiUfIJ5K8ZrUYgQ==
X-Google-Smtp-Source: ACJfBouDZ49J0rJonOJlpocRS33vJZhYs2V6sYJ6L8zCVK+9b/xaCuK/kvyrpa42bAe2JwI9ZBzZZYQR0t9BGPOtIf8=
X-Received: by 10.36.157.133 with SMTP id f127mr15768867itd.61.1515519687375; 
	Tue, 09 Jan 2018 09:41:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.137.52 with HTTP; Tue, 9 Jan 2018 09:41:26 -0800 (PST)
In-Reply-To: <1515494589-11986-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1515494589-11986-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Tue, 9 Jan 2018 23:11:26 +0530
Message-ID: <CAD3vsf5dG6FcWY1AmN=3-kjnGbb2wW9cusOQRYDG4SLgjvgF=A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] open-vm-tools: add sysvinit script to start vmtoolsd daemon at boot time
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
X-List-Received-Date: Tue, 09 Jan 2018 17:41:27 -0000
Content-Type: text/plain; charset="UTF-8"

Please ignore this patch, I will send v2 to
1. to record PID of vmtoolsd in /var/pid/vmtools.pid.
2. check the status of vmtoolsd via init script.
3. restart vmtoolsd correctly.

Regards,
Jagadeesh

On Tue, Jan 9, 2018 at 4:13 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> It adds support to start vmtoolsd daemon during system startup,
> when init manager is SysVinit.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  .../open-vm-tools/files/vmtoolsd.init              | 66
> ++++++++++++++++++++++
>  .../open-vm-tools/open-vm-tools_10.1.5.bb          | 17 +++++-
>  2 files changed, 80 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-support/open-
> vm-tools/files/vmtoolsd.init
>
> diff --git a/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
> b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
> new file mode 100644
> index 0000000..b78b9f5
> --- /dev/null
> +++ b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
> @@ -0,0 +1,66 @@
> +#!/bin/sh
> +#
> +#   vmtoolsd          Start/stop the vmware tools daemon
> +#
> +# chkconfig:  2345 90 60
> +# description: vmtoolsd is a daemon that starts up.  for some reason, it
> +#              doesn't include a sysv init startup file in the latest
> release.
> +#              so i have to write this
> +#
> +
> +### BEGIN INIT INFO
> +# Provides: vmtoolsd
> +# Required-Start: $local_fs $syslog
> +# Required-Stop: $local_fs $syslog
> +# Default-Start: 2345
> +# Default-Stop: 90
> +# Short-Description: Run vmware tools daemon
> +### END INIT INFO
> +
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +DAEMON=/usr/bin/vmtoolsd
> +NAME=vmtoolsd
> +DESC="vmware tools daemon"
> +VMTOOLSDARGS=""
> +RETVAL="1"
> +
> +# source function library
> +. /etc/init.d/functions
> +
> +test -f $DAEMON || exit 0
> +
> +
> +case "$1" in
> +  start)
> +    echo -n "Starting vmware tools daemon: "
> +    start-stop-daemon --start --quiet --exec $DAEMON -- $VMTOOLSDARGS
> +    RETVAL=$?
> +    if [ $RETVAL -eq 0 ] ; then
> +        echo "OK"
> +    else
> +        echo "FAIL"
> +    fi
> +    ;;
> +  stop)
> +    echo -n "Stopping vmware tools daemon: "
> +    start-stop-daemon --stop --quiet --pidfile /var/run/vmtoolsd.pid
> +    RETVAL=$?
> +    if [ $RETVAL -eq 0 ] ; then
> +        echo "OK"
> +    else
> +        echo "FAIL"
> +    fi
> +    ;;
> +  status)
> +    status vmtoolsd
> +    exit $?
> +    ;;
> +  restart)
> +    $0 stop && sleep 1 && $0 start
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/vmtoolsd {start|stop|status|restart}"
> +    exit 1
> +esac
> +
> +exit $RETVAL
> diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
> b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
> index 81e8e96..e9e0f92 100644
> --- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
> +++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
> @@ -24,6 +24,7 @@ LICENSE_modules/solaris = "CDDL-1.0"
>  SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
>             file://tools.conf \
>             file://vmtoolsd.service \
> +           file://vmtoolsd.init \
>             file://0001-configure.ac-don-t-use-dnet-config.patch \
>             file://0002-add-include-sys-sysmacros.h.patch \
>             file://0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch
> \
> @@ -50,7 +51,7 @@ DEPENDS_append_libc-musl = " libtirpc"
>  # open-vm-tools is supported only on x86.
>  COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
>
> -inherit autotools pkgconfig systemd
> +inherit autotools pkgconfig systemd update-rc.d
>
>  SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
>
> @@ -85,8 +86,14 @@ RDEPENDS_${PN} = "util-linux libdnet fuse"
>
>  do_install_append() {
>      ln -sf ${sbindir}/mount.vmhgfs ${D}/sbin/mount.vmhgfs
> -    install -d ${D}${systemd_unitdir}/system
> ${D}${sysconfdir}/vmware-tools
> -    install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
> +    install -d ${D}${sysconfdir}/vmware-tools
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
> +    else
> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/vmtoolsd.init ${D}${sysconfdir}/init.d/
> vmtoolsd
> +    fi
>      install -m 0644 ${WORKDIR}/tools.conf ${D}${sysconfdir}/vmware-
> tools/tools.conf
>  }
>
> @@ -95,6 +102,10 @@ do_configure_prepend() {
>      export CUSTOM_DNET_LIBS=-L${STAGING_LIBDIR}/libdnet.so
>  }
>
> +INITSCRIPT_PACKAGES = "${PN}"
> +INITSCRIPT_NAME_${PN} = "vmtoolsd"
> +INITSCRIPT_PARAMS_${PN} = "start 90 2 3 4 5 . stop 60 0 1 6 ."
> +
>  python() {
>      if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split()
> or \
>         'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
> --
> 2.7.4
>
>

