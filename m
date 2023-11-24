Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1BEC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 18:37:44 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.722.1700851055580651202
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Nov 2023 10:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id E15C11E125
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 19:37:23 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.165.244]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6b3K-3q0eZ70; Fri, 24 Nov 2023 19:37:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cups-filters: fix Makefile race condition
Date: Fri, 24 Nov 2023 19:37:41 +0100
Message-ID: <20231124183741.997723-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700851042-761C09CF-8FCDFD2E/0/0 CLEAN NORMAL
X-TOI-MSGID: cc69ecc9-fe8c-474c-9cd4-a22c6d4031c9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 18:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107047

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../cups/cups-filters/fix-make-race.patch     | 33 +++++++++++++++++++
 .../cups/cups-filters_2.0.0.bb                |  5 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/fix-make-r=
ace.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters/fix-make-race.pat=
ch b/meta-oe/recipes-printing/cups/cups-filters/fix-make-race.patch
new file mode 100644
index 000000000..9a4e31c1d
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/fix-make-race.patch
@@ -0,0 +1,33 @@
+From 7aba7c690fd84ca1e48d0cb6829410eeb658c594 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 24 Nov 2023 17:53:49 +0100
+Subject: [PATCH] Fix a Makefile race condition
+
+utils/driverless-fax script may be written before utils directory was cr=
eated
+
+| make[2]: Entering directory '/home/flk/poky/build/tmp/work/corei7-64-p=
oky-linux/cups-filters/2.0.0/build'
+| sed \
+|   -e "s|\@CUPS_SERVERBIN\@|/usr/libexec/cups|" \
+|   ../cups-filters-2.0.0/utils/driverless-fax.in > utils/driverless-fax
+| /bin/bash: line 2: utils/driverless-fax: No such file or directory
+
+Upstream-Status: Pending
+---
+ Makefile.am | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+--- a/Makefile.am	2023-09-22 18:14:03.000000000 +0200
++++ b/Makefile.am	2023-11-24 19:09:09.339653936 +0100
+@@ -62,7 +62,7 @@
+ # "driverless" utility
+ # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ utils/driverless-fax: utils/driverless-fax.in Makefile
+-	sed \
++	mkdir -p utils && sed \
+ 	  -e "s|\@CUPS_SERVERBIN\@|$(CUPS_SERVERBIN)|" \
+ 	  $< > $@
+=20
+
+
+
+
diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-o=
e/recipes-printing/cups/cups-filters_2.0.0.bb
index 0370ae79d..efcd1aab8 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d5b952b53dbe=
7752199903d082e5f07"
=20
 DEPENDS =3D "libcupsfilters libppd glib-2.0 poppler"
=20
-SRC_URI =3D "https://github.com/OpenPrinting/${BPN}/releases/download/${=
PV}/${BP}.tar.xz"
+SRC_URI =3D " \
+	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.ta=
r.xz \
+	file://fix-make-race.patch \
+"
 SRC_URI[sha256sum] =3D "b5152e3dd148ed73835827ac2f219df7cf5808dbf9dbaec2=
aa0127b44de800d8"
=20
 inherit autotools gettext pkgconfig github-releases
--=20
2.42.0


