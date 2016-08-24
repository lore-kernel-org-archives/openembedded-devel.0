Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 448 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Aug 2016 09:36:35 UTC
Received: from root.phytec.de (mail.microcatalog.org.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id BB97F6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:36:35 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 3E2DCA0041C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 11:29:14 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016082411290575-98197 ;
	Wed, 24 Aug 2016 11:29:05 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Aug 2016 11:29:07 +0200
Message-Id: <1472030947-2054-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 24.08.2016 11:29:05,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 24.08.2016 11:29:05
X-TNEFEvaluated: 1
Subject: [meta-networking][PATCH] crda: fix QA Issue: No GNU_HASH in the elf binary
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2016 09:36:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Linking needs to respect LDFLAGS. Patch the Makefile.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 .../0001-Makefile-respect-LDFLAGS-for-libreg.patch | 29 ++++++++++++++++++=
++++
 .../recipes-connectivity/crda/crda=5F3.18.bb         |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/0001-Mak=
efile-respect-LDFLAGS-for-libreg.patch

diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Makefile-r=
espect-LDFLAGS-for-libreg.patch b/meta-networking/recipes-connectivity/crda=
/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
new file mode 100644
index 0000000..16800d5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-=
LDFLAGS-for-libreg.patch
@@ -0,0 +1,29 @@
+From 1e1a78b7b4fa1662b4447aa19c15b1e839b7e9db Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kliese=
r@phytec.de>
+Date: Wed, 24 Aug 2016 10:58:45 +0200
+Subject: [PATCH] Makefile: respect LDFLAGS for libreg
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 2879896..1650db8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY=5FDIR)/=
*.pem)
+=20
+ $(LIBREG): regdb.h reglib.h reglib.c
+ 	$(NQ) '  CC  ' $@
+-	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^ $=
(LIBREGLDLIBS)
++	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^ $=
(LDFLAGS) $(LIBREGLDLIBS)
+=20
+ install-libreg-headers:
+ 	$(NQ) '  INSTALL  libreg-headers'
+--=20
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/crda/crda=5F3.18.bb b/met=
a-networking/recipes-connectivity/crda/crda=5F3.18.bb
index 7e13d7b..f5e9e41 100644
--- a/meta-networking/recipes-connectivity/crda/crda=5F3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda=5F3.18.bb
@@ -12,6 +12,7 @@ SRC=5FURI =3D "https://www.kernel.org/pub/software/networ=
k/crda/${BP}.tar.xz;name=3Dcr
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
            file://fix-linking-of-libraries-used-by-reglib.patch \
            file://fix-gcc-6-unused-variables.patch \
+           file://0001-Makefile-respect-LDFLAGS-for-libreg.patch \
 "
 SRC=5FURI[crda.md5sum] =3D "0431fef3067bf503dfb464069f06163a"
 SRC=5FURI[crda.sha256sum] =3D "43fcb9679f8b75ed87ad10944a506292def13e4afb1=
94afa7aa921b01e8ecdbf"
--=20
1.9.1


