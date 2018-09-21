Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id A287A747E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 15:54:38 +0000 (UTC)
Received: from heron.blarg.de (pD9EBF56F.dip0.t-ipconnect.de [217.235.245.111])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id CD4A822019D;
	Fri, 21 Sep 2018 17:54:38 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Sep 2018 17:54:33 +0200
Message-Id: <20180921155433.669-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <CAMKF1sqsm4xRckbhNLUDCU=1+Dih=0MguYHvZtiyRhmSbgmcqA@mail.gmail.com>
References: <CAMKF1sqsm4xRckbhNLUDCU=1+Dih=0MguYHvZtiyRhmSbgmcqA@mail.gmail.com>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v3] libmpdclient: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 15:54:39 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../musicpd/libmpdclient_2.15.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
new file mode 100644
index 000000000..c78344c66
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
@@ -0,0 +1,19 @@
+SUMMARY = "C client library for the Music Player Daemon"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=06b9dfd2f197dc514d8ef06549684b77"
+HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
+
+inherit meson
+
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/libmpdclient \
+"
+SRCREV = "7754ffdfb9371cd398371cb2670a54e9e1e623e2"
+S = "${WORKDIR}/git"
+
+do_install_append() {
+    # libmpdclient's Vala bindings are outdated and unmaintained; it
+    # is likely that nobody will ever use them, so let's not install
+    # them
+    rm -rf ${D}${datadir}/vala
+}
-- 
2.19.0


