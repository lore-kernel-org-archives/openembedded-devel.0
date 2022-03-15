Return-Path: <Nandipati.AnuDeepthika@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619F7C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 12:22:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.106])
 by mx.groups.io with SMTP id smtpd.web11.10087.1647346955046878478
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 05:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=otbIk4h4;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.22.106,
 mailfrom: anudeepthika@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+IAW939nKeb7T8eZwrE6u6SfYuNbJkmaWy6t0TRzSoSQS9u8cuCE0FRaBbTI7SZQRkLjxEy1bcM9Jea0By6RzbtVodq2/3I5+vi+0lk1fRTCcTXJ2sZZE1mjCHZwZ17y+QiyzLYh3tOt/UXcanIbmYw1kPPgt125l0GIXTjCh02bHZT6JxjfwpTMU9okilhWI15pK8Eqw3/7IYcYhGrEUUJj34b3RhDaJypCSkkoJoi3315oJgGs50F1ZqTbdCi5Nd4lAPyOwME/vxaxkCn6jO5ZvM+utYbTtDlAUR3+3zHBXxCK/C8m8c87BL6BxRCB97fXixe6Ptuvj5gdShQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86sPjNt6FbNdvxeeaA6SoIgyFCpCz6fF8FNbmUpRJ00=;
 b=HtRFrz4+OvAM4uNRcBKvENXibMhiq21Fy3wDpA+ma8J7mkUnRvqP1IqvMMP/1qbj5mXb40elJiBpzQKxwl4KiFi96gAVzils3oX0pMkiOQQ/WS5ZG3V2hMZSgsg4A4668Z/M6SrfzZXlTBWaK1ua9+LM0UJSXcGCjnnKA79DdaDqqZWF6G5Y9t6+KaCmOt5FVUzBsyjB01HJTszWEu8UZhd7N5iQ7crtuhaGR1p9Itq5m4WVYiIgeXcipufLL/erhIseP8/ePsSppfsv+Sbt+x2FufiF7Xq8fcgVVLMh6hc+U4K6CWYMfwzbjMu+qHteZVQ9hDYOQ4VSZKaLxuUdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86sPjNt6FbNdvxeeaA6SoIgyFCpCz6fF8FNbmUpRJ00=;
 b=otbIk4h4mYAjuqhQsY8qjr89YAFbDpn9XlUttdB+B6fLUlomFpFhlbMS/r5LdWAVnZMzOYj2Fwh0qFFN2h9SIsOXDLKY7Bn3FKaIrg/G7B89HKcvURJzTW/dyrf8B8lsgZ09jMiSq1yEMpxn5Tp2HIEnK+OlvIL0ymxzI99deVg=
Received: from DB6PR0202CA0031.eurprd02.prod.outlook.com (2603:10a6:4:a5::17)
 by AM8P122MB0262.EURP122.PROD.OUTLOOK.COM (2603:10a6:20b:229::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Tue, 15 Mar
 2022 12:22:32 +0000
Received: from DB5EUR01FT101.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::64) by DB6PR0202CA0031.outlook.office365.com
 (2603:10a6:4:a5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29 via Frontend
 Transport; Tue, 15 Mar 2022 12:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com;
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 DB5EUR01FT101.mail.protection.outlook.com (10.152.5.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.10 via Frontend Transport; Tue, 15 Mar 2022 12:22:31 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id U5uVngIRIcz85U5ynngxqK; Tue, 15 Mar 2022 12:08:45 +0000
Received: from INGBTCPIC6LX130.in-101.lan.philips.com ([161.85.104.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id U6BwnUdfopiPMU6C6n92oH; Tue, 15 Mar 2022 12:22:31 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Anu Deepthika <anudeepthika@code1.emi.philips.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] usbguard: Add inital recipe
Date: Tue, 15 Mar 2022 23:21:59 +0530
Message-ID: <20220315175159.3787985-1-anudeepthika@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Nandipati.AnuDeepthika@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9686ceba-c62d-423b-3ab7-08da067e7a84
X-MS-TrafficTypeDiagnostic: AM8P122MB0262:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8P122MB0262AF9458C4AE6BD08291038E109@AM8P122MB0262.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rypJOU0aw5sBfdqSivBoCbW+gl6mbnwMvqwq24Nlue2NN9WplikTtvqehATTaanD9PTwiaSbe0lDT/7Q2j6cUphK6AsIUAuu1lDtBFzD6OuyHC2kp1DkI9M/9xKcSIdqqQCXaQToLIpOtH43T9vS8rC8/ToPTihvbFFcwIroPsiqycLB1J2bHcf/Xuau6fxwc1wOXoBVedVQwVHAxgpIe3bREyxVBcwHHJyZWsuCnMM/e7Iwl4Of+sd/eFTNqKwT1YUorg+yxTbyi/AxNK475yOzBVyTARbBv7j6o1b8oJNjKpeVptns2VmDrQF39PN9V2H3SWt2TkKxzkxOJQtHHgnpzhZv8MfzKWw3FQdTJV7nAdW/Ylhwrg7/ih5h9MpdItCTa2+QcJQQexhYRcvGASyH+POmA3cv3AofGMA87TrAKCSouCqWk4cbDM3/pCv9AXFgXYxpbLy5+yFobejl6Zv7NYxJQaHNsbrapESnfLgv3bxm5TExexfLBO2yPTg80/Di1gLM0KWI7t7nHTn96s55n9jsM3YWdWeSHL80nBB38O11WjNVKU2pkNUX4u0PhN3QL7nBWXxk0FIbybO6fvLZjeNXCuxwBuHIZwOn+lLcoE2/01XZsuDajBdng8CrNvwSfr+0YW59tTwSLA37Buwy1EI5dcUzN9Vs5bzzhVNQ9oDO9O6Od9ODB03eez95V3ZKPZUz9mOrLqzVG0bKOs6hvgTOKAqQ+eaWHX/ghmQFUM2JaJ+2mEG5ikVuBFfsJSATEG20V5S6ukX061a8T644phAgufEldLpL20q5QSE=
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8676002)(6916009)(70206006)(70586007)(316002)(40460700003)(508600001)(82960400001)(81166007)(356005)(86362001)(2906002)(34020700004)(6666004)(47076005)(36860700001)(1076003)(2616005)(956004)(82310400004)(336012)(186003)(26005)(8936002)(5660300002)(83380400001);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 12:22:31.2478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9686ceba-c62d-423b-3ab7-08da067e7a84
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT101.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P122MB0262
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 12:22:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95990

From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>

Set one crypto-backend library at a time
OpenSSL is the crypto-backend library set for device hashing
Override PACKAGECONFIG to replace it with libsodium or libgcrypt

Signed-off-by: Anu Deepthika, Nandipati <Nandipati.AnuDeepthika@philips.com=
>
---
 ...kgconfig-instead-of-libgcrypt-config.patch | 106 ++++++++++++++++++
 .../usbguard/usbguard_1.1.0.bb                |  74 ++++++++++++
 2 files changed, 180 insertions(+)
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Add-and=
-use-pkgconfig-instead-of-libgcrypt-config.patch
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb

diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pk=
gconfig-instead-of-libgcrypt-config.patch b/meta-oe/recipes-security/usbgua=
rd/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
new file mode 100644
index 000000000..a7a3eb043
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig=
-instead-of-libgcrypt-config.patch
@@ -0,0 +1,106 @@
+From e36cbf9d7a32de9945a8b6c62ad29dfb60358081 Mon Sep 17 00:00:00 2001
+From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>
+Date: Wed, 9 Mar 2022 02:03:51 +0530
+Subject: [PATCH] Add and use pkgconfig instead of libgcrypt-config
+
+Upstream-Status: Pending
+
+Signed-off-by: Anu Deepthika, Nandipati <Nandipati.AnuDeepthika@philips.co=
m>
+---
+ m4/libgcrypt.m4 | 56 ++-----------------------------------------------
+ 1 file changed, 2 insertions(+), 54 deletions(-)
+
+diff --git a/m4/libgcrypt.m4 b/m4/libgcrypt.m4
+index 9a29eb5..465fe24 100644
+--- a/m4/libgcrypt.m4
++++ b/m4/libgcrypt.m4
+@@ -22,17 +22,7 @@ dnl with a changed API.
+ dnl
+ AC_DEFUN([AM_PATH_LIBGCRYPT],
+ [ AC_REQUIRE([AC_CANONICAL_HOST])
+-  AC_ARG_WITH(libgcrypt-prefix,
+-            AS_HELP_STRING([--with-libgcrypt-prefix=3DPFX],
+-                           [prefix where LIBGCRYPT is installed (optional=
)]),
+-     libgcrypt_config_prefix=3D"$withval", libgcrypt_config_prefix=3D"")
+-  if test x$libgcrypt_config_prefix !=3D x ; then
+-     if test x${LIBGCRYPT_CONFIG+set} !=3D xset ; then
+-        LIBGCRYPT_CONFIG=3D$libgcrypt_config_prefix/bin/libgcrypt-config
+-     fi
+-  fi
+=20
+-  AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, no)
+   tmp=3Difelse([$1], ,1:1.2.0,$1)
+   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
+      req_libgcrypt_api=3D`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
+@@ -41,44 +31,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+      req_libgcrypt_api=3D0
+      min_libgcrypt_version=3D"$tmp"
+   fi
++  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >=3D $min_libgcrypt_version], [=
ok=3Dyes], [ok=3Dno])
+=20
+-  AC_MSG_CHECKING(for LIBGCRYPT - version >=3D $min_libgcrypt_version)
+-  ok=3Dno
+-  if test "$LIBGCRYPT_CONFIG" !=3D "no" ; then
+-    req_major=3D`echo $min_libgcrypt_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=3D`echo $min_libgcrypt_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    req_micro=3D`echo $min_libgcrypt_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-    libgcrypt_config_version=3D`$LIBGCRYPT_CONFIG --version`
+-    major=3D`echo $libgcrypt_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+-    minor=3D`echo $libgcrypt_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
+-    micro=3D`echo $libgcrypt_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
+-    if test "$major" -gt "$req_major"; then
+-        ok=3Dyes
+-    else
+-        if test "$major" -eq "$req_major"; then
+-            if test "$minor" -gt "$req_minor"; then
+-               ok=3Dyes
+-            else
+-               if test "$minor" -eq "$req_minor"; then
+-                   if test "$micro" -ge "$req_micro"; then
+-                     ok=3Dyes
+-                   fi
+-               fi
+-            fi
+-        fi
+-    fi
+-  fi
+-  if test $ok =3D yes; then
+-    AC_MSG_RESULT([yes ($libgcrypt_config_version)])
+-  else
+-    AC_MSG_RESULT(no)
+-  fi
+   if test $ok =3D yes; then
+      # If we have a recent libgcrypt, we should also check that the
+      # API is compatible
+@@ -96,10 +50,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+      fi
+   fi
+   if test $ok =3D yes; then
+-    LIBGCRYPT_CFLAGS=3D`$LIBGCRYPT_CONFIG --cflags`
+-    LIBGCRYPT_LIBS=3D`$LIBGCRYPT_CONFIG --libs`
+     ifelse([$2], , :, [$2])
+-    libgcrypt_config_host=3D`$LIBGCRYPT_CONFIG --host 2>/dev/null || echo=
 none`
++	libgcrypt_config_host=3D`$PKG_CONFIG --variable=3Dhost libgcrypt`
+     if test x"$libgcrypt_config_host" !=3D xnone ; then
+       if test x"$libgcrypt_config_host" !=3D x"$host" ; then
+   AC_MSG_WARN([[
+@@ -112,10 +64,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+ ***]])
+       fi
+     fi
+-  else
+-    LIBGCRYPT_CFLAGS=3D""
+-    LIBGCRYPT_LIBS=3D""
+-    ifelse([$3], , :, [$3])
+   fi
+   AC_SUBST(LIBGCRYPT_CFLAGS)
+   AC_SUBST(LIBGCRYPT_LIBS)
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb b/meta-oe/=
recipes-security/usbguard/usbguard_1.1.0.bb
new file mode 100644
index 000000000..da192ce50
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
@@ -0,0 +1,74 @@
+# Copyright (c) 2021 Koninklijke Philips N.V.
+#
+# SPDX-License-Identifier: MIT
+#
+SUMMARY =3D "USBGuard daemon for blacklisting and whitelisting of USB devi=
ces"
+DESCRIPTION =3D "The USBGuard software framework helps to protect your com=
puter against \
+rogue USB devices (a.k.a. Bad USB) by implementing basic whitelisting and =
blacklisting \
+capabilities based on device attributes. This recipe takes OpenSSL as cryp=
to-backend for \
+computing device hashes (Supported values are sodium, gcrypt, openssl)."
+HOMEPAGE =3D "https://usbguard.github.io/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
+
+SRC_URI =3D "https://github.com/USBGuard/usbguard/releases/download/${BPN}=
-${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.p=
atch"
+
+SRC_URI[sha256sum] =3D "a39104042b0c57f969c4e6580f6d80ad7066551eda96660069=
5e644081128a2d"
+
+inherit autotools-brokensep bash-completion pkgconfig systemd
+
+DEPENDS =3D "glib-2.0-native libcap-ng libqb libxml2-native libxslt-native=
 pegtl protobuf protobuf-native xmlto-native"
+
+S =3D "${WORKDIR}/${BPN}-${PV}"
+
+EXTRA_OECONF +=3D "\
+                 --with-bundled-catch \
+                 --with-bundled-pegtl \
+                "
+
+PACKAGECONFIG ?=3D "\
+                  openssl \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                 "
+
+# USBGuard has made polkit mandatory to configure with-dbus
+PACKAGECONFIG[dbus] =3D "--with-dbus,--without-dbus,dbus-glib polkit"
+PACKAGECONFIG[libgcrypt] =3D "--with-crypto-library=3Dgcrypt,,libgcrypt,,,=
libsodium openssl"
+PACKAGECONFIG[libsodium] =3D "--with-crypto-library=3Dsodium,,libsodium,,,=
libgcrypt openssl"
+PACKAGECONFIG[openssl] =3D "--with-crypto-library=3Dopenssl,,openssl,,,lib=
gcrypt libsodium"
+PACKAGECONFIG[polkit] =3D "--with-polkit,--without-polkit,polkit"
+PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
+
+SYSTEMD_PACKAGES =3D "${PN}"
+
+SYSTEMD_SERVICE_${PN} =3D "usbguard.service"
+
+SYSTEMD_PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN=
}-dbus', '', d)}"
+
+SYSTEMD_SERVICE_${PN}-dbus =3D "usbguard-dbus.service"
+
+PACKAGES =3D+ "${PN}-dbus"
+
+FILES:${PN} +=3D "\
+                ${systemd_unitdir}/system/usbguard.service \
+                ${systemd_unitdir}/system/usbguard-dbus.service \
+                ${datadir}/polkit-1 \
+                ${datadir}/polkit-1/actions \
+                ${datadir}/dbus-1 \
+               "
+
+INSANE_SKIP:${PN} +=3D "empty-dirs"
+
+do_install:append() {
+# Create /var/log/usbguard in runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} 0755 root root -" > ${D}${nona=
rch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${s=
ysconfdir}/default/volatiles/99_${BPN}
+    fi
+}
\ No newline at end of file
--=20
2.25.1


