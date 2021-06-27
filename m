Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.2665.1624825349333531150
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UeR7Vx5Z;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id a2so13457619pgi.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tKCU4cqPY0OFejJV9lMKyV5OfByV6P99NJoLX9nxsMw=;
        b=UeR7Vx5ZOseY6L9rVGVNjPJZLkJaW2fZwgltD1TbjdS/rIFzp2OhXsbr300kAcj57x
         PH1brHBpgee6TLoZ//Skof7DMUeBm3wIk9dzf/bMOu4ADfhPohsBO4n3bXPgwFi8R+1S
         PROg2cw/ipNt7Zx1uVp3RJztf7voySjIVqRXrm+B6COiDSpcwzyBVPyxoHDOMJCrvgJw
         yUSn2Kbe2Z8XDMuKKYNT5wpixG3918ZxUDaNXpXmX3oVQ2hxnYnnR0dx0AQhL5HcHH0y
         eyT2/Cj3vGz7rhs3CfBhE9cMfhRvdI7vZCjCsFwi7szfZqJbUrfq6pyMCVmvPuG8lG44
         WM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tKCU4cqPY0OFejJV9lMKyV5OfByV6P99NJoLX9nxsMw=;
        b=CBg4A9hRX9NewiLOSG2glneeYEL8BrCFwn3kS04LRJDZz3G6fydM4K/DKCnR3/9OuX
         4gCESDNtYHD4YXFrLC2WjptSDghMz6rJHzVmyLyeTMaupnl0CZ5ekBu4WBK8LaQx1kPo
         r8ApuxIQiB6UdINp7c0xfLNMz6s5iZK0jEGJq/V5Aqlv0DS6Pi4UN5k+FMkOM3Omo9E4
         prPHNDvPjZlolSvpDBoU1iq2Nl46eshpE4s6TQrYX2prHAwioCRflCPFPlUJGY1r7dwp
         c+PtSgwt8RkD+J44XlbRkb00+NKTZgzOmQvADu2CgcJs6ZHNtTgjk5tVT52QygO4nCXd
         FGyA==
X-Gm-Message-State: AOAM530KyD2OrM8b75P9RsYH3pup7DMXyo3bIGHyLhePa83VhklpQQbM
	hdlldHbY8KPoEtMWWKbQZ97s5Xf5MlynMg==
X-Google-Smtp-Source: ABdhPJxsO0fR9WQwhqGl7dyrmnsUWmoxs2EQNJMeLKKqornCEWU2yCJy6JuehZaDZuobzvOy+r2TSA==
X-Received: by 2002:a63:e04c:: with SMTP id n12mr19924728pgj.239.1624825348704;
        Sun, 27 Jun 2021 13:22:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/20] net-snmp: A little clean up
Date: Sun, 27 Jun 2021 13:22:06 -0700
Message-Id: <f7967ddfbb634fdaccb49b7289f54834a51d1e89.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

* Remove the explicit dependency on libnl as the libnl PACKAGECONFIG
  depends on it as necessary.
* Add a PACKAGECONFIG for systemd to replace modifying EXTRA_OECONF
  directly.
* Sort the PACKAGECONFIGs.
* Some whitespace clean up.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 411c981ef01b9965c22b7c35549dc95023169ea7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../net-snmp/net-snmp_5.9.1.bb                | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index d03961ab37..46aba3b81a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD & MIT"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9d100a395a38584f2ec18a8275261687"
 
-DEPENDS = "openssl libnl pciutils"
+DEPENDS = "openssl pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://init \
@@ -41,24 +41,23 @@ CCACHE = ""
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} des smux"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} des smux"
+PACKAGECONFIG[des] = "--enable-des, --disable-des"
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
 PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
-
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
-
-PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no,\
-                       perl,"
-PACKAGECONFIG[des] = "--enable-des,--disable-des"
+PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no, perl"
 PACKAGECONFIG[smux] = ""
-
-EXTRA_OECONF = "--enable-shared \
-                --disable-manuals \
-                --with-defaults \
-                --with-install-prefix=${D} \
-                --with-persistent-directory=${localstatedir}/lib/net-snmp \
-                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
-                --with-mib-modules='${MIB_MODULES}' \
+PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd"
+
+EXTRA_OECONF = " \
+    --enable-shared \
+    --disable-manuals \
+    --with-defaults \
+    --with-install-prefix=${D} \
+    --with-persistent-directory=${localstatedir}/lib/net-snmp \
+    --with-endianness=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+    --with-mib-modules='${MIB_MODULES}' \
 "
 
 MIB_MODULES = ""
@@ -117,7 +116,7 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
-    sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+    sed -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
@@ -232,8 +231,6 @@ INITSCRIPT_PACKAGES = "${PN}-server-snmpd"
 INITSCRIPT_NAME_${PN}-server-snmpd = "snmpd"
 INITSCRIPT_PARAMS_${PN}-server-snmpd = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
-
 SYSTEMD_PACKAGES = "${PN}-server-snmpd \
                     ${PN}-server-snmptrapd"
 
-- 
2.17.1

