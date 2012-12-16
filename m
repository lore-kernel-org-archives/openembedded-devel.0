Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIi5-0005nH-9D
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705927eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZWN8NADwhBoUWT4uh9kE7O6FJ4xlD3ImAaeYuyvOaaw=;
	b=e7Bx3GQ8JKYD8HIqDGsdAqOL6/M4pSSTEBNhKIl5rU6/kb4kr0MhVcgmNJWE+i6gV5
	pxGmeM2WsBtbzR2XDFzPVcfEPSRmWAuG+qzx4YDikyqBD6XNyl18WvfYrppFvRDCme/z
	fhXir7FIGJ0N25VO3Z7wAxm24GiXFEl+DLTZ3IR6tlTdWVrJkMa0DynzSkN+1YETySd0
	xI8MJgeC20fUVKqnrHUYEoxWSyIHD3468cVK+ZHpQFp8HkKVMk2XdvA+gttAQp05ExfU
	gCYtB+wgcGubENx4H2T4ngEG6I85sjreLkSQqwwjebxiw93rTk1MUWwkDcyl5ZnPMur8
	3rOQ==
Received: by 10.14.194.195 with SMTP id m43mr33930181een.44.1355680710083;
	Sun, 16 Dec 2012 09:58:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm23875552eeg.4.2012.12.16.09.58.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:57 +0100
Message-Id: <f685a1db094199e337f58cfa86893d084e03de95.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/26] proj: add recipe
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Jan Luebbe <jluebbe@debian.org>

Signed-off-by: Jan Luebbe <jluebbe@debian.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj.inc      | 13 +++++++++++++
 meta-oe/recipes-navigation/proj/proj_4.7.0.bb |  7 +++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/proj/proj.inc
 create mode 100644 meta-oe/recipes-navigation/proj/proj_4.7.0.bb

diff --git a/meta-oe/recipes-navigation/proj/proj.inc b/meta-oe/recipes-navigation/proj/proj.inc
new file mode 100644
index 0000000..f6275d1
--- /dev/null
+++ b/meta-oe/recipes-navigation/proj/proj.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "PROJ.4 - Cartographic Projections Library"
+HOMEPAGE = "http://trac.osgeo.org/proj/"
+SECTION = "libs"
+
+INC_PR = "r0"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
+
+SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
diff --git a/meta-oe/recipes-navigation/proj/proj_4.7.0.bb b/meta-oe/recipes-navigation/proj/proj_4.7.0.bb
new file mode 100644
index 0000000..8e4f901
--- /dev/null
+++ b/meta-oe/recipes-navigation/proj/proj_4.7.0.bb
@@ -0,0 +1,7 @@
+require proj.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "927d34623b52e0209ba2bfcca18fe8cd"
+SRC_URI[sha256sum] = "fc5440002a496532bfaf423c28bdfaf9e26cc96c84ccefcdefde911efbd98986"
+
-- 
1.8.0.2



