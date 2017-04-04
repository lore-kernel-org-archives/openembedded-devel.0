Return-Path: <oliver.graute@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8A44060291
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Apr 2017 15:36:03 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id o81so28837283wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Apr 2017 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mail-followup-to:mime-version
	:content-disposition:user-agent;
	bh=MIKxgRsfNU6vf+hXFhtAMbHYdPzxHIbXdTK8mhdLhqw=;
	b=TgxVGIVNSCnYxjiTc/ytvIruoyC5shnlZYVT+jh9FsQwtDozEuVuj4tLZrSbSCdzeB
	xBv73CJlvLc3ea2N6ALSRkmjHhcnNIglWAJ3OYc+jWj9dWE40572z2CNBAxx8G9kFdG1
	EQows7CUiEPnPZw6cgLTocEYIx12N/r4rmfU+rOWsP2E6I9xHt+gzI971b+UTBSUFbNX
	+qRQDmcuWCsvcVsNQuG07vT8ABLVUzA8Sfvasfka04FQzXvh6CT/dqQ6yHyid6rqQxIO
	JzXgQLMGY8fysfR0g9iho7UzmS2iYCVcS1fnan08KhgCbUgRC+bJzD1315y2S5/mUxv+
	pXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:mime-version:content-disposition:user-agent;
	bh=MIKxgRsfNU6vf+hXFhtAMbHYdPzxHIbXdTK8mhdLhqw=;
	b=l/npBV3EPag382217J+x/lElIouLP2t/R02z22CjxD24TawtYgfEF+Du6c4nkjk3pu
	YAx/XOy6GlULgQQ+krvcUHJUFXRIwMO3NhGwuAV2XgpkGgBY7jHj34Zdk5FX44qucRf+
	Z3Sl5N8Lk+k4kO/Lr4zS0KZrvt3HdNKpCQY/0d6AQSPHNm4P9hQRJcVbM/ZjEUza2B/W
	Oaus5eEAQUVx4tzineO0TtIClnE2fTw6n4FZqfSHioswu7NSWanXXB8PEhZoN4GUsC9l
	rVcO8R5LWyqJ+AvXi1aj4GjmlCtgodntUrcnqlZp82wZ6uSKl+1tIilTdIlFevO8hWCl
	Ey4w==
X-Gm-Message-State: AFeK/H0mhokiXsuetsvq88QDnO3EMbUxjmjD1365Zji4YXOJnE2dvRAt
	CeDqZbAjAXFfT14PHus=
X-Received: by 10.28.215.18 with SMTP id o18mr15334971wmg.98.1491320164134;
	Tue, 04 Apr 2017 08:36:04 -0700 (PDT)
Received: from localhost (x4e365c9d.dyn.telefonica.de. [78.54.92.157])
	by smtp.gmail.com with ESMTPSA id
	b42sm22854466wra.36.2017.04.04.08.36.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 04 Apr 2017 08:36:03 -0700 (PDT)
Date: Tue, 4 Apr 2017 17:35:24 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170404153524.GA23716@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-networking] problem with unbound dependency to libreswan
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
X-List-Received-Date: Tue, 04 Apr 2017 15:36:09 -0000
X-Groupsio-MsgNum: 66096
Content-Type: multipart/mixed; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello list,

i'am working on a libreswan and a unbound recipe but im somewhere lost
in the include and dependency hell between unbound and libreswan.

perhaps somebody can point me into the right direction by reviewing my
provisional recipes.

this is the error I got on compiling libreswan:

DPOLICYGROUPSDIR=\"/etc/ipsec/ipsec.d/policies\" -DIPSEC_SECRETS_FILE=\"/etc/ipsec/ip
sec.secrets\" -DFORCE_PR_ASSERT -DRETRANSMIT_INTERVAL_DEFAULT="500" -DUSE_FORK=1 -DUSE_VFORK=0 -DUSE_DAEMON=0 -DUSE_PTHREAD_SETSCHEDPRIO=1 -DGCC_LINT -DALLOW_MICROSOFT_BAD_PROPOSAL -Werror -Wall -Wextra -Wform
at -Wformat-nonliteral -Wformat-security -Wundef -Wmissing-declarations -Wredundant-decls -Wnested-externs  -DNSS_REQ_AVA_COPY -I/home/graute/libreswan/ports/linux/include  \
|               -MMD -MF ./unbound.d \
|               -o ./unbound.o \
|               -c /home/graute/libreswan/lib/libswan/unbound.c
| /home/graute/libreswan/lib/libswan/unbound.c:30:46: fatal error: unbound.h: No such file or directory
| compilation terminated.
|
| /home/graute/libreswan/lib/libswan/unbound.c:30:46: fatal error: unbound.h: No such file or directory
| compilation terminated.
| make[3]: *** [unbound.o] Error 1

Best regards,

Oliver

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="unbound_1.6.1.bb"

# Copyright (C) 2017 Oliver Graute <oliver.graute@neuhaus.de>
# Released under the MIT license (see COPYING.MIT for the terms)

SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
DESCRIPTION = "\ Unbound is designed as a set of modular components, so that \
                also DNSSEC (secure DNS) validation and stub-resolvers \
                (that do not run as a server, but are linked into an applica \
                tion) are easily possible."

HOMEPAGE = "https://www.unbound.net/"
SECTION = "net"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
DEPENDS = "openssl libtool libevent"
RDEPENDS_${PN} += "bash"
inherit autotools pkgconfig
PR = "r0"

SRC_URI = "https://www.unbound.net/downloads/${BP}.tar.gz"
SRC_URI[md5sum] = "aa808f33d94a36c9312d1b8ad8805e14"
SRC_URI[sha256sum] = "42df63f743c0fe8424aeafcf003ad4b880b46c14149d696057313f5c1ef51400"

S = "${WORKDIR}/unbound-${PV}"

EXTRA_OECONF = " \
        --host=${TARGET_SYS} \
        --build=${BUILD_SYS} \
"

do_configure () {
        ${S}/configure ${EXTRA_OECONF}
}

do_compile () {
        make depend
        oe_runmake
}

do_install () {
#        oe_runmake install DESTDIR=${D} PREFIX=${prefix} LIB=${base_libdir}
        install -d ${D}${bindir}
        install -d ${D}${libdir}
        install -d ${D}${sysconfdir}
        install -m 644 -D ${S}/libunbound/unbound.h ${D}${includedir}/libunbound/unbound.h
        install -m 644 -D ${S}/doc/example.conf.in ${D}${sysconfdir}/unbound/unbound.conf
        install -m 644 -D ${S}/contrib/unbound.service.in ${D}${libdir}/systemd/unbound.service
        install -m 755 unbound ${D}${bindir}
        install -m 755 unbound-anchor ${D}${bindir}
        install -m 755 unbound-checkconf ${D}${bindir}
        install -m 755 unbound ${D}${bindir}
        install -m 755 unbound-control-setup ${D}${bindir}
        install -m 755 unbound-host ${D}${bindir}
#       install -m 755 ${S}/.libs/libunbound.so ${D}${libdir}/
}

FILES_${PN} ="${sysconfdir}/unbound/unbound.conf ${bindir}/unbound* ${libdir}/systemd/unbound.service ${includedir}/libunbound/unbound.h"
#FILES_${PN}-dev ="${includedir}/libunbound/unbound.h"
PACKAGES =+ "lib${BPN}"
FILES_lib${BPN} = "${libdir}/lib*.so.*"


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="libreswan_3.20.bb"

# Copyright (C) 2017 Oliver Graute <oliver.graute@neuhaus.de>
# Released under the MIT license (see COPYING.MIT for the terms)
DESCRIPTION = "Libreswan is an IPsec implementation for Linux."
SUMMARY = "Libreswan is an OpenSource IPsec implementation"
HOMEPAGE = "http://www.libreswan.org"
SECTION = "net"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
DEPENDS = "gmp nss libevent iproute2 iptables unbound flex-native"
RRECOMMENDS_${PN} = "kernel-module-ipsec"
RDEPENDS_${PN}_nylon = "perl"
PR = "r0"

SRC_URI = "http://download.libreswan.org/libreswan-${PV}.tar.gz"
SRC_URI[md5sum] = "72aecdf8314c0c47546d5ae2cf918191"
SRC_URI[sha256sum] = "2f0931c11ea0b9303ce1e4ee76ffe9db6f3bd70ceead51fe4ec11e2f40a9ae2e"

S = "${WORKDIR}/libreswan-${PV}"

PARALLEL_MAKE = ""
EXTRA_OECONF = " \
        --host=${TARGET_SYS} \
        --build=${BUILD_SYS} \
"

EXTRA_OEMAKE = "DESTDIR=${D} \
                USERCOMPILE="${CFLAGS}" \
                FINALCONFDIR=${sysconfdir}/ipsec \
                INC_RCDEFAULT=${sysconfdir}/init.d \
                INC_USRLOCAL=${prefix} \
                INC_MANDIR=share/man WERROR=''"

do_compile () {
	oe_runmake programs
}

do_install () {
        export WERROR_CFLAGS=""
	oe_runmake install
}

FILES_${PN} = "${sysconfdir} ${libdir}/ipsec/* ${sbindir}/* ${libexecdir}/ipsec/*"
FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"

CONFFILES_${PN} = "${sysconfdir}/ipsec/ipsec.conf"

--AqsLC8rIMeq19msA--
