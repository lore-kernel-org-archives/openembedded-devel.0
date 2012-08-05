Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeE-0002RW-W4
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:47 +0200
Received: by wgbdr1 with SMTP id dr1so1458788wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=1iM8oA3L1ym/uCOlUCXuaKv58FZzn1HuaVJ2ri1joVA=;
	b=ON6N3Gdqyuy7Sn2AyL11sDituYDvXArv4bJUU9CefHpi/mosCL+b5XwAzc8Tt7BPCT
	dYTvzdV2Yc+jeMQxzMiphwQ53QELGANPtViHUUqRebV2xdEnmXyaB4XpEfZyscT6rrW1
	tTez4wIofGSk59u5IrDmo9M69/K9vMxadjaeoqzben8g2U1Mtk5SFB12cbZLaSZQxlDo
	JE1nSpDJuPisTAb+lEDdtr4IaG4bPtei8Xa9rBI0TBe9Zo9Zx2CPkiKFvrBa7oriqcGA
	ET8l0PIAbP+GE3deSOVW6YTdZWqxuqncAyoz789oP/HzSjBp0UpzvI1TKGVutUI/tZJb
	6gwA==
Received: by 10.180.102.136 with SMTP id fo8mr7303678wib.19.1344125584401;
	Sat, 04 Aug 2012 17:13:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:46 +0200
Message-Id: <1344126001-19256-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 01/16] angstrom-task-gnome: split out task-gnome-apps
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome.bb |   12 ++----------
 recipes-angstrom/tasks/task-gnome-apps.bb     |   14 ++++++++++++++
 2 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome-apps.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index 45d85aa..cb4dde5 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -2,22 +2,14 @@ DESCRIPTION = "Task for a GNOME based image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r12"
+PR = "r13"
 
 inherit task
 
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome-apps task-gnome-fonts task-gnome task-gnome-gstreamer task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
-
-
-RDEPENDS_task-gnome-apps = " \
-  x11vnc \
-  matchbox-terminal \
-  epiphany \
-  gedit \
-"
+PACKAGES += "task-gnome-fonts task-gnome task-gnome-gstreamer task-gnome-perl task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
 
 RDEPENDS_task-gnome-fonts = " \
   fontconfig fontconfig-utils font-util \
diff --git a/recipes-angstrom/tasks/task-gnome-apps.bb b/recipes-angstrom/tasks/task-gnome-apps.bb
new file mode 100644
index 0000000..51306f9
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome-apps.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Task for GNOME applications"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  x11vnc \
+  matchbox-terminal \
+  epiphany \
+  gedit \
+"
-- 
1.7.4.4



