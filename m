Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.315.1620745873009575119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 08:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sYdNLdvW;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id a5so9251201pfa.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hPLGQ+fKm6ZlFRsDvq4YazmEqbcz7VoOAzi90TZ8xhU=;
        b=sYdNLdvW5OR4alOL+pZwb1teJUwVVudzF532p18kFFb8zINbt8/eQ85UngAMFc4pUX
         pKnGiPrUPJMM79rwspSflJNg48/IYHBfX/yEIsfBNPmXVR2q9LZWdMu0RT7p3ZQPG1iK
         CDqF8xUh5AmIpXoY53h2sYf0riX2eEMssEWxAXeHDhVRVS2LvO/pCKn5Se2JRshgx3vd
         UGrL5OXjnS432ya42JAutJVGjQvXswxNOLgzECJ/gxe47iVdLa3/iej+SxpC+9JeVOW5
         wNR3cPzV6AejfTycbpLlWhZpqj02kM8zkbUmn7XnHXIY75ej85LrWEhcC5SJzsZ2j7lX
         qEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hPLGQ+fKm6ZlFRsDvq4YazmEqbcz7VoOAzi90TZ8xhU=;
        b=NrzC7Zb+6lDFuPDw6oYpEq0bb5I68eTDLFeffV1H6vbuOT0NmjB6BW0AsaC3+nZkG6
         l6TaajDnitkUwZJ69/qpqxjVgjYwCGxiMcq3G/8+GYhLu9hR2fLAigCbsj5ORT1LLrrs
         tm7dM0n3HafM8umVHkpjT+z4Q1pqsEwiajrOIIPDT9nvChIp7bFYdHQsuT5f0tPdNBdO
         QCrT0SuzSbmcy8YY2xcxVno/SKXWCacs6z1foLliHA1sb+zifVYZpU3THK5WH9vL9ey6
         D/ASrFTZqTeAVxP0Z2xr2H4Wp+wSWFgY8wL3omc23IrhMiC0mXSzYCFcPf49/XhTpJAm
         kSMg==
X-Gm-Message-State: AOAM530OEKhzJD/i98EIiOAt+eMwmHnpGes++o7tG3ZJa2FIuNDN9brd
	ssqkc7v29jHyBJDmgzTChylLQ/hq4w7a8w==
X-Google-Smtp-Source: ABdhPJySfXv8rkHUGFGaX4M4JsfQJHZwELAUl44Wls5VDHz+k582JOH7Bqd7SbQHszRlkaFNF8bI6A==
X-Received: by 2002:a63:d64f:: with SMTP id d15mr30939162pgj.137.1620745870853;
        Tue, 11 May 2021 08:11:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4c51:e82a:7ea3:9a08? ([2601:646:9200:a0f0:4c51:e82a:7ea3:9a08])
        by smtp.gmail.com with ESMTPSA id 23sm14216603pfz.91.2021.05.11.08.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 08:11:10 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH] dhcp: add recipe
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20210511062439.135521-1-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <40acef78-5adf-6dca-1592-d39e6d22ab2b@gmail.com>
Date: Tue, 11 May 2021 08:11:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511062439.135521-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/10/21 11:24 PM, Yi Zhao wrote:
> Although kea is the default dhcp server in oe-coe, dhcp can still
> provide some useful functions, e.g. dhcrelay.
> This patch is picked up from oe-core with some minor tweaks. In order to
> fix the build dependency, we use bundled bind instead of external bind.
> 

can we just add a recipe for missing dhcrelay ?

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../recipes-connectivity/dhcp/dhcp.inc        | 150 ++++++++++++++++++
>   ...TH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  30 ++++
>   .../dhcp/dhcp/0002-dhclient-dbus.patch        | 117 ++++++++++++++
>   .../dhcp/dhcp/0003-link-with-lcrypto.patch    |  38 +++++
>   .../dhcp/0004-Fix-out-of-tree-builds.patch    |  98 ++++++++++++
>   ...invoke-dhclient-script-failed-on-Rea.patch |  36 +++++
>   ...gument-to-make-the-libxml2-dependenc.patch |  66 ++++++++
>   ...move-dhclient-script-bash-dependency.patch |  28 ++++
>   ...ct-the-intention-for-xml2-lib-search.patch |  37 +++++
>   ...ox-limitation-in-Linux-dhclient-scri.patch |  65 ++++++++
>   .../recipes-connectivity/dhcp/dhcp_4.4.2.bb   |  24 +++
>   .../dhcp/files/default-relay                  |  12 ++
>   .../dhcp/files/default-server                 |   7 +
>   .../dhcp/files/dhclient-systemd-wrapper       |  39 +++++
>   .../dhcp/files/dhclient.conf                  |  50 ++++++
>   .../dhcp/files/dhclient.service               |  13 ++
>   .../dhcp/files/dhcpd.conf                     | 108 +++++++++++++
>   .../dhcp/files/dhcpd.service                  |  15 ++
>   .../dhcp/files/dhcpd6.service                 |  15 ++
>   .../dhcp/files/dhcrelay.service               |  10 ++
>   .../dhcp/files/init-relay                     |  44 +++++
>   .../dhcp/files/init-server                    |  44 +++++
>   22 files changed, 1046 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp.inc
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0006-Add-configure-argument-to-make-the-libxml2-dependenc.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0007-remove-dhclient-script-bash-dependency.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0008-dhcp-correct-the-intention-for-xml2-lib-search.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0009-Workaround-busybox-limitation-in-Linux-dhclient-scri.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default-relay
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default-server
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhclient.conf
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhclient.service
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcpd.conf
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcpd.service
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcpd6.service
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-relay
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-server
> 
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp.inc b/meta-networking/recipes-connectivity/dhcp/dhcp.inc
> new file mode 100644
> index 000000000..aff330d59
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp.inc
> @@ -0,0 +1,150 @@
> +SECTION = "console/network"
> +SUMMARY = "Internet Software Consortium DHCP package"
> +DESCRIPTION = "DHCP (Dynamic Host Configuration Protocol) is a protocol \
> +which allows individual devices on an IP network to get their own \
> +network configuration information from a server.  DHCP helps make it \
> +easier to administer devices."
> +
> +HOMEPAGE = "http://www.isc.org/"
> +
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
> +
> +DEPENDS = "openssl libcap zlib"
> +
> +SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
> +           file://init-relay file://default-relay \
> +           file://init-server file://default-server \
> +           file://dhclient.conf file://dhcpd.conf \
> +           file://dhclient-systemd-wrapper \
> +           file://dhclient.service \
> +           file://dhcpd.service file://dhcrelay.service \
> +           file://dhcpd6.service \
> +           "
> +
> +UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
> +UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
> +
> +inherit autotools-brokensep systemd useradd update-rc.d
> +
> +USERADD_PACKAGES = "${PN}-server"
> +USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
> +
> +SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay ${PN}-client"
> +SYSTEMD_SERVICE_${PN}-server = "dhcpd.service dhcpd6.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
> +
> +SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-relay = "disable"
> +
> +SYSTEMD_SERVICE_${PN}-client = "dhclient.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-client = "disable"
> +
> +INITSCRIPT_PACKAGES = "dhcp-server"
> +INITSCRIPT_NAME_dhcp-server = "dhcp-server"
> +INITSCRIPT_PARAMS_dhcp-server = "defaults"
> +
> +CFLAGS += "-D_GNU_SOURCE"
> +EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
> +                --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
> +                --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
> +                --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
> +                --enable-paranoia --disable-static \
> +                --with-randomdev=/dev/random \
> +                --enable-libtool \
> +               "
> +
> +#Enable shared libs per dhcp README
> +do_configure_prepend () {
> +    cp configure.ac+lt configure.ac
> +}
> +
> +do_install_append () {
> +    install -d ${D}${sysconfdir}/init.d
> +    install -d ${D}${sysconfdir}/default
> +    install -d ${D}${sysconfdir}/dhcp
> +    install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
> +    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
> +    install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
> +    install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
> +
> +    rm -f ${D}${sysconfdir}/dhclient.conf*
> +    rm -f ${D}${sysconfdir}/dhcpd.conf*
> +    install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
> +    install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
> +
> +    install -d ${D}${base_sbindir}/
> +    if [ "${sbindir}" != "${base_sbindir}" ]; then
> +        mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
> +    fi
> +    install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
> +
> +    # Install systemd unit files
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/dhcpd6.service ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
> +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service ${D}${systemd_unitdir}/system/dhcrelay.service
> +    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
> +    sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
> +    sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
> +    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
> +
> +    install -d ${D}${base_sbindir}
> +    install -m 0755 ${WORKDIR}/dhclient-systemd-wrapper ${D}${base_sbindir}/dhclient-systemd-wrapper
> +    install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
> +    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhclient.service
> +    sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/dhclient.service
> +}
> +
> +PACKAGES += "dhcp-libs dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
> +
> +PACKAGES_remove = "${PN}"
> +RDEPENDS_${PN}-client += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'iproute2', '', d)}"
> +RDEPENDS_${PN}-dev = ""
> +RDEPENDS_${PN}-staticdev = ""
> +
> +FILES_${PN}-libs = "${libdir}/lib*.so.*"
> +
> +FILES_${PN}-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
> +RRECOMMENDS_${PN}-server = "dhcp-server-config"
> +
> +FILES_${PN}-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
> +
> +FILES_${PN}-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
> +
> +FILES_${PN}-client = "${base_sbindir}/dhclient \
> +                      ${base_sbindir}/dhclient-script \
> +                      ${sysconfdir}/dhcp/dhclient.conf \
> +                      ${base_sbindir}/dhclient-systemd-wrapper \
> +                     "
> +
> +FILES_${PN}-omshell = "${bindir}/omshell"
> +
> +pkg_postinst_dhcp-server() {
> +    mkdir -p $D/${localstatedir}/lib/dhcp
> +    touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
> +    touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
> +}
> +
> +pkg_postinst_dhcp-client() {
> +    mkdir -p $D/${localstatedir}/lib/dhcp
> +}
> +
> +pkg_postrm_dhcp-server() {
> +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
> +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
> +
> +    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
> +        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
> +    fi
> +}
> +
> +pkg_postrm_dhcp-client() {
> +    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
> +    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
> +
> +    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
> +        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
> +    fi
> +}
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
> new file mode 100644
> index 000000000..3050636e8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
> @@ -0,0 +1,30 @@
> +From 6424c532f49041ecf8fd3776d43b0d583b723b12 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 15 Aug 2017 16:14:22 +0800
> +Subject: [PATCH] define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Rebase to 4.3.6
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + includes/site.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/includes/site.h b/includes/site.h
> +index 2ef69e4..b4dd2e4 100644
> +--- a/includes/site.h
> ++++ b/includes/site.h
> +@@ -148,7 +148,8 @@
> + /* Define this if you want the dhcpd.conf file to go somewhere other than
> +    the default location.   By default, it goes in /etc/dhcpd.conf. */
> +
> +-/* #define _PATH_DHCPD_CONF	"/etc/dhcpd.conf" */
> ++#define _PATH_DHCPD_CONF	"/etc/dhcp/dhcpd.conf"
> ++#define _PATH_DHCLIENT_CONF	"/etc/dhcp/dhclient.conf"
> +
> + /* Network API definitions.   You do not need to choose one of these - if
> +    you don't choose, one will be chosen for you in your system's config
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
> new file mode 100644
> index 000000000..df0c9a1fa
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
> @@ -0,0 +1,117 @@
> +From 3fa083e3d8b65eeb5444e458aed358709130141f Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 15 Aug 2017 14:56:56 +0800
> +Subject: [PATCH] dhclient dbus
> +
> +Upstream-Status: Inappropriate [distribution]
> +
> +Rebase to 4.3.6
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + client/scripts/bsdos   | 5 +++++
> + client/scripts/freebsd | 5 +++++
> + client/scripts/linux   | 5 +++++
> + client/scripts/netbsd  | 5 +++++
> + client/scripts/openbsd | 5 +++++
> + client/scripts/solaris | 5 +++++
> + 6 files changed, 30 insertions(+)
> +
> +diff --git a/client/scripts/bsdos b/client/scripts/bsdos
> +index d69d0d8..095b143 100755
> +--- a/client/scripts/bsdos
> ++++ b/client/scripts/bsdos
> +@@ -45,6 +45,11 @@ exit_with_hooks() {
> +     . /etc/dhclient-exit-hooks
> +   fi
> + # probably should do something with exit status of the local script
> ++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
> ++    dbus-send --system --dest=com.redhat.dhcp \
> ++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
> ++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
> ++  fi
> +   exit $exit_status
> + }
> +
> +diff --git a/client/scripts/freebsd b/client/scripts/freebsd
> +index 7c073f8..b3426bf 100755
> +--- a/client/scripts/freebsd
> ++++ b/client/scripts/freebsd
> +@@ -89,6 +89,11 @@ exit_with_hooks() {
> +     . /etc/dhclient-exit-hooks
> +   fi
> + # probably should do something with exit status of the local script
> ++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
> ++    dbus-send --system --dest=com.redhat.dhcp \
> ++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
> ++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
> ++  fi
> +   exit $exit_status
> + }
> +
> +diff --git a/client/scripts/linux b/client/scripts/linux
> +index 0c42969..cded38f 100755
> +--- a/client/scripts/linux
> ++++ b/client/scripts/linux
> +@@ -174,6 +174,11 @@ exit_with_hooks() {
> +         exit_status=$?
> +     fi
> +
> ++    if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
> ++        dbus-send --system --dest=com.redhat.dhcp \
> ++           --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
> ++           'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
> ++    fi
> +     exit $exit_status
> + }
> +
> +diff --git a/client/scripts/netbsd b/client/scripts/netbsd
> +index fa08637..3628418 100755
> +--- a/client/scripts/netbsd
> ++++ b/client/scripts/netbsd
> +@@ -45,6 +45,11 @@ exit_with_hooks() {
> +     . /etc/dhclient-exit-hooks
> +   fi
> + # probably should do something with exit status of the local script
> ++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
> ++    dbus-send --system --dest=com.redhat.dhcp \
> ++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
> ++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
> ++  fi
> +   exit $exit_status
> + }
> +
> +diff --git a/client/scripts/openbsd b/client/scripts/openbsd
> +index afb7924..57c80d4 100755
> +--- a/client/scripts/openbsd
> ++++ b/client/scripts/openbsd
> +@@ -45,6 +45,11 @@ exit_with_hooks() {
> +     . /etc/dhclient-exit-hooks
> +   fi
> + # probably should do something with exit status of the local script
> ++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
> ++    dbus-send --system --dest=com.redhat.dhcp \
> ++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
> ++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
> ++  fi
> +   exit $exit_status
> + }
> +
> +diff --git a/client/scripts/solaris b/client/scripts/solaris
> +index af553b9..4a2aa69 100755
> +--- a/client/scripts/solaris
> ++++ b/client/scripts/solaris
> +@@ -26,6 +26,11 @@ exit_with_hooks() {
> +     . /etc/dhclient-exit-hooks
> +   fi
> + # probably should do something with exit status of the local script
> ++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
> ++    dbus-send --system --dest=com.redhat.dhcp \
> ++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
> ++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
> ++  fi
> +   exit $exit_status
> + }
> +
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
> new file mode 100644
> index 000000000..1c55a70a7
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
> @@ -0,0 +1,38 @@
> +From 4d7dd522faed6c25daf88ac81a43943af4c40fe7 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei@gherzan.ro>
> +Date: Tue, 15 Aug 2017 15:05:47 +0800
> +Subject: [PATCH] link with lcrypto
> +
> +From 4.2.0 final release, -lcrypto check was removed and we compile
> +static libraries
> +from bind that are linked to libcrypto. This is why i added a patch in
> +order to add
> +-lcrypto to LIBS.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +
> +Rebase to 4.3.6
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.ac | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3a583a5..b3d48f7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -603,6 +603,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo() __attribute__((noreturn));
> + # Look for optional headers.
> + AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
> +
> ++# find an MD5 library
> ++AC_SEARCH_LIBS(MD5_Init, [crypto])
> ++AC_SEARCH_LIBS(MD5Init, [crypto])
> ++
> + # Solaris needs some libraries for functions
> + AC_SEARCH_LIBS(socket, [socket])
> + AC_SEARCH_LIBS(inet_ntoa, [nsl])
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
> new file mode 100644
> index 000000000..912a8f20c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
> @@ -0,0 +1,98 @@
> +From d64897645e712975763fa78937c6c1ea7a46542d Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 15 Aug 2017 15:08:22 +0800
> +Subject: [PATCH] Fix out of tree builds
> +
> +Upstream-Status: Pending
> +
> +RP 2013/03/21
> +
> +Rebase to 4.3.6
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + client/Makefile.am  | 2 +-
> + common/Makefile.am  | 3 ++-
> + dhcpctl/Makefile.am | 2 ++
> + omapip/Makefile.am  | 1 +
> + relay/Makefile.am   | 2 +-
> + server/Makefile.am  | 2 +-
> + 6 files changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/client/Makefile.am b/client/Makefile.am
> +index d177159..4857a86 100644
> +--- a/client/Makefile.am
> ++++ b/client/Makefile.am
> +@@ -5,7 +5,7 @@
> + SUBDIRS = . tests
> +
> + AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"'
> +-AM_CPPFLAGS += -DLOCALSTATEDIR='"$(localstatedir)"'
> ++AM_CPPFLAGS += -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
> +
> + dist_sysconf_DATA = dhclient.conf.example
> + sbin_PROGRAMS = dhclient
> +diff --git a/common/Makefile.am b/common/Makefile.am
> +index 91dd235..725cd4c 100644
> +--- a/common/Makefile.am
> ++++ b/common/Makefile.am
> +@@ -1,4 +1,5 @@
> +-AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
> ++AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
> ++
> + AM_CFLAGS = $(LDAP_CFLAGS)
> +
> + lib_LIBRARIES = libdhcp.a
> +diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
> +index 0d66971..a52326b 100644
> +--- a/dhcpctl/Makefile.am
> ++++ b/dhcpctl/Makefile.am
> +@@ -3,6 +3,8 @@ BINDLIBDNSDIR=@BINDLIBDNSDIR@
> + BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
> + BINDLIBISCDIR=@BINDLIBISCDIR@
> +
> ++AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
> ++
> + bin_PROGRAMS = omshell
> + lib_LIBRARIES = libdhcpctl.a
> + noinst_PROGRAMS = cltest
> +diff --git a/omapip/Makefile.am b/omapip/Makefile.am
> +index 5b61581..c9091dc 100644
> +--- a/omapip/Makefile.am
> ++++ b/omapip/Makefile.am
> +@@ -2,6 +2,7 @@ BINDLIBIRSDIR=@BINDLIBIRSDIR@
> + BINDLIBDNSDIR=@BINDLIBDNSDIR@
> + BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
> + BINDLIBISCDIR=@BINDLIBISCDIR@
> ++AM_CPPFLAGS = -I$(top_srcdir)/includes
> +
> + lib_LIBRARIES = libomapi.a
> + noinst_PROGRAMS = svtest
> +diff --git a/relay/Makefile.am b/relay/Makefile.am
> +index 5562b69..d265ec2 100644
> +--- a/relay/Makefile.am
> ++++ b/relay/Makefile.am
> +@@ -1,6 +1,6 @@
> + SUBDIRS = . tests
> +
> +-AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
> ++AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
> +
> + sbin_PROGRAMS = dhcrelay
> + dhcrelay_SOURCES = dhcrelay.c
> +diff --git a/server/Makefile.am b/server/Makefile.am
> +index 787efca..35b747e 100644
> +--- a/server/Makefile.am
> ++++ b/server/Makefile.am
> +@@ -4,7 +4,7 @@
> + # production code. Sadly, we are not there yet.
> + SUBDIRS = . tests
> +
> +-AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
> ++AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
> +
> + dist_sysconf_DATA = dhcpd.conf.example
> + sbin_PROGRAMS = dhcpd
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
> new file mode 100644
> index 000000000..b93325f34
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
> @@ -0,0 +1,36 @@
> +From d27dea78a073a124f416af26501197d18130913d Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 15 Aug 2017 15:24:14 +0800
> +Subject: [PATCH] dhcp-client: fix invoke dhclient-script failed on Read-only
> + file system
> +
> +In read-only file system, '/etc' is on the readonly partition,
> +and '/etc/resolv.conf' is symlinked to a separate writable
> +partition.
> +
> +In this situation, we create temp files 'resolv.conf.dhclient-new'
> +in /tmp dir.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + client/scripts/linux | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/client/scripts/linux b/client/scripts/linux
> +index cded38f..516c986 100755
> +--- a/client/scripts/linux
> ++++ b/client/scripts/linux
> +@@ -40,7 +40,7 @@ make_resolv_conf() {
> +     # DHCPv4
> +     if [ -n "$new_domain_search" ] || [ -n "$new_domain_name" ] ||
> +        [ -n "$new_domain_name_servers" ]; then
> +-        new_resolv_conf=/etc/resolv.conf.dhclient-new
> ++        new_resolv_conf=/tmp/resolv.conf.dhclient-new
> +         rm -f $new_resolv_conf
> +
> +         if [ -n "$new_domain_name" ]; then
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0006-Add-configure-argument-to-make-the-libxml2-dependenc.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0006-Add-configure-argument-to-make-the-libxml2-dependenc.patch
> new file mode 100644
> index 000000000..6471bcf6c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0006-Add-configure-argument-to-make-the-libxml2-dependenc.patch
> @@ -0,0 +1,66 @@
> +From 0ca6f4d1e34b54f85de9f5c27536f01326cf35fd Mon Sep 17 00:00:00 2001
> +From: Christopher Larson <chris_larson@mentor.com>
> +Date: Tue, 15 Aug 2017 16:17:49 +0800
> +Subject: [PATCH] Add configure argument to make the libxml2 dependency
> + explicit and determinisitic.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +
> +Rebase to 4.3.6
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.ac    | 11 +++++++++++
> + configure.ac+lt | 12 ++++++++++++
> + 2 files changed, 23 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index b3d48f7..35a9fbb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -633,6 +633,17 @@ if test "$have_nanosleep" = "rt"; then
> + 	LIBS="-lrt $LIBS"
> + fi
> +
> ++AC_ARG_WITH(libxml2,
> ++	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
> ++	with_libxml2="$withval", with_libxml2="no")
> ++
> ++if test x$with_libxml2 != xno; then
> ++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
> ++		[if test x$with_libxml2 != xauto; then
> ++			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
> ++		fi])
> ++fi
> ++
> + # check for /dev/random (declares HAVE_DEV_RANDOM)
> + AC_MSG_CHECKING(for random device)
> + AC_ARG_WITH(randomdev,
> +diff --git a/configure.ac+lt b/configure.ac+lt
> +index 6432927..df6ea4f 100644
> +--- a/configure.ac+lt
> ++++ b/configure.ac+lt
> +@@ -900,6 +900,18 @@ elif test "$want_libtool" = "yes" -a "$use_libbind" = "no"; then
> + fi
> + AM_CONDITIONAL(INSTALL_BIND, test "$want_install_bind" = "yes")
> +
> ++AC_ARG_WITH(libxml2,
> ++	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
> ++	with_libxml2="$withval", with_libxml2="no")
> ++
> ++if test x$with_libxml2 != xno; then
> ++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
> ++		[if test x$with_libxml2 != xauto; then
> ++			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
> ++		fi])
> ++fi
> ++
> ++
> + # OpenLDAP support.
> + AC_ARG_WITH(ldap,
> +     AS_HELP_STRING([--with-ldap],[enable OpenLDAP support in dhcpd (default is no)]),
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0007-remove-dhclient-script-bash-dependency.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0007-remove-dhclient-script-bash-dependency.patch
> new file mode 100644
> index 000000000..ba3b459a9
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0007-remove-dhclient-script-bash-dependency.patch
> @@ -0,0 +1,28 @@
> +From b006317ed7b1068764f362429feaebbd450f2eca Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Tue, 15 Aug 2017 15:49:31 +0800
> +Subject: [PATCH] remove dhclient-script bash dependency
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +
> +Rebase to 4.3.6
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + client/scripts/linux | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/client/scripts/linux b/client/scripts/linux
> +index 516c986..e9ea379 100755
> +--- a/client/scripts/linux
> ++++ b/client/scripts/linux
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + # dhclient-script for Linux. Dan Halbert, March, 1997.
> + # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
> + # No guarantees about this. I'm a novice at the details of Linux
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0008-dhcp-correct-the-intention-for-xml2-lib-search.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0008-dhcp-correct-the-intention-for-xml2-lib-search.patch
> new file mode 100644
> index 000000000..67e346dcd
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0008-dhcp-correct-the-intention-for-xml2-lib-search.patch
> @@ -0,0 +1,37 @@
> +From b734ef006c2b79529d44edab9f75786ecc9030e1 Mon Sep 17 00:00:00 2001
> +From: Awais Belal <awais_belal@mentor.com>
> +Date: Wed, 25 Oct 2017 21:00:05 +0500
> +Subject: [PATCH] dhcp: correct the intention for xml2 lib search
> +
> +A missing case breaks the build when libxml2 is
> +required and found appropriately. The third argument
> +to the function AC_SEARCH_LIB is action-if-found which
> +was mistakenly been used for the case where the library
> +is not found and hence breaks the configure phase
> +where it shoud actually pass.
> +We now pass on silently when action-if-found is
> +executed.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 35a9fbb..c5dd69e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -638,7 +638,7 @@ AC_ARG_WITH(libxml2,
> + 	with_libxml2="$withval", with_libxml2="no")
> +
> + if test x$with_libxml2 != xno; then
> +-	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
> ++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
> + 		[if test x$with_libxml2 != xauto; then
> + 			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
> + 		fi])
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0009-Workaround-busybox-limitation-in-Linux-dhclient-scri.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0009-Workaround-busybox-limitation-in-Linux-dhclient-scri.patch
> new file mode 100644
> index 000000000..61cf6003a
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0009-Workaround-busybox-limitation-in-Linux-dhclient-scri.patch
> @@ -0,0 +1,65 @@
> +From 5374cef35850ca476d4e866471d8c724eabc6d4a Mon Sep 17 00:00:00 2001
> +From: Haris Okanovic <haris.okanovic@ni.com>
> +Date: Mon, 7 Jan 2019 13:22:09 -0600
> +Subject: [PATCH] Workaround busybox limitation in Linux dhclient-script
> +
> +Busybox is a lightweight implementation of coreutils commonly used on
> +space-constrained embedded Linux distributions. It's implementation of
> +chown and chmod doesn't provide a "--reference" option added to
> +client/scripts/linux as of commit 9261cb14. This change works around
> +that limitation by using stat to read ownership and permissions flags
> +and simple chown/chmod calls supported in both coreutils and busybox.
> +
> +    modified:   client/scripts/linux
> +
> +Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> +Upstream-Status: Pending [ISC-Bugs #48771]
> +---
> + client/scripts/linux | 17 +++++++++++++----
> + 1 file changed, 13 insertions(+), 4 deletions(-)
> +
> +diff --git a/client/scripts/linux b/client/scripts/linux
> +index e9ea379..8d4acbf 100755
> +--- a/client/scripts/linux
> ++++ b/client/scripts/linux
> +@@ -32,6 +32,17 @@
> + # if your system holds ip tool in a non-standard location.
> + ip=/sbin/ip
> +
> ++chown_chmod_by_reference() {
> ++    local reference_file="$1"
> ++    local target_file="$2"
> ++
> ++    local owner=$(stat -c "%u:%g" "$reference_file")
> ++    local perm=$(stat -c "%a" "$reference_file")
> ++
> ++    chown "$owner" "$target_file"
> ++    chmod "$perm" "$target_file"
> ++}
> ++
> + # update /etc/resolv.conf based on received values
> + # This updated version mostly follows Debian script by Andrew Pollock et al.
> + make_resolv_conf() {
> +@@ -74,8 +85,7 @@ make_resolv_conf() {
> +         fi
> +
> + 	if [ -f /etc/resolv.conf ]; then
> +-	    chown --reference=/etc/resolv.conf $new_resolv_conf
> +-	    chmod --reference=/etc/resolv.conf $new_resolv_conf
> ++	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
> + 	fi
> +         mv -f $new_resolv_conf /etc/resolv.conf
> +     # DHCPv6
> +@@ -101,8 +111,7 @@ make_resolv_conf() {
> +         fi
> +
> + 	if [ -f /etc/resolv.conf ]; then
> +-            chown --reference=/etc/resolv.conf $new_resolv_conf
> +-            chmod --reference=/etc/resolv.conf $new_resolv_conf
> ++	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
> + 	fi
> +         mv -f $new_resolv_conf /etc/resolv.conf
> +     fi
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb
> new file mode 100644
> index 000000000..30ca34722
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb
> @@ -0,0 +1,24 @@
> +require dhcp.inc
> +
> +SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch \
> +            file://0002-dhclient-dbus.patch \
> +            file://0003-link-with-lcrypto.patch \
> +            file://0004-Fix-out-of-tree-builds.patch \
> +            file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
> +            file://0006-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
> +            file://0007-remove-dhclient-script-bash-dependency.patch \
> +            file://0008-dhcp-correct-the-intention-for-xml2-lib-search.patch \
> +            file://0009-Workaround-busybox-limitation-in-Linux-dhclient-scri.patch \
> +           "
> +
> +SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
> +SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
> +
> +LDFLAGS_append = " -pthread"
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
> +
> +CFLAGS += "-fcommon"
> +
> +PARALLEL_MAKE = ""
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
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-server b/meta-networking/recipes-connectivity/dhcp/files/default-server
> new file mode 100644
> index 000000000..0385d1699
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/default-server
> @@ -0,0 +1,7 @@
> +# Defaults for dhcp initscript
> +# sourced by /etc/init.d/dhcp-server
> +# installed at /etc/default/dhcp-server by the maintainer scripts
> +
> +# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
> +#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
> +INTERFACES=""
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper b/meta-networking/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
> new file mode 100644
> index 000000000..7d0e224a1
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +
> +# In case the interface is used for nfs, skip it.
> +nfsroot=0
> +interfaces=""
> +exec 9<&0 < /proc/mounts
> +while read dev mtpt fstype rest; do
> +    if test $mtpt = "/" ; then
> +        case $fstype in
> +            nfs | nfs4)
> +                nfsroot=1
> +                nfs_addr=`echo $rest | sed -e 's/^.*addr=\([0-9.]*\).*$/\1/'`
> +                break
> +                ;;
> +            *)
> +                ;;
> +        esac
> +    fi
> +done
> +exec 0<&9 9<&-
> +
> +if [ $nfsroot -eq 0 ]; then
> +    interfaces="$INTERFACES"
> +else
> +    if [ -x /bin/ip -o -x /sbin/ip ] ; then
> +	nfs_iface=`ip route get $nfs_addr | grep dev | sed -e 's/^.*dev \([-a-z0-9.]*\).*$/\1/'`
> +    fi
> +    for i in $INTERFACES; do
> +	if test "x$i" = "x$nfs_iface"; then
> +            echo "dhclient skipping nfsroot interface $i"
> +	else
> +	    interfaces="$interfaces $i"
> +	fi
> +    done
> +fi
> +
> +if test "x$interfaces" != "x"; then
> +    /sbin/dhclient -d -cf /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases $interfaces
> +fi
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhclient.conf b/meta-networking/recipes-connectivity/dhcp/files/dhclient.conf
> new file mode 100644
> index 000000000..0e6dcf96c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhclient.conf
> @@ -0,0 +1,50 @@
> +# Configuration file for /sbin/dhclient, which is included in Debian's
> +#	dhcp3-client package.
> +#
> +# This is a sample configuration file for dhclient. See dhclient.conf's
> +#	man page for more information about the syntax of this file
> +#	and a more comprehensive list of the parameters understood by
> +#	dhclient.
> +#
> +# Normally, if the DHCP server provides reasonable information and does
> +#	not leave anything out (like the domain name, for example), then
> +#	few changes must be made to this file, if any.
> +#
> +
> +#send host-name "andare.fugue.com";
> +#send dhcp-client-identifier 1:0:a0:24:ab:fb:9c;
> +#send dhcp-lease-time 3600;
> +#supersede domain-name "fugue.com home.vix.com";
> +#prepend domain-name-servers 127.0.0.1;
> +request subnet-mask, broadcast-address, time-offset, routers,
> +	domain-name, domain-name-servers, host-name,
> +	netbios-name-servers, netbios-scope;
> +#require subnet-mask, domain-name-servers;
> +#timeout 60;
> +#retry 60;
> +#reboot 10;
> +#select-timeout 5;
> +#initial-interval 2;
> +#script "/etc/dhcp3/dhclient-script";
> +#media "-link0 -link1 -link2", "link0 link1";
> +#reject 192.33.137.209;
> +
> +#alias {
> +#  interface "eth0";
> +#  fixed-address 192.5.5.213;
> +#  option subnet-mask 255.255.255.255;
> +#}
> +
> +#lease {
> +#  interface "eth0";
> +#  fixed-address 192.33.137.200;
> +#  medium "link0 link1";
> +#  option host-name "andare.swiftmedia.com";
> +#  option subnet-mask 255.255.255.0;
> +#  option broadcast-address 192.33.137.255;
> +#  option routers 192.33.137.250;
> +#  option domain-name-servers 127.0.0.1;
> +#  renew 2 2000/1/12 00:00:01;
> +#  rebind 2 2000/1/12 00:00:01;
> +#  expire 2 2000/1/12 00:00:01;
> +#}
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhclient.service b/meta-networking/recipes-connectivity/dhcp/files/dhclient.service
> new file mode 100644
> index 000000000..9ddb4d1df
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhclient.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Dynamic Host Configuration Protocol (DHCP)
> +Wants=network.target
> +Before=network.target
> +After=systemd-udevd.service
> +
> +[Service]
> +EnvironmentFile=-@SYSCONFDIR@/default/dhcp-client
> +ExecStart=@BASE_SBINDIR@/dhclient-systemd-wrapper
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcpd.conf b/meta-networking/recipes-connectivity/dhcp/files/dhcpd.conf
> new file mode 100644
> index 000000000..0001c0f00
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhcpd.conf
> @@ -0,0 +1,108 @@
> +#
> +# Sample configuration file for ISC dhcpd for Debian
> +#
> +# $Id: dhcpd.conf,v 1.1.1.1 2002/05/21 00:07:44 peloy Exp $
> +#
> +
> +# The ddns-updates-style parameter controls whether or not the server will
> +# attempt to do a DNS update when a lease is confirmed. We default to the
> +# behavior of the version 2 packages ('none', since DHCP v2 didn't
> +# have support for DDNS.)
> +ddns-update-style none;
> +
> +# option definitions common to all supported networks...
> +option domain-name "example.org";
> +option domain-name-servers ns1.example.org, ns2.example.org;
> +
> +default-lease-time 600;
> +max-lease-time 7200;
> +
> +# If this DHCP server is the official DHCP server for the local
> +# network, the authoritative directive should be uncommented.
> +#authoritative;
> +
> +# Use this to send dhcp log messages to a different log file (you also
> +# have to hack syslog.conf to complete the redirection).
> +log-facility local7;
> +
> +# No service will be given on this subnet, but declaring it helps the
> +# DHCP server to understand the network topology.
> +
> +#subnet 10.152.187.0 netmask 255.255.255.0 {
> +#}
> +
> +# This is a very basic subnet declaration.
> +
> +#subnet 10.254.239.0 netmask 255.255.255.224 {
> +#  range 10.254.239.10 10.254.239.20;
> +#  option routers rtr-239-0-1.example.org, rtr-239-0-2.example.org;
> +#}
> +
> +# This declaration allows BOOTP clients to get dynamic addresses,
> +# which we don't really recommend.
> +
> +#subnet 10.254.239.32 netmask 255.255.255.224 {
> +#  range dynamic-bootp 10.254.239.40 10.254.239.60;
> +#  option broadcast-address 10.254.239.31;
> +#  option routers rtr-239-32-1.example.org;
> +#}
> +
> +# A slightly different configuration for an internal subnet.
> +#subnet 10.5.5.0 netmask 255.255.255.224 {
> +#  range 10.5.5.26 10.5.5.30;
> +#  option domain-name-servers ns1.internal.example.org;
> +#  option domain-name "internal.example.org";
> +#  option routers 10.5.5.1;
> +#  option broadcast-address 10.5.5.31;
> +#  default-lease-time 600;
> +#  max-lease-time 7200;
> +#}
> +
> +# Hosts which require special configuration options can be listed in
> +# host statements.   If no address is specified, the address will be
> +# allocated dynamically (if possible), but the host-specific information
> +# will still come from the host declaration.
> +
> +#host passacaglia {
> +#  hardware ethernet 0:0:c0:5d:bd:95;
> +#  filename "vmunix.passacaglia";
> +#  server-name "toccata.fugue.com";
> +#}
> +
> +# Fixed IP addresses can also be specified for hosts.   These addresses
> +# should not also be listed as being available for dynamic assignment.
> +# Hosts for which fixed IP addresses have been specified can boot using
> +# BOOTP or DHCP.   Hosts for which no fixed address is specified can only
> +# be booted with DHCP, unless there is an address range on the subnet
> +# to which a BOOTP client is connected which has the dynamic-bootp flag
> +# set.
> +#host fantasia {
> +#  hardware ethernet 08:00:07:26:c0:a5;
> +#  fixed-address fantasia.fugue.com;
> +#}
> +
> +# You can declare a class of clients and then do address allocation
> +# based on that.   The example below shows a case where all clients
> +# in a certain class get addresses on the 10.17.224/24 subnet, and all
> +# other clients get addresses on the 10.0.29/24 subnet.
> +
> +#class "foo" {
> +#  match if substring (option vendor-class-identifier, 0, 4) = "SUNW";
> +#}
> +
> +#shared-network 224-29 {
> +#  subnet 10.17.224.0 netmask 255.255.255.0 {
> +#    option routers rtr-224.example.org;
> +#  }
> +#  subnet 10.0.29.0 netmask 255.255.255.0 {
> +#    option routers rtr-29.example.org;
> +#  }
> +#  pool {
> +#    allow members of "foo";
> +#    range 10.17.224.10 10.17.224.250;
> +#  }
> +#  pool {
> +#    deny members of "foo";
> +#    range 10.0.29.10 10.0.29.230;
> +#  }
> +#}
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcpd.service b/meta-networking/recipes-connectivity/dhcp/files/dhcpd.service
> new file mode 100644
> index 000000000..ae4f93eca
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhcpd.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=DHCPv4 Server Daemon
> +Documentation=man:dhcpd(8) man:dhcpd.conf(5)
> +After=network.target
> +After=time-sync.target
> +
> +[Service]
> +PIDFile=@localstatedir@/run/dhcpd.pid
> +EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
> +EnvironmentFile=-@SYSCONFDIR@/sysconfig/dhcp-server
> +ExecStartPre=@base_bindir@/touch @localstatedir@/lib/dhcp/dhcpd.leases
> +ExecStart=@SBINDIR@/dhcpd -f -cf @SYSCONFDIR@/dhcp/dhcpd.conf -pf @localstatedir@/run/dhcpd.pid $DHCPDARGS -q $INTERFACES
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcpd6.service b/meta-networking/recipes-connectivity/dhcp/files/dhcpd6.service
> new file mode 100644
> index 000000000..52a6224dc
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhcpd6.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=DHCPv6 Server Daemon
> +Documentation=man:dhcpd(8) man:dhcpd.conf(5)
> +After=network.target
> +After=time-sync.target
> +
> +[Service]
> +PIDFile=@localstatedir@/run/dhcpd6.pid
> +EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
> +EnvironmentFile=-@SYSCONFDIR@/sysconfig/dhcpd6
> +ExecStartPre=@base_bindir@/touch @localstatedir@/lib/dhcp/dhcpd6.leases
> +ExecStart=@SBINDIR@/dhcpd -f -6 -cf @SYSCONFDIR@/dhcp/dhcpd6.conf -pf @localstatedir@/run/dhcpd6.pid $DHCPDARGS -q $INTERFACES
> +
> +[Install]
> +WantedBy=multi-user.target
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
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-server b/meta-networking/recipes-connectivity/dhcp/files/init-server
> new file mode 100644
> index 000000000..5e693adf7
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/init-server
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +#
> +# $Id: dhcp3-server.init.d,v 1.4 2003/07/13 19:12:41 mdz Exp $
> +#
> +
> +test -f /usr/sbin/dhcpd || exit 0
> +
> +# It is not safe to start if we don't have a default configuration...
> +if [ ! -f /etc/default/dhcp-server ]; then
> +	echo "/etc/default/dhcp-server does not exist! - Aborting..."
> +	exit 0
> +fi
> +
> +# Read init script configuration (so far only interfaces the daemon
> +# should listen on.)
> +. /etc/default/dhcp-server
> +
> +case "$1" in
> +	start)
> +		echo -n "Starting DHCP server: "
> +		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
> +		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases	
> +		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES -user dhcp -group dhcp
> +		echo "."
> +		;;
> +	stop)
> +		echo -n "Stopping DHCP server: dhcpd3"
> +		start-stop-daemon -K -x /usr/sbin/dhcpd
> +		echo "."
> +		;;
> +	restart | force-reload)
> +		$0 stop
> +		sleep 2
> +		$0 start
> +		if [ "$?" != "0" ]; then
> +			exit 1
> +		fi
> +		;;
> +	*)
> +		echo "Usage: /etc/init.d/dhcp-server {start|stop|restart|force-reload}"
> +		exit 1
> +esac
> +
> +exit 0
> 
> 
> 
> 
> 
