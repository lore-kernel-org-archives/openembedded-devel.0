Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.6713.1630497446118245163
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 04:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B7C391BF203;
	Wed,  1 Sep 2021 11:57:23 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-oe][PATCH 1/2] meta-oe: stop using "virtual/" in RPROVIDES and RDEPENDS
Date: Wed,  1 Sep 2021 13:57:17 +0200
Message-Id: <20210901115718.118994-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.

That's confusing because "virtual/" has no special meaning in
RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).

Instead, using "virtual-" instead of "virtual/"
as already done in the glibc recipe in OE-core

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb | 2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_367.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
index 93ef228ef..c85293aa5 100644
--- a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
+++ b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
@@ -33,4 +33,4 @@ do_install() {
     install -m 0755 openbox-xdgmenu ${D}${bindir}
 }
 
-RDEPENDS:${PN} += "virtual/x-terminal-emulator"
+RDEPENDS:${PN} += "virtual-x-terminal-emulator"
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_367.bb b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
index 81bfcf114..ee25dc872 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
@@ -37,7 +37,7 @@ do_install:append() {
     oe_runmake install-desktop DESTDIR="${D}" DESKTOP_FLAGS="--dir=${D}${DESKTOPDIR}"
 }
 
-RPROVIDES:${PN} = "virtual/x-terminal-emulator"
+RPROVIDES:${PN} = "virtual-x-terminal-emulator"
 
 # busybox can supply resize too
 inherit update-alternatives
-- 
2.25.1

