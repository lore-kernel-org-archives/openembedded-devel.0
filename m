Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1Qeonu-0008Vc-Be
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 15:39:43 +0200
Received: by mail-bw0-f47.google.com with SMTP id 20so1009142bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=u181FXqt8Ik3Q6ztXS3Al0wh1b5ce0sNkwNDudM6PZs=;
	b=SV6YnwM/N3MXGazPOiC41wjxiBy2U1+n74NZ06gO0bRed3YtrIUy8KqsjTe6Xd9F75
	7HB21mbmonTXtHhxPWeML3FYpM76ag/taZip9K3VDvxHiUNjqfS+1TO7zU1Zps2EYyt2
	Ws1kg29Mc/6e/u/PPf/aP6+3YlZ35ANole4Wg=
Received: by 10.204.7.201 with SMTP id e9mr718779bke.126.1310045752922;
	Thu, 07 Jul 2011 06:35:52 -0700 (PDT)
Received: from localhost.localdomain (wgr614v6.plus.sbg.ac.at
	[141.201.137.156])
	by mx.google.com with ESMTPS id l24sm8552146bkw.3.2011.07.07.06.35.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 06:35:52 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 15:36:11 +0200
Message-Id: <52d3dbb81758055099740c437667671b45974a2d.1310045515.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310045515.git.michael.lippautz@gmail.com>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCHv2 4/4] start-stop-daemon: Add version 1.16.0.2 (initial recipe)
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
X-List-Received-Date: Thu, 07 Jul 2011 13:39:43 -0000

Provides a stand-lone s-s-d that is extracted from dpkg of the corresponding
version.

* dpkg_1.16.0.2 is hostedd on sources.oe.org, since debian wipes old versions
  from their mirrors
* Installing only s-s-d (binary) would be covered by automake rules.
  Documentation would be missing. Thus install all and purge non s-s-d files.

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../start-stop-daemon_1.16.0.2.bb                  |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
new file mode 100644
index 0000000..9b1084a
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Debian's start-stop-daemon utility extracted from the dpkg \
+package"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
+# start-stop-daemon is usually shipped by dpkg
+RCONFLICS_${PN} = "dpkg" 
+PR = "r0"
+
+SRC_URI = "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
+SRC_URI[md5sum] = "d211a84f38987771a49ad1c0f144334a"
+SRC_URI[sha256sum] = "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d0a31bbcc2b54c0ea5"
+
+inherit autotools gettext
+
+S = "${WORKDIR}/dpkg-${PV}"
+
+EXTRA_OECONF = " \
+  --with-start-stop-daemon \
+  --without-bz2 \
+  --without-deselect \
+  --without-install-info \
+  --without-selinux \
+  --without-update-alternatives \
+"
+
+do_install_append () {
+  # remove everything that is not related to start-stop-daemon, since there
+  # is no explicit rule for only installing ssd
+  find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
+  find ${D} -depth -type d -empty -exec rmdir {} \;
+}
-- 
1.7.3.4



