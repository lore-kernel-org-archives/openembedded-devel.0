Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrsp-0004Zk-2U
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:04:20 +0100
Received: by eeav2 with SMTP id v2so902377eea.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pfz5k7iJ4lvSejxfQIQG8SwK2TM1ZXQdIgc0lWL4pVo=;
	b=VMi2BdLaNAAzFZioSuJfDyTeZVQm4W9KUau7l7hBKP266YR298VsJTeACQCHyzYWl3
	FR6KbCt7XSd1b7lu/T6gKNRTrpdjZDcwPyuBushCQ2B8sflc6gv0s8teshewNNQuOKqS
	mGDw0f81o1AmPJy4HXl43zTl6ZKGgXgWGz67A=
Received: by 10.14.11.150 with SMTP id 22mr2136380eex.217.1323165452050;
	Tue, 06 Dec 2011 01:57:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c9sm67377454eeb.0.2011.12.06.01.57.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:57:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:01 +0100
Message-Id: <cf61bd0ed1c4cf0aad39627099a21dcc46912eda.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 02/16] edbus: include libeconnman0_7x in edbus-connman, otherwise whole PN is renamed and breaks upgrade path
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
X-List-Received-Date: Tue, 06 Dec 2011 10:04:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index 4f2e920..58498b4 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=550b8cea13dacc4bf00508a8cce1074c"
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRCNAME = "e_dbus"
 
@@ -17,7 +17,7 @@ FILES_${PN}-enotify = "${libdir}/libenotify.so.* ${bindir}/e-notify-send"
 FILES_${PN}-edbus = "${libdir}/libedbus.so.*"
 FILES_${PN}-enm = "${libdir}/libenm.so.*"
 FILES_${PN}-ehal = "${libdir}/libehal.so.*"
-FILES_${PN}-econnman = "${libdir}/libeconnman.so.*"
+FILES_${PN}-econnman = "${libdir}/libeconnman.so.* ${libdir}/libeconnman0_7x.so.*"
 FILES_${PN}-eofono = "${libdir}/libeofono.so.*"
 FILES_${PN}-eukit = "${libdir}/libeukit.so.*"
 FILES_${PN}-ebluez = "${libdir}/libebluez.so.*"
-- 
1.7.8



