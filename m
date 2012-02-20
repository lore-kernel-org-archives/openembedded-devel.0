Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rzbcc-0006F0-J0
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 23:22:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2044814eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 14:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.2.67 as permitted sender) client-ip=10.213.2.67; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.2.67 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.2.67])
	by 10.213.2.67 with SMTP id 3mr2857211ebi.46.1329776038712 (num_hops =
	1); Mon, 20 Feb 2012 14:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fVLai08AHLSTR16zRiN919r8jrhSU2hTl3mHWF4D/Gs=;
	b=G8VwGq6HEV8b6iuMojF2bpZ6S5CAgwnc4AULpPkBntLO5GXxUCsak/2v6P7NO8+CPO
	fu6lUfQ+t807wmxhmFsyrrtwg7+4yafjZ2/JSEAr/ufJy0q1biSb9X7nyrWvI3rs96n1
	y4mbUdss0AZreDBur47HvpMZTtOBJeiXxEnTA=
Received: by 10.213.2.67 with SMTP id 3mr2257381ebi.46.1329776038229;
	Mon, 20 Feb 2012 14:13:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm65284567eem.11.2012.02.20.14.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 14:13:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 23:13:41 +0100
Message-Id: <17ab4f811136f8611964110fcf2098813f30f7ab.1329775974.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <39ee8c2d0d24a2c80eca0afdff9b19ced16f6034.1329775974.git.Martin.Jansa@gmail.com>
References: <39ee8c2d0d24a2c80eca0afdff9b19ced16f6034.1329775974.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329775974.git.Martin.Jansa@gmail.com>
References: <cover.1329775974.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/2] task-x11-illume: change default ETHEME from e-wm-theme-illume to e-wm-theme-default
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
X-List-Received-Date: Mon, 20 Feb 2012 22:22:14 -0000

* e-wm-theme-illume is gone with illume1 (see b37564b7355af71595ac48b96bcf7d2087e47c73)
* found by accident when running distroless build, guess everybody is using own theme anyway

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/tasks/task-x11-illume.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
index e197cc7..6557619 100644
--- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
+++ b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
@@ -3,14 +3,14 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${TOPDIR}/meta-openembedded/meta-efl/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r1"
+PR = "r2"
 
 # WORK IN PROGRESS
 
 inherit task
 
-# Default illume theme
-ETHEME ?= "e-wm-theme-illume"
+# Default theme and config
+ETHEME ?= "e-wm-theme-default"
 ECONFIG ?= "e-wm-config-illume2"
 
 RDEPENDS_${PN} = "\
-- 
1.7.8.4



