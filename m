Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiER8-0007Rr-Hg
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:15:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1930158eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tmBmqhwUvspj7eZFMrkvDjgwQvro4mnsBG+GrWYDfQk=;
	b=kMSbNxGsAS2+qSemGDsvO7B1fiPMguHlre73D4nlqY4LBK+nyO+Kwr8ROzcjeHQ+jg
	ZEK5YYF4TSrEH5w29CSHDuLhi8Cg7CU4vd2EhV2QXvsarOQz/P0BqjPI25hSKr/UKGbb
	NCe/6u3SEStpwgGJoWv8phekBvL2H9NXVX+F0t4WaqRCq35/WL7Uk5hn3AM4MtXdr1Pi
	dcmLEdjCUwmIH4aLJZpaxLOTrrfF477bPwv1jAojsoBVSswoIEzS53XPpuQcjpmjrs90
	SymoRyMjbd8EpDC4RYYj2JhGIWODPVTeVaOrQw02wSObkOsmZ38WHumQoPbqcVUDXqB4
	4N3g==
Received: by 10.14.223.200 with SMTP id v48mr55238229eep.24.1355187635380;
	Mon, 10 Dec 2012 17:00:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm46662509eel.17.2012.12.10.17.00.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:00:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 02:00:00 +0100
Message-Id: <49c232118052aeef2336aafff464603cf6771eb9.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1355187290.git.Martin.Jansa@gmail.com>
Subject: [PATCH 88/90] openbox: fix PR format and use new update-alternatives syntax
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
X-List-Received-Date: Tue, 11 Dec 2012 01:15:14 -0000

* fixes:
  NOTE: recipe openbox-3.5.0-1: task do_package: Started
  WARNING: openbox: Use of ALTERNATIVE_NAME is deprecated, see
  update-alternatives.bbclass for more info.
* bump PE if you care about upgrade path from wrong PR, introduced in
  commit 3becce8504033dfac7c497fa12675f873a5df9e0
  Author: Mario Domenech Goulart <mario@ossystems.com.br>
  Date:   Mon Dec 3 16:03:23 2012 +0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index a2c5a66..1fe2e17 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -9,14 +9,13 @@ SRC_URI = "http://icculus.org/openbox/releases/openbox-${PV}.tar.gz"
 SRC_URI[md5sum] = "00441b53cf14c03566c8e82643544ff9"
 SRC_URI[sha256sum] = "6fa90016530b3aa6102e254079461977439398531fb23e7ec076ff2c140fea0a"
 
-PR = "1"
+PR = "r2"
 
 inherit autotools gettext update-alternatives
 
-ALTERNATIVE_PATH = "${bindir}/openbox"
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "10"
+ALTERNATIVE_${PN}-core = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/openbox"
+ALTERNATIVE_PRIORITY[x-window-manager] = "10"
 
 EXTRA_OECONF += "--with-plugins=none"
 
-- 
1.8.0



