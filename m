Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULexT-0007aK-JZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 20:27:27 +0100
Received: by mail-ee0-f43.google.com with SMTP id e50so327206eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 12:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=NxqlBG7/fJ/lbyhVf9cw/B1d+BMhnP63TNpNXggvo4Y=;
	b=TYObrtC8bYUl5RCoyuOb0FPhFg00IxHnek0b6fhqLOdyw0Y37quYZ+obo13sJb9QQ7
	oAJvChbEmYgNpWMoMG1MxpZps1onICMw9KJKFxlS9lDdt3J8BymnzLJ+a+XJDNpUholF
	a7TOklEAtwo0qlnn4UAkXWXgQaqDj5jKDNex4BjXwCGXTw4D4NBUwEWP48kY2BY+ePat
	8RngRhhNHFbdg3p/uWZ/p6O1rPSwPLdjXtaYN3m7MgyptME8J3n2p+xo93G7QiH6Y4AD
	9nEvoTnrUGWa1VP0e0BuOj6H3ZVHSQT66Zxs6vF/7F+iLxfxZx0gpbgbeQujTTpMhSGE
	NGaw==
X-Received: by 10.14.216.2 with SMTP id f2mr10499638eep.44.1364584223501;
	Fri, 29 Mar 2013 12:10:23 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id r4sm5769042eeo.12.2013.03.29.12.10.22
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 12:10:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 20:10:06 +0100
Message-Id: <1364584207-3047-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 3/4] xfce4-closebutton-plugin: initial add
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
X-List-Received-Date: Fri, 29 Mar 2013 19:27:27 -0000
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
index 0000000..cbc7df5
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
+DEPENDS += "perl-native exo-native libwnck xfconf"
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



