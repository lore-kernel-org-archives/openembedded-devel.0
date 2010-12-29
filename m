Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PY235-00047l-RB
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 20:51:03 +0100
Received: (qmail 16365 invoked by uid 503); 29 Dec 2010 19:33:25 -0000
Received: from b6.ovh.net (HELO mail404.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 29 Dec 2010 19:33:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Dec 2010 21:50:48 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Dec 2010 21:50:47 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 20:45:53 +0100
Message-Id: <1293651953-2998-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1293644563.4238.7.camel@mattotaupa>
References: <1293644563.4238.7.camel@mattotaupa>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10454825061965409609
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] glib 2.26.1: fix compilation failure
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
X-List-Received-Date: Wed, 29 Dec 2010 19:51:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

during configure, pkgconfig detects dbus-1.pc which was installed
by dbus-native and thus the compilation fails because it can't
find dbus/dbus.h which is not yet installed for in the target's
sysroot.

This patch workaround this problem by not compiling the test program
which depends on dbus's headers.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/glib-2.0/glib-2.0_2.26.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-2.0_2.26.1.bb
index d95f894..e19fb9f 100644
--- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
+++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0-native gtk-doc zlib"
 DEPENDS_virtclass-native = "gettext-native gtk-doc-native \
                             pkgconfig-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   http://ftp.gnome.org/pub/GNOME/sources/glib/2.26/glib-${PV}.tar.bz2;name=archive \
@@ -38,6 +38,7 @@ EXTRA_OECONF_append_glibc_arm = "  --enable-included-printf=no "
 
 do_configure_prepend () {
 	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
+	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
 }
 
 do_install_append() {
-- 
1.7.0.4



