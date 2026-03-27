Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B6E10F2845
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 15:40:22 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75509.1774626016373251174
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 08:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ov9NLY3a;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 26BCA9F2
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 16:40:14 +0100 (CET)
Received: from fedora.fritz.box ([84.154.173.111]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w69IC-2MFGfh0; Fri, 27 Mar 2026 16:40:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: fix RDEPENDS
Date: Fri, 27 Mar 2026 16:40:06 +0100
Message-ID: <20260327154006.1319770-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774626012-277FD99A-BCF6B473/0/0 CLEAN NORMAL
X-TOI-MSGID: 350059bc-9a56-4de8-833e-27b6a7c34ac8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774626014; i=f_l_k@t-online.de;
	bh=4f4WMj/DTrfk4Ks/uxI5mX7pvxkAMgRkWlkICu54+8Q=;
	h=From:To:Subject:Date;
	b=ov9NLY3aau6wdGx1NKowmE1I10xzHVJoGHIzkCv7TLLWwAxG0t6QfL5PKhz66qZIC
	 xFRcnvyT/W3BTEWBcttWQR6xPrUrsWP8sS/1eGYQxoHq5SYq5yIoGuATDspEK7QPrg
	 eUBP7U/xWKI/9vNin8LqEXVGV/Z7WVof+TYTz4OU/NBXfMAVcXRY1cWahpIdxUgMZx
	 68umDh55cJB5Qv0JkyPh/nPAYvP6gdda2QQtJR+LofNiegxuHsh2SQdjf/s8g+juA+
	 YU1uk9dWm8tCKcGkZkPzh9dqDRu0RwL8xJae3TQjdGn16TUZZUW2051rlsce9jxkVJ
	 IM+FHCA9ytBbg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 15:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125790

This prevents the wrong mypaint-brushes package from being installed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.2.0.bb
index d6928498ac..1b092eb7e5 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb
@@ -132,7 +132,7 @@ do_install:prepend() {
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
=20
-RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-networking python3-pygobjec=
t"
+RDEPENDS:${PN} =3D "mypaint-brushes glib-networking python3-pygobject"
=20
 CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only applie=
s for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] =3D "not-applicable-config: the vulnerability =
only affects MacOS"
--=20
2.53.0


