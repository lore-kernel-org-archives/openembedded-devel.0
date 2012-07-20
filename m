Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ss9n4-0002H6-Ie
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 11:46:30 +0200
Received: by weyr6 with SMTP id r6so2368632wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=jHTaT4ah+zLmArrp9UV6owf8tJljiT67kWbKbXGwGR0=;
	b=r0BpkS6WvYbeaukpKsrLos84h0pQdksMHkADIsIJ8HFrjBD0nL74YAFfFe2DV01raO
	fLQzbwONwStEc9k+rKp2UvroZyTtz5N5Q3b3jVanEKNmgJxa3EaIvT4V/lLiSUPj6wwG
	3GsGC5qZtnK+DqOryfxQNzWdPiAogv9/0e1O7hkJMgd4Qaq4ZeVEs4N80gnIPjJMfidq
	Ws9qdmyiD73ErFGqwZ5KbtnRVYlCMEPksP40Ch/dewM/7LUG6LlHRBopH0ibHzCAa7ZZ
	aDEShqWW72xZo9jxXSrsRmk7bNbfK2puwUPdqm42FYBixJPVIWMRiHmodCpVh6ZPKGIX
	rdfA==
Received: by 10.217.1.79 with SMTP id m57mr3114342wes.121.1342776907600;
	Fri, 20 Jul 2012 02:35:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm13616333wiz.11.2012.07.20.02.35.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 02:35:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jul 2012 11:35:16 +0200
Message-Id: <1342776917-24116-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-systemd][PATCH 1/2] systemd: add usbutils to DEPENDS
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
X-List-Received-Date: Fri, 20 Jul 2012 09:46:30 -0000

* fixes:
  | No package 'usbutils' found
  | configure:16015: error: Package requirements (usbutils >= 0.82) were not met:

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 7fccadb..4257660 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r1"
+PR = "r2"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-- 
1.7.8.6



