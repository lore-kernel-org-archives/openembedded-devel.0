Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD28E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 21:40:14 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web11.113702.1733780413674535971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 13:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id E897D607C3; Mon,  9 Dec 2024 21:40:11 +0000 (UTC)
Received: from localhost.localdomain (ip-046-223-149-087.um13.pools.vodafone-ip.de [46.223.149.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id C8D2E6072A;
	Mon,  9 Dec 2024 21:40:11 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: fix number of arguments check in API function
Date: Mon,  9 Dec 2024 22:39:48 +0100
Message-Id: <20241209213948.2377-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 21:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114257

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 ...r-of-arguments-check-in-API-function.patch | 23 +++++++++++++++++++
 .../canopenterm/canopenterm_1.0.10.bb         |  4 +++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0001=
-fix-number-of-arguments-check-in-API-function.patch

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-fix-nu=
mber-of-arguments-check-in-API-function.patch b/meta-oe/recipes-extended/=
canopenterm/canopenterm/0001-fix-number-of-arguments-check-in-API-functio=
n.patch
new file mode 100644
index 000000000..aba139ff5
--- /dev/null
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-fix-number-of=
-arguments-check-in-API-function.patch
@@ -0,0 +1,23 @@
+From 02e8b19d4090809deee11bf6801c0444c38fe4d2 Mon Sep 17 00:00:00 2001
+From: Michael Fitzmayer <mail@michael-fitzmayer.de>
+Date: Mon, 9 Dec 2024 22:30:03 +0100
+Subject: [PATCH] canopenterm: fix number of arguments check in API funct=
ion
+
+Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
+---
+ src/api/python_test_report.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/api/python_test_report.c b/src/api/python_test_report.c
+index ff7b31e..1b1fc4a 100644
+--- a/src/api/python_test_report.c
++++ b/src/api/python_test_report.c
+@@ -69,7 +69,7 @@ bool py_test_eds_file(int argc, py_Ref argv)
+     (void)argc;
+     (void)argv;
+=20
+-    PY_CHECK_ARGC(2);
++    PY_CHECK_ARGC(3);
+=20
+     node_id   =3D py_toint(py_arg(0));
+     file_name =3D py_tostr(py_arg(1));
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b=
/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
index b15a36330..81ba15fab 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
@@ -15,7 +15,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70=
e8c3a1fbc462f5424806474"
=20
 DEPENDS =3D "cjson libinih libsdl2 lua libsocketcan pocketpy"
=20
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain \
+           file://0001-fix-number-of-arguments-check-in-API-function.pat=
ch \
+           "
=20
 SRCREV  =3D "e0760b2e9657907e691be4df384ca7617109635d"
=20
--=20
2.39.5


