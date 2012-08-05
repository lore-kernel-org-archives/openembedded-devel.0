Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeT-0002TC-2t
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:25:01 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1123970wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=c0YvgQ8BARt01X4ppPUnEnmMVU5g4q7G0nbYDYB5uk8=;
	b=yNsuNgNQJnyFJGz84ee+zJ+Kc57a8lDm9VI01GWj93s7N44tPNbJVKTgE/o9APjTWb
	42uP5DpJFTwAL8gwf1JdRF8c1EaSgdVsbSP+F6LYZbl79rvQiuKssgQvxYM09iFHvKyO
	gU+6/yONUMerSmUQkV5FZqpOMQ5d61pPttvniL0XROz4GyFQyC6qhrytCX1odGFVuez+
	vDGW1yieCuAA2AKoan8h3Km3LiHQimqfhcSTbYds0V7sbQJO2RW341QAg1FYvuXyH0Ub
	RXOP6dgVZOANtTT8ebKub1AEBNZjkVM7IY9mkVm40mhX3A7em+Yy9luRxjQ1rI52AX7k
	T7aw==
Received: by 10.216.198.137 with SMTP id v9mr3277597wen.116.1344125600733;
	Sat, 04 Aug 2012 17:13:20 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:57 +0200
Message-Id: <1344126001-19256-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 12/16] angstrom-task-gnome3: split out task-gnome3-gstreamer
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
X-List-Received-Date: Sun, 05 Aug 2012 00:25:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb |   14 +-------------
 recipes-angstrom/tasks/task-gnome-gstreamer.bb |    3 +++
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 9e4581e..670b941 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -9,19 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome3-gstreamer task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
-
-DEPENDS_task-gnome3-gstreamer = " \
-  gst-plugins-base \
-  gst-plugins-good \
-  gst-plugins-bad \
-  gst-plugins-ugly \
-"
-
-RDEPENDS_task-gnome3-gstreamer = " \
-  gst-ffmpeg \
-  gst-plugins-base-meta \
-"
+PACKAGES += "task-gnome3-perl task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
 
 RDEPENDS_task-gnome3-perl = " \
   perl \
diff --git a/recipes-angstrom/tasks/task-gnome-gstreamer.bb b/recipes-angstrom/tasks/task-gnome-gstreamer.bb
index e0a520c..7ba8d43 100644
--- a/recipes-angstrom/tasks/task-gnome-gstreamer.bb
+++ b/recipes-angstrom/tasks/task-gnome-gstreamer.bb
@@ -6,6 +6,9 @@ PR = "r13"
 
 inherit task
 
+# for backwards compatibility
+RPROVIDES_${PN} += "task-gnome3-gstreamer"
+
 DEPENDS_${PN} = " \
   gst-plugins-base \
   gst-plugins-good \
-- 
1.7.4.4



