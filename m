Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpMUX-0001Kt-73
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 14:58:15 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id A6A74189367; Thu,  2 Apr 2009 14:58:02 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 14:58:02 +0200
Message-Id: <1238677082-16711-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>,
	=?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] zeroconf: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Thu, 02 Apr 2009 12:58:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/zeroconf/files/zeroconf-ldflags.patch |   12 ++++++++++++
 recipes/zeroconf/zeroconf_0.9.bb              |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/zeroconf/files/zeroconf-ldflags.patch

diff --git a/recipes/zeroconf/files/zeroconf-ldflags.patch b/recipes/zero=
conf/files/zeroconf-ldflags.patch
new file mode 100644
index 0000000..ba60569
--- /dev/null
+++ b/recipes/zeroconf/files/zeroconf-ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN zeroconf-0.9.orig/Makefile zeroconf-0.9/Makefile
+--- zeroconf-0.9.orig/Makefile	2006-04-29 10:41:15.000000000 +0000
++++ zeroconf-0.9/Makefile	2009-04-02 09:27:38.000000000 +0000
+@@ -18,7 +18,7 @@
+=20
+ zeroconf: zeroconf.o delay.o
+ 	$(Q)echo "Creating $@"
+-	$(Q)$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
++	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+=20
+=20
+ # Automatic dependency generation
diff --git a/recipes/zeroconf/zeroconf_0.9.bb b/recipes/zeroconf/zeroconf=
_0.9.bb
index 5c42237..2857247 100644
--- a/recipes/zeroconf/zeroconf_0.9.bb
+++ b/recipes/zeroconf/zeroconf_0.9.bb
@@ -5,10 +5,11 @@ LICENSE =3D "GPL"
 SECTION =3D "net"
 PRIORITY =3D "optional"
=20
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "http://www.progsoc.org/~wildfire/zeroconf/download/${PN}-${=
PV}.tar.gz \
 	   file://zeroconf-default \
+	   file://zeroconf-ldflags.patch;patch=3D1 \
 	   file://zeroconf-limits.h.patch;patch=3D1 \
 	   file://debian-zeroconf"
=20
--=20
1.5.6.5



