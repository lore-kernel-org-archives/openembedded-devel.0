Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC858CD6E60
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 23:17:25 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32658.1780528637957946080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 16:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=og5e7zid;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout05.t-online.de (Postfix) with SMTP id 3B2EDFE8
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Jun 2026 01:17:00 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.172.112]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wUupQ-1svMLR0; Thu, 4 Jun 2026 01:16:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] miniupnpd: fix build
Date: Thu,  4 Jun 2026 01:16:46 +0200
Message-ID: <20260603231646.514531-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1780528613-A7FFD4D0-F5F894D1/0/0 CLEAN NORMAL
X-TOI-MSGID: eaa4fc91-6cc4-401e-b07f-3afc1be014b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780528620; i=f_l_k@t-online.de;
	bh=YUnUzmUmxH9GLCtXUJI8z+LO6NMifFoOaVZa0PRBTEM=;
	h=From:To:Subject:Date;
	b=og5e7zidU8od5/lz1BANJFoKmFaNdTfEKeqUGIRN1EIIk8z7OwDBSG22vv/IJYALw
	 k15BuBThaoFVSfp4FqxwzIjtsTct8fDLAQ1v27xG09CMLYF+UsobJNfTRjebEgksVE
	 1Ut+nhbjQZqBOWI2b7zj7OLdFdkAzYkSdPz19BYUyptlo2lMPNe3oMUkDnEOT8P8Sy
	 ktvXfXJ5v2/7p/MlYyLGXczpsmZJBzp9ksIWIcvAeA5emqv8ttgLQc4FN65J1O//Qg
	 /EO0W4grzmCVjbC/LV/kQ4w2uHW2n+SrG91VvwUjCJZxr6EvgI6Aw9P1sYUm8bk3QK
	 F9g2gwxT3Ak3A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 23:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127390

After the recent recipe update I see this build error:
| Makefile.linux:67: config.mk: No such file or directory
| make: *** No rule to make target '/configure', needed by 'config.mk'.  =
Stop.

Run the configure script so that config.mk gets created

Also fix LIC_FILE_CHECKSUM. Copyright year has been changed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3=
.10.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.=
bb
index f7e1518f2c..91f86659f7 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb
@@ -5,7 +5,7 @@ the network."
=20
 SECTION =3D "networking"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da1ed15843ce66639bcf9f109cf247=
870"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9526418307cb153aee96a4f9b33bd=
1c7"
=20
 inherit gettext pkgconfig systemd
=20
@@ -26,6 +26,7 @@ EXTRA_OEMAKE =3D "-f Makefile.linux"
=20
 do_configure() {
     echo "${@d.getVar('DISTRO_VERSION')}" > ${S}/os.openembedded
+    ./configure
     CONFIG_OPTIONS=3D"--leasefile --vendorcfg ${PACKAGECONFIG_CONFARGS}"=
 oe_runmake --always-make config.h
 }
=20
--=20
2.54.0


