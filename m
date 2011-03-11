Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyBrS-00056P-N3
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:35:12 +0100
Received: (qmail 8168 invoked by uid 503); 12 Mar 2011 00:19:12 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 12 Mar 2011 00:19:12 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Mar 2011 01:33:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Mar 2011 01:33:32 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 00:34:58 +0100
Message-Id: <1299886498-22190-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1299886498-22190-1-git-send-email-eric@eukrea.com>
References: <1299886498-22190-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12775586243375115595
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 2/2] bluez-hcidump: add 2.0
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
X-List-Received-Date: Fri, 11 Mar 2011 23:35:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/bluez/bluez-hcidump_2.0.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez-hcidump_2.0.bb

diff --git a/recipes/bluez/bluez-hcidump_2.0.bb b/recipes/bluez/bluez-hcidump_2.0.bb
new file mode 100644
index 0000000..94a7097
--- /dev/null
+++ b/recipes/bluez/bluez-hcidump_2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Linux Bluetooth Stack HCI Debugger Tool."
+SECTION = "console"
+PRIORITY = "optional"
+DEPENDS = "bluez-libs"
+LICENSE = "GPLv2"
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
+S = "${WORKDIR}/bluez-hcidump-${PV}"
+
+EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
+
+inherit autotools
+
+SRC_URI[md5sum] = "5c2e3ef0a68b2845047867ba51ff8ac9"
+SRC_URI[sha256sum] = "b3b64fd0b18301df07d3aaf34c037c1e4808b4aaf702294822d62b5424f617fd"
-- 
1.7.0.4



