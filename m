Received: from [212.27.42.3] (helo=smtp3-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1LqPkT-0001hb-Na
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Apr 2009 12:38:49 +0200
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 3F2BE818135;
	Sun,  5 Apr 2009 12:35:59 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 542A581813C;
	Sun,  5 Apr 2009 12:35:57 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 474FE1841EE; Sun,  5 Apr 2009 12:35:50 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Apr 2009 12:35:50 +0200
Message-Id: <1238927750-17603-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.3
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] libpcap: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Sun, 05 Apr 2009 10:38:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/libpcap/libpcap-1.0.0/ldflags.patch |   12 ++++++++++++
 recipes/libpcap/libpcap_1.0.0.bb            |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/libpcap/libpcap-1.0.0/ldflags.patch

diff --git a/recipes/libpcap/libpcap-1.0.0/ldflags.patch b/recipes/libpca=
p/libpcap-1.0.0/ldflags.patch
new file mode 100644
index 0000000..66ab5f7
--- /dev/null
+++ b/recipes/libpcap/libpcap-1.0.0/ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN libpcap-1.0.0.orig/Makefile.in libpcap-1.0.0/Makefile.in
+--- libpcap-1.0.0.orig/Makefile.in	2008-10-28 01:26:13.000000000 +0000
++++ libpcap-1.0.0/Makefile.in	2009-04-02 13:54:20.000000000 +0000
+@@ -326,7 +326,7 @@
+ #
+ libpcap.so: $(OBJ)
+ 	@rm -f $@
+-	$(CC) -shared -Wl,-soname,$@.1 -o $@.`cat $(srcdir)/VERSION` $(OBJ) $(=
DAGLIBS)
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,$@.1 -o $@.`cat $(srcdir)/VERSION=
` $(OBJ) $(DAGLIBS)
+=20
+ #
+ # The following rule succeeds, but the result is untested.
diff --git a/recipes/libpcap/libpcap_1.0.0.bb b/recipes/libpcap/libpcap_1=
.0.0.bb
index b85bf4c..6dfc056 100644
--- a/recipes/libpcap/libpcap_1.0.0.bb
+++ b/recipes/libpcap/libpcap_1.0.0.bb
@@ -1,9 +1,10 @@
 require libpcap.inc
=20
-PR =3D "r5"
+PR =3D "r6"
 SRC_URI =3D "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 SRC_URI +=3D "file://aclocal.patch;patch=3D1"
 SRC_URI +=3D "file://ieee80215-arphrd.patch;patch=3D1"
+SRC_URI +=3D "file://ldflags.patch;patch=3D1"
=20
 do_compile () {
     oe_runmake
--=20
1.6.2.1



