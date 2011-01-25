Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhlaR-0000wR-JW
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:17:43 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArcEAIyGPk1bdWOb/2dsb2JhbACEE5I+jxGsJIM7AY0ngSODOHQEjCiFYw
X-IronPort-AV: E=Sophos;i="4.60,374,1291590000"; d="scan'208";a="721343411"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 25 Jan 2011 17:16:59 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhlZj-0005Oz-68; Tue, 25 Jan 2011 17:16:59 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhlZj-0004W5-2L; Tue, 25 Jan 2011 17:16:59 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhlZi-00044p-OC; Tue, 25 Jan 2011 17:16:58 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jan 2011 17:16:52 +0100
Message-Id: <3d0c09dc2f178a8c355b544d1afa98cb46db2617.1295971903.git.vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1295971903.git.vjaquez@igalia.com>
References: <cover.1295971903.git.vjaquez@igalia.com>
In-Reply-To: <cover.1295971903.git.vjaquez@igalia.com>
References: <cover.1295971903.git.vjaquez@igalia.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCHv2 1/2] python-scons_1.3.0: add missing dependencies
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
X-List-Received-Date: Tue, 25 Jan 2011 16:17:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to launch scons in a board it depends on a couple python packages
which were not managed by the recipe.

This patch adds them.

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 recipes/python/python-scons_1.3.0.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-scons_1.3.0.bb b/recipes/python/python-scons_1.3.0.bb
index 792e3a5..a0690d1 100644
--- a/recipes/python/python-scons_1.3.0.bb
+++ b/recipes/python/python-scons_1.3.0.bb
@@ -3,6 +3,7 @@ SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "GPL"
 SRCNAME = "scons"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz;name=scons \
            file://toolchain-from-env.SConscript \
@@ -21,3 +22,11 @@ do_install_append() {
 
 NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} = "python-shell \
+	       python-stringold \
+	       python-lang \
+	       python-io \
+	       python-fcntl \
+	       python-pickle \
+	       python-crypt"
-- 
1.7.2.3



