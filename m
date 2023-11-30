Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F719C10DAA
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:56:10 +0000 (UTC)
Received: from ci74p00im-qukt09090301.me.com (ci74p00im-qukt09090301.me.com [17.57.156.20])
 by mx.groups.io with SMTP id smtpd.web10.63780.1701312962849126008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=RyA/PFwu;
 spf=pass (domain: subset.ch, ip: 17.57.156.20, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701312962; bh=hU8shcUuaETa8k5VeoLdArP1Q8l8NRKDX3XLlEX5ThY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RyA/PFwuAD+CW2AwfN4r2GKqzDWwUOzQ7PN1N+MfYebcg7CfLhWlBwtiNwkY8fEFA
	 ClXcjAVyPEtdDpaypqjwRGpaO5rhoZbak3mk+lVx0d/E61FFNlZfn3lxyiyFbogsSJ
	 F2aV3kVJOZb+Y1gdAYIt90J+1osgj6v42YU244c278Qh36e7A/AhnoyiaqCkzau9OR
	 pJL/2uyt2BiWP1N8cO9J6x6QU3LV5El+c1Z2twO560FSTPK7usvTDKb4jHkOgdqEzh
	 sfEEGbI5PffwISAskmQTyRIvTFLYQ+yD2IfUYzUtBJAmJ/9ifH7r4e9T3bxch4Htyi
	 Z7IEwnmE7EOeg==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090301.me.com (Postfix) with ESMTPSA id 4B77611201D5;
	Thu, 30 Nov 2023 02:56:01 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-networking][PATCH 3/6] squid: add auth packageconfig
Date: Thu, 30 Nov 2023 03:55:26 +0100
Message-ID: <d1eacef3ab208e84f2c81a8edb98e4ce2dbb5097.1701312810.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701312810.git.patrick.wicki@siemens.com>
References: <cover.1701312810.git.patrick.wicki@siemens.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 2titNmbSVEhebNYpYEgMLEU0y5AqgFub
X-Proofpoint-ORIG-GUID: 2titNmbSVEhebNYpYEgMLEU0y5AqgFub
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=896 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311300020
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107156

From: Patrick Wicki <patrick.wicki@siemens.com>

Introduce PACKAGECONFIG[auth] and pin the dependencies to it. This
allows building squid without authentication support and all its related
dependencies.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_6.5.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.5.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_6.5.bb
index 33a8bc476..66b42ebbb 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.5.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] =3D "99acd54ec9d68b2a9080d19fcc43eca=
1a245146cf162dbba689510d01e
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
                     file://errors/COPYRIGHT;md5=3Dd324bc1f9447d1d1588d75=
b22a678dc4 \
                     "
-DEPENDS =3D "libtool krb5 openldap db cyrus-sasl"
+DEPENDS =3D "libtool"
=20
 inherit autotools pkgconfig useradd ptest perlnative
=20
@@ -42,13 +42,16 @@ LDFLAGS:append:riscv32 =3D " -latomic"
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system --no-create-home --home-dir /var/run/s=
quid --shell /bin/false --user-group squid"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-                  "
+PACKAGECONFIG ??=3D "auth \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+
 PACKAGECONFIG[libnetfilter-conntrack] =3D "--with-netfilter-conntrack=3D=
${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
 PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[werror] =3D "--enable-strict-error-checking,--disable-stri=
ct-error-checking,"
 PACKAGECONFIG[esi] =3D "--enable-esi,--disable-esi,expat libxml2"
 PACKAGECONFIG[ssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,openssl=
"
+PACKAGECONFIG[auth] =3D "--enable-auth-basic=3D'${BASIC_AUTH}',--disable=
-auth --disable-auth-basic,krb5 openldap db cyrus-sasl"
=20
 PACKAGES =3D+ "${PN}-networkmanager"
=20
@@ -57,7 +60,7 @@ BASIC_AUTH =3D "DB SASL LDAP"
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '=
', d)}"
 BASIC_AUTH +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM', '=
', d)}"
=20
-EXTRA_OECONF +=3D "--with-default-user=3Dsquid --enable-auth-basic=3D'${=
BASIC_AUTH}' \
+EXTRA_OECONF +=3D "--with-default-user=3Dsquid \
                  --sysconfdir=3D${sysconfdir}/${BPN} \
                  --with-logdir=3D${localstatedir}/log/${BPN} \
                  'PERL=3D${USRBINPATH}/env perl'"
--=20
2.43.0


