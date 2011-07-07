Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QehGH-0002XC-Mt
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 07:36:29 +0200
Received: by gxk3 with SMTP id 3so288340gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 22:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=maVvuIhnkG98bTXyxoTKsZzxXb8IanSEtQe+CcdTp2s=;
	b=uAVK4DDuDcOOLFxaFLeF2CHmytPa/+QptpVpe1p8GdwZUqJtX7N2Beeb8aJXj5scmh
	uJRW5qtIhSz3ruJbbJZ/VhzllKCwD3B89a7YlDOTq5KrI1lsnteSbqbUIQ3fx1MUwskx
	R87l2Ye2xtEdo15HdlBBVSC/XajpM8nr9zjdI=
Received: by 10.151.154.8 with SMTP id g8mr603344ybo.29.1310016757322;
	Wed, 06 Jul 2011 22:32:37 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id o6sm267712yba.17.2011.07.06.22.32.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jul 2011 22:32:36 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 00:29:23 -0500
Message-Id: <1310016563-8871-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com,
	Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, beagle@list.ti.com
Subject: [PATCH] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Thu, 07 Jul 2011 05:36:29 -0000

* Pulseaudio running as per-user is opening audio devices and blocking everyone else from getting access
  to the device. The problem is it doesn't even seem to be allowing applications to connect to it, this
  patch starts it up in system mode instead which is tested and known to work

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 .../pulseaudio-system-mode-startup.sh              |    4 ++++
 recipes/pulseaudio/pulseaudio_0.9.22.bb            |   15 +++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100755 recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-system-mode-startup.sh

diff --git a/recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-system-mode-startup.sh b/recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-system-mode-startup.sh
new file mode 100755
index 0000000..528ceb9
--- /dev/null
+++ b/recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-system-mode-startup.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+echo "Starting Pulseaudio in system mode.."
+pulseaudio --log-target=syslog --system
diff --git a/recipes/pulseaudio/pulseaudio_0.9.22.bb b/recipes/pulseaudio/pulseaudio_0.9.22.bb
index 2368829..6d3adc4 100644
--- a/recipes/pulseaudio/pulseaudio_0.9.22.bb
+++ b/recipes/pulseaudio/pulseaudio_0.9.22.bb
@@ -12,6 +12,10 @@ FILESPATHPKG =. "pulseaudio-0.9.21:"
 
 inherit gettext
 
+inherit update-rc.d
+INITSCRIPT_NAME = "pulseaudio.sh"
+INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
+
 #SRC_URI += "\
 #  file://buildfix.patch \
 #  file://autoconf_version.patch \
@@ -27,6 +31,7 @@ SRC_URI += "\
   file://armv4+v5asm.patch \
   file://fixbluezbuild.patch \
   file://ubacktrace.patch \
+  file://pulseaudio-system-mode-startup.sh \
 "
 
 #do_compile_prepend() {
@@ -37,3 +42,13 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "ca85ab470669b05e100861654cf5eb3c"
 SRC_URI[sha256sum] = "c6019324395117a258c048a6db5e9734551cc2c61dc35b46403ff00d64be55f0"
+
+do_install_append() {
+  # init script to start pulseaudio system-wide
+  install -d ${D}/${sysconfdir}/init.d/
+  install -m 0755 ${WORKDIR}/pulseaudio-system-mode-startup.sh ${D}/${sysconfdir}/init.d/pulseaudio.sh
+
+  # Disable startup of pulseaudio as a per-user instance
+  chmod -x ${D}/${bindir}/start-pulseaudio-x11
+}
+
-- 
1.7.0.4



