Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDWZE-0005IT-1N
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 10:20:32 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2156742bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 01:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GhLZqty+QrFYE1u5bqpu4vx8v3tTiPb6A6UsyqjDvo4=;
	b=EdK4qGD2NUOH7Q51tZNGINBOOSAqidikIpHIYCd9X8V0hhSoK/X7GcnwQC/0Np9IrI
	EYH3NPsyrC0xzrdWl4RrH09N5x91XkRmxY7nLkGsZlyYV9MuQMUTF3uH47kOmKxdUNXn
	+icVVU0mg6gFvJFx3s4WQX1CuthWgcBVLYTx/sFQAMD6mUJ35hUA/tklthjE6LQiIX8p
	/OSWcZ6tRepCyCh4iohsQaCCcEQTzbaQii5zEg9qtyn042P5nqlBDLgLFcmRGgIlHVXh
	Zu1gCYim9gfDEQg6QU4qDKvH481O8WtdbXe+7IqCwJZ7oFcPw48bPcniK4kGipR/GwQC
	FLXQ==
Received: by 10.204.149.217 with SMTP id u25mr3918005bkv.107.1347869275952;
	Mon, 17 Sep 2012 01:07:55 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1A7D.dip.t-dialin.net.
	[79.223.26.125])
	by mx.google.com with ESMTPS id a17sm1387041bkw.5.2012.09.17.01.07.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 01:07:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:15:42 +0200
Message-Id: <1347869747-14271-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 2/7] gdm: do not rely on dev-tty7.device
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
X-List-Received-Date: Mon, 17 Sep 2012 08:20:32 -0000
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



