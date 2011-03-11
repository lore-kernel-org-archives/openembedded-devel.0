Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyBrV-00056W-8j
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:35:13 +0100
Received: (qmail 8167 invoked by uid 503); 12 Mar 2011 00:19:12 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 12 Mar 2011 00:19:12 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Mar 2011 01:33:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Mar 2011 01:33:32 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 00:34:57 +0100
Message-Id: <1299886498-22190-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1299886498-22190-1-git-send-email-eric@eukrea.com>
References: <1299886498-22190-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12775586243375115594
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/2] obexd: add 0.40
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
X-List-Received-Date: Fri, 11 Mar 2011 23:35:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/bluez/obexd_0.40.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/obexd_0.40.bb

diff --git a/recipes/bluez/obexd_0.40.bb b/recipes/bluez/obexd_0.40.bb
new file mode 100644
index 0000000..3d8790a
--- /dev/null
+++ b/recipes/bluez/obexd_0.40.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "OBEX Server and Client"
+DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
+
+LICENSE = "GPLv2"
+
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
+
+inherit autotools
+
+FILES_${PN} += "${datadir}/dbus-1/"
+
+SRC_URI[md5sum] = "243335d849700c30b318c360db95f62c"
+SRC_URI[sha256sum] = "5440a3df1d33c2c12cca61fff1e8d643488ea139eef7340cfdbf6d2e5ea3e04b"
-- 
1.7.0.4



