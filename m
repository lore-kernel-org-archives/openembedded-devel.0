Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA5FC10F04
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:56:10 +0000 (UTC)
Received: from ci74p00im-qukt09090301.me.com (ci74p00im-qukt09090301.me.com [17.57.156.20])
 by mx.groups.io with SMTP id smtpd.web11.63594.1701312965949389345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=hPhsJA7m;
 spf=pass (domain: subset.ch, ip: 17.57.156.20, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701312965; bh=AXaegzb2LRsR+E0dN9AHni9SZaCIOhttOiOLVJ/PMtQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hPhsJA7mzsI3g3jb3SeGyYL2OCZcalceLQXM7S/gV1Ui5SZbbAGCQ/I53PWrPXwZj
	 P5yC251ZjjfEQcylOaehEZUGa0Hol1WXRsvgbNpH5WolNBWsQLXtg6JQUygIWtQd/V
	 tQCWFPK3d/C+xb6i4/8Eiz2oo6KbQEz+sz7NTH+2GL6MxFlCY7FyiZbL8DZNl8/Tlz
	 H7FW1+PM5mgLyxpjRyr5xK/HnGjqU7f8CwjyQKg0Vb6yeWLyJwazCnBLLnAtwWSJFP
	 FtBnde0YgJI1mx6+kr991HmnrUVlQtFFgxsVhpyWhKb6Kz8aZw9tg1afTuR2qegWp8
	 qWTHwEjFenWBw==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090301.me.com (Postfix) with ESMTPSA id 3ACEE11201D5;
	Thu, 30 Nov 2023 02:56:04 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-networking][PATCH 5/6] squid: add url-rewrite-helpers packageconfig
Date: Thu, 30 Nov 2023 03:55:28 +0100
Message-ID: <1a27ed5cacd67a6d2c3ce712f278ee05ef82cf09.1701312810.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701312810.git.patrick.wicki@siemens.com>
References: <cover.1701312810.git.patrick.wicki@siemens.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 5wRmDHNExvzH1uDAukeFsXBE3-zvTlTq
X-Proofpoint-ORIG-GUID: 5wRmDHNExvzH1uDAukeFsXBE3-zvTlTq
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=658 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311300020
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107158

From: Patrick Wicki <patrick.wicki@siemens.com>

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_6.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.5.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_6.5.bb
index af3cbe067..2641943fe 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.5.bb
@@ -42,7 +42,7 @@ LDFLAGS:append:riscv32 =3D " -latomic"
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system --no-create-home --home-dir /var/run/s=
quid --shell /bin/false --user-group squid"
=20
-PACKAGECONFIG ??=3D "auth \
+PACKAGECONFIG ??=3D "auth url-rewrite-helpers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
=20
@@ -52,6 +52,7 @@ PACKAGECONFIG[werror] =3D "--enable-strict-error-checki=
ng,--disable-strict-error-c
 PACKAGECONFIG[esi] =3D "--enable-esi,--disable-esi,expat libxml2"
 PACKAGECONFIG[ssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,openssl=
"
 PACKAGECONFIG[auth] =3D "--enable-auth-basic=3D'${BASIC_AUTH}',--disable=
-auth --disable-auth-basic,krb5 openldap db cyrus-sasl"
+PACKAGECONFIG[url-rewrite-helpers] =3D "--enable-url-rewrite-helpers,--d=
isable-url-rewrite-helpers,"
=20
 PACKAGES =3D+ " \
     ${PN}-conf \
--=20
2.43.0


