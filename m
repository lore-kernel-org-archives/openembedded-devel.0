Return-Path: <Nandipati.AnuDeepthika@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34BCC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:17:48 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.108])
 by mx.groups.io with SMTP id smtpd.web11.10696.1647350267337373534
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=S3PcGAd7;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.14.108,
 mailfrom: anudeepthika@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrIWkumtRjfQMc76pntyfQ7eBAQA1d40FAVhq0UInxFgJa7p4ZT3pfTgL+BxCVhZv4cGE4DAekd9xQcwFQ8bB14HTapZ9HKURKoaZPIvb0l5jYATqSthBMs6QZD8vArP3Y6GOMpL7xzz7rZABfd+gtYB8h3zzY5ZbCeSLxKJyEXEh+EpUPvJN4XVj3DDRU0M0JXoMj53vPqyYoR5nM32HvR2m6hjOGRC/jzfxu7P5/5OlZKAKyh7eFVPyEKWG+t4xf7gc6FBsg/sVBAZRyWl26JWpiAzSjhtAwdr6y25ytBP31rH+5mmCKxUZ+EdghmpruMdiIL3xlMWIcs+0VsEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ykz7I4towVCS1s6CRNbx+lOqapIWBMDrxhehjYuuvGg=;
 b=iSmIwWjTvdk0ad6FrTSVcohCit6PTsKNlSwcOmk9EXYHCrtA84P+k8V5LOS9A27Y5obBoHlQ0p3aQ/VMYeiCRb6adU2sEmAvnkDdo6LPzqk7OfNemUs++u9S602yhV5FuIogOSRcb9EDP3bvaM3Jax8/PWVT/6KBF8UE4KAgj9Y+1I45cdbx03F5a/h1IZyqZlCEUQ06Vg9CIDt566O3Yu1GKenSHmTd1yanGu+wKhL3H/YcwhT2+l0V3keCOR2fQu8cqhfwXpGkLkuaF8bSfmjM5rVlXV5MLMmSyv5z1VNsYh57CSbhORRJpeDNGOrCWm4mBRjnVwh1g9Abbk2S2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ykz7I4towVCS1s6CRNbx+lOqapIWBMDrxhehjYuuvGg=;
 b=S3PcGAd73qIeeGg9C6G8xTjOJG2gerVZLt2kK8735gq1kgnhwe/rjF2Bh/bFkbDAxFvpx/H+PPhDYBfKDgMcId8jkUTaLmXcMFHJEeAarNFBe3Lkuv3Xw5J0u9GhKTmVz57ysWzfsbFepbS9os7mHWvpkEDiV45NSCNuhnOzg+g=
Received: from DU2PR04CA0151.eurprd04.prod.outlook.com (2603:10a6:10:2b0::6)
 by DBBP122MB0202.EURP122.PROD.OUTLOOK.COM (2603:10a6:10:174::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Tue, 15 Mar
 2022 13:17:43 +0000
Received: from DB5EUR01FT029.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::48) by DU2PR04CA0151.outlook.office365.com
 (2603:10a6:10:2b0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Tue, 15 Mar 2022 13:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com;
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 DB5EUR01FT029.mail.protection.outlook.com (10.152.4.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 13:17:42 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id U6dUngIhfcz85U6qCngyQg; Tue, 15 Mar 2022 13:03:56 +0000
Received: from INGBTCPIC6LX130.in-101.lan.philips.com ([161.85.104.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id U73RnUfH8piPMU73Wn94Ny; Tue, 15 Mar 2022 13:17:42 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Anu Deepthika <anudeepthika@code1.emi.philips.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] usbguard: Add inital recipe
Date: Wed, 16 Mar 2022 00:17:14 +0530
Message-ID: <20220315184714.3788561-1-anudeepthika@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Nandipati.AnuDeepthika@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c1d665ba-da14-4fc6-570c-08da06863067
X-MS-TrafficTypeDiagnostic: DBBP122MB0202:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBP122MB0202BF00ACB1B3C970A9A1E68E109@DBBP122MB0202.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5XqUeQnkGbhXv9AGtOBkVnmr/bu7nlbCiCmXvIBauBICUTHgoQIyLplmUOmRxhybQ2gvvGRusKlSooSa5Te2HINS6vfJzpVtvFmekIUZJmlAUOvgtRKFRiBlSiPX4tCHoE1AJbqzdPvS4R26589kL8KHKgSsUUr5x+Puu5DPT0V2byISRPypm5a2UpOVzOyhCbz7Kzz/DW/rm2rcWPGAG1S27Bt3LJR32oiw76AxpDWssATg9jVt7mx6Bpq5FapDl3/QpJUClCle2MLmLVK0IgYTgH5tE0Ylytu+aBbwv/N1kr2SXpU1MqsdJcYMrILKRtCqCPFcw/dub8VcvDCcAsyexbqRyk8UlqEiNVfB5WYQzKB06U8A0OWYBvDhDl2zZUkeRplUbWwjG/QkNdgxGYVm8BYjcgAptLekIRxDuvXX+WrZcT+uC2wdlT9JMTVYMJhfY7TKBs1HMnU9vxzkfZHT+4iM8Dm7ocfeJrXdTUULGGbChZFST+a0sqOJuHCr66AbFu5/UzBPFwrR46lw3X/29coOMpjSvHbDwNhMwAA3Q/6d0dtLiZqDaW0EF356Ga+aOqSIKg4FONfhG62aHT6z3xRznpGTz63a9mecuAoWQz6d/dWlN5h9J9GthbIg031XgyA22doRvOxcQAYcouMK5CgXourLQCS4yXWCz3zyTMggId99AXC42CHsDgtCn//RJgO/sRghs/zlE1vBfYmlHKIIcqKo7T27WsPDIMVAruUyrR1osP2mx6hRs3tDkEL1quQAT8jmLodX4LcxyGeGaT1wiCKBvFCQxhaiXf4=
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(81166007)(8936002)(86362001)(70586007)(356005)(70206006)(8676002)(316002)(82960400001)(6916009)(82310400004)(34020700004)(6666004)(336012)(40460700003)(5660300002)(2906002)(26005)(83380400001)(956004)(186003)(1076003)(47076005)(36860700001)(2616005);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 13:17:42.8809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c1d665ba-da14-4fc6-570c-08da06863067
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT029.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP122MB0202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 13:17:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95991

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
index 000000000..40f37f976
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
+                 "
+
+PACKAGECONFIG ?=3D "\
+                  openssl \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                  "
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
+                "
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


