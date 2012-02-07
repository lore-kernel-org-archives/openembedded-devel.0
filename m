Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumtK-0003dX-2X
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:23:34 +0100
Received: by eekd41 with SMTP id d41so2181836eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=iZrafSdCppDkdO9w9Gc4b0vNePxJKdzEPgsoOnW92Z4=;
	b=JuUVWguOIqVJQUvDQFGWyFDPe9WUe82mVdfEZjhsWzIqpgQFXzfGgoUeJ022fcUTGR
	rYxGulWWjuDKLZZVE608sdaur0sXKXsVq7DaWPSJsOTy9O8umbpv7CBcpJ5V/EHtlyaE
	pDrg4SIaa42nCe3IT73urQnI5sNV67DgYtotc=
Received: by 10.14.37.68 with SMTP id x44mr7257806eea.57.1328627731943;
	Tue, 07 Feb 2012 07:15:31 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id z47sm66752182eeh.9.2012.02.07.07.15.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:15:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue,  7 Feb 2012 16:15:31 +0100
Message-Id: <1328627734-5293-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][RFC 3/6] angstrom-task-gnome: replace gdm-systemd by gdm
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
X-List-Received-Date: Tue, 07 Feb 2012 15:23:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index 544997e..186fdfe 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Task for a GNOME based image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r11"
+PR = "r12"
 
 inherit task
 
@@ -29,7 +29,7 @@ RDEPENDS_task-gnome-fonts = " \
 RDEPENDS_task-gnome = " \
   gnome-settings-daemon gnome-control-center \
   gnome-keyring \
-  gdm-systemd angstrom-gdm-autologin-hack \
+  gdm angstrom-gdm-autologin-hack \
   gnome-power-manager \
   gnome-bluetooth \
   connman-gnome  \
-- 
1.7.6.4



