Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USBYz-00048l-8A
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 21:29:23 +0200
Received: by mail-ea0-f179.google.com with SMTP id f15so386246eak.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=IHHyqS/FWXmTIdRxBFiGecj2yX2qxdiDxp6MqRjA2tY=;
	b=AdS9OZGUG6JpxHTExZxjXgElwv7DzxvBT8sE9WmtA9fk6N8hTjJvbjHLMDdH2PrGSg
	u4nvAmXx1yDXcqG65aIHhbgoJzvxUxPa5hnPWBUZQ9zw8080FJKBvVAlBkD+JzoBx4x2
	Fk2tBaCiBZege3buWTDvIaZJLNcH6IS3VPYThrX5DzS1tZUpKn3KJMP0K2rZbNNa7YhH
	qxaqx4cRcjl8eriEyBl1AY4kbx/bkocRMnRd3nnToRrUbfY1CUD6PUw08p2UwxZA0HZv
	Fskc9QdH35Am4O2F8C4TG0Vg5U9/kTtYg158/k12PBM1fabDSZdwckSJqp+pwTuUvuaA
	p5qQ==
X-Received: by 10.15.111.202 with SMTP id cj50mr9460249eeb.6.1366139497187;
	Tue, 16 Apr 2013 12:11:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a41sm4501394eei.4.2013.04.16.12.11.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 12:11:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 21:11:40 +0200
Message-Id: <1366139500-880-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1366139500-880-1-git-send-email-Martin.Jansa@gmail.com>
References: <1366139500-880-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] xinput-calibrator: install .service only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 16 Apr 2013 19:30:10 -0000

* Otavio reported unpackaged files without systemd enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 593d465..640aef1 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 inherit autotools systemd
 
@@ -26,8 +26,10 @@ do_install_append() {
     sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
     install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
-- 
1.8.1.5



