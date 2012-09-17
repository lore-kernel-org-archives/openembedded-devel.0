Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDWZF-0005IT-Sh
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 10:20:34 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2156742bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 01:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=o38O7qO7+nIIGKHmB9axLhJgLPfBSdBScpkvHJhdguE=;
	b=w1ZRrpNFaw68dOvStGq8xUDyKcEC6YyPZtWPKHjpdJxDZ14xfXsicYwBuA5eReSIZ1
	shoN1JHt8GKADCYBYL/+bouXpstSXAqA1pl4Go4rZd0yIZQoK6KM6SHSN6IB2CWIFjrK
	WElXCZtb47ua/MVMoR4R3FYWUlAz52zhM2Sd00SCeXysGdiHh8hyYtHR14hw2bM8y7NC
	vtXA7v9XFzfK56CMPdZvYPrX7zUp7CfX6Ke7lYgCS6A94Oeedk/FZafVprRO5U86lIhM
	Jw7LRIHdQHIQmg9IDU773uezuAGQhnUPtx4AZo0GFUOOTzP7yHCWiaKBPDHKaXG8ShWC
	uuSw==
Received: by 10.204.152.146 with SMTP id g18mr188876bkw.73.1347869277445;
	Mon, 17 Sep 2012 01:07:57 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1A7D.dip.t-dialin.net.
	[79.223.26.125])
	by mx.google.com with ESMTPS id a17sm1387041bkw.5.2012.09.17.01.07.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 01:07:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:15:43 +0200
Message-Id: <1347869747-14271-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 3/7] gdm: do not hardcode /usr/sbin
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
X-List-Received-Date: Mon, 17 Sep 2012 08:20:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gdm/gdm/{gdm.service => gdm.service.in}        |    2 +-
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   11 ++++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)
 rename meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/{gdm.service => gdm.service.in} (81%)

diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
similarity index 81%
rename from meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
rename to meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
index 0f94e0c..3e1556a 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
@@ -3,7 +3,7 @@ Description=Gnome Display Manager
 After=systemd-user-sessions.service
 
 [Service]
-ExecStart=/usr/sbin/gdm -nodaemon
+ExecStart=%sbindir%/gdm -nodaemon
 StandardOutput=syslog
 
 [Install]
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index 496a276..45b47c3 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -5,9 +5,14 @@ PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
-SRC_URI += " \
-            file://gdm.service \
-           "
+SRC_URI += "file://gdm.service.in"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	sed -e 's,%sbindir%,${sbindir},g' \
+		< ${WORKDIR}/gdm.service.in \
+		> ${D}${systemd_unitdir}/system/gdm.service
+}
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "gdm.service"
-- 
1.7.4.4



