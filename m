Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TftEy-0000Pc-2v
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 15:12:54 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so3856537oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=vsXY3fvluvMWqI0UI7/M7M2/ky6U5Tnfuc6lMC1SL6I=;
	b=N0CkZ80KmltQps8NQGe9LVTyIOc6t1K0PUNnQyJleOV6hLOgj/MB8whu61wAFnpEke
	RkipzcKZCsfltaasB1J5T/5Adn5lQhaoakLNScccJHTX5CZIjGYhfB9dZRoVx+2surXW
	Xih6O7L7OkzIAfSVFdITXk8JaQTCPD1whalrDLgLGnRoXJyoq06IUcnhxNeNp82heY9q
	giDm6RtdgOsrB5qSfZfRzgASnJlwsDvwXRBhDqebphKR2NkQV7hMeMbfo040Pdi/kvO1
	rfFsQD89DxDIw3H0MCfWR9rP+iQulvubiSO/iS3SryNaFUsDn4rFulImHjHBt+3C3G8a
	ayeA==
Received: by 10.60.169.140 with SMTP id ae12mr11321127oec.52.1354629508982;
	Tue, 04 Dec 2012 05:58:28 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id n7sm810975obd.16.2012.12.04.05.58.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 05:58:28 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:58:18 -0200
Message-Id: <1354629498-4917-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH] xinput-calibrator: remove hardcoded path from xinput_calibrator.desktop
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
X-List-Received-Date: Tue, 04 Dec 2012 14:12:55 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../xinput-calibrator/xinput-calibrator_git.bb     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index c16a412..97f9343 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
+PR = "r1"
 
 inherit autotools
 
@@ -21,7 +22,7 @@ do_install_append() {
         install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
 
         install -d ${D}${sysconfdir}/xdg/autostart
-        sed -i -e 's,^Exec=.*,Exec=/usr/bin/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
+        sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
         install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
 }
 
-- 
1.7.2.5



