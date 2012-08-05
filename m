Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeL-0002RV-Mo
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:53 +0200
Received: by mail-wi0-f169.google.com with SMTP id hm2so540004wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Mp6batZW65PRrRwxMjrRJ48vac8PWYexOeoAPDNvqCs=;
	b=gcpKulWUQsfKtK+uwmVZSgljzUvRjqQf4Z9IWJOSGq/U7e1VbWewNAZyiw+zlyrPQg
	hjP9g+R03xePcDubdcUzxvPZyUstwGYQMYQl/4fO9EcqqPFLzAQPCCY+qz4Xws+wtUtP
	DRBW5Wv03AJM8S14oYfllUkpuGzHZUOpu9JYFd84d3a2G9RFfGnus/DKYjSQvbCRfxPK
	GAATEjPnCd8TLaOulkJLqLagqZMF8y/ykDzDnANazX2kHMS9CWaAq+RahSWUDy/tIWe5
	1s+yW6XNDSYiIfE2cJMGMhX6NBcQ7GdWgUfLdp8Jq9raek4YPNxRyvBJEEehk2JcwH99
	tU/w==
Received: by 10.216.153.139 with SMTP id f11mr3327030wek.16.1344125593366;
	Sat, 04 Aug 2012 17:13:13 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:52 +0200
Message-Id: <1344126001-19256-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 07/16] angstrom-task-gnome: split out task-gnome-themes
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome.bb |   27 +--------------------
 recipes-angstrom/tasks/task-gnome-themes.bb   |   32 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 26 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome-themes.bb

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index 54ad693..66b00bb 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -9,32 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome-themes task-gnome-xserver-base "
-
-RDEPENDS_task-gnome-themes = " \
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
+PACKAGES += "task-gnome-xserver-base "
 
 RDEPENDS_task-gnome-xserver-base = " \
   dbus-x11 \
diff --git a/recipes-angstrom/tasks/task-gnome-themes.bb b/recipes-angstrom/tasks/task-gnome-themes.bb
new file mode 100644
index 0000000..0842a7d
--- /dev/null
+++ b/recipes-angstrom/tasks/task-gnome-themes.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Task for GNOME themes"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+  angstrom-gnome-icon-theme-enable \
+  gnome-icon-theme \
+  gnome-themes \
+  gnome-theme-crux \
+  gnome-theme-highcontrast \
+  gnome-theme-highcontrastinverse \
+  gnome-theme-highcontrastlargeprint \
+  gnome-theme-highcontrastlargeprintinverse \
+  gnome-theme-largeprint \
+  gnome-theme-mist \
+  gtk-engine-clearlooks \
+  gtk-engine-crux-engine \
+  gtk-engine-glide \
+  gtk-engine-hcengine \
+  gtk-engine-thinice \
+  gtk-engine-redmond95 \
+  gtk-theme-clearlooks \
+  gtk-theme-crux \
+  gtk-theme-mist \
+  gtk-theme-thinice \
+  gtk-theme-redmond \
+  hicolor-icon-theme \
+"
-- 
1.7.4.4



