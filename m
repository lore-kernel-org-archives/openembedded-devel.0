Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F28CC433EF
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 12:04:02 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web08.8720.1642939440573147194
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 04:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 15E1F3ACF
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 13:03:59 +0100 (CET)
Received: from localhost.localdomain ([84.163.32.167]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nBbbC-0sWdGc0; Sun, 23 Jan 2022 13:03:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3 2/2] packagegroup-gnome-apps.bb: add geary
Date: Sun, 23 Jan 2022 13:03:26 +0100
Message-Id: <20220123120326.37863-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220123120326.37863-1-f_l_k@t-online.de>
References: <20220123120326.37863-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642939438-0000BD0E-6C661C4D/0/0 CLEAN NORMAL
X-TOI-MSGID: 891627d8-f71b-422c-82ed-feb9d77acca0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 12:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95013

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/packagegroups/packagegroup-gnome-apps.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-=
apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-app=
s.bb
index d003e23b8..481dd727d 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -10,6 +10,7 @@ RDEPENDS:${PN} =3D " \
     evolution-data-server \
     evince \
     file-roller \
+    geary \
     gedit \
     ghex \
     gnome-calculator \
--=20
2.25.1


