Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NabOO-00049B-9k
	for openembedded-devel@openembedded.org; Thu, 28 Jan 2010 21:55:11 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id AC6B4200168;
	Thu, 28 Jan 2010 21:52:39 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2010 21:52:44 +0100
Message-Id: <1264711964-25127-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] ecore-svn: fix NULL pointer dereference
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jan 2010 20:55:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch fixes NULL pointer dereference in exquisite triggered 5 times
during each boot and causes flood of this annoying messages:

*** ECORE ERROR: Ecore Magic Check Failed!!!
*** IN FUNCTION: ecore_event_handler_del() Input handle pointer is NULL!
*** NAUGHTY PROGRAMMER!!!
*** SPANK SPANK SPANK!!!
*** Now go fix your code. Tut tut tut!

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/efl1/ecore/fix-null-pointer.patch |   29 +++++++++++++++++++++++=
++++++
 recipes/efl1/ecore_svn.bb                 |    3 ++-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 recipes/efl1/ecore/fix-null-pointer.patch

diff --git a/recipes/efl1/ecore/fix-null-pointer.patch b/recipes/efl1/eco=
re/fix-null-pointer.patch
new file mode 100644
index 0000000..4750e4d
--- /dev/null
+++ b/recipes/efl1/ecore/fix-null-pointer.patch
@@ -0,0 +1,29 @@
+This patch fixes NULL pointer dereference in exquisite triggered 5 times
+during each boot and causes flood of this annoying messages:
+
+*** ECORE ERROR: Ecore Magic Check Failed!!!
+*** IN FUNCTION: ecore_event_handler_del() Input handle pointer is NULL!
+*** NAUGHTY PROGRAMMER!!!
+*** SPANK SPANK SPANK!!!
+*** Now go fix your code. Tut tut tut!
+
+Signed-off-by: Petr Stetiar <ynezz@true.cz>
+
+Index: ecore/src/lib/ecore_evas/ecore_evas_fb.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ecore.orig/src/lib/ecore_evas/ecore_evas_fb.c	2010-01-28 18:41:29.00=
0000000 +0100
++++ ecore/src/lib/ecore_evas/ecore_evas_fb.c	2010-01-28 18:42:53.0000000=
00 +0100
+@@ -504,8 +504,11 @@
+      {
+ 	int i;
+=20
+-	for (i =3D 0; i < 5; i++)
+-	  ecore_event_handler_del(ecore_evas_event_handlers[i]);
++	for (i =3D 0; i < 5; i++) {
++	  if (ecore_evas_event_handlers[i]) {
++	  	ecore_event_handler_del(ecore_evas_event_handlers[i]);
++	  }
++	}
+ 	ecore_fb_ts_shutdown();
+      }
+    if (_ecore_evas_init_count < 0) _ecore_evas_init_count =3D 0;
diff --git a/recipes/efl1/ecore_svn.bb b/recipes/efl1/ecore_svn.bb
index 178e9e9..0f15184 100644
--- a/recipes/efl1/ecore_svn.bb
+++ b/recipes/efl1/ecore_svn.bb
@@ -1,8 +1,9 @@
 require ecore.inc
-PR =3D "r7"
+PR =3D "r8"
=20
 SRC_URI +=3D "file://iconv.patch;patch=3D1;maxrev=3D43996 \
             file://exit_uclibc.patch;patch=3D1 \
+            file://fix-null-pointer.patch;patch=3D1 \
            "
=20
 EXTRA_OECONF =3D "\
--=20
1.6.0.4



