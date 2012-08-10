Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpg6-0001Fc-3c
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:55:02 +0200
Received: by wibhm2 with SMTP id hm2so1138918wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FrkxNLsqy2ja/p/uB5PYORv+n6CL1g3N4aFOKTblhYU=;
	b=AhypAVBUEw0kmCFq247hgmI3i0accD1oXkvlkmWwEQTHRrCZQmTJdpD44CGv4nwL+p
	+QkJrrCWq5mZO21EcP/SyCfIZq6kdiUa1ArLp+M4eeuhK3hMeWbgaLNaCSciNJdeb4Bh
	HYmSBcwtSw4ZV7MoQwOF0o9WI15JAVh1QlN2GHyaAG5ouvs8EO+hHoJiC7F1v5iVBmPj
	wO8qt6U8qgZuzEvjCIH7pfGuQNJIoeCCJQDDI1YKN5NqpHQFr+Tc5mQtrCVUy2A54siC
	+cTIil2FhytT+HfeA3xcCBIgky+xLDbxmoSvA0rGnaeMmkTFwcyg5XpxGjD0L4E31G5A
	boiA==
Received: by 10.180.82.39 with SMTP id f7mr6281795wiy.2.1344606192582;
	Fri, 10 Aug 2012 06:43:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm7834579wib.2.2012.08.10.06.43.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:43:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:56 +0200
Message-Id: <639c321e2dbe260817c0c34697c47e721256834f.1344599409.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344599409.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344599409.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] meta-systemd: adjust the gpsd bbappend to match the current version.
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
X-List-Received-Date: Fri, 10 Aug 2012 13:55:02 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gpsd/{gpsd_3.5.bbappend => gpsd_3.7.bbappend}  |    0
 .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 --------------
 2 files changed, 0 insertions(+), 14 deletions(-)
 rename meta-systemd/meta-oe/recipes-navigation/gpsd/{gpsd_3.5.bbappend => gpsd_3.7.bbappend} (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend

diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
rename to meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend
deleted file mode 100644
index 1026e22..0000000
--- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.socket"
-SYSTEMD_OESCONS = "true"
-
-do_install_append() {
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
-}
-- 
1.7.8.6



