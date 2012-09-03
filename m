Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8QdG-0000Vy-1X
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 08:59:44 +0200
Received: by wgbds1 with SMTP id ds1so1938810wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Sep 2012 23:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Y2G/50GAN7JD+aJTAJB9WgstOt0Y48DT1nXWxIH0stc=;
	b=xMOJ5nCHtyWT9kZYSVWDCyfdlf0XHwdL5c4Ek5W6crEzKy6ZWFREZ77aGHbmKLDr4h
	Ba2IgYmzVHfzfqW9HMsqyasCHOstnzOQ1nVWyLiZSHCFzUi7g16JzC4rmGhmFoCZ1geT
	u+ioS6ZNQU1iFBWvdT+zV/M7fb35K55/prd44UFA/RTnCwMAJB0J7d2hMqF9PHzNrO1p
	xEkjKwTK30egI4hWLC6oi+OOV6PakjUhAELuAap85W+VbYIEENj2X3fqoBOKEOUM9g23
	Urdc0rtgO/TZVhmipgcusw5obGq18+zzHcNtTrR3SGC5mSaUMEKiudEmuPall+NP/F8g
	fKjA==
Received: by 10.216.133.90 with SMTP id p68mr8715960wei.105.1346654838145;
	Sun, 02 Sep 2012 23:47:18 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2A7E.dip.t-dialin.net.
	[91.10.42.126])
	by mx.google.com with ESMTPS id l5sm25820387wix.5.2012.09.02.23.47.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 23:47:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 08:54:37 +0200
Message-Id: <1346655278-3462-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1346655278-3462-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346655278-3462-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gdm: do not hardcode /usr/sbin
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



