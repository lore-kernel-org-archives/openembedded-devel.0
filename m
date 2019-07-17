Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 85B927C127
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:46:55 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a27so16472882qkk.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 21:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=86MsPdXPBLGv+JhSu0zkInyfM2Yl8HCWZll3URKf5oE=;
	b=gsGg71bHae4y1Cd0MQA367TbfZK2/3wNf5kb/eaUJdWyGM8x5n38wdc9UBeCLIskR1
	1FFqnw3wUFAydctHv8jJqXxAy0ePFaIgH5sOvq5RI0nuQvjs57RN4Un9V5sVOx4dfDbg
	0GVo3RVZP7nyz0pa1zHE6B4Uwu6OVUE3kX41AqwzRt1SPm9SONPyaQd94Mn1HiY+K9KY
	590780I3t72yTvRADjAykSwl2gu4IqsHBut1pBNOMbgnCvpVqltjgQMJMWcLls9/HjBm
	2GLxtbu0TrzxBC1fVdC0hB8R0RvT8Mb50hVuboA8j5zmvMOceDTOh3O3m1FLLsY5O6dQ
	3RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=86MsPdXPBLGv+JhSu0zkInyfM2Yl8HCWZll3URKf5oE=;
	b=dsf0wMgVwgxuqF171KccrYrxynKAjgVs85YsnEeFhVmwjVkQ2+Y/as8b/+lXUPb7W3
	gLZtqnqmqrdPm2wdhJLsspxcXFZj3Yhfr0BVWihY7EXNZcjblbd/xEnZCenfU0+lNLyG
	sm85lfi7KNvuq/yHQojbHA2+ukJj413t8WM3Ybc6IuYQG/+t30ED0sqpvKMdmswVzXP/
	I2OTBn074yU0yzXfh1a7j8OiXeHtQNVljlqj1EKCFtZD/ArZc/P3tl8fw/tuNwJiG7wc
	4M4sF8AjmCWaudselG8kGKWTo5DzygRThzWbhVToF/CACbg2ZclG5MdPC+Oh8Xa7neRs
	13+A==
X-Gm-Message-State: APjAAAUFnZHZJ+Wam38kSory5JWaHtgFzgGAXvfyUjZne16mHrX3Mjui
	L/wSRcsso/Lp6DgdPgRvwS5Rb3d8OjannOvv4ak=
X-Google-Smtp-Source: APXvYqx2ry2VbV8UymW4W5jPcsCGx7pdy3b53dgkCmg6MoCBEKXTc5KNlkqcEx7IlPzC+96OHbl1jVjXs+dp1tzXtrc=
X-Received: by 2002:a37:c81:: with SMTP id 123mr25291491qkm.474.1563338815958; 
	Tue, 16 Jul 2019 21:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190716171213.7862-1-beniaminsandu@gmail.com>
In-Reply-To: <20190716171213.7862-1-beniaminsandu@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 21:46:40 -0700
Message-ID: <CAMKF1srzgyhLcON-ruzi7KWeX_kzWJiBzxkpe1LHQEPtXnJEhQ@mail.gmail.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Wed, 17 Jul 2019 04:46:55 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build on mips

https://errors.yoctoproject.org/Errors/Details/252371/

On Tue, Jul 16, 2019 at 10:12 AM Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  ...add-yocto-compatible-startup-scripts.patch | 78 +++++++++++++++++++
>  .../recipes-support/unbound/unbound_1.9.2.bb  | 43 ++++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
>  create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>
> diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> new file mode 100644
> index 000000000..46f6a7b3f
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> @@ -0,0 +1,78 @@
> +From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Tue, 16 Jul 2019 19:59:23 +0300
> +Subject: [PATCH] contrib: add yocto compatible startup scripts
> +
> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> +---
> + contrib/unbound.init       | 10 +++++-----
> + contrib/unbound.service.in |  4 ++--
> + 2 files changed, 7 insertions(+), 7 deletions(-)
> + mode change 100644 => 100755 contrib/unbound.init
> +
> +diff --git a/contrib/unbound.init b/contrib/unbound.init
> +old mode 100644
> +new mode 100755
> +index cccadecc..4eba752b
> +--- a/contrib/unbound.init
> ++++ b/contrib/unbound.init
> +@@ -19,11 +19,11 @@
> + ### END INIT INFO
> +
> + # Source function library.
> +-. /etc/rc.d/init.d/functions
> ++. /etc/init.d/functions
> +
> + exec="/usr/sbin/unbound"
> + prog="unbound"
> +-config="/var/unbound/unbound.conf"
> ++config="/etc/unbound/unbound.conf"
> + pidfile="/var/unbound/unbound.pid"
> + rootdir="/var/unbound"
> +
> +@@ -61,7 +61,7 @@ start() {
> +     fi;
> +
> +     # if not running, start it up here
> +-    daemon $exec
> ++    daemonize $exec
> +     retval=$?
> +     echo
> +     [ $retval -eq 0 ] && touch $lockfile
> +@@ -71,7 +71,7 @@ start() {
> + stop() {
> +     echo -n $"Stopping $prog: "
> +     # stop it here, often "killproc $prog"
> +-    killproc -p $pidfile $prog
> ++    killproc $prog
> +     retval=$?
> +     echo
> +     [ $retval -eq 0 ] && rm -f $lockfile
> +@@ -99,7 +99,7 @@ force_reload() {
> +
> + rh_status() {
> +     # run checks to determine if the service is running or use generic status
> +-    status -p $pidfile $prog
> ++    status $prog
> + }
> +
> + rh_status_q() {
> +diff --git a/contrib/unbound.service.in b/contrib/unbound.service.in
> +index 95976dd9..0e7f79a9 100644
> +--- a/contrib/unbound.service.in
> ++++ b/contrib/unbound.service.in
> +@@ -10,9 +10,9 @@ WantedBy=multi-user.target
> +
> + [Service]
> + ExecReload=/bin/kill -HUP $MAINPID
> +-ExecStart=@UNBOUND_SBIN_DIR@/unbound
> ++ExecStart=@UNBOUND_SBIN_DIR@/unbound -d
> + NotifyAccess=main
> +-Type=notify
> ++Type=simple
> + CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE
> + MemoryDenyWriteExecute=true
> + NoNewPrivileges=true
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
> new file mode 100644
> index 000000000..5f9bacc31
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
> +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
> +       features including enhanced security (DNSSEC) validation, Internet Protocol \
> +       Version 6 (IPv6), and a client resolver library API as an integral part of the \
> +       architecture"
> +
> +HOMEPAGE = "https://www.unbound.net/"
> +SECTION = "net"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
> +
> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
> +       file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
> +"
> +SRCREV="ee06aaaad99dc4d6b73f915d98f05c506885b98a"
> +
> +inherit autotools pkgconfig systemd update-rc.d
> +
> +DEPENDS = "openssl libevent libtool-native bison-native expat"
> +RDEPENDS_${PN} = "bash openssl-bin daemonize"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
> +               --with-ssl=${STAGING_EXECPREFIXDIR}"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd', d)}"
> +PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
> +PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
> +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> +
> +do_install_append() {
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
> +
> +       install -d ${D}${sysconfdir}/init.d
> +       install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> +
> +INITSCRIPT_NAME = "unbound"
> +INITSCRIPT_PARAMS = "defaults"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

