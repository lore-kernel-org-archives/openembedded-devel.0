Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.23798.1621866240694845746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 07:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QaEY2Fqk;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id v13so14683494ple.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tIsco+XUuQ4rXAXWKDLMct7rtDfIpOIWN/OFed7+a8I=;
        b=QaEY2FqkAedCYC5iG75lMEghVObwAOgj2U2VAvWvzyCGNyeDlIcO8ssTiycyd+S93b
         oIkrqbnoZrGQ+t42ew0zevroAxvE2Ayzua1xS000DaXBP1YxonObavq4/TIZ9AupPbnO
         6+cJ1GDKhHJsUckkv520RdEo6crVFnmljKxfIAn3t6sJSLUSzQngHeLB6cjcZDq6LcJw
         7NI3rv8ywoyk9PKYJdJ3649yQHoeKD++k3ghFn7oIInve3B6+EmlXQWK8Ycczt2Zxv3Y
         0TRKKuL9ZYITd684XzO7ccumMEgUJt9RrS8XXsPK5PVfOlmcCEzaGG+VgihRNa+M5tmq
         MzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tIsco+XUuQ4rXAXWKDLMct7rtDfIpOIWN/OFed7+a8I=;
        b=dQjPjp4fT9zYRpakrMDT9krB3ppEDV/0H59J/A3q2/CWODr5p7ZFhcDHIYbiw5TOAq
         2JalzyYQV0ZNOZKhnpGrePn3rfkrZEoFAgVp64Eocp0NgEp3jomLs2TiMo1/AW19p3bi
         1k1XxlFHEobJ9r9uzxef6EStowfoxCBpY1mx5+Z2uAk8xK8baM2qUYNzplrRLnuplmIU
         6yALVGvglcvQQOr8MJb4XyKWg8Sd7XqfcL+8KYXPtejtnxTOx/DqyvdOciawoDjZaFbk
         vXw/1WNAh0Xftdr58aXBlHvSGfWz4gRYHKKewduL3CS9TXk8+4ekGWhrFA17Kbu/l5Iq
         ny+w==
X-Gm-Message-State: AOAM5304Mpr7ggzH6Ww61DdEgsCv10Pyt6UZzH8rbSURwzWH5oYVyyOy
	5CZHVmpJ7kBg2o3gneeIuat5yaa90/BU3A==
X-Google-Smtp-Source: ABdhPJzOcIwbIHD18o2AnK6YQQt1QVxEXtbuV/gleNYu6xhD2GxcAvCZu+ISMrSdEbV1ZGzzJDPweA==
X-Received: by 2002:a17:90a:950c:: with SMTP id t12mr24646963pjo.135.1621866239750;
        Mon, 24 May 2021 07:23:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::9c7a? ([2601:646:9200:a0f0::9c7a])
        by smtp.gmail.com with ESMTPSA id n6sm12021637pgm.79.2021.05.24.07.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 07:23:59 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH] dhcp-relay: add recipe
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <167FC4DDC2069D52.24037@lists.openembedded.org>
 <931b389f-1994-22ef-2eba-d20dbf6ff8b4@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f8d57238-0030-f053-fed2-47aa916bb682@gmail.com>
Date: Mon, 24 May 2021 07:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <931b389f-1994-22ef-2eba-d20dbf6ff8b4@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Can you resend this patch ? secondly, I worry that since kea is way
to go we are adding a package which perhaps is virtually going to be
dead soon. Is there any work on kea itself providing similar functionality?

On 5/23/21 11:36 PM, Yi Zhao wrote:
> Ping ...
> 
> 
> //Yi
> 
> 
> On 5/17/21 1:53 PM, Yi Zhao wrote:
>> The current default dhcp server kea in oe-core doesn't provide
>> dhcp-relay tool. Add a recipe to provide dhcrelay which is from dhcp.
>> This patch is picked up from dhcp recipe with some tweaks. In order to
>> fix the build dependency, we use bundled bind instead of external bind.
>>
>> Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
>> ---
>>   .../dhcp/dhcp-relay_4.4.2.bb                  | 62 +++++++++++++++++++
>>   ...0001-Makefile.am-only-build-dhcrelay.patch | 30 +++++++++
>>   .../dhcp/files/default-relay                  | 12 ++++
>>   .../dhcp/files/dhcrelay.service               | 10 +++
>>   .../dhcp/files/init-relay                     | 44 +++++++++++++
>>   5 files changed, 158 insertions(+)
>>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
>>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default-relay
>>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-relay
>>
>> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>> new file mode 100644
>> index 000000000..bd816106c
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>> @@ -0,0 +1,62 @@
>> +SECTION = "console/network"
>> +SUMMARY = "Internet Software Consortium DHCP Relay Agent"
>> +DESCRIPTION = "A DHCP relay agent passes DHCP requests from one \
>> +LAN to another, so that a DHCP server is not needed on every LAN."
>> +
>> +HOMEPAGE ="http://www.isc.org/"
>> +
>> +LICENSE = "ISC"
>> +LIC_FILES_CHKSUM ="file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
>> +
>> +DEPENDS = "openssl libcap zlib"
>> +
>> +SRC_URI ="https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \ + 
>> file://default-relay \ + file://init-relay \ + file://dhcrelay.service 
>> \ + file://0001-Makefile.am-only-build-dhcrelay.patch \ + "
>> +
>> +SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
>> +SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
>> +
>> +UPSTREAM_CHECK_URI ="http://ftp.isc.org/isc/dhcp/"
>> +UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>> +
>> +S = "${WORKDIR}/dhcp-${PV}"
>> +
>> +inherit autotools-brokensep systemd
>> +
>> +SYSTEMD_SERVICE_${PN} = "dhcrelay.service"
>> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>> +
>> +CFLAGS += "-D_GNU_SOURCE -fcommon"
>> +LDFLAGS_append = " -pthread"
>> +
>> +EXTRA_OECONF = "--enable-paranoia \
>> +                --disable-static \
>> +                --enable-libtool \
>> +                --with-randomdev=/dev/random \
>> +" + +# Enable shared libs per dhcp README +do_configure_prepend () { + 
>> cp configure.ac+lt configure.ac +} + +do_install_append () { + install 
>> -d ${D}${sysconfdir}/default + install -m 0644 
>> ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay + + if 
>> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; 
>> then + install -d ${D}${systemd_unitdir}/system + install -m 0644 
>> ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system + sed -i -e 
>> 's,@SBINDIR@,${sbindir},g' 
>> ${D}${systemd_unitdir}/system/dhcrelay.service + sed -i -e 
>> 's,@SYSCONFDIR@,${sysconfdir},g' 
>> ${D}${systemd_unitdir}/system/dhcrelay.service + else + install -d 
>> ${D}${sysconfdir}/init.d + install -m 0755 ${WORKDIR}/init-relay 
>> ${D}${sysconfdir}/init.d/dhcp-relay + fi +} + +PARALLEL_MAKE = ""
>> diff --git a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
>> new file mode 100644
>> index 000000000..fed85d2a8
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
>> @@ -0,0 +1,30 @@
>> +From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17 00:00:00 2001
>> +From: Yi Zhao<yi.zhao@windriver.com>
>> +Date: Thu, 13 May 2021 15:23:16 +0800
>> +Subject: [PATCH] Makefile.am: only build dhcrelay
>> +
>> +Drop client and server build as we don't need them.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
>> +---
>> + Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index ed692a5..34f9772 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -38,7 +38,7 @@ endif
>> +
>> + # Use an autoconf substitution vs an automake conditional here
>> + # to fool automake when the bind directory does not exist.
>> +-SUBDIRS = @BINDSUBDIR@ includes tests common omapip client dhcpctl relay server
>> ++SUBDIRS = @BINDSUBDIR@ includes common omapip relay
>> +
>> + DIST_SUBDIRS = $(SUBDIRS) keama
>> +
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-relay b/meta-networking/recipes-connectivity/dhcp/files/default-relay
>> new file mode 100644
>> index 000000000..7961f014b
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcp/files/default-relay
>> @@ -0,0 +1,12 @@
>> +# Defaults for dhcp-relay initscript
>> +# sourced by /etc/init.d/dhcp-relay
>> +
>> +# What servers should the DHCP relay forward requests to?
>> +# e.g: SERVERS="192.168.0.1"
>> +SERVERS=""
>> +
>> +# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
>> +INTERFACES=""
>> +
>> +# Additional options that are passed to the DHCP relay daemon?
>> +OPTIONS=""
>> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>> new file mode 100644
>> index 000000000..15ff927d3
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>> @@ -0,0 +1,10 @@
>> +[Unit]
>> +Description=DHCP Relay Agent Daemon
>> +After=network.target
>> +
>> +[Service]
>> +EnvironmentFile=@SYSCONFDIR@/default/dhcp-relay
>> +ExecStart=@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-relay b/meta-networking/recipes-connectivity/dhcp/files/init-relay
>> new file mode 100644
>> index 000000000..019a7e84c
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcp/files/init-relay
>> @@ -0,0 +1,44 @@
>> +#!/bin/sh
>> +#
>> +# $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
>> +#
>> +
>> +# It is not safe to start if we don't have a default configuration...
>> +if [ ! -f /etc/default/dhcp-relay ]; then
>> +	echo "/etc/default/dhcp-relay does not exist! - Aborting..."
>> +	echo "create this file to fix the problem."
>> +	exit 1
>> +fi
>> +
>> +# Read init script configuration (interfaces the daemon should listen on
>> +# and the DHCP server we should forward requests to.)
>> +. /etc/default/dhcp-relay
>> +
>> +# Build command line for interfaces (will be passed to dhrelay below.)
>> +IFCMD=""
>> +if test "$INTERFACES" != ""; then
>> +	for I in $INTERFACES; do
>> +		IFCMD=${IFCMD}"-i "${I}" "
>> +	done
>> +fi
>> +
>> +DHCRELAYPID=/var/run/dhcrelay.pid
>> +
>> +case "$1" in
>> +	start)
>> +		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
>> +		;;
>> +	stop)
>> +		start-stop-daemon -K -x /usr/sbin/dhcrelay
>> +		;;
>> +	restart | force-reload)
>> +		$0 stop
>> +		sleep 2
>> +		$0 start
>> +		;;
>> +	*)
>> +		echo "Usage: /etc/init.d/dhcp-relay {start|stop|restart|force-reload}"
>> +		exit 1
>> +esac
>> +
>> +exit 0
>>
> 
> 
> 
> 
