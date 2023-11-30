Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D24C10DC3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:56:10 +0000 (UTC)
Received: from ci74p00im-qukt09090301.me.com (ci74p00im-qukt09090301.me.com [17.57.156.20])
 by mx.groups.io with SMTP id smtpd.web10.63777.1701312961463018996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=uPpVGHZd;
 spf=pass (domain: subset.ch, ip: 17.57.156.20, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701312960; bh=mNtQ3owRybDGfFtJMWdAIloy9rN+Y3s/2Bhv4W+f/Jw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=uPpVGHZdfSfVY4wo2vFZkqN7O3lZWxlnnO7RCIvBOdkwq0K3ZhaLMvJvoXXx1nZps
	 PyoLoPbmulPzRm+49kOsbY5sZuve32OL886MeIfJvDQCeSpgarVQy89NS83gfetkLM
	 Ywo3CHA7Zc+HMFWg8Vgai7UGSWOZ1WZjIcPx56V4cPp7EDw7cbt0cJL4Sk/F0lWFw1
	 3kIfMxnh32F7/ySsi/2c4UrKKy6diTV+oCA7+NjHMqpatWSsWdeL9nEXB3SvUFXcEU
	 zPn36wcgWqbIl6FfLehzgI4FLP7he89x5804dW0ekJ/4Y+RAZNpH005SBvUQm4O2MR
	 dW6Twmndbo1Ng==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090301.me.com (Postfix) with ESMTPSA id B9701112029C;
	Thu, 30 Nov 2023 02:55:59 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-networking][PATCH 2/6] squid: add nm dispatcher reload hook
Date: Thu, 30 Nov 2023 03:55:25 +0100
Message-ID: <c78496ac98397e12708692a3e0ab668d5d8be10d.1701312810.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701312810.git.patrick.wicki@siemens.com>
References: <cover.1701312810.git.patrick.wicki@siemens.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Fqz1IEyD1NsD4SSx-OfQpxX_fDpqslsw
X-Proofpoint-ORIG-GUID: Fqz1IEyD1NsD4SSx-OfQpxX_fDpqslsw
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311300020
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107155

From: Patrick Wicki <patrick.wicki@siemens.com>

This enables the networkmanager dispatcher to reload squid automatically
on network changes. This idea is from the Fedora package where they do
the same:
https://src.fedoraproject.org/rpms/squid/blob/rawhide/f/squid.spec#_207

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/files/squid.nm | 7 +++++++
 meta-networking/recipes-daemons/squid/squid_6.5.bb   | 8 ++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/squid.nm

diff --git a/meta-networking/recipes-daemons/squid/files/squid.nm b/meta-=
networking/recipes-daemons/squid/files/squid.nm
new file mode 100644
index 000000000..b58ee11bd
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/squid.nm
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+case "$2" in
+        up|down|vpn-up|vpn-down)
+                systemctl -q reload squid.service || :
+                ;;
+esac
diff --git a/meta-networking/recipes-daemons/squid/squid_6.5.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_6.5.bb
index 3795da7f5..33a8bc476 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.5.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "http://www.squid-cache.org/Versions/v${MAJ=
_VER}/${BPN}-${PV}.tar.bz2
            file://volatiles.03_squid \
            file://0001-configure-Check-for-Wno-error-format-truncation-c=
omp.patch \
            file://0002-squid-make-squid-conf-tests-run-on-target-device.=
patch \
+           file://squid.nm \
            "
=20
 SRC_URI:remove:toolchain-clang =3D "file://0001-configure-Check-for-Wno-=
error-format-truncation-comp.patch"
@@ -49,6 +50,8 @@ PACKAGECONFIG[werror] =3D "--enable-strict-error-checki=
ng,--disable-strict-error-c
 PACKAGECONFIG[esi] =3D "--enable-esi,--disable-esi,expat libxml2"
 PACKAGECONFIG[ssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,openssl=
"
=20
+PACKAGES =3D+ "${PN}-networkmanager"
+
 BASIC_AUTH =3D "DB SASL LDAP"
=20
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '=
', d)}"
@@ -109,11 +112,16 @@ do_install:append() {
=20
     rmdir "${D}${localstatedir}/log/${BPN}"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}/log"
+
+    # Install NetworkManager dispatcher reload hooks
+    install -d ${D}${libdir}/NetworkManager/dispatcher.d
+    install -m 0755 ${WORKDIR}/squid.nm ${D}${libdir}/NetworkManager/dis=
patcher.d/20-squid
 }
=20
 FILES:${PN} +=3D "${libdir} ${datadir}/errors ${datadir}/icons"
 FILES:${PN}-dbg +=3D "/usr/src/debug"
 FILES:${PN}-doc +=3D "${datadir}/*.txt"
+FILES:${PN}-networkmanager =3D "${libdir}/NetworkManager/dispatcher.d"
=20
 RDEPENDS:${PN} +=3D "perl"
 RDEPENDS:${PN}-ptest +=3D "perl make"
--=20
2.43.0


