Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3538DC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:10:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7491.1642169412348598186
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D556ED1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:10:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0712D3F774
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:10:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] python3-scapy: remove redundant pycrypto RDEPENDS
Date: Fri, 14 Jan 2022 14:10:07 +0000
Message-Id: <20220114141008.3998380-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 14:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94837

Scapy moved from pycrypto to cryptography in 2.4.0 (commit c24298b).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.=
bb b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
index 927482f994..d318c27c5a 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
@@ -38,4 +38,4 @@ do_install_ptest() {
=20
 RDEPENDS:${PN} =3D "tcpdump ${PYTHON_PN}-compression ${PYTHON_PN}-crypto=
graphy ${PYTHON_PN}-netclient  \
                   ${PYTHON_PN}-netserver ${PYTHON_PN}-pydoc ${PYTHON_PN}=
-pkgutil ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers ${PYTHON_P=
N}-pycrypto"
+                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
--=20
2.25.1


