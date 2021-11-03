Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F3CC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 01:52:16 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web09.1967.1635904335182950429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 18:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 30D36E04B0;
	Wed,  3 Nov 2021 14:52:11 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [meta-virtualization][PATCH] container-dummy-provides: Blacklist for
 icecc
Date: Wed,  3 Nov 2021 14:52:00 +1300
Message-Id: <20211103015201.572934-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 01:52:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93797

${HOST_PREFIX} is empty, which triggers the "NULL prefix" error
from icecc.bbclass.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 149b42e..84595cb 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -59,3 +59,6 @@ USER_CLASSES:append =3D " meta-virt-k8s-cfg"
 USER_CLASSES:append =3D " meta-virt-xen-cfg"
=20
 HOSTTOOLS_NONFATAL +=3D "getent"
+
+# container-dummy-provides: ${HOST_PREFIX} is empty, which triggers the =
"NULL prefix" error
+ICECC_SYSTEM_PACKAGE_BL +=3D "container-dummy-provides"
--=20
2.32.0


