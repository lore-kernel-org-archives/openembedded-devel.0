Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UMuvF-0007T1-Gc
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 08:42:21 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so31076eei.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=TFswSFYgQNUsNTp1jdEWncpK92VAbSHB+U2kyurPJs8=;
	b=GwYdbdFibNCxdYL567FwIotkOJyaN/W1uS02HKLoUS+/l8UWcEB+g7fcMh9ySWtVM3
	afczoVXteCN2vFySQWY/yFiYSmU/kinY2SNuE4wrYOFmcWNk1Td4vGLo0Kj+kv31gY5p
	Vt589ogLNXxHsz4wuoFRCUltVrH+4SKFgWvyq6AbtmROEl0FniU277DdvN/wyyLD63r9
	8ead18eIxIHLtei208LwsEDFoPi9vUfQ5BiYwoYBS38uc8jAjuLe6ptviEs7mbGuPfE5
	kQEDpfnDIbvdDauVTaEkRVwMFVmocSkvQ/6il9adljuSIJx2+IjyhXnWgqSH3djmFfBP
	RZ4w==
X-Received: by 10.14.210.132 with SMTP id u4mr45403933eeo.19.1364883912371;
	Mon, 01 Apr 2013 23:25:12 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A51.dip.t-dialin.net.
	[91.10.58.81])
	by mx.google.com with ESMTPS id s3sm458591eem.4.2013.04.01.23.25.11
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 23:25:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2013 08:24:54 +0200
Message-Id: <1364883895-24252-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce,V2 4/5] xfce4-closebutton-plugin: initial add
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
X-List-Received-Date: Tue, 02 Apr 2013 06:42:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I do not have the environment and the time to create a tarball, so take sources
from my git repo.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../closebutton/xfce4-closebutton-plugin_git.bb    |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
new file mode 100644
index 0000000..879d1d6
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Plugin displaying close button for application currently active"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
+
+inherit xfce-panel-plugin gtk-icon-cache perlnative
+
+DEPENDS += "exo-native libwnck xfconf"
+
+PV = "0.1.0+gitr${SRCPV}"
+
+SRC_URI = "git://gitorious.org/xfce/xfce4-closebutton-plugin.git;protocol=git;branch=master"
+SRCREV = "bd76154afe26ba8a5251a1887d88f9d855301850"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--enable-maintainer-mode"
+
+do_configure_prepend() {
+	NOCONFIGURE=yes ./autogen.sh
+}
+
+FILES_${PN} += "${datadir}/xfce4/closebutton/themes"
-- 
1.7.4.4



