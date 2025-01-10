Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37FDE7719F
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:25:11 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.1056.1736540705600938821
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 9C26EA3A
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 21:25:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.171.8]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tWLZ0-2H5Bk90; Fri, 10 Jan 2025 21:25:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] packagegroup-meta-multimedia: set PACKAGE_ARCH to MACHINE_ARCH
Date: Fri, 10 Jan 2025 21:25:13 +0100
Message-ID: <20250110202513.12317-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736540702-96FFA9E5-2BB9884C/0/0 CLEAN NORMAL
X-TOI-MSGID: 27b7b52b-29a0-4984-a1dc-afb79c930aa7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114804

This fixes:
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (openh264-dev to libopenh264-dev)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (libde265 to libde265-0)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (openh264 to libopenh264-7)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (openh264-dbg to libopenh264-dbg)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegrou=
p-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/p=
ackagegroup-meta-multimedia.bb
index 83efaaa125..0573af7ebe 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
@@ -1,5 +1,6 @@
 SUMMARY =3D "Meta-multimedia packagegroups"
=20
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit packagegroup
=20
 PROVIDES =3D "${PACKAGES}"
--=20
2.47.1


