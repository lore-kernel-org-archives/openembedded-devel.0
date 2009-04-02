Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpMUW-0001Ks-Ti
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 14:58:23 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 5E508189366; Thu,  2 Apr 2009 14:58:02 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 14:58:02 +0200
Message-Id: <1238677082-16635-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>,
	=?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] wireless-tools: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Thu, 02 Apr 2009 12:58:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/wireless-tools/wireless-tools.inc          |    1 +
 .../wireless-tools/shared_lib_ldflags.patch        |   12 ++++++++++++
 recipes/wireless-tools/wireless-tools_29.bb        |    2 +-
 3 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/wireless-tools/wireless-tools/shared_lib_ldfl=
ags.patch

diff --git a/recipes/wireless-tools/wireless-tools.inc b/recipes/wireless=
-tools/wireless-tools.inc
index 36ee3ed..d2a7b89 100644
--- a/recipes/wireless-tools/wireless-tools.inc
+++ b/recipes/wireless-tools/wireless-tools.inc
@@ -7,6 +7,7 @@ LICENSE =3D "GPL"
 SRC_URI +=3D "\
   http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.${=
PV}.tar.gz \
   file://man.patch;patch=3D1 \
+  file://shared_lib_ldflags.patch;patch=3D1 \
   file://wireless-tools.if-pre-up \
   file://zzz-wireless.if-pre-up"
 S =3D "${WORKDIR}/wireless_tools.${PV}"
diff --git a/recipes/wireless-tools/wireless-tools/shared_lib_ldflags.pat=
ch b/recipes/wireless-tools/wireless-tools/shared_lib_ldflags.patch
new file mode 100644
index 0000000..85abde0
--- /dev/null
+++ b/recipes/wireless-tools/wireless-tools/shared_lib_ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN wireless_tools.29.orig/Makefile wireless_tools.29/Makefile
+--- wireless_tools.29.orig/Makefile	2007-09-17 23:56:46.000000000 +0000
++++ wireless_tools.29/Makefile	2009-04-02 09:22:14.000000000 +0000
+@@ -145,7 +145,7 @@
+=20
+ # Compilation of the dynamic library
+ $(DYNAMIC): $(OBJS:.o=3D.so)
+-	$(CC) -shared -o $@ -Wl,-soname,$@ $(STRIPFLAGS) $(LIBS) -lc $^
++	$(CC) $(LDFLAGS) -shared -o $@ -Wl,-soname,$@ $(STRIPFLAGS) $(LIBS) -l=
c $^
+=20
+ # Compilation of the static library
+ $(STATIC): $(OBJS:.o=3D.so)
diff --git a/recipes/wireless-tools/wireless-tools_29.bb b/recipes/wirele=
ss-tools/wireless-tools_29.bb
index c83ae17..196a194 100644
--- a/recipes/wireless-tools/wireless-tools_29.bb
+++ b/recipes/wireless-tools/wireless-tools_29.bb
@@ -1,3 +1,3 @@
 require wireless-tools.inc
=20
-PR =3D "r2"
+PR =3D "r3"
--=20
1.5.6.5



