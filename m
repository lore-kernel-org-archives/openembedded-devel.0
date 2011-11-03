Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vita.preskovsky@gmail.com>) id 1RLu2I-0007iQ-4Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 10:56:38 +0100
Received: by gyd8 with SMTP id 8so1072742gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BRRLrgcxxOAFpERlHWoLXF5mdas+zihnBYHtZ1AaGdI=;
	b=hMiYPnkME4rmIJbUNQNc8bXiSK7++D+bN2f9jm/0+lHU0a0q6z1CGKXfF224jr0J23
	22X3KG5LXTed8XgxdyrJFcCjsdpSjH5ug1XxrbweSqkrH/RuOWTCAitFsxl/1wTgM8yo
	j6mi8fk/1IBIHs1edsp7VzZiUr2OzCZaZA+40=
Received: by 10.236.22.164 with SMTP id t24mr11840781yht.67.1320313825605;
	Thu, 03 Nov 2011 02:50:25 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o64sm8553185yhk.3.2011.11.03.02.50.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 02:50:24 -0700 (PDT)
From: Vita Preskovsky <vita.preskovsky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2011 11:49:33 +0200
Message-Id: <1320313773-1826-1-git-send-email-vitap@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] new recipe - bluez-hcidump_2.1.bb, to build new version of bluez-hcidump-2.1 that compatible with bluez4_4.95.
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
X-List-Received-Date: Thu, 03 Nov 2011 09:56:38 -0000

---
 recipes/bluez/bluez-hcidump_2.1.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez-hcidump_2.1.bb

diff --git a/recipes/bluez/bluez-hcidump_2.1.bb b/recipes/bluez/bluez-hcidump_2.1.bb
new file mode 100644
index 0000000..2e1389c
--- /dev/null
+++ b/recipes/bluez/bluez-hcidump_2.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Linux Bluetooth Stack HCI Debugger Tool."
+SECTION = "console"
+PRIORITY = "optional"
+DEPENDS = "bluez-libs"
+LICENSE = "GPLv2"
+PR = "r0"
+
+SRC_URI = "http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
+S = "${WORKDIR}/bluez-hcidump-${PV}"
+
+EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
+
+inherit autotools
+
+SRC_URI[md5sum] = "b160f0672276398344eebe9df1b37a2c"
+SRC_URI[sha256sum] = "a6cc20b95b6b1a28ff336aad91e124555231628689225c1155e8cd7aac1af86d"
-- 
1.7.0.4



