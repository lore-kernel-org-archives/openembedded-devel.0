Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.10299.1621951302626090396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 07:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OKcqbI6W;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id f22so15312453pfn.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y5Vc8nYhvXHLlEuOzEjop2H6n3+wV+4HUq9TotAZLng=;
        b=OKcqbI6W0plap49sB7Oub5MWpp6d6JXqzulIo5aBgHttF0B7FjMhsks53mMowljjhV
         R5Mcc3uwXxRLlWOcz2NOkPao3qo+6/AofKSqegZUMVahxGAR5I3sdD72bfvh8tQ2SUX5
         +5SJ5nSvbXIN34iGB2qxo8IrdRcyuqLr6LGDnBRtyoYnqIpaEryDqXxXEclJAzKZa4XY
         XGF9/+5xE58LkcbFdzs5Nhj3yablveCHao141SopezPZ4YNTT+IXKHhbi3Dra35kFhRV
         6amTILKPTIEMMaQQHUGtpWkWBZB/Qh+UPYLZ7fLPFeRp622/3Lq9CTBGJ2jFqQ3xYlH/
         YB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=y5Vc8nYhvXHLlEuOzEjop2H6n3+wV+4HUq9TotAZLng=;
        b=EjStkjW2ILRxo7pyXIbovKgJNaPCTXsmryi0d3/xZ1j0JCz2ioscaTOzRFWnpciRLJ
         eI5/1fj8rJyuyVpC75tOWZDXFtGASb5IAheDrkHK19zCkC1CK//0wgMjHzcTHBdn/2B0
         BpP0nP0yx61pwuEX7e5yxF9iy4OpFWUBqTOHeLif5Hy7uAvZFW8/Owjz1jXf5Wmyad7r
         cPZ//mOYWMF2no3dwKRcuoBnlqXvxUGTM3eqqekFekxiQGXW84wN3Ng+QYuemwLs4k8q
         DpKREcSczCX3TqmtcYmM6kNVTyrgrvqaNfOVYhzKRbok1YjXsxI5w23KD8P1QANooWxD
         J+cQ==
X-Gm-Message-State: AOAM531r3BpflEk2jPePA6qyHizVZSmLcL3YfUJRL9QBzFyWxdgE93CA
	SvYd4bLXDB3/78ta39DSz0TWsw7C8DAj4Q==
X-Google-Smtp-Source: ABdhPJzBtJCrU4RzendEATEgEbMi4hjvNSrDIG/RWZSGhUihdxyOBjmdEt0F2Zg7NNTb648dZoon6Q==
X-Received: by 2002:a63:f40d:: with SMTP id g13mr19495292pgi.290.1621951301410;
        Tue, 25 May 2021 07:01:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::2290? ([2601:646:9200:a0f0::2290])
        by smtp.gmail.com with ESMTPSA id n28sm7366359pfq.139.2021.05.25.07.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 07:01:41 -0700 (PDT)
Subject: Re: [meta-networking][RESEND][PATCH] dhcp-relay: add recipe
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <f8d57238-0030-f053-fed2-47aa916bb682@gmail.com>
 <20210525085615.174480-1-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <99f83f04-b224-efa4-5435-865a3fa56cb0@gmail.com>
Date: Tue, 25 May 2021 07:01:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525085615.174480-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/25/21 1:56 AM, Yi Zhao wrote:
> The current default dhcp server kea in oe-core doesn't provide
> dhcp-relay tool. Add a recipe to provide dhcrelay which is from dhcp.
> This patch is picked up from dhcp recipe with some tweaks. In order to
> fix the build dependency, we use bundled bind instead of external bind.
> 

also send a patch to add it to packagegroups-meta-networking

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../dhcp/dhcp-relay_4.4.2.bb                  | 62 +++++++++++++++++++
>   ...0001-Makefile.am-only-build-dhcrelay.patch | 30 +++++++++
>   .../dhcp/files/default-relay                  | 12 ++++
>   .../dhcp/files/dhcrelay.service               | 10 +++
>   .../dhcp/files/init-relay                     | 44 +++++++++++++
>   5 files changed, 158 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default-relay
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-relay
> 
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
> new file mode 100644
> index 000000000..bd816106c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
> @@ -0,0 +1,62 @@
> +SECTION = "console/network"
> +SUMMARY = "Internet Software Consortium DHCP Relay Agent"
> +DESCRIPTION = "A DHCP relay agent passes DHCP requests from one \
> +LAN to another, so that a DHCP server is not needed on every LAN."
> +
> +HOMEPAGE = "http://www.isc.org/"
> +
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
> +
> +DEPENDS = "openssl libcap zlib"
> +
> +SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
> +           file://default-relay \
> +           file://init-relay \
> +           file://dhcrelay.service \
> +           file://0001-Makefile.am-only-build-dhcrelay.patch \
> +           "
> +
> +SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
> +SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
> +
> +UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
> +UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
> +
> +S = "${WORKDIR}/dhcp-${PV}"
> +
> +inherit autotools-brokensep systemd
> +
> +SYSTEMD_SERVICE_${PN} = "dhcrelay.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> +
> +CFLAGS += "-D_GNU_SOURCE -fcommon"
> +LDFLAGS_append = " -pthread"
> +
> +EXTRA_OECONF = "--enable-paranoia \
> +                --disable-static \
> +                --enable-libtool \
> +                --with-randomdev=/dev/random \
> +               "
> +
> +# Enable shared libs per dhcp README
> +do_configure_prepend () {
> +    cp configure.ac+lt configure.ac
> +}
> +
> +do_install_append () {
> +    install -d ${D}${sysconfdir}/default
> +    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
> +    else
> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
> +    fi
> +}
> +
> +PARALLEL_MAKE = ""
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
> new file mode 100644
> index 000000000..fed85d2a8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
> @@ -0,0 +1,30 @@
> +From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 13 May 2021 15:23:16 +0800
> +Subject: [PATCH] Makefile.am: only build dhcrelay
> +
> +Drop client and server build as we don't need them.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index ed692a5..34f9772 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -38,7 +38,7 @@ endif
> +
> + # Use an autoconf substitution vs an automake conditional here
> + # to fool automake when the bind directory does not exist.
> +-SUBDIRS = @BINDSUBDIR@ includes tests common omapip client dhcpctl relay server
> ++SUBDIRS = @BINDSUBDIR@ includes common omapip relay
> +
> + DIST_SUBDIRS = $(SUBDIRS) keama
> +
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-relay b/meta-networking/recipes-connectivity/dhcp/files/default-relay
> new file mode 100644
> index 000000000..7961f014b
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/default-relay
> @@ -0,0 +1,12 @@
> +# Defaults for dhcp-relay initscript
> +# sourced by /etc/init.d/dhcp-relay
> +
> +# What servers should the DHCP relay forward requests to?
> +# e.g: SERVERS="192.168.0.1"
> +SERVERS=""
> +
> +# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
> +INTERFACES=""
> +
> +# Additional options that are passed to the DHCP relay daemon?
> +OPTIONS=""
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
> new file mode 100644
> index 000000000..15ff927d3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=DHCP Relay Agent Daemon
> +After=network.target
> +
> +[Service]
> +EnvironmentFile=@SYSCONFDIR@/default/dhcp-relay
> +ExecStart=@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-relay b/meta-networking/recipes-connectivity/dhcp/files/init-relay
> new file mode 100644
> index 000000000..019a7e84c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/init-relay
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +#
> +# $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
> +#
> +
> +# It is not safe to start if we don't have a default configuration...
> +if [ ! -f /etc/default/dhcp-relay ]; then
> +	echo "/etc/default/dhcp-relay does not exist! - Aborting..."
> +	echo "create this file to fix the problem."
> +	exit 1
> +fi
> +
> +# Read init script configuration (interfaces the daemon should listen on
> +# and the DHCP server we should forward requests to.)
> +. /etc/default/dhcp-relay
> +
> +# Build command line for interfaces (will be passed to dhrelay below.)
> +IFCMD=""
> +if test "$INTERFACES" != ""; then
> +	for I in $INTERFACES; do
> +		IFCMD=${IFCMD}"-i "${I}" "
> +	done
> +fi
> +
> +DHCRELAYPID=/var/run/dhcrelay.pid
> +
> +case "$1" in
> +	start)
> +		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
> +		;;
> +	stop)
> +		start-stop-daemon -K -x /usr/sbin/dhcrelay
> +		;;
> +	restart | force-reload)
> +		$0 stop
> +		sleep 2
> +		$0 start
> +		;;
> +	*)
> +		echo "Usage: /etc/init.d/dhcp-relay {start|stop|restart|force-reload}"
> +		exit 1
> +esac
> +
> +exit 0
> 
