Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QczFP-0005lr-RA
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:24:31 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so4287077fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 05:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+5SO+jTUxIitJL0jpnclOgMLKRPXRRxgMq37JH6IUAI=;
	b=HRxvv2u7rqdVZx/TP8vaST1nstB8AXzLEqH4bRHjeUUcm4oONrCJno1oZXB+znGzb6
	HKhsjBjAo/rVBzhKHWXwQB+7QKUrwKujBhDs6RPTADPQ9x+8UAClgkn9cYRuOdnDvxNQ
	NTjI8ouxuAvHTR43SvnqgtJnNSNoa+SN6kFjw=
Received: by 10.223.145.2 with SMTP id b2mr6404674fav.99.1309609248179;
	Sat, 02 Jul 2011 05:20:48 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-149-243.dynamic.xdsl-line.inode.at [85.127.149.243])
	by mx.google.com with ESMTPS id q21sm3042895fan.40.2011.07.02.05.20.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 05:20:47 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jul 2011 14:21:04 +0200
Message-Id: <1487279e2c46654967623254841a293cb838279b.1309608953.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCH 4/4] start-stop-daemon: Add initial version
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
X-List-Received-Date: Sat, 02 Jul 2011 12:24:31 -0000

Provides a stand-alone ssd that is extracted from dpkg of the corresponding
version.

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../start-stop-daemon_1.16.0.2.bb                  |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
new file mode 100644
index 0000000..5c2b92a
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Debian's start-stop-daemon utility extracted from the dpkg \
+packge"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
+# start-stop-daemon is usually shipped by dpkg
+RCONFLICS_${PN} = "dpkg" 
+PR = "r0"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
+
+inherit autotools gettext
+
+S = "${WORKDIR}/dpkg-${PV}"
+
+EXTRA_OECONF = " \
+  --with-start-stop-daemon \
+  --without-bz2 \
+  --without-deselect \
+  --without-update-alternatives \
+  --without-install-info \
+  --without-selinux \
+"
+
+do_install_append () {
+  # remove everything that is not related to start-stop-daemon, since there
+  # is no explicit rule for only installing ssd
+  find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
+  find ${D} -depth -type d -empty -exec rmdir {} \;
+}
+
+SRC_URI[md5sum] = "d211a84f38987771a49ad1c0f144334a"
+SRC_URI[sha256sum] = "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d0a31bbcc2b54c0ea5"
-- 
1.7.3.4



