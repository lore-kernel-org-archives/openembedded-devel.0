Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <todd.kempel@gmail.com>) id 1RPyOg-0006sy-Av
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 16:24:34 +0100
Received: by yenq7 with SMTP id q7so175235yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7IUnQh4/3u/RdeANoVBRoSKdjbulxCqilIoXckSOWm0=;
	b=DuBoevXwQoGXggd92iWD1P7//tyYEv1rv3pQV6OxhIn5+i6B0WrRGnJDagwlabRjGb
	9cB7ViD9QMDfWJynGPeIoQIR8qjpPpve6PzIeFZb/3SDoGECBP2PeW8dh4/X762lfmZy
	F4NA/fgduWquPEutfVBm9myeXKt9Kcn1QvTxg=
Received: by 10.146.200.27 with SMTP id x27mr1331142yaf.31.1321283891222;
	Mon, 14 Nov 2011 07:18:11 -0800 (PST)
Received: from localhost.localdomain
	(173-165-236-123-minnesota.hfc.comcastbusiness.net.
	[173.165.236.123])
	by mx.google.com with ESMTPS id 8sm61948955anv.16.2011.11.14.07.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 07:18:10 -0800 (PST)
From: Todd Kempel <todd.kempel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 09:17:42 -0600
Message-Id: <1321283862-3579-1-git-send-email-todd.kempel@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Todd Kempel <todd.kempel@gmail.com>
Subject: [PATCH v2] batctl: Add version 2011.3.0 (initial recipe)
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
X-List-Received-Date: Mon, 14 Nov 2011 15:24:34 -0000

* batmand is included in the current OE repository but is not being actively maintained.
  The batman-adv kernel module is a replacement for batmand and requires batctl for operation.
  Recipe has been tested and binary found fully operational using Angstrom on gumstix board.

Signed-off-by: Todd Kempel <todd.kempel@gmail.com>
---
 recipes/batctl/batctl.inc         |   20 ++++++++++++++++++++
 recipes/batctl/batctl_2011.3.0.bb |    6 ++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/batctl/batctl.inc
 create mode 100644 recipes/batctl/batctl_2011.3.0.bb

diff --git a/recipes/batctl/batctl.inc b/recipes/batctl/batctl.inc
new file mode 100644
index 0000000..75bb62f
--- /dev/null
+++ b/recipes/batctl/batctl.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "Control application for B.A.T.M.A.N. routing protocol kernel module for multi-hop ad-hoc mesh networks."
+HOMEPAGE = "http://www.open-mesh.net/"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPL"
+
+INC_PR = "r0"
+
+RDEPENDS_${PN} = "kernel-module-batman-adv"
+
+SRC_URI = "http://downloads.open-mesh.net/batman/stable/sources/batctl/batctl-${PV}.tar.gz"
+
+do_compile() {
+  oe_runmake
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 0755 batctl ${D}${bindir}
+}
diff --git a/recipes/batctl/batctl_2011.3.0.bb b/recipes/batctl/batctl_2011.3.0.bb
new file mode 100644
index 0000000..97d8e17
--- /dev/null
+++ b/recipes/batctl/batctl_2011.3.0.bb
@@ -0,0 +1,6 @@
+require batctl.inc
+PR = "${INC_PR}.0"
+
+
+SRC_URI[md5sum] = "8eb197896049bb04a6beef56015a16b6"
+SRC_URI[sha256sum] = "94922fd167d2bca5193cc7465bfc212c2c3595da70e653506493dfc65e4410fb"
-- 
1.7.4.1



