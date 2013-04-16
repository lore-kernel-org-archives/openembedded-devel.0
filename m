Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USBYv-00048b-HF
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 21:29:05 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so368029eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0F7dXc6aa+nKZD4/ux4B1xD7FHpOqIP5OYKhZmNFnyI=;
	b=XVKr/N4XB58x81L6hdZvB7FUcWSloxjsskMY31FUlkRkt9CABA28sBkj6/3NhQOhEW
	4Y7PL5WTcpKPrVsoonBLGPVtPvJNZ7YkDs6TeyPjla93mUXxVTij3XIo7yYXzkyiWlgl
	C1Q7nRQNkRWvH5pkd9+734EKrAPhaOmJwsQnGO1gn9sJNgUKcrr7CYRx6hSHF1NL6SRO
	39vgRjhOyGjW6JeK9fJfUUaJJ5fCwWBPZcbupZ/LOVFh0OMWx1uvaj8hYm6s7cvi1kxK
	jooWS2iZ0UaJmWF7oew1Z5L5O3j5SQ06WeyKdyZhbI6+VI9Uybi7ZrkDhe5W4EJDefYu
	RREw==
X-Received: by 10.15.98.66 with SMTP id bi42mr9252384eeb.39.1366139495025;
	Tue, 16 Apr 2013 12:11:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ch6sm4413603eeb.17.2013.04.16.12.11.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 12:11:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 21:11:39 +0200
Message-Id: <1366139500-880-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH 1/2] xserver-nodm-init: install .service and conf only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 16 Apr 2013 19:29:05 -0000

* Otavio reported unpackaged files without systemd enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb                | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index aa85c8c..d5e461a 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r21"
+PR = "r22"
 
 SRC_URI = "file://xserver-nodm \
            file://gplv2-license.patch \
@@ -23,9 +23,12 @@ do_install() {
     install xserver-nodm ${D}${sysconfdir}/init.d
 
     install -d ${D}${sysconfdir}/default
-    install -d ${D}${systemd_unitdir}/system
-    install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
-    install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
+        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-- 
1.8.1.5



