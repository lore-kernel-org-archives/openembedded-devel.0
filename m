Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41151C46CA7
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:56:10 +0000 (UTC)
Received: from ci74p00im-qukt09090301.me.com (ci74p00im-qukt09090301.me.com [17.57.156.20])
 by mx.groups.io with SMTP id smtpd.web10.63781.1701312964348981192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=mFGvzgi2;
 spf=pass (domain: subset.ch, ip: 17.57.156.20, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701312963; bh=FMco+fKHHna6g68BBLG1OJ77WUO/6hTxjhxtY57hWes=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mFGvzgi2qBTYVH5stA8IdULnLqeTMG7d3uwjy72GYE2EIN/DKoW9oOtoK2Exk+hHU
	 oSj2qk00jxXt6rZg+LY0WbIgWYrUmhQwPJAtIQ3YM5M3uKeuA0n16rUXnHjwUIWUkE
	 AfwD87dieBWCN+Q+oCYglFauNTJbyoUdsfejv73fb5hCp8CviAG5DVVVwhvOH3MEvY
	 B7cu+XvCmwh2seHd1NZBYDZQ1uzw1sBRA82L/vKqqbH8fMikil6TnC3t5OFj69MK0r
	 RF+/944Ycfdo26SDDZduTrkJ4FuideqdG2fFKD0iR2pKGpzM1ANK4sfViFnZH7qTQi
	 cojLpmQJOeDTQ==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090301.me.com (Postfix) with ESMTPSA id B65E5112026E;
	Thu, 30 Nov 2023 02:56:02 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-networking][PATCH 4/6] squid: move configs to sub package
Date: Thu, 30 Nov 2023 03:55:27 +0100
Message-ID: <14e2e3caff4acb99c107e11ae5f4cd9638b01ab5.1701312810.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701312810.git.patrick.wicki@siemens.com>
References: <cover.1701312810.git.patrick.wicki@siemens.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 2VK3EqIgbGH4hPCgC7xXP-W6qGmaaWod
X-Proofpoint-ORIG-GUID: 2VK3EqIgbGH4hPCgC7xXP-W6qGmaaWod
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=625 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311300020
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107157

From: Patrick Wicki <patrick.wicki@siemens.com>

Move the config files to a separate squid-conf package. This allows
shipping new configs via a custom conf package.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_6.5.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.5.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_6.5.bb
index 66b42ebbb..af3cbe067 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.5.bb
@@ -53,7 +53,10 @@ PACKAGECONFIG[esi] =3D "--enable-esi,--disable-esi,exp=
at libxml2"
 PACKAGECONFIG[ssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,openssl=
"
 PACKAGECONFIG[auth] =3D "--enable-auth-basic=3D'${BASIC_AUTH}',--disable=
-auth --disable-auth-basic,krb5 openldap db cyrus-sasl"
=20
-PACKAGES =3D+ "${PN}-networkmanager"
+PACKAGES =3D+ " \
+    ${PN}-conf \
+    ${PN}-networkmanager \
+"
=20
 BASIC_AUTH =3D "DB SASL LDAP"
=20
@@ -124,7 +127,8 @@ do_install:append() {
 FILES:${PN} +=3D "${libdir} ${datadir}/errors ${datadir}/icons"
 FILES:${PN}-dbg +=3D "/usr/src/debug"
 FILES:${PN}-doc +=3D "${datadir}/*.txt"
+FILES:${PN}-conf +=3D "${sysconfdir}/squid"
 FILES:${PN}-networkmanager =3D "${libdir}/NetworkManager/dispatcher.d"
=20
-RDEPENDS:${PN} +=3D "perl"
+RDEPENDS:${PN} +=3D "perl ${PN}-conf"
 RDEPENDS:${PN}-ptest +=3D "perl make"
--=20
2.43.0


