Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8QdE-0000Ug-Ig
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 08:59:44 +0200
Received: by wibhn17 with SMTP id hn17so3018564wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Sep 2012 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=GhLZqty+QrFYE1u5bqpu4vx8v3tTiPb6A6UsyqjDvo4=;
	b=qXgwJqxuCF8okRJLq3+kzIuJ8aaFkNhX2XkHZjH9mqzbkRNh/cqmFmUMWmAIZ5wYdk
	yBU3LNzavqIy3HQouJIEnoBp9AAKceKU8p3lPhZN0/zMd9bJdpgakF1FRE+HpRf+1EKO
	/n8StqukNa38+gKkjLewIIVnm2VOgNeYHyhkvBo6GDWF2pgwZLaaDjKm0jNLDWP5fdOD
	OZupS5ZslAQfwe7d9GamJ3Ssb5tz7W0iZ03zjvSBO1CM2cq1wib3EAWFhuaw6VWlLAZf
	RgWYEb+WZ+KmW88q+Z6tBRpIFVWF0VCb3dKcVetAhB62BLAjZV3MWVy/uAJ3hlsuMVQC
	+gag==
Received: by 10.216.49.6 with SMTP id w6mr9261906web.207.1346654836411;
	Sun, 02 Sep 2012 23:47:16 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2A7E.dip.t-dialin.net.
	[91.10.42.126])
	by mx.google.com with ESMTPS id l5sm25820387wix.5.2012.09.02.23.47.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 23:47:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 08:54:36 +0200
Message-Id: <1346655278-3462-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH 1/3] gdm: do not rely on dev-tty7.device
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
X-List-Received-Date: Mon, 03 Sep 2012 06:59:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Error message was:

[ TIME ] Timed out waiting for device dev-tty7.device.
[DEPEND] Dependency failed for Gnome Display Manager.

run tested on overo/xfce

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../meta-gnome/recipes-gnome/gdm/gdm/gdm.service   |    3 +--
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
index adfc565..0f94e0c 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
@@ -1,7 +1,6 @@
 [Unit]
 Description=Gnome Display Manager
-Requires=dev-tty7.device
-After=dev-tty7.device systemd-user-sessions.service
+After=systemd-user-sessions.service
 
 [Service]
 ExecStart=/usr/sbin/gdm -nodaemon
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index 963e3e8..496a276 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
-- 
1.7.4.4



