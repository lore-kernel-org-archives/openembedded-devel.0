Return-Path: <Nandipati.AnuDeepthika@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD641C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 05:05:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web12.21243.1647407122554676691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 22:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=XxwvF5Nr;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.22.110,
 mailfrom: anudeepthika@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQPUkzhOkzjJgnQJ0cJLkZ9pbbCJEJIbFNCTt095Z30O/V0Z/qDFyGm5MaaTwi/8X5Ol/Ron+xJEQuwv0mNOLtdAIq6LUYQ5Upz2gpq1x46OGtqO7HLdOaDtwIhY9FdQyg2ps599hv6Bz6FEKmSQpK0jSQ6pQ4nHztkVTWVFrYpJFVXm0wtpkZ+7jRQRX6AnDgZMintm3e7j52e3+tduTsGgQLGpG7g3Tvv5x1NU4kgmtObKC56ZCVr7DXkVxX6zQRA0ZiyNzujgXGiGiXiPrus39GP8e+vrrTqwa4gBIeDywxLic4x5sweqHUuAfmKFRvi7ZkiuakpzJ2KvkK96+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mB4scv5/ULk/XAIo2Dz/Fla/cRmlYzY4lwFlzLGY6Qs=;
 b=UXDYXzqs0C1x2rFRLUS70vwJ8Hsma/GHlvBHocfcu3Nt8q1blMuDYdP1qyIY9JBO2iULCCuwHI2UOvLLQs4vHjxm6jodg2tiVQemClj3ckIHmKf1jex8IFOoSohZyRJcgm/A6YZu+nmqszyrl7WGdXpgPzDrBXIgGtrjWCr3cORE4THt1q/5f+J7pyjh4OqqWOf927WIjDJJiedZTUc6Zoc+oL5NWlcU9/pjerHg2LXS/jlX1yBufv6NuSJlU/WVKM/QO3M8qHg5A3Pgnp+Zmvjz02yx0cqYYkGv4i0eq9Pu4xFkI8O1UO3/7wnEhAuTTZ5+/5pxX8WP4Y81KQsSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mB4scv5/ULk/XAIo2Dz/Fla/cRmlYzY4lwFlzLGY6Qs=;
 b=XxwvF5Nr++KWtj9xZuySEInw6BHmVSVydMcSwN4IRd68fdWYSSjFPjETYofH/8TDuUugZv1heNHTxV4SdHimE3p1MKynrW5gcOZPlIa7SuKINVhRJmLHFVI/uybZVl9G3uAZppZbqXqbcQrXBxqRXAuv4Hx3rH/e5JbxSD7YPe4=
Received: from SV0P279CA0060.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::11)
 by AMAP122MB0243.EURP122.PROD.OUTLOOK.COM (2603:10a6:20b:195::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Wed, 16 Mar
 2022 05:05:19 +0000
Received: from HE1EUR01FT040.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::84) by SV0P279CA0060.outlook.office365.com
 (2603:10a6:f10:14::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Wed, 16 Mar 2022 05:05:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com;
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 HE1EUR01FT040.mail.protection.outlook.com (10.152.1.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Wed, 16 Mar 2022 05:05:17 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id ULY8ngMyNcz85ULdCnh9Ae; Wed, 16 Mar 2022 04:51:30 +0000
Received: from INGBTCPIC6LX130.in-101.lan.philips.com ([161.85.104.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id ULqQnV6e0piPMULqWn9WZ3; Wed, 16 Mar 2022 05:05:16 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Anu Deepthika <anudeepthika@code1.emi.philips.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v4] usbguard: Add inital recipe
Date: Wed, 16 Mar 2022 16:04:50 +0530
Message-ID: <20220316103450.3790172-1-anudeepthika@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Nandipati.AnuDeepthika@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1a9976c8-de0d-4aa8-c289-08da070a9059
X-MS-TrafficTypeDiagnostic: AMAP122MB0243:EE_
X-Microsoft-Antispam-PRVS: 
	<AMAP122MB02433398D2F814199899760F8E119@AMAP122MB0243.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z54pf0Kj8bQfbVGKo/qoxiKnGVp1zCqZ1RePvIT+HuAeERQZ+um+G+RETfJNsTesmIQaiE5iBz1gKUp4zAw/Pbv9pKta4MUftFj7C9TSuA9nXEjeWINEflsBvHdYK+UkOsXcIiLtmQbrMLduouskCwfN7elzuS7WrCrES2/ZLCOjyp5cZ2MW9s/8MgCM1JaMbeogFwhj/zQz0yQeA2SrMf0EGYHCgKSJb3hhkf+UCt5vj7M5XjWQzxDcDxVo0gLffPedn8E+xlIg79cfp26o7K9jasnwTLiK+yc9ZS25XYdjaTbiz/B1HVZnUmeSfcMVoWTEMDMScnG/snqNf2T+rqN/o2jZjMcW/pMSOnvO+Kb7t8SYxJgPuEdS9widpGckKGNeVKvlscdG9Kq1fGQgWGEF4Z0/Xi6mR53z2ki9U2Dp363HGl2BkS9Zyn20thZNtIK0BR4k6jkMB01NKJNeNHsj4v+e8Pmr8eUHQBpLy/HP3Gj2Y75Z8Adp658zboBz+o+8z8VKDba/jN85XniKv9z1aAYaIdpa4/Ca/jxcHHnw/EU8HMpASAfqzMIz2Qn37QHetXamwouQjeV9jlp7vjF/tJYWvy+BAaT0IfvP/ULgWybPiSM5DuuLeqm4x0q8nfSkT2ne/Z0DyLcXh7u5kvxZW4NM1SP29MDJYYJuEdJfhbbwkmain3S2vH7bjaGSxVlDNCIX+3+34igwqkm+eGwmDRs3zQ8eurEwzuDIH04CAsJtkv2joll5z29in9HYzXUHmXeEFPLMtdSs0kHVrOmD7nZqwIUWh+NYVeP/M/U=
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(356005)(2616005)(956004)(5660300002)(82960400001)(186003)(83380400001)(81166007)(6666004)(508600001)(1076003)(82310400004)(316002)(8676002)(26005)(6916009)(36860700001)(86362001)(40460700003)(2906002)(34020700004)(70206006)(8936002)(70586007)(336012)(47076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 05:05:17.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a9976c8-de0d-4aa8-c289-08da070a9059
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT040.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMAP122MB0243
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 05:05:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96004

From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>

Set one crypto-backend library at a time
OpenSSL is the crypto-backend library set for device hashing
Override PACKAGECONFIG to replace it with libsodium or libgcrypt

Signed-off-by: Anu Deepthika, Nandipati <Nandipati.AnuDeepthika@philips.com=
>
---
 ...kgconfig-instead-of-libgcrypt-config.patch | 106 ++++++++++++++++++
 .../usbguard/usbguard_1.1.0.bb                |  75 +++++++++++++
 2 files changed, 181 insertions(+)
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
index 000000000..ca97a3a8b
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
@@ -0,0 +1,75 @@
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
+    file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch"
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
+    --with-bundled-catch \
+    --with-bundled-pegtl \
+"
+
+PACKAGECONFIG ?=3D "\
+    openssl \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
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
+    ${systemd_unitdir}/system/usbguard.service \
+    ${systemd_unitdir}/system/usbguard-dbus.service \
+    ${datadir}/polkit-1 \
+    ${datadir}/polkit-1/actions \
+    ${datadir}/dbus-1 \
+    ${nonarch_libdir}/tmpfiles.d \
+"
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
--=20
2.25.1


