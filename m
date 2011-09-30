Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9itz-0002At-GU
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 21:37:43 +0200
Received: by fxi1 with SMTP id 1so3455125fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=w62CLpRGCsZUEmmCRRnfOmK5hhZH0rJyJOjl4PucQyg=;
	b=orbqyqo1QiduQ2GIp4P5iWS+G1xpqm8eFAqKETQcsDNECcr4tili4hex7TgcoNswBw
	uR3OUPkxKY9f8YJn1ntdgD3026PVxcGLUxrISx7C4JquZGVGNHbfqH+YdnAx/U1NBiPc
	F8Ss0E6TAbUrhFTfX+/Ozyv0YPOG7vPNcypF8=
Received: by 10.223.56.67 with SMTP id x3mr13505770fag.64.1317411134376;
	Fri, 30 Sep 2011 12:32:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm8003245fac.6.2011.09.30.12.32.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 12:32:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 21:32:06 +0200
Message-Id: <1317411126-13649-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [PATCH] elementary, ethumb, libeflvala: bump PR to rebuild against newer poppler
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
X-List-Received-Date: Fri, 30 Sep 2011 19:37:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb     |    1 +
 meta-efl/recipes-efl/efl/libeflvala_svn.bb |    1 +
 3 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 0cfa821..1034e0f 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cdc6c12b238ccd62635a7517dfe89438"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
 PV = "0.7.0+svnr${SRCPV}"
-PR = "r11"
+PR = "r12"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl gettext
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index 2908ee1..e9087ce 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 3ac2384..f70f953 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary"
 PV = "2011.01.13.1+svnr${SRCPV}"
+PR = "r1"
 PE = "1"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
-- 
1.7.6.1



