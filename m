Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeQ-0002RW-3B
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:58 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1458788wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7eFBtp/X8YB7SEru/XgktxD3M6e15xYNTkgMo3zkZ8w=;
	b=givEMiAS8me3dMjw3kuAYIb/rgtGqq7G8cx8kEiHqH0PU9LQKt+HsV2eVezo3Oa/oh
	V7QC0JkDu14vZLP+rM6pISaAr28zuULDsH1my/8PhA2AO0wuugTE3liUBKIW4pB+o2cO
	d9r4k4YJFnFcwXo8Y0BBf8pdt9A04NCB9Xn+PB93uawVMularc1QI2/piADpBg48sb/F
	Sl5qemKJ7R+5UJtrNdUY9GNZB4UVlqD9bhtrIAG5Ob2GLdNClTBL7rTvgZqGYzMJz8xK
	QRLnuooZCYZ6R1EDxH6T7CR/f0RbPyaKoEViYIqSOYDCUgHSzAlAzrGlblxs40vYAFBC
	11Fw==
Received: by 10.216.138.26 with SMTP id z26mr2953860wei.57.1344125597744;
	Sat, 04 Aug 2012 17:13:17 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:55 +0200
Message-Id: <1344126001-19256-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 10/16] angstrom-task-gnome3: split out task-gnome3-fonts
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb |    9 +--------
 recipes-angstrom/tasks/task-gnome-fonts.bb     |    3 +++
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 7564339..3d6dcb2 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -9,14 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome3-fonts task-gnome3 task-gnome3-gstreamer task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
-
-RDEPENDS_task-gnome3-fonts = " \
-  fontconfig fontconfig-utils font-util \
-  ttf-liberation-sans \
-  ttf-liberation-serif \
-  ttf-liberation-mono \
- "  
+PACKAGES += "task-gnome3 task-gnome3-gstreamer task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
 
 RDEPENDS_task-gnome3 = " \
   gnome-settings-daemon gnome-control-center \
diff --git a/recipes-angstrom/tasks/task-gnome-fonts.bb b/recipes-angstrom/tasks/task-gnome-fonts.bb
index 772dcf1..7ba76ca 100644
--- a/recipes-angstrom/tasks/task-gnome-fonts.bb
+++ b/recipes-angstrom/tasks/task-gnome-fonts.bb
@@ -6,6 +6,9 @@ PR = "r13"
 
 inherit task
 
+# for backwards compatibility
+RPROVIDES_${PN} += "task-gnome3-fonts"
+
 RDEPENDS_${PN} = " \
   fontconfig fontconfig-utils font-util \
   ttf-liberation-sans \
-- 
1.7.4.4



