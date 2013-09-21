Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4266CA16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAfud4013442; 
	Sat, 21 Sep 2013 12:41:56 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAftea013441;
	Sat, 21 Sep 2013 12:41:55 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:35 +0200
Message-Id: <1379760101-13380-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 04/10] sound-theme-freedesktop: initial add 0.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Sep 2013 10:41:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../sound-themes/sound-theme-freedesktop_0.8.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
new file mode 100644
index 0000000..97a1dba
--- /dev/null
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Freedesktop sound theme"
+HOMEPAGE = "http://freedesktop.org/wiki/Specifications/sound-theme-spec"
+LICENSE = "GPLv2+ CC-BY-3.0 CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://CREDITS;md5=3213e601ce34bb42ddc3498903ac4e69"
+
+inherit autotools gettext
+
+# with allarch.bbclass configure fails fo no compiler found
+PACKAGE_ARCH = "all"
+
+SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
+SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
-- 
1.8.3.1


