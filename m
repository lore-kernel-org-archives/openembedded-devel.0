Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C52CC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 10:18:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.48320.1711361871570545285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 03:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id BEB033574B
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 11:17:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.236]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rohOm-4RThjd0; Mon, 25 Mar 2024 11:17:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] tracker-miners: fix reproducibility issue for landlock
Date: Mon, 25 Mar 2024 11:18:05 +0100
Message-ID: <20240325101805.2306-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711361869-F8FF694C-7782CC3D/0/0 CLEAN NORMAL
X-TOI-MSGID: e947b3e2-b6be-47d5-b289-ef9291cf42e1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 10:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109574

If landlock feature is enabled there is buildpath leakage again.
This is because in-tree rules get included. Disable the
in-tree check to avoid it.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-fix-reproducibility.patch            | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-rep=
roducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001=
-fix-reproducibility.patch
index 68ff95e79..98618e5d3 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
@@ -92,6 +92,27 @@ index 6e5883288..04750f82b 100644
          '-DLIBEXECDIR=3D"@0@"'.format(get_option('prefix') / get_option=
('libexecdir')),
      ],
      install: true,
+diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtr=
acker-miners-common/tracker-landlock.c
+index 27e7db65b..3021343eb 100644
+--- a/src/libtracker-miners-common/tracker-landlock.c
++++ b/src/libtracker-miners-common/tracker-landlock.c
+@@ -276,7 +276,7 @@
+ 			          LANDLOCK_ACCESS_FS_READ_DIR);
+ 		}
+ 	}
+-
++#if 0
+ 	current_dir =3D g_get_current_dir ();
+=20
+ 	/* Detect running in-tree */
+@@ -296,7 +296,7 @@
+ 			          in_tree_rules[i].flags);
+ 		}
+ 	}
+-
++#endif
+ 	/* Add user cache for readonly databases */
+ #ifdef MINER_FS_CACHE_LOCATION
+ 	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
 --=20
 2.41.0
-
--=20
2.44.0


