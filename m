Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeX-0002TC-AT
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:25:05 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1123970wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KcvY9e25Qe7AaGvlmVWnwqq+R9BQ0c7NEu1Rc2XoHE4=;
	b=tDWwtRx/UCYUf+wcaIQBbg3hJCmPWxHmMkVIIss329D0LWVFcIr/PoUT0BWdx6kHXm
	8uRvr/8SIHxWwr1WNXEbhNIKvtNBIRTJ0fc7hV3SBheMFXbS86UrPHEfWD0hE+/rKKu8
	vmFds0Jsli+Z3mm+HnGQQhYtc7dU/oiNzvyHGBhNSidUG/cLX6ASxWjeT2rTieF46ONn
	0Rd6RJUPpMU+zr/tgvmIxBocNPz5ygy5hfatlVxmksEUGJAEtdwj9Zqwz6o4ZBHosduw
	BZS2quv9RKqSlc6SYNkczKNZrM2PnmqpuadG3/XS5LZ9FxSwEl9HGmr+TenV1T/risUx
	nRCQ==
Received: by 10.180.109.166 with SMTP id ht6mr7345726wib.11.1344125604970;
	Sat, 04 Aug 2012 17:13:24 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:20:00 +0200
Message-Id: <1344126001-19256-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 15/16] angstrom-task-gnome3: split out task-gnome3-themes
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
X-List-Received-Date: Sun, 05 Aug 2012 00:25:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb |   27 +-----------------------
 recipes-angstrom/tasks/task-gnome-themes.bb    |    3 ++
 2 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 8fdbec7..7a4fabd 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -9,32 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome3-themes task-gnome3-xserver-base "
-
-RDEPENDS_task-gnome3-themes = " \
-  angstrom-gnome-icon-theme-enable \
-  gnome-icon-theme \
-  gnome-themes \
-  gnome-theme-crux \
-  gnome-theme-highcontrast \
-  gnome-theme-highcontrastinverse \
-  gnome-theme-highcontrastlargeprint \
-  gnome-theme-highcontrastlargeprintinverse \
-  gnome-theme-largeprint \
-  gnome-theme-mist \
-  gtk-engine-clearlooks \
-  gtk-engine-crux-engine \
-  gtk-engine-glide \
-  gtk-engine-hcengine \
-  gtk-engine-thinice \
-  gtk-engine-redmond95 \
-  gtk-theme-clearlooks \
-  gtk-theme-crux \
-  gtk-theme-mist \
-  gtk-theme-thinice \
-  gtk-theme-redmond \
-  hicolor-icon-theme \
- "
+PACKAGES += "task-gnome3-xserver-base "
 
 RDEPENDS_task-gnome3-xserver-base = " \
   dbus-x11 \
diff --git a/recipes-angstrom/tasks/task-gnome-themes.bb b/recipes-angstrom/tasks/task-gnome-themes.bb
index 0842a7d..a2e75c7 100644
--- a/recipes-angstrom/tasks/task-gnome-themes.bb
+++ b/recipes-angstrom/tasks/task-gnome-themes.bb
@@ -6,6 +6,9 @@ PR = "r13"
 
 inherit task
 
+# for backwards compatibility
+RPROVIDES_${PN} += "task-gnome3-themes"
+
 RDEPENDS_${PN} = " \
   angstrom-gnome-icon-theme-enable \
   gnome-icon-theme \
-- 
1.7.4.4



